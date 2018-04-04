<?php
/*
 Global variables
*/
$TIMETREX_URL = 'http://localhost:8085/api/json/api.php';

$TIMETREX_USERNAME = $_GET['username'];
$TIMETREX_PASSWORD =  $_GET['password'].'@Aa';
$TIMETREX_EMP_ID =  (int) $_GET['employee_id'];
$TIMETREX_STATUS_ID = (int) $_GET['status_id'];
$TIMETREX_TimeStamp =  $_GET['dateTimeStamp']; 
$TIMETREX_TYPE_ID = 10;
$TIMETREX_TRANSFER = true;
$TIMETREX_USERJSON = '{
	"71192": {"username":"yawarkhan","password":"1234@Aa"},
	"80291": {"username":"bilalraza","password":"1234@Aa"},
	"90993": {"username":"adilanis","password":"1234@Aa"},
	"180993": {"username":"harismumtaz","password":"1234@Aa"},
	"211091": {"username":"tanveerrafiquee","password":"1234@Aa"},
	"260888": {"username":"maazibrahim","password":"1234@Aa"},
	"2110991": {"username":"rafayabedi","password":"1234@Aa"},
	"13": {"username":"hammadmassod","password":"1234@Aa"},
	"5": {"username":"asjadamin","password":"1234@Aa"},
	"3": {"username":"arsalan","password":"1234@Aa"},
	"2":{"username":"tahirakhtar","password":"1234@Aa"},
	"6": {"username":"atheriltifat","password":"1234@Aa"},
	"1": {"username":"jehanzeb","password":"1234@Aa"}
}';
// $TIMETREX_USER = json_decode($TIMETREX_USERJSON,TRUE);
//    $arguments = array();

      if(is_null($_GET['employee_id'])||empty($_GET['employee_id']))
      {
            echo json_encode(array("status"=>200, "msg"=>"Employee id is empty"));
            exit;
      }
          
      if(is_null($_GET['status_id'])/*||empty($_GET['status_id'])*/)
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

//Build URL given a Class and Method to call.
//Format is: http://demo.timetrex.com/api/json/api.php?Class=<CLASS>&Method=<METHOD>&SessionID=<SessionID>
function buildURL( $class, $method, $session_id = FALSE ) {
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
	if ( is_array($result) AND isset($result['api_retval'])) {
		if ( $raw === TRUE ) {
			return $result;
		} else {
			if ( $result['api_retval'] === FALSE ) {
				//Display any error messages that might be returned.
				$output[] = '  Returned:';
				$output[] = ( $result['api_retval'] === TRUE ) ? '    IsValid: YES' : '    IsValid: NO';
				if ( $result['api_retval'] === TRUE ) {
					$output[] = '    Return Value: '. $result['api_retval'];
				} else {
					$output[] = '    Code: '. $result['api_details']['code'];
					$output[] = '    Description: '. $result['api_details']['description'];
					$output[] = '    Details: ';

					$details = $result['api_details']['details'];
					if ( is_array($details) ) {
						foreach( $details as $row => $detail ) {
							$output[] = '      Row: '. $row;
							foreach( $detail as $field => $msgs ) {
								$output[] = '      --Field: '. $field;
								foreach( $msgs as $key => $msg ) {
									$output[] = '      ----Message: '. $msg;
								}
							}
						}
					}
				}
				$output[] = '==============================================================';
				$output[] = '';

				//echo implode( "\n", $output );
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
            
$arguments = array('user_name' => $TIMETREX_USERNAME, 'password' => $TIMETREX_PASSWORD );
$TIMETREX_SESSION_ID = postToURL( buildURL( 'APIAuthentication', 'Login' ), $arguments );
if ( $TIMETREX_SESSION_ID == FALSE ) {
      echo "Login Failed!<br>\n";
      exit;
}
//echo "Session ID: $TIMETREX_SESSION_ID<br>\n";

$arguments = array( 'filter_data' => array('employee_number' => $TIMETREX_EMP_ID));
$user_data = postToURL( buildURL( 'APIUser', 'getUser' ), array( $arguments ) );

//for stored punching
$punch_data = array(
				     'user_id' => $TIMETREX_EMP_ID,
                             'type_id' => $TIMETREX_TYPE_ID,
                             'status_id' => $TIMETREX_STATUS_ID,
                             'station_id' => $TIMETREX_SESSION_ID,
                             'time_stamp' => Date('d-M-y+h:m+A'),
                             'epoch' => strtotime($TIMETREX_TimeStamp),
                             //'epoch' => strtotime('19-03-2018 08:50:42 AM'),
					);



if(isset($user_data)){
$result = postToURL( buildURL( 'APIPunch', 'setUserPunch' ), array( $punch_data ) );
}
if ( $result !== FALSE ) {
	echo json_encode(array("status"=>200, "msg"=>"Punch added successfully."));
	$insert_id = $result; //Get employees new ID on success.
} else {
	echo "Punch save failed.<br>\n";
	//print_r($punch_data); //Show error messages
	print_r($punch_data);
}

?>