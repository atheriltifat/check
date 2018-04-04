<?php


/*
 Global variables
*/
 $TIMETREX_URL = 'http://localhost:8085/api/json/api.php';
 $TIMETREX_SESSION_ID;

 if(adminLogin()){
 	getAtt();
 	//getEmployee_Att();
 }
 else{
 	exit;
 }

 function adminLogin(){
 	global $TIMETREX_SESSION_ID;
 	$TIMETREX_USERNAME = 'masteradmin';
 	$TIMETREX_PASSWORD =  '1234@Aa';
 	$arguments = array('user_name' => $TIMETREX_USERNAME, 'password' => $TIMETREX_PASSWORD );
 	$TIMETREX_SESSION_ID = postToURL( buildURL( 'APIAuthentication', 'Login' ), $arguments );
 	if ( $TIMETREX_SESSION_ID == FALSE ) {
 		echo "Login Failed!<br>\n";
      //exit;
 		return false;
 	}
 	else{
 		
 		return true;
 	}
 }

 function getEmployee_Att(){
 	
 	$dataArray = json_decode(file_get_contents('php://input'), true);
 	for($x = 0; $x < count($dataArray); $x++) {
 		$TIMETREX_EMP_ID =  (int)$dataArray[$x]['dwEnrollNumber'];
 		$TIMETREX_STATUS_ID = (int)$dataArray[$x]['dwInOutMode'];
 		$TIMETREX_PUNCH_DATE =  $dataArray[$x]['punch_date']; 
 		$TIMETREX_PUNCH_TIME =  $dataArray[$x]['punch_time'];
 		postAttendance($TIMETREX_EMP_ID, $TIMETREX_STATUS_ID, $TIMETREX_PUNCH_DATE, $TIMETREX_PUNCH_TIME);
 	}
 }

//Build URL given a Class and Method to call.
//Format is: http://demo.timetrex.com/api/json/api.php?Class=<CLASS>&Method=<METHOD>&SessionID=<SessionID>
 function buildURL( $class, $method, $session_id = FALSE) {
	global $TIMETREX_URL, $TIMETREX_SESSION_ID;
	$url = $TIMETREX_URL.'?Class='.$class.'&Method='.$method;
	if ( $session_id != '' OR $TIMETREX_SESSION_ID != '' ) {
		if ( $session_id == '' ) {
			$session_id = $TIMETREX_SESSION_ID;
		}
		$url .= '&SessionID='.$session_id;
	}
	return $url;
}


//Handle complex result.
 function handleResult( $result, $raw = FALSE ) {
	if ( is_array( $result ) AND isset( $result['api_retval'] ) ) {
		if ( $raw === TRUE ) {
			return $result;
		} else {
			if ( $result['api_retval'] === FALSE ) {
				//Display any error messages that might be returned.
				$output[] = '  Returned:';
				$output[] = ( $result['api_retval'] === TRUE ) ? '    IsValid: YES' : '    IsValid: NO';
				if ( $result['api_retval'] === TRUE ) {
					$output[] = '    Return Value: ' . $result['api_retval'];
				} else {
					$output[] = '    Code: ' . $result['api_details']['code'];
					$output[] = '    Description: ' . $result['api_details']['description'];
					$output[] = '    Details: ';

					$details = $result['api_details']['details'];
					if ( is_array( $details ) ) {
						foreach ( $details as $row => $detail ) {
							$output[] = '      Row: ' . $row;
							foreach ( $detail as $field => $msgs ) {
								$output[] = '      --Field: ' . $field;
								foreach ( $msgs as $key => $msg ) {
									$output[] = '      ----Message: ' . $msg;
								}
							}
						}
					}
				}
				$output[] = '==============================================================';
				$output[] = '';

				echo implode( "\n", $output );
			}

			return $result['api_retval'];
		}
	}

	return $result;
}

//Post data (array of arguments) to URL
 function postToURL( $url, $data, $raw_result = FALSE ) {
	$curl_connection = curl_init( $url );
	curl_setopt($curl_connection, CURLOPT_CONNECTTIMEOUT, 600 );
	curl_setopt($curl_connection, CURLOPT_RETURNTRANSFER, TRUE );
	curl_setopt($curl_connection, CURLOPT_SSL_VERIFYPEER, FALSE );
	curl_setopt($curl_connection, CURLOPT_FOLLOWLOCATION, 1 );
	curl_setopt($curl_connection, CURLOPT_REFERER, $url ); //Referred is required is CSRF checks are enabled on the server.
	//When sending JSON data to POST, it must be sent as JSON=<JSON DATA>
	//<JSON DATA> should be an associative array with the first level being the number of arguments, where each argument can be of mixed type. ie:
	// array(
	//       0 => <ARG1>,
	//		 1 => <ARG2>,
	//		 2 => <ARG3>,
	//       ...
	//      )
	$post_data = 'json='.urlencode( json_encode($data) );
	curl_setopt($curl_connection, CURLOPT_POSTFIELDS, $post_data );

	/*echo "==============================================================\n";
	echo "Posting data to URL: ". $url ."\n";
	echo "  POST Data: ". $post_data ."\n";
	echo "--------------------------------------------------------------\n";*/
	$result = curl_exec($curl_connection);
	curl_close($curl_connection);

	return handleResult( json_decode($result, TRUE ), $raw_result );
}


function postAttendance( $TIMETREX_EMP_ID, $TIMETREX_STATUS_ID, $TIMETREX_PUNCH_DATE, $TIMETREX_PUNCH_TIME ){
	$TIMETREX_TYPE_ID = 10;
	$TIMETREX_TRANSFER = true;

	if(is_null($TIMETREX_EMP_ID)||empty($TIMETREX_EMP_ID))
	{
		echo json_encode(array("status"=>200, "msg"=>"Employee id is empty"));
		exit;
	}

if(is_null($TIMETREX_STATUS_ID)/*||empty($_GET['status_id'])*/)
{
	echo json_encode(array("status"=>200, "msg"=>"Status id is empty"));
	exit;
}
else{
	if($TIMETREX_STATUS_ID==0)
	{
		            //STATUS TIME IN 
		$TIMETREX_TYPE_ID = 10;     
		$TIMETREX_STATUS_ID = 10;
	}
	else if($TIMETREX_STATUS_ID==1)
	{
		            //STATUS TIME OUT
		$TIMETREX_TYPE_ID = 10; 
		$TIMETREX_STATUS_ID=20;
	}
	else if($TIMETREX_STATUS_ID==2)
	{
		            //STATUS BREAK IN
		$TIMETREX_TYPE_ID = 20; 
		$TIMETREX_STATUS_ID=10;
	}else {
		            //STATUS  OUT
		$TIMETREX_TYPE_ID = 20; 
		$TIMETREX_STATUS_ID=20;
	}
}

$arguments = array( 'filter_data' => array('employee_number' => $TIMETREX_EMP_ID));
$user_data = postToURL( buildURL( 'APIUser', 'getUser' ), array( $arguments ) );
$punch_data = array( 'status_id'=>$TIMETREX_STATUS_ID, 
	'type_id'=> $TIMETREX_TYPE_ID, 
	//'user_id'=>'11e826b3-4443-10c0-8c23-e1d6a404182b', 
	'user_id'=>$user_data[0]['id'],
	//'punch_time'=>'8:50:24 AM', 
	'punch_time'=> $TIMETREX_PUNCH_TIME,
	'branch_id'=>'00000000-0000-0000-0000-000000000000', 
	'department_id'=>'00000000-0000-0000-0000-000000000000', 
	'job_id'=>'00000000-0000-0000-0000-000000000000', 
	'job_item_id'=>'00000000-0000-0000-0000-000000000000', 
	'time_stamp'=> false, 
	'punch_date'=> $TIMETREX_PUNCH_DATE,
	//'punch_date'=> '22-03-2018',
);

$result = postToURL( buildURL( 'APIPunch', 'setPunch' ), array($punch_data) );
//$result === FALSE;
if ( $result !== FALSE ) {
	echo "Punch added successfully\n";
	$insert_id = $result; //Get employees new ID on success.

} else {
	echo "Punch save failed\n";
	log_Att_Err($TIMETREX_EMP_ID, $TIMETREX_STATUS_ID, $TIMETREX_PUNCH_DATE, $TIMETREX_PUNCH_TIME);
	echo "Error in posting attendance for details please check file 'attendance_error.txt'\n";
	print $result; //Show error messages
}
}

function log_Att_Err($TIMETREX_EMP_ID, $TIMETREX_STATUS_ID, $TIMETREX_PUNCH_DATE, $TIMETREX_PUNCH_TIME){
	if($TIMETREX_STATUS_ID == 10){
		$TIMETREX_STATUS_ID = 'Time IN';
	}
	else{
		$TIMETREX_STATUS_ID = 'Time Out';
	}
	$fileName = "attendance_error.txt";
 $handle = fopen($fileName, 'a') or die("can't open file");
 $dataFile = 'Emp ID: '. $TIMETREX_EMP_ID .',  '.'Punch Date: '.$TIMETREX_PUNCH_DATE . ',  '
 .'Punch Time: '.$TIMETREX_PUNCH_TIME. ',  ' . 'Attendance Status: '.$TIMETREX_STATUS_ID."\n";
 fwrite($handle, $dataFile);
}


// }

//
//Get TimeSheet Summary report data in raw PHP native array format. 'csv' and 'pdf' are also valid formats.
//
/*$config = postToURL( buildURL( 'APITimesheetSummaryReport', 'getTemplate' ), array( 'by_employee+regular+overtime+premium+absence' ) );
$result = postToURL( buildURL( 'APITimesheetSummaryReport', 'getTimesheetSummaryReport' ), array( $config, 'raw' ) );
*//*echo "Report Data: <br>\n";
var_dump($result);*/

function getAtt(){
	// admin
	// userID = '11e826af-d65c-2ec0-9fc9-e1d6a404182b', base_date = '26-03-2018'
 	$arguments = array('11e826af-d65c-2ec0-9fc9-e1d6a404182b','26-03-2018');
	$result = postToURL( buildURL( 'APITimeSheet', 'getTimeSheetData'), $arguments);
	print_r($result['punch_data']);
	//  ather   '11e826b3-4443-10c0-8c23-e1d6a404182b'
}


?>