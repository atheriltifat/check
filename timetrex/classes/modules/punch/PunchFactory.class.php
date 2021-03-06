<?php
/*********************************************************************************
 * TimeTrex is a Workforce Management program developed by
 * TimeTrex Software Inc. Copyright (C) 2003 - 2018 TimeTrex Software Inc.
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License version 3 as published by
 * the Free Software Foundation with the addition of the following permission
 * added to Section 15 as permitted in Section 7(a): FOR ANY PART OF THE COVERED
 * WORK IN WHICH THE COPYRIGHT IS OWNED BY TIMETREX, TIMETREX DISCLAIMS THE
 * WARRANTY OF NON INFRINGEMENT OF THIRD PARTY RIGHTS.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Affero General Public License along
 * with this program; if not, see http://www.gnu.org/licenses or write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 *
 * You can contact TimeTrex headquarters at Unit 22 - 2475 Dobbin Rd. Suite
 * #292 West Kelowna, BC V4T 2E9, Canada or at email address info@timetrex.com.
 *
 * The interactive user interfaces in modified source and object code versions
 * of this program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU Affero General Public License version 3.
 *
 * In accordance with Section 7(b) of the GNU Affero General Public License
 * version 3, these Appropriate Legal Notices must retain the display of the
 * "Powered by TimeTrex" logo. If the display of the logo is not reasonably
 * feasible for technical reasons, the Appropriate Legal Notices must display
 * the words "Powered by TimeTrex".
 ********************************************************************************/


/**
 * @package Modules\Punch
 */
class PunchFactory extends Factory {
	protected $table = 'punch';
	protected $pk_sequence_name = 'punch_id_seq'; //PK Sequence name

	var $punch_control_obj = NULL;
	var $previous_punch_obj = NULL;
	protected $schedule_obj = NULL;
	var $tmp_data = NULL;

	/**
	 * @param $name
	 * @param null $parent
	 * @return array|null
	 */
	function _getFactoryOptions( $name, $parent = NULL ) {

		$retval = NULL;
		switch( $name ) {
			case 'status':
				$retval = array(
										10 => TTi18n::gettext('In'),
										20 => TTi18n::gettext('Out'),
									);
				break;
			case 'type':
				$retval = array(
										10 => TTi18n::gettext('Normal'),
										20 => TTi18n::gettext('Lunch'),
										30 => TTi18n::gettext('Break'),
									);
				break;
			case 'transfer':
				$retval = array(
										0 => TTi18n::gettext('No'),
										1 => TTi18n::gettext('Yes'),
									);
				break;
			case 'columns':
				$retval = array(
										'-1000-first_name' => TTi18n::gettext('First Name'),
										'-1002-last_name' => TTi18n::gettext('Last Name'),
										//'-1005-user_status' => TTi18n::gettext('Employee Status'),
										'-1010-title' => TTi18n::gettext('Title'),
										'-1039-group' => TTi18n::gettext('Group'),
										'-1040-default_branch' => TTi18n::gettext('Default Branch'),
										'-1050-default_department' => TTi18n::gettext('Default Department'),
										'-1160-branch' => TTi18n::gettext('Branch'),
										'-1170-department' => TTi18n::gettext('Department'),

										'-1180-job' => TTi18n::gettext('Job'),
										'-1190-job_item' => TTi18n::gettext('Task'),

										'-1200-type' => TTi18n::gettext('Type'),
										'-1202-status' => TTi18n::gettext('Status'),
										'-1210-date_stamp' => TTi18n::gettext('Date'),
										'-1220-time_stamp' => TTi18n::gettext('Time'),

										'-1230-tainted' => TTi18n::gettext('Tainted'),

										'-1310-station_station_id' => TTi18n::gettext('Station ID'),
										'-1320-station_type' => TTi18n::gettext('Station Type'),
										'-1330-station_source' => TTi18n::gettext('Station Source'),
										'-1340-station_description' => TTi18n::gettext('Station Description'),

										'-2000-created_by' => TTi18n::gettext('Created By'),
										'-2010-created_date' => TTi18n::gettext('Created Date'),
										'-2020-updated_by' => TTi18n::gettext('Updated By'),
										'-2030-updated_date' => TTi18n::gettext('Updated Date'),
							);
				break;
			case 'list_columns':
				$retval = Misc::arrayIntersectByKey( $this->getOptions('default_display_columns'), Misc::trimSortPrefix( $this->getOptions('columns') ) );
				break;
			case 'default_display_columns': //Columns that are displayed by default.
				$retval = array(
								'first_name',
								'last_name',
								'type',
								'status',
								'date_stamp',
								'time_stamp',
								);
				break;
			case 'unique_columns': //Columns that are unique, and disabled for mass editing.
				$retval = array(
								);
				break;
			case 'linked_columns': //Columns that are linked together, mainly for Mass Edit, if one changes, they all must.
				$retval = array(
								);
				break;
		}

		return $retval;
	}

	/**
	 * @param $data
	 * @return array
	 */
	function _getVariableToFunctionMap( $data ) {
			$variable_function_map = array(
											'id' => 'ID',

											'user_id' => FALSE, //This is coming from PunchControl factory.
											'transfer' => 'Transfer',
											'type_id' => 'Type',
											'type' => FALSE,
											'status_id' => 'Status',
											'status' => FALSE,
											'time_stamp' => 'TimeStamp',
											'punch_date' => FALSE,
											'punch_time' => FALSE,
											'punch_control_id' => 'PunchControlID',
											'actual_time_stamp' => 'ActualTimeStamp',
											'original_time_stamp' => 'OriginalTimeStamp',
											'schedule_id' => 'ScheduleID',

											'station_id' => 'Station',
											'station_station_id' => FALSE,
											'station_type_id' => FALSE,
											'station_type' => FALSE,
											'station_source' => FALSE,
											'station_description' => FALSE,

											'longitude' => 'Longitude',
											'latitude' => 'Latitude',
											'position_accuracy' => 'PositionAccuracy',

											'first_name' => FALSE,
											'last_name' => FALSE,
											'user_status_id' => FALSE,
											'user_status' => FALSE,
											'group_id' => FALSE,
											'group' => FALSE,
											'title_id' => FALSE,
											'title' => FALSE,
											'default_branch_id' => FALSE,
											'default_branch' => FALSE,
											'default_department_id' => FALSE,
											'default_department' => FALSE,

											'date_stamp' => FALSE,
											'user_date_id' => FALSE,
											'pay_period_id' => FALSE,

											'branch_id' => FALSE,
											'branch' => FALSE,
											'department_id' => FALSE,
											'department' => FALSE,
											'job_id' => FALSE,
											'job' => FALSE,
											'job_item_id' => FALSE,
											'job_item' => FALSE,
											'quantity' => FALSE,
											'bad_quantity' => FALSE,
											'meal_policy_id' => FALSE,
											'note' => FALSE,

											'other_id1' => FALSE, //These need to be here as they are actually pulled from the PunchControl table.
											'other_id2' => FALSE,
											'other_id3' => FALSE,
											'other_id4' => FALSE,
											'other_id5' => FALSE,

											'tainted' => 'Tainted',
											'has_image' => 'HasImage',

											'deleted' => 'Deleted',
											);
			return $variable_function_map;
	}

	/**
	 * @return bool
	 */
	function getPunchControlObject() {
		return $this->getGenericObject( 'PunchControlListFactory', $this->getPunchControlID(), 'punch_control_obj' );
	}

	/**
	 * @return bool
	 */
	function getScheduleObject() {
		return $this->getGenericObject( 'ScheduleListFactory', $this->getScheduleID(), 'schedule_obj' );
	}

	/**
	 * @return bool
	 */
	function getUserObject() {
		return $this->getGenericObject( 'UserListFactory', $this->getUser(), 'user_obj' );
	}

	/*
	function getPreviousPunchObject( $time_stamp ) {
		if ( is_object($this->previous_punch_obj) ) {
			return $this->previous_punch_obj;
		} else {
			$plf = TTnew( 'PunchListFactory' );
			$plf->getPreviousPunchByUserIdAndEpoch( $this->getUser(), (int)$time_stamp );
			if ( $plf->getRecordCount() > 0 ) {
				$previous_punch_obj = $plf->getCurrent();
				return $previous_punch_obj;
			}

			return FALSE;
		}
	}
	*/

	/**
	 * @param int $epoch EPOCH
	 * @param bool $user_id
	 * @param bool $ignore_future_punches
	 * @return bool|null
	 */
	function getPreviousPunchObject( $epoch, $user_id = FALSE, $ignore_future_punches = FALSE ) {
		if ( $user_id == '' ) {
			$user_id = $this->getUser();
		}

		if ( is_object($this->previous_punch_obj) ) {
			return $this->previous_punch_obj;
		} else {
			//Use getShiftData() to better detect the previous punch based on the shift time.
			//This should make our maximum shift time setting based on the shift start time rather then the last punch that happens to exist.
			//If no Normal In punch exists in the shift, use the first punch time to base the Maximum Shift Time on.
			$ppslf = new PayPeriodScheduleListFactory();
			$ppslf->getByUserId( $user_id );
			if ( $ppslf->getRecordCount() == 1 ) {
				$pps_obj = $ppslf->getCurrent();
				$maximum_shift_time = $pps_obj->getMaximumShiftTime();
			} else {
				$pps_obj = TTnew('PayPeriodScheduleFactory');
				$maximum_shift_time = ( 3600 * 16 );
				$pps_obj->setMaximumShiftTime( $maximum_shift_time );
			}
			$shift_data = $pps_obj->getShiftData( NULL, $user_id, $epoch, 'nearest_shift', NULL, NULL, NULL, NULL, $ignore_future_punches );
			unset($pps_obj);

			$last_punch_id = FALSE;
			if ( isset($shift_data) AND is_array($shift_data) ) {
				//If we check against the first punch, then split shifts like: 10AM -> 11AM, then 11PM -> 8AM (next day) won't match properly,
				// as the 8AM would need an almost 24hr maximum shift time, when the shift was only 1hr prior to last out punch.
				// Instead maybe check from the last punch minus the maximum shift time minus the total time of the shift, that way when the 8AM
				// punch out specified in the above case is being entered it would be 10hr maximum shift time, not a 22hr maximum shift time.

//				if ( isset($shift_data['punches']) AND $shift_data['punches'][0]['time_stamp'] >= ( $epoch - $maximum_shift_time ) ) {
//					$last_punch_id = $shift_data['punches'][( count($shift_data['punches']) - 1 )]['id'];
//				}
				if ( isset($shift_data['punches']) AND isset($shift_data['last_punch_key']) AND isset($shift_data['punches'][$shift_data['last_punch_key']])
						AND $shift_data['punches'][$shift_data['last_punch_key']]['time_stamp'] >= ( $epoch - ( $maximum_shift_time - $shift_data['total_time'] ) ) ) {
					$last_punch_id = $shift_data['punches'][$shift_data['last_punch_key']]['id'];
				} else {
					Debug::Text(' Shift didnt start within maximum shift time...', __FILE__, __LINE__, __METHOD__, 10);
				}
			} else {
				Debug::Text(' No shift data...', __FILE__, __LINE__, __METHOD__, 10);
			}
			//Debug::Arr($shift_data, ' Shift Data: Last Punch ID: '. $last_punch_id, __FILE__, __LINE__, __METHOD__, 10);

			if ( TTUUID::isUUID($last_punch_id) AND $last_punch_id != TTUUID::getZeroID() AND $last_punch_id != TTUUID::getNotExistID() ) {
				$plf = TTnew( 'PunchListFactory' );
				$plf->getById( $last_punch_id );
				if ( $plf->getRecordCount() > 0 ) {
					$previous_punch_obj = $plf->getCurrent();
					return $previous_punch_obj;
				}
			}

			return FALSE;
		}
	}

	/**
	 * @return bool|mixed
	 */
	function getNextPunchControlID() {
		//This is normally the PREVIOUS punch,
		//so if it was IN (10), return its punch control ID
		//so the next OUT punch is a new punch_control_id.
		if ( $this->getStatus() == 10 ) {
			return $this->getPunchControlID();
		}

		return FALSE;
	}

	/**
	 * @return bool|mixed
	 */
	function getUser() {
		return $this->getGenericDataValue( 'user_id' );
	}

	/**
	 * @param string $id UUID
	 * @return bool
	 */
	function setUser( $value) {
		return $this->setGenericDataValue( 'user_id', TTUUID::castUUID($value) );//Make sure this isn't an array.
	}

	/**
	 * @return bool|mixed
	 */
	function findPunchControlID() {
		if ( $this->getPunchControlID() != FALSE ) {
			$retval = $this->getPunchControlID();
		} else {
			$pclf = TTnew( 'PunchControlListFactory' );
			Debug::Text('Checking for incomplete punch control... User: '. $this->getUser() .' TimeStamp: '. $this->getTimeStamp() .' Status: '. $this->getStatus(), __FILE__, __LINE__, __METHOD__, 10);

			//Need to make sure the punch is rounded before we can get the proper punch_control_id. However
			// roundTimeStamp requires punch_control_id before it can round properly.
			$retval = $pclf->getInCompletePunchControlIdByUserIdAndEpoch( $this->getUser(), $this->getTimeStamp(), $this->getStatus() );
			if ( $retval == FALSE ) {
				Debug::Text('Couldnt find already existing PunchControlID, generating new one...', __FILE__, __LINE__, __METHOD__, 10);
				$retval = $pclf->getNextInsertId();
			}
		}

		Debug::Text('Punch Control ID: '. $retval, __FILE__, __LINE__, __METHOD__, 10);
		return $retval;
	}

	/**
	 * @return bool|mixed
	 */
	function getPunchControlID() {
		return $this->getGenericDataValue( 'punch_control_id' );
	}

	/**
	 * @param string $id UUID
	 * @return bool
	 */
	function setPunchControlID( $value) {
		$value = trim($value);
		//Can't check to make sure the PunchControl row exists, as it may be inserted later. So just
		//make sure its an non-zero INT.
/*
		if (  $this->Validator->isResultSetWithRows(	'punch_control',
														$pclf->getByID($id),
														TTi18n::gettext('Invalid Punch Control ID')
														) ) {
			$this->setGenericDataValue( 'punch_control_id', $id );

			return TRUE;
		}
*/
		return $this->setGenericDataValue( 'punch_control_id', $value );
	}

	/**
	 * @return bool
	 */
	function getTransfer() {
		return $this->fromBool( $this->getGenericDataValue( 'transfer' ) );
	}

	/**
	 * @param $bool
	 * @param null $time_stamp
	 * @return bool
	 */
	function setTransfer( $value, $time_stamp = NULL) {
		//If a timestamp is passed, check for the previous punch, if one does NOT exist, transfer can not be enabled.
		if ( $value == TRUE AND $time_stamp != '' AND $this->isNew() ) { //If the punch isn't a new one, always accept the transfer flag so we don't mistakenly round punches that are transfer punches when an administrator edits them.
			$prev_punch_obj = $this->getPreviousPunchObject( $time_stamp );
			//Make sure we check that the previous punch wasn't an out punch from the last shift.
			if ( !is_object( $prev_punch_obj ) OR ( is_object( $prev_punch_obj ) AND $prev_punch_obj->getStatus() == 20 ) ) {
				Debug::Text('Previous punch does not exist, or it was an OUT punch, transfer cannot be enabled. EPOCH: '. $time_stamp, __FILE__, __LINE__, __METHOD__, 10);
				return FALSE;
			}
		}
		return $this->setGenericDataValue( 'transfer', $this->toBool($value) );
	}

	/**
	 * @return int
	 */
	function getNextStatus() {
		if ( $this->getStatus() == 10 ) {
			return 20;
		}

		return 10;
	}

	/**
	 * @return bool|int
	 */
	function getStatus() {
		return $this->getGenericDataValue( 'status_id' );
	}

	/**
	 * @param $status
	 * @return bool
	 */
	function setStatus( $value) {
		$value = (int)trim($value);
		Debug::text(' Status: '. $value, __FILE__, __LINE__, __METHOD__, 10);
		return $this->setGenericDataValue( 'status_id', $value );
	}

	/**
	 * @param int $epoch EPOCH
	 * @return int
	 */
	function getNextType( $epoch = NULL ) {
		if ( $this->getStatus() == 10 ) { //In
			$next_type = 10; //Normal
		} else { //20 = Out
			$next_type = $this->getType();
		}

		//$this object should always be the previous punch.
		if ( $epoch > 0 AND TTUUID::isUUID( $this->getUser() ) AND $this->getUser() != TTUUID::getZeroID() AND $this->getUser() != TTUUID::getNotExistID()  ) {
			Debug::Text(' Previous Punch Type: '. $this->getType() .' Status: '. $this->getStatus() .' Epoch: '. $epoch .' User ID: '. $this->getUser(), __FILE__, __LINE__, __METHOD__, 10);

			//Check for break policy window.
			//With Time Window auto-detection, ideally we would filter on $this->getStatus() != 20, so we don't try to detect explicit OUT punches.
			//However with Punch Time auto-detection, ideally we would filter on $this->getStatus() != 10 so we don't try to detect explicity IN punches.
			//So because of the above, we can't filter based on status at all until we know what the break/lunch policy requires.
			//Do the filter in inBreakPolicyWindow()/inMealPolicyWindow().
			//if ( $next_type != 30 AND ( $this->getStatus() != 20 AND $this->getType() != 30 ) ) {
			if ( $next_type != 30 AND $this->getType() != 30 ) {
				$this->setScheduleID( $this->findScheduleID( $epoch ) );
				if ( $this->inBreakPolicyWindow( $epoch, $this->getTimeStamp(), $this->getStatus() ) == TRUE ) {
					Debug::Text(' Setting Type to Break...', __FILE__, __LINE__, __METHOD__, 10);
					$next_type = 30;
				}
			}

			//Check for meal policy window.
			//if ( $next_type != 20 AND ( $this->getStatus() != 20 AND $this->getType() != 20 ) ) {
			if ( $next_type != 20 AND $this->getType() != 20 ) {
				$this->setScheduleID( $this->findScheduleID( $epoch ) );
				if ( $this->inMealPolicyWindow( $epoch, $this->getTimeStamp(), $this->getStatus() ) == TRUE ) {
					Debug::Text(' Setting Type to Lunch...', __FILE__, __LINE__, __METHOD__, 10);
					$next_type = 20;
				}
			}
		}

		return (int)$next_type;
	}

	/**
	 * @return bool|string
	 */
	function getTypeCode() {
		if ( $this->getType() != 10 ) {
			$options = $this->getOptions('type');
			return substr( $options[$this->getType()], 0, 1);
		}

		return FALSE;
	}

	/**
	 * @return bool|int
	 */
	function getType() {
		return $this->getGenericDataValue( 'type_id' );
	}

	/**
	 * @param $value
	 * @return bool
	 */
	function setType( $value) {
		$value = (int)trim($value);
		return $this->setGenericDataValue( 'type_id', $value );
	}

	/**
	 * @return bool|mixed
	 */
	function getStation() {
		return $this->getGenericDataValue( 'station_id' );
	}

	/**
	 * @param string $id UUID
	 * @return bool
	 */
	function setStation( $value) {
		$value = TTUUID::castUUID( $value );
		return $this->setGenericDataValue( 'station_id', $value );
	}

	/**
	 * @param int $epoch EPOCH
	 * @return bool|int|mixed
	 */
	function roundTimeStamp( $epoch) {
		if ( $epoch == '' ) {
			return FALSE;
		}

		$original_epoch = $epoch;

		//$is_transfer = ( ( $this->getTransfer() == TRUE OR $this->getEnableAutoTransfer() ) ? TRUE : FALSE ); //This broke rounding on timeclocks for the first IN punch of the day when a Branch/Department/Job/Task was specified.
		$is_transfer = $this->getTransfer();

		//Punch control is no longer used for rounding.
		//Check for rounding policies.
		$riplf = TTnew( 'RoundIntervalPolicyListFactory' );
		$type_id = $riplf->getPunchTypeFromPunchStatusAndType( $this->getStatus(), $this->getType(), $is_transfer );
		Debug::text(' Rounding Timestamp: '. TTDate::getDate('DATE+TIME', $epoch ) .'('. $epoch .') Status ID: '. $this->getStatus() .' Type ID: '. $this->getType() .' Round Policy Type: '. $type_id .' Is Transfer: '. (int)$is_transfer, __FILE__, __LINE__, __METHOD__, 10);

		$riplf->getByPolicyGroupUserIdAndTypeId( $this->getUser(), $type_id );
		Debug::text(' Round Interval Punch Type: '. $type_id .' User: '. $this->getUser() .' Total Records: '. $riplf->getRecordCount(), __FILE__, __LINE__, __METHOD__, 10);
		if ( $riplf->getRecordCount() > 0 ) {
			$is_rounded_timestamp = FALSE;
			//Loop over each rounding policy testing the conditionals and rounding the punch if necessary.
			foreach( $riplf as $round_policy_obj ) {
				Debug::text(' Found Rounding Policy: '. $round_policy_obj->getName() .'('. $round_policy_obj->getId() .') Punch Type: '. $round_policy_obj->getPunchType() .' Conditional Type: '. $round_policy_obj->getConditionType(), __FILE__, __LINE__, __METHOD__, 10);

				//FIXME: It will only do proper total rounding if they edit the Lunch Out punch.
				//We need to account for cases when they edit just the Lunch In Punch.
				if ( $round_policy_obj->getPunchType() == 100 ) {
					Debug::text('Lunch Total Rounding: '. TTDate::getDate('DATE+TIME', $epoch ), __FILE__, __LINE__, __METHOD__, 10);

					//On Lunch Punch In (back from lunch) do the total rounding.
					if ( $this->getStatus() == 10 AND $this->getType() == 20 ) {
						Debug::text('bLunch Total Rounding: '. TTDate::getDate('DATE+TIME', $epoch ), __FILE__, __LINE__, __METHOD__, 10);
						//If strict is set, round to scheduled lunch time?
						//Find Lunch Punch In.

						//Make sure we include both lunch and normal punches when searching for the previous punch, because with Punch Time detection meal policies
						//the previous punch will never be lunch, just normal, but with Time Window meal policies it will be lunch. This is critical for Lunch rounding
						//with Punch Time detection meal policies.
						//There was a bug where if Lunch Total rounding is enabled, and auto-detect punches by Punch Time is also enabled,
						//this won't round the Lunch In punch because the Lunch Out punch hasn't been designated until changePreviousPunchType() is called in PunchControlFactory::preSave().
						//which doesn't happen until later.
						$plf = TTnew( 'PunchListFactory' );
						$plf->getPreviousPunchByUserIdAndStatusAndTypeAndEpoch( $this->getUser(), 20, array(10, 20), $epoch );
						if ( $plf->getRecordCount() == 1 ) {
							Debug::text('Found Lunch Punch Out: '. TTDate::getDate('DATE+TIME', $plf->getCurrent()->getTimeStamp() ), __FILE__, __LINE__, __METHOD__, 10);

							$total_lunch_time = ( $epoch - $plf->getCurrent()->getTimeStamp() );
							Debug::text('Total Lunch Time: '. $total_lunch_time, __FILE__, __LINE__, __METHOD__, 10);

							//Test rounding condition, needs to happen after we attempt to get the schedule at least.
							if ( $round_policy_obj->isConditionTrue( $total_lunch_time, FALSE ) == FALSE ) {
								continue;
							}

							//Set the ScheduleID
							$has_schedule = $this->setScheduleID( $this->findScheduleID( $epoch ) );

							//Combine all break policies together.
							$meal_policy_time = 0;
							if ( is_object( $this->getScheduleObject() ) AND is_object( $this->getScheduleObject()->getSchedulePolicyObject() ) ) {
								$meal_policy_ids = $this->getScheduleObject()->getSchedulePolicyObject()->getMealPolicy();
								if ( is_array($meal_policy_ids) ) {
									$meal_policy_data = array();
									foreach( $meal_policy_ids as $meal_policy_id ) {
										$meal_policy_obj = $this->getScheduleObject()->getSchedulePolicyObject()->getMealPolicyObject( $meal_policy_id );
										if ( is_object( $meal_policy_obj ) ) {
											$meal_policy_data[$meal_policy_obj->getTriggerTime()] = $meal_policy_obj->getAmount();
										}
									}
									krsort($meal_policy_data);

									if ( is_array($meal_policy_data) ) {
										foreach( $meal_policy_data as $meal_policy_trigger_time => $tmp_meal_policy_time ) {
											Debug::text('Checking Meal Policy Trigger Time: '. $meal_policy_trigger_time .' Schedule Time: '. $this->getScheduleObject()->getTotalTime(), __FILE__, __LINE__, __METHOD__, 10);
											if ( $this->getScheduleObject()->getTotalTime() >= $meal_policy_trigger_time ) {
												$meal_policy_time = $tmp_meal_policy_time;
												break;
											}
										}
									}
								}
							}
							unset($meal_policy_id, $meal_policy_ids, $meal_policy_data, $meal_policy_trigger_time, $tmp_meal_policy_time);
							Debug::text('Meal Policy Time: '. $meal_policy_time, __FILE__, __LINE__, __METHOD__, 10);

							if ( $has_schedule == TRUE AND $round_policy_obj->getGrace() > 0 )	{
								Debug::text(' Applying Grace Period: ', __FILE__, __LINE__, __METHOD__, 10);
								$total_lunch_time = TTDate::graceTime($total_lunch_time, $round_policy_obj->getGrace(), $meal_policy_time );
								Debug::text('After Grace: '. $total_lunch_time, __FILE__, __LINE__, __METHOD__, 10);
							}

							if ( $round_policy_obj->getInterval() > 0 )	 {
								Debug::Text(' Rounding to interval: '. $round_policy_obj->getInterval(), __FILE__, __LINE__, __METHOD__, 10);
								$total_lunch_time = TTDate::roundTime($total_lunch_time, $round_policy_obj->getInterval(), $round_policy_obj->getRoundType(), $round_policy_obj->getGrace() );
								Debug::text('After Rounding: '. $total_lunch_time, __FILE__, __LINE__, __METHOD__, 10);
							}

							if ( $has_schedule == TRUE AND $round_policy_obj->getStrict() == TRUE ) {
								Debug::Text(' Snap Time: Round Type: '. $round_policy_obj->getRoundType(), __FILE__, __LINE__, __METHOD__, 10);
								if ( $round_policy_obj->getRoundType() == 10 ) {
									Debug::Text(' Snap Time DOWN ', __FILE__, __LINE__, __METHOD__, 10);
									$total_lunch_time = TTDate::snapTime($total_lunch_time, $meal_policy_time, 'DOWN');
								} elseif ( $round_policy_obj->getRoundType() == 30 ) {
									Debug::Text(' Snap Time UP', __FILE__, __LINE__, __METHOD__, 10);
									$total_lunch_time = TTDate::snapTime($total_lunch_time, $meal_policy_time, 'UP');
								} else {
									Debug::Text(' Not Snaping Time', __FILE__, __LINE__, __METHOD__, 10);
								}
							}

							$epoch = ( $plf->getCurrent()->getTimeStamp() + $total_lunch_time );
							Debug::text('Epoch after total rounding is: '. $epoch .' - '. TTDate::getDate('DATE+TIME', $epoch), __FILE__, __LINE__, __METHOD__, 10);
							$is_rounded_timestamp = TRUE;
						} else {
							Debug::text('DID NOT Find Lunch Punch Out: '. TTDate::getDate('DATE+TIME', $plf->getCurrent()->getTimeStamp() ), __FILE__, __LINE__, __METHOD__, 10);
						}

					} else {
						Debug::text('Skipping Lunch Total Rounding: '. TTDate::getDate('DATE+TIME', $epoch ), __FILE__, __LINE__, __METHOD__, 10);
					}
				} elseif ( $round_policy_obj->getPunchType() == 110 ) { //Break Total
					Debug::text('Break Total Rounding: '. TTDate::getDate('DATE+TIME', $epoch ), __FILE__, __LINE__, __METHOD__, 10);

					//On break Punch In (back from break) do the total rounding.
					if ( $this->getStatus() == 10 AND $this->getType() == 30 ) {
						Debug::text('bbreak Total Rounding: '. TTDate::getDate('DATE+TIME', $epoch ), __FILE__, __LINE__, __METHOD__, 10);
						//If strict is set, round to scheduled break time?
						//Find break Punch In.

						//Make sure we include both break and normal punches when searching for the previous punch, because with Punch Time detection meal policies
						//the previous punch will never be break, just normal, but with Time Window meal policies it will be break. This is critical for break rounding
						//with Punch Time detection meal policies.
						$plf = TTnew( 'PunchListFactory' );
						$plf->getPreviousPunchByUserIdAndStatusAndTypeAndEpoch( $this->getUser(), 20, array(10, 30), $epoch );
						if ( $plf->getRecordCount() == 1 ) {
							Debug::text('Found break Punch Out: '. TTDate::getDate('DATE+TIME', $plf->getCurrent()->getTimeStamp() ), __FILE__, __LINE__, __METHOD__, 10);

							$total_break_time = ( $epoch - $plf->getCurrent()->getTimeStamp() );
							Debug::text('Total break Time: '. $total_break_time, __FILE__, __LINE__, __METHOD__, 10);

							//Test rounding condition, needs to happen after we attempt to get the schedule at least.
							if ( $round_policy_obj->isConditionTrue( $total_break_time, FALSE ) == FALSE ) {
								continue;
							}

							//Set the ScheduleID
							$has_schedule = $this->setScheduleID( $this->findScheduleID( $epoch ) );

							//Combine all break policies together.
							$break_policy_time = 0;
							if ( is_object($this->getScheduleObject()) AND is_object( $this->getScheduleObject()->getSchedulePolicyObject() ) ) {
								$break_policy_ids = $this->getScheduleObject()->getSchedulePolicyObject()->getBreakPolicy();
								if ( is_array($break_policy_ids) ) {
									foreach( $break_policy_ids as $break_policy_id ) {
										if ( is_object( $this->getScheduleObject()->getSchedulePolicyObject()->getBreakPolicyObject( $break_policy_id ) ) ) {
											$break_policy_time += $this->getScheduleObject()->getSchedulePolicyObject()->getBreakPolicyObject( $break_policy_id )->getAmount();
										}
									}
								}
							}
							unset($break_policy_id, $break_policy_ids);
							Debug::text('Break Policy Time: '. $break_policy_time, __FILE__, __LINE__, __METHOD__, 10);

							if ( $has_schedule == TRUE AND $round_policy_obj->getGrace() > 0 )	{
								Debug::text(' Applying Grace Period: ', __FILE__, __LINE__, __METHOD__, 10);
								$total_break_time = TTDate::graceTime($total_break_time, $round_policy_obj->getGrace(), $break_policy_time );
								Debug::text('After Grace: '. $total_break_time, __FILE__, __LINE__, __METHOD__, 10);
							}

							if ( $round_policy_obj->getInterval() > 0 )	 {
								Debug::Text(' Rounding to interval: '. $round_policy_obj->getInterval(), __FILE__, __LINE__, __METHOD__, 10);
								$total_break_time = TTDate::roundTime($total_break_time, $round_policy_obj->getInterval(), $round_policy_obj->getRoundType(), $round_policy_obj->getGrace() );
								Debug::text('After Rounding: '. $total_break_time, __FILE__, __LINE__, __METHOD__, 10);
							}

							if ( $has_schedule == TRUE AND $round_policy_obj->getStrict() == TRUE ) {
								Debug::Text(' Snap Time: Round Type: '. $round_policy_obj->getRoundType(), __FILE__, __LINE__, __METHOD__, 10);
								if ( $round_policy_obj->getRoundType() == 10 ) {
									Debug::Text(' Snap Time DOWN ', __FILE__, __LINE__, __METHOD__, 10);
									$total_break_time = TTDate::snapTime($total_break_time, $break_policy_time, 'DOWN');
								} elseif ( $round_policy_obj->getRoundType() == 30 ) {
									Debug::Text(' Snap Time UP', __FILE__, __LINE__, __METHOD__, 10);
									$total_break_time = TTDate::snapTime($total_break_time, $break_policy_time, 'UP');
								} else {
									Debug::Text(' Not Snaping Time', __FILE__, __LINE__, __METHOD__, 10);
								}
							}

							$epoch = ( $plf->getCurrent()->getTimeStamp() + $total_break_time );
							Debug::text('Epoch after total rounding is: '. $epoch .' - '. TTDate::getDate('DATE+TIME', $epoch), __FILE__, __LINE__, __METHOD__, 10);

							$is_rounded_timestamp = TRUE;
						} else {
							Debug::text('DID NOT Find break Punch Out: '. TTDate::getDate('DATE+TIME', $plf->getCurrent()->getTimeStamp() ), __FILE__, __LINE__, __METHOD__, 10);
						}
					} else {
						Debug::text('Skipping break Total Rounding: '. TTDate::getDate('DATE+TIME', $epoch ), __FILE__, __LINE__, __METHOD__, 10);
					}
				} elseif ( $round_policy_obj->getPunchType() == 120 ) { //Day Total Rounding
					Debug::text('Day Total Rounding: '. TTDate::getDate('DATE+TIME', $epoch ), __FILE__, __LINE__, __METHOD__, 10);
					if ( $this->getStatus() == 20 AND $this->getType() == 10 ) { //Out, Type Normal
						Debug::text('bDay Total Rounding: '. TTDate::getDate('DATE+TIME', $epoch ), __FILE__, __LINE__, __METHOD__, 10);

						//If strict is set, round to scheduled time?
						$plf = TTnew( 'PunchListFactory' );
						$plf->getPreviousPunchByUserIdAndEpochAndNotPunchIDAndMaximumShiftTime( $this->getUser(), $epoch, $this->getId() );
						if ( $plf->getRecordCount() == 1 ) {
							Debug::text('Found Previous Punch In: '. TTDate::getDate('DATE+TIME', $plf->getCurrent()->getTimeStamp() ), __FILE__, __LINE__, __METHOD__, 10);

							//Get day total time prior to this punch control.
							$pclf = TTnew( 'PunchControlListFactory' );
							$pclf->getByUserIdAndDateStamp( $this->getUser(), $plf->getCurrent()->getPunchControlObject()->getDateStamp() );
							if ( $pclf->getRecordCount() > 0 ) {
								$day_total_time = ( $epoch - $plf->getCurrent()->getTimeStamp() );
								Debug::text('aDay Total Time: '. $day_total_time .' Current Punch Control ID: '. $this->getPunchControlID(), __FILE__, __LINE__, __METHOD__, 10);

								foreach( $pclf as $pc_obj ) {
									if ( $plf->getCurrent()->getPunchControlID() != $pc_obj->getID() ) {
										Debug::text('Punch Control Total Time: '. $pc_obj->getTotalTime() .' ID: '. $pc_obj->getId(), __FILE__, __LINE__, __METHOD__, 10);
										$day_total_time += $pc_obj->getTotalTime();
									}
								}

								//Take into account paid meal/breaks when doing day total rounding...
								//  Since we don't know what time will be added/deducted when creating a new punch, but it has already happened when editing an existing punch,
								//  the calculations should be based on the RAW time taken only. So we need to add back in any meal/break time taken but not auto-deducted/added.
								//  **If the Meal/Break policy active after setting is greater than the first part of the shift before lunch, then when creating a new punch the rounding will not work, because the policy hasn't been calculated yet.
								//      So if the rounding isn't being calculated correctly, they may need to set the active after setting lower, to ensure the meal policy is calculated before the last punch of the day.
								//  See testRoundingDayTotal*() unit tests.
								$meal_and_break_adjustment = 0;
								$udtlf = TTnew( 'UserDateTotalListFactory' );
								$udtlf->getByUserIdAndDateStampAndObjectType( $this->getUser(), $plf->getCurrent()->getPunchControlObject()->getDateStamp(), array(100, 110) ); //Only consider time calculated from meal/break policies. Not time taken.
								if ( $udtlf->getRecordCount() > 0 ) {
									foreach( $udtlf as $udt_obj ) {
										$meal_and_break_adjustment += $udt_obj->getTotalTime();
									}
									Debug::text('Meal and Break Adjustment: '. $meal_and_break_adjustment .' Records: '. $udtlf->getRecordCount(), __FILE__, __LINE__, __METHOD__, 10);
								}
								$day_total_time += $meal_and_break_adjustment;

								$original_day_total_time = $day_total_time;

								Debug::text('cDay Total Time: '. $day_total_time, __FILE__, __LINE__, __METHOD__, 10);
								if ( $day_total_time > 0 ) {
									//Need to handle split shifts properly, so just like we get all punches for the user_date_id, get all schedules too.
									$has_schedule = FALSE;
									$schedule_day_total_time = 0;

									//Test rounding condition, needs to happen after we attempt to get the schedule at least.
									if ( $round_policy_obj->isConditionTrue( $day_total_time, FALSE ) == FALSE ) {
										continue;
									}

									$slf = TTnew('ScheduleListFactory');
									//$slf->getByUserDateId( $plf->getCurrent()->getPunchControlObject()->getUserDateID() );
									$slf->getByUserIdAndDateStamp( $this->getUser(), $plf->getCurrent()->getPunchControlObject()->getDateStamp() );
									if ( $slf->getRecordCount() > 0 ) {
										$has_schedule = TRUE;
										foreach( $slf as $s_obj ) {
											//Because auto-deduct meal/break policies are already accounted for in the total schedule time, they will be automatically
											//deducted once the punch is saved. So if we don't add them back in here they will be deducted twice.
											//The above happens when adding new punches, but editing existing punches need to account for any already deducted meal/break time.
											//  This was causing problems with auto-deduct meal policies where the user punched for part of the meal time, and it auto-deducted the rest.
											//  Since we don't know what time will be added/deducted when creating a new punch, but it has already happened when editing an existing punch,
											//  the calculations should be based on the RAW time only.
											//$schedule_day_total_time += ( $s_obj->getTotalTime() + abs($s_obj->getMealPolicyDeductTime( $s_obj->calcRawTotalTime(), 10 )) + abs($s_obj->getBreakPolicyDeductTime( $s_obj->calcRawTotalTime(), 10 )) + $meal_and_break_adjustment );
											$schedule_day_total_time += $s_obj->calcRawTotalTime();
										}
										Debug::text('Before Grace: '. $day_total_time .' Schedule Day Total: '. $schedule_day_total_time, __FILE__, __LINE__, __METHOD__, 10);
										$day_total_time = TTDate::graceTime($day_total_time, $round_policy_obj->getGrace(), $schedule_day_total_time );
										Debug::text('After Grace: '. $day_total_time, __FILE__, __LINE__, __METHOD__, 10);
									}
									unset($slf, $s_obj);

									if ( $round_policy_obj->getInterval() > 0 )	 {
										Debug::Text(' Rounding to interval: '. $round_policy_obj->getInterval(), __FILE__, __LINE__, __METHOD__, 10);
										$day_total_time = TTDate::roundTime($day_total_time, $round_policy_obj->getInterval(), $round_policy_obj->getRoundType(), $round_policy_obj->getGrace() );
										Debug::text('After Rounding: '. $day_total_time, __FILE__, __LINE__, __METHOD__, 10);
									}

									if (  $has_schedule == TRUE AND $round_policy_obj->getStrict() == TRUE
											AND $schedule_day_total_time > 0 ) {
										Debug::Text(' Snap Time: Round Type: '. $round_policy_obj->getRoundType(), __FILE__, __LINE__, __METHOD__, 10);
										if ( $round_policy_obj->getRoundType() == 10 ) {
											Debug::Text(' Snap Time DOWN ', __FILE__, __LINE__, __METHOD__, 10);
											$day_total_time = TTDate::snapTime($day_total_time, $schedule_day_total_time, 'DOWN');
										} elseif ( $round_policy_obj->getRoundType() == 30 ) {
											Debug::Text(' Snap Time UP', __FILE__, __LINE__, __METHOD__, 10);
											$day_total_time = TTDate::snapTime($day_total_time, $schedule_day_total_time, 'UP');
										} else {
											Debug::Text(' Not Snaping Time', __FILE__, __LINE__, __METHOD__, 10);
										}
									}

									Debug::text('cDay Total Time: '. $day_total_time, __FILE__, __LINE__, __METHOD__, 10);

									$day_total_time_diff = ( $day_total_time - $original_day_total_time );
									Debug::text('Day Total Diff: '. $day_total_time_diff, __FILE__, __LINE__, __METHOD__, 10);

									$epoch = ( $original_epoch + $day_total_time_diff );

									$is_rounded_timestamp = TRUE;
								}
							}
						} else {
							Debug::text('DID NOT Find Normal Punch Out: '. TTDate::getDate('DATE+TIME', $plf->getCurrent()->getTimeStamp() ), __FILE__, __LINE__, __METHOD__, 10);
						}
					} else {
						Debug::text('Skipping Lunch Total Rounding: '. TTDate::getDate('DATE+TIME', $epoch ), __FILE__, __LINE__, __METHOD__, 10);
					}
				} else {
					Debug::text('NOT Total Rounding: '. TTDate::getDate('DATE+TIME', $epoch ), __FILE__, __LINE__, __METHOD__, 10);

					$in_schedule_window = $this->inScheduleStartStopWindow( $epoch, $this->getStatus() );
					//Test rounding condition, needs to happen after we attempt to get the schedule at least, which inScheduleStartStopWindow() does for us.
					// But this also needs to ahppen before we apply the grace period below,
					//   otherwise the epoch will already be adjusted, and makes it hard to predict what the condition will be testing against.
					if ( $round_policy_obj->isConditionTrue( $epoch, $this->getScheduleWindowTime() ) == FALSE ) {
						continue;
					}

					if ( $in_schedule_window == TRUE AND $round_policy_obj->getGrace() > 0 )	 {
						Debug::text(' Applying Grace Period: ', __FILE__, __LINE__, __METHOD__, 10);
						$epoch = TTDate::graceTime($epoch, $round_policy_obj->getGrace(), $this->getScheduleWindowTime() );
						Debug::text('After Grace: '. TTDate::getDate('DATE+TIME', $epoch ), __FILE__, __LINE__, __METHOD__, 10);
					}
					unset($in_schedule_window);

					$grace_time = $round_policy_obj->getGrace();
					//If strict scheduling is enabled, handle grace times differently.
					//Only apply them above if we are near the schedule start/stop time.
					//This allows for grace time to apply if an employee punches in late,
					//but afterwards not apply at all.
					if ( $round_policy_obj->getStrict() == TRUE ) {
						$grace_time = 0;
					}

					if ( $round_policy_obj->getInterval() > 0 )	 {
						Debug::Text(' Rounding to interval: '. $round_policy_obj->getInterval(), __FILE__, __LINE__, __METHOD__, 10);
						$epoch = TTDate::roundTime($epoch, $round_policy_obj->getInterval(), $round_policy_obj->getRoundType(), $grace_time );
						Debug::text('After Rounding: '. TTDate::getDate('DATE+TIME', $epoch ), __FILE__, __LINE__, __METHOD__, 10);
					}

					//ONLY perform strict rounding on Normal punches, not break/lunch punches?
					//Modify the UI to restrict this as well perhaps?
					if ( $round_policy_obj->getStrict() == TRUE AND $this->getScheduleWindowTime() !== FALSE ) {
						Debug::Text(' Snap Time: Round Type: '. $round_policy_obj->getRoundType(), __FILE__, __LINE__, __METHOD__, 10);
						if ( $round_policy_obj->getRoundType() == 10 ) {
							Debug::Text(' Snap Time DOWN ', __FILE__, __LINE__, __METHOD__, 10);
							$epoch = TTDate::snapTime($epoch, $this->getScheduleWindowTime(), 'DOWN');
						} elseif ( $round_policy_obj->getRoundType() == 30 ) {
							Debug::Text(' Snap Time UP', __FILE__, __LINE__, __METHOD__, 10);
							$epoch = TTDate::snapTime($epoch, $this->getScheduleWindowTime(), 'UP');
						} else {
							//If its an In Punch, snap up, if its out punch, snap down?
							Debug::Text(' Average rounding type, automatically determining snap direction.', __FILE__, __LINE__, __METHOD__, 10);
							if ( $this->getStatus() == 10 ) {
								Debug::Text(' Snap Time UP', __FILE__, __LINE__, __METHOD__, 10);
								$epoch = TTDate::snapTime($epoch, $this->getScheduleWindowTime(), 'UP');
							} else {
								Debug::Text(' Snap Time DOWN ', __FILE__, __LINE__, __METHOD__, 10);
								$epoch = TTDate::snapTime($epoch, $this->getScheduleWindowTime(), 'DOWN');
							}
						}
					}

					$is_rounded_timestamp = TRUE;
				}

				//In cases where employees transfer between jobs, then have rounding on just In or Out punches,
				//its possible for a punch in to be at 3:04PM and a later Out punch at 3:07PM to be rounded down to 3:00PM,
				//causing a conflict and the punch not to be saved at all.
				//In these cases don't round the punch.
				//Don't implement just yet...
				/*
				$plf = TTnew( 'PunchListFactory' );
				$plf->getPreviousPunchByUserIdAndStatusAndTypeAndEpoch( $this->getUser(), 10, array(10, 20, 30), $original_epoch );
				if ( $plf->getRecordCount() == 1 ) {
					if ( $epoch <= $plf->getCurrent()->getTimeStamp() ) {
						Debug::text(' Rounded TimeStamp is before previous punch, not rounding at all! Previous Punch: '. TTDate::getDate('DATE+TIME', $plf->getCurrent()->getTimeStamp() ) .' Rounded Time: '. TTDate::getDate('DATE+TIME', $epoch ), __FILE__, __LINE__, __METHOD__, 10);
						$epoch = $original_epoch;
					}
				}
				unset($plf, $p_obj);
				*/
			}

			//In cases where there may be one or more conditional rounding policies, if none of the conditions match, the punch still needs to be rounded down to the nearest minute,
			//otherwise its recorded to the nearest second when they may not be expecting that.
			// So when we know there are rounding policies, if none of them get applied, treat it as if there aren't any policies at all and still round to the minute.
			if ( $is_rounded_timestamp == FALSE ) {
				Debug::text(' Rounding Policy(s) found, but due to conditions none applied...', __FILE__, __LINE__, __METHOD__, 10);
				$epoch = TTDate::roundTime($epoch, 60, 10); //Round down.
			}
		} else {
			Debug::text(' NO Rounding Policy(s) Found', __FILE__, __LINE__, __METHOD__, 10);

			//Even when rounding policies don't exist,
			//  Always round *down* to the nearest minute, no matter what. Even on a transfer punch.
			//  We used to round to the nearest minute (average), however in v10.5.0 this was changed.
			//  Instead this mimics what a wall clock would show, for example 8:00:59 shows as 8:00, so if we do average rounding it would record as 8:01 which they may not expect.
			//  So if we always round down its still fair and consistent, for both IN and OUT punches, but it more closely matches a clock that they may be looking at, assuming its close to the server time at least.
			//
			//  **To disable rounding completely and record punches to the exact second, they must create a rounding policy with a interval of 0 and no grace time.
			//
			//  This is also done in setTimeStamp() when rounding policies are disabled.
			$epoch = TTDate::roundTime($epoch, 60, 10); //Round down.
		}

		Debug::text(' Rounded TimeStamp: '. TTDate::getDate('DATE+TIME', $epoch ) .'('. $epoch .') Original TimeStamp: '. TTDate::getDate('DATE+TIME', $original_epoch ), __FILE__, __LINE__, __METHOD__, 10);
		return $epoch;
	}

	/**
	 * @param bool $raw
	 * @return bool|int
	 */
	function getTimeStamp( $raw = FALSE ) {
		$value = $this->getGenericDataValue( 'time_stamp' );
		if ( $value !== FALSE ) {
			if ( $raw === TRUE) {
				return $value;
			} else {
				//return $this->db->UnixTimeStamp( $this->data['start_date'] );
				//strtotime is MUCH faster than UnixTimeStamp
				//Must use ADODB for times pre-1970 though.
				return TTDate::strtotime( $value );
			}
		}

		return FALSE;
	}

	/**
	 * @param int $epoch EPOCH
	 * @param bool $enable_rounding
	 * @return bool
	 */
	function setTimeStamp( $value, $enable_rounding = TRUE) {
		$value = trim($value);

		//We can't disable rounding if its the first IN punch and no transfer actually needs to occur.
		//Have setTransfer check to see if there is a previous punch and if not, don't allow it to be set.
		if ( $enable_rounding == TRUE ) {
			$value = $this->roundTimeStamp($value);
		} else {
			Debug::text(' Rounding policies disabled... ', __FILE__, __LINE__, __METHOD__, 10);

			//When rounding is disabled, that just disables rounding policies.
			//  Still always round *down* to the nearest minute, no matter what. Even on a transfer punch.
		//  We used to round to the nearest minute (average), however in v10.5.0 this was changed.
		//  Instead this mimics what a wall clock would show, for example 8:00:59 shows as 8:00, so if we do average rounding it would record as 8:01 which they may not expect.
		//  So if we always round down its still fair and consistent, for both IN and OUT punches, but it more closely matches a clock that they may be looking at, assuming its close to the server time at least.
			//
			//  **To disable rounding completely and record punches to the exact second, they must create a rounding policy with a interval of 0 and no grace time.
			//
			//  This is also done in roundTimeStamp() when no rounding policies apply.
			$value = TTDate::roundTime($value, 60, 10); //Round down.
		}
		Debug::text(' Set: '. $value, __FILE__, __LINE__, __METHOD__, 10);
		return $this->setGenericDataValue( 'time_stamp', $value );
	}

	/**
	 * @param bool $raw
	 * @return bool|int
	 */
	function getOriginalTimeStamp( $raw = FALSE ) {
		$value = $this->getGenericDataValue( 'original_time_stamp' );
		if ( $value !== FALSE ) {
			if ( $raw === TRUE ) {
				return $value;
			} else {
				//return $this->db->UnixTimeStamp( $this->data['start_date'] );
				//strtotime is MUCH faster than UnixTimeStamp
				//Must use ADODB for times pre-1970 though.
				return TTDate::strtotime( $value );
			}
		}

		return FALSE;
	}

	/**
	 * @param int $epoch EPOCH
	 * @return bool
	 */
	function setOriginalTimeStamp( $value) {
		$value = ( !is_int($value) ) ? trim($value) : $value; //Dont trim integer values, as it changes them to strings.
		return $this->setGenericDataValue( 'original_time_stamp', $value );
	}

	/**
	 * @param bool $raw
	 * @return bool|int
	 */
	function getActualTimeStamp( $raw = FALSE ) {
		$value = $this->getGenericDataValue( 'actual_time_stamp' );
		if ( $value !== FALSE ) {
			if ( $raw === TRUE ) {
				return $value;
			} else {
				//return $this->db->UnixTimeStamp( $this->data['start_date'] );
				//strtotime is MUCH faster than UnixTimeStamp
				//Must use ADODB for times pre-1970 though.
				return TTDate::strtotime( $value );
			}
		}

		return FALSE;
	}

	/**
	 * @param int $epoch EPOCH
	 * @return bool
	 */
	function setActualTimeStamp( $value) {
		$value = ( !is_int($value) ) ? trim($value) : $value; //Dont trim integer values, as it changes them to strings.
		return $this->setGenericDataValue( 'actual_time_stamp', $value );
	}

	/**
	 * @return bool|float
	 */
	function getLongitude() {
		return $this->getGenericDataValue( 'longitude' );
	}

	/**
	 * @param $value
	 * @return bool
	 */
	function setLongitude( $value ) {
		if ( is_numeric($value) ) {
			$value = number_format( (float)TTi18n::parseFloat( $value ), 6 ); //Always use 6 decimal places as that is to 0.11m accuracy, this also prevents audit logging 0 vs 0.000000000
		} else {
			$value = NULL; //Allow $value=NULL so the coordinates can be cleared. Also make sure if FALSE is passed in here we assume NULL so it doesn't get cast to integer and saved in DB.
		}

		return $this->setGenericDataValue( 'longitude', $value );
	}

	/**
	 * @return bool|float
	 */
	function getLatitude() {
		return $this->getGenericDataValue( 'latitude' );
	}

	/**
	 * @param $value
	 * @return bool
	 */
	function setLatitude( $value ) {
		if ( is_numeric($value) ) {
			$value = number_format( (float)TTi18n::parseFloat( $value ), 6 ); //Always use 6 decimal places as that is to 0.11m accuracy, this also prevents audit logging 0 vs 0.000000000
		} else {
			$value = NULL; //Allow $value=NULL so the coordinates can be cleared. Also make sure if FALSE is passed in here we assume NULL so it doesn't get cast to integer and saved in DB.
		}

		return $this->setGenericDataValue( 'latitude', $value );
	}

	/**
	 * @return bool|float
	 */
	function getPositionAccuracy() {
		return $this->getGenericDataValue( 'position_accuracy' );
	}

	/**
	 * @param $value
	 * @return bool
	 */
	function setPositionAccuracy( $value ) {
		if ( is_numeric($value) ) {
			$value = number_format( (float)trim( $value ), 6 ); //This in meters.
		} else {
			$value = NULL; //If no position accuracy is sent, leave NULL.
		}

		return $this->setGenericDataValue( 'position_accuracy', $value );
	}

	/**
	 * @return bool
	 */
	function getScheduleID() {
		return $this->getGenericTempDataValue( 'schedule_id' );
	}

	/**
	 * @param string $id UUID
	 * @return bool
	 */
	function setScheduleID( $value ) {
		if ( $value != FALSE ) {
			//Each time this is called, clear the ScheduleObject() cache.
			$this->schedule_obj = NULL;
			return $this->setGenericTempDataValue( 'schedule_id', $value );
		}

		return FALSE;
	}

	/**
	 * @param int $epoch EPOCH
	 * @param string $user_id UUID
	 * @return bool
	 */
	function findScheduleID( $epoch = NULL, $user_id = NULL ) {
		//Debug::text(' aFinding SchedulePolicyID for this Punch: '. $epoch .' User ID: '. $user_id, __FILE__, __LINE__, __METHOD__, 10);
		if ( $epoch == '' ) {
			$epoch = $this->getTimeStamp();
		}

		if ( $epoch == FALSE ) {
			return FALSE;
		}

		if ( $user_id == '' AND $this->getUser() == '' ) {
			Debug::text(' User ID not specified, cant find schedule... ', __FILE__, __LINE__, __METHOD__, 10);
			return FALSE;
		} elseif ( $user_id == '' ) {
			$user_id = $this->getUser();
		}
		//Debug::text(' bFinding SchedulePolicyID for this Punch: '. $epoch .' User ID: '. $user_id, __FILE__, __LINE__, __METHOD__, 10);

		//Check to see if this punch is within the start/stop window for the schedule.
		//We need to make sure we get schedules within about a 24hr
		//window of this punch, because if punch is at 11:55AM and the schedule starts at 12:30AM it won't
		//be found by a user_date_id.
		//In cases where an absence shift ends at the exact same time as working shift begins (Absence: 11:30PM to 7:00AM, WORKING: 7:00AM-3:00PM),
		//order the working shift first so its used instead of the absence shift.
		$slf = TTnew( 'ScheduleListFactory' );
		$slf->getByUserIdAndStartDateAndEndDate( $user_id, ($epoch - 43200), ($epoch + 43200), NULL, array( 'a.date_stamp' => 'asc', 'a.status_id' => 'asc' ) );
		if ( $slf->getRecordCount() > 0 ) {
			$retval = FALSE;
			$best_diff = FALSE;
			//Check for schedule policy
			foreach ( $slf as $s_obj ) {
				Debug::text(' Checking Schedule ID: '. $s_obj->getID(), __FILE__, __LINE__, __METHOD__, 10);

				//If the Start/Stop window is large (ie: 6-8hrs) we need to find the closest schedule.
				$schedule_diff = $s_obj->inScheduleDifference( $epoch, $this->getStatus() );
				if ( $schedule_diff === 0 ) {
					Debug::text(' Within schedule times. ', __FILE__, __LINE__, __METHOD__, 10);
					return $s_obj->getId();
				} else {
					if ( $schedule_diff > 0 AND ( $best_diff === FALSE OR $schedule_diff < $best_diff ) ) {
						Debug::text(' Within schedule start/stop time by: '. $schedule_diff .' Prev Best Diff: '. $best_diff, __FILE__, __LINE__, __METHOD__, 10);
						$best_diff = $schedule_diff;
						$retval = $s_obj->getId();
					}
				}
			}

			Debug::text(' Final Schedule ID: '. $retval, __FILE__, __LINE__, __METHOD__, 10);
			return $retval;
		} else {
			Debug::text(' Did not find Schedule...', __FILE__, __LINE__, __METHOD__, 10);
		}

		return FALSE;
	}

	/**
	 * @return bool
	 */
	function getEnableCalcSystemTotalTime() {
		if ( isset($this->calc_system_total_time) ) {
			return $this->calc_system_total_time;
		}

		return FALSE;
	}

	/**
	 * @param $bool
	 * @return bool
	 */
	function setEnableCalcSystemTotalTime( $bool) {
		$this->calc_system_total_time = $bool;

		return TRUE;
	}

	/**
	 * @return bool
	 */
	function getEnableCalcWeeklySystemTotalTime() {
		if ( isset($this->calc_weekly_system_total_time) ) {
			return $this->calc_weekly_system_total_time;
		}

		return FALSE;
	}

	/**
	 * @param $bool
	 * @return bool
	 */
	function setEnableCalcWeeklySystemTotalTime( $bool) {
		$this->calc_weekly_system_total_time = $bool;

		return TRUE;
	}

	/**
	 * @return bool
	 */
	function getEnableCalcException() {
		if ( isset($this->calc_exception) ) {
			return $this->calc_exception;
		}

		return FALSE;
	}

	/**
	 * @param $bool
	 * @return bool
	 */
	function setEnableCalcException( $bool) {
		$this->calc_exception = $bool;

		return TRUE;
	}

	/**
	 * @return bool
	 */
	function getEnablePreMatureException() {
		if ( isset($this->premature_exception) ) {
			return $this->premature_exception;
		}

		return FALSE;
	}

	/**
	 * @param $bool
	 * @return bool
	 */
	function setEnablePreMatureException( $bool) {
		$this->premature_exception = $bool;

		return TRUE;
	}

	/**
	 * @return bool
	 */
	function getEnableCalcUserDateTotal() {
		if ( isset($this->calc_user_date_total) ) {
			return $this->calc_user_date_total;
		}

		return FALSE;
	}

	/**
	 * @param $bool
	 * @return bool
	 */
	function setEnableCalcUserDateTotal( $bool) {
		$this->calc_user_date_total = $bool;

		return TRUE;
	}

	/**
	 * @return bool
	 */
	function getEnableCalcUserDateID() {
		if ( isset($this->calc_user_date_id) ) {
			return $this->calc_user_date_id;
		}

		return FALSE;
	}

	/**
	 * @param $bool
	 * @return bool
	 */
	function setEnableCalcUserDateID( $bool) {
		$this->calc_user_date_id = $bool;

		return TRUE;
	}

	/**
	 * @return bool
	 */
	function getEnableCalcTotalTime() {
		if ( isset($this->calc_total_time) ) {
			return $this->calc_total_time;
		}

		return FALSE;
	}

	/**
	 * @param $bool
	 * @return bool
	 */
	function setEnableCalcTotalTime( $bool) {
		$this->calc_total_time = $bool;

		return TRUE;
	}

	/**
	 * @return bool
	 */
	function getEnableAutoTransfer() {
		if ( isset($this->auto_transfer) ) {
			return $this->auto_transfer;
		}

		return FALSE; //Default to FALSE otherwise roundTimeStamp() will treat it as a transfer punch and only apply the transfer rounding policy type to it.
		//return TRUE;
	}

	/**
	 * @param $bool
	 * @return bool
	 */
	function setEnableAutoTransfer( $bool) {
		$this->auto_transfer = $bool;

		return TRUE;
	}

	/**
	 * @return bool
	 */
	function getEnableSplitAtMidnight() {
		if ( isset($this->split_at_midnight) ) {
			return $this->split_at_midnight;
		}

		return TRUE;
	}

	/**
	 * @param $bool
	 * @return bool
	 */
	function setEnableSplitAtMidnight( $bool) {
		$this->split_at_midnight = $bool;

		return TRUE;
	}

	/**
	 * @return bool
	 */
	function getScheduleWindowTime() {
		return $this->getGenericTempDataValue( 'schedule_window_time' );
	}

	/**
	 * @param int $epoch EPOCH
	 * @param int $status_id
	 * @return bool
	 */
	function inScheduleStartStopWindow( $epoch, $status_id ) {
		if ( $epoch == '' ) {
			return FALSE;
		}

		$this->setScheduleID( $this->findScheduleID( $epoch ) );

		if ( $this->getScheduleObject() == FALSE ) {
			return FALSE;
		}

		//If the Start/Stop window is excessively long (like 6-8hrs) with strict rounding and an user punches in AND out within that time,
		//we have to return the schedule time in accordance to the punch status (In/Out) to prevent rounding Out punches to the schedule start time
		if ( $status_id == 10 AND $this->getScheduleObject()->inStartWindow( $epoch ) == TRUE ) { //Consider In punches only.
			Debug::text(' Within Start window... Schedule Policy ID: '. $this->getScheduleObject()->getSchedulePolicyID(), __FILE__, __LINE__, __METHOD__, 10);
			$this->setGenericTempDataValue( 'schedule_window_time', $this->getScheduleObject()->getStartTime() );
			return TRUE;
		} elseif ( $status_id == 20 AND $this->getScheduleObject()->inStopWindow( $epoch ) == TRUE ) { //Consider Out punches only.
			Debug::text(' Within Start window... Schedule Policy ID: '. $this->getScheduleObject()->getSchedulePolicyID(), __FILE__, __LINE__, __METHOD__, 10);
			$this->setGenericTempDataValue( 'schedule_window_time', $this->getScheduleObject()->getEndTime() );
			return TRUE;
		} else {
			Debug::text(' NOT Within Start/Stop window.', __FILE__, __LINE__, __METHOD__, 10);
		}

		return FALSE;
	}

	//Run this function on the previous punch object normally.

	/**
	 * @param int $current_epoch EPOCH
	 * @param int $previous_epoch EPOCH
	 * @param null $previous_punch_status
	 * @return bool
	 */
	function inMealPolicyWindow( $current_epoch, $previous_epoch, $previous_punch_status = NULL ) {
		Debug::Text(' Checking if we are in meal policy window/punch time...', __FILE__, __LINE__, __METHOD__, 10);

		if ( $current_epoch == '' ) {
			return FALSE;
		}

		if ( $previous_epoch == '' ) {
			return FALSE;
		}

		Debug::Text(' bChecking if we are in meal policy window/punch time...', __FILE__, __LINE__, __METHOD__, 10);

		$mplf = TTnew( 'MealPolicyListFactory' );
		if ( is_object( $this->getScheduleObject() )
				AND is_object( $this->getScheduleObject()->getSchedulePolicyObject() )
				AND $this->getScheduleObject()->getSchedulePolicyObject()->isUsePolicyGroupMealPolicy() == FALSE ) {
			$policy_group_meal_policy_ids = $this->getScheduleObject()->getSchedulePolicyObject()->getMealPolicy();
			$mplf->getByIdAndCompanyId( $policy_group_meal_policy_ids, $this->getUserObject()->getCompany() );
			$start_epoch = $this->getScheduleObject()->getStartTime();
		} else {
			$mplf->getByPolicyGroupUserId( $this->getUser() );
			$start_epoch = $previous_epoch;
		}

		//Debug::Text('Meal Policy Record Count: '. $mplf->getRecordCount(), __FILE__, __LINE__, __METHOD__, 10);
		if ( $mplf->getRecordCount() > 0 ) {
			$mp_obj = $mplf->getCurrent();
		}
		unset($mplf);

		//Start time should be the shift start time, not the previous punch start time.
		//Get shift data here.
		if ( is_object( $this->getPunchControlObject() ) ) {
			$this->getPunchControlObject()->setPunchObject( $this );
			$shift_data = $this->getPunchControlObject()->getShiftData();
			if ( is_array($shift_data) AND isset($shift_data['first_in']) ) {
				Debug::Text(' Shift First In Punch: '. TTDate::getDate('DATE+TIME', $shift_data['first_in']['time_stamp'] ), __FILE__, __LINE__, __METHOD__, 10);
				$start_epoch = $shift_data['first_in']['time_stamp'];
			}
		}

		if ( isset($mp_obj) AND is_object( $mp_obj ) ) {
			if ( $mp_obj->getAutoDetectType() == 10 ) { //Meal window
				Debug::Text(' Auto Detect Type: Meal Window...', __FILE__, __LINE__, __METHOD__, 10);

				//Make we sure ignore meals if the previous punch status was OUT.
				if (	$previous_punch_status != 20
						AND $current_epoch >= ( $start_epoch + $mp_obj->getStartWindow() )
						AND $current_epoch <= ( $start_epoch + $mp_obj->getStartWindow() + $mp_obj->getWindowLength() ) ) {
					Debug::Text(' aPunch is in meal policy window! Current Epoch: '. TTDate::getDate('DATE+TIME', $current_epoch), __FILE__, __LINE__, __METHOD__, 10);

					return TRUE;
				}
			} else { //Punch time.
				Debug::Text(' Auto Detect Type: Punch Time...', __FILE__, __LINE__, __METHOD__, 10);
				//Make we sure ignore meals if the previous punch status was IN.
				if (	$previous_punch_status != 10
						AND ( $current_epoch - $previous_epoch ) >= $mp_obj->getMinimumPunchTime()
						AND ( $current_epoch - $previous_epoch ) <= $mp_obj->getMaximumPunchTime() )  {
					Debug::Text(' bPunch is in meal policy window!', __FILE__, __LINE__, __METHOD__, 10);

					return TRUE;
				}
			}
		} else {
			Debug::Text(' Unable to find meal policy object...', __FILE__, __LINE__, __METHOD__, 10);
		}

		return FALSE;
	}

	//Run this function on the previous punch object normally.

	/**
	 * @param int $current_epoch EPOCH
	 * @param int $previous_epoch EPOCH
	 * @param null $previous_punch_status
	 * @return bool
	 */
	function inBreakPolicyWindow( $current_epoch, $previous_epoch, $previous_punch_status = NULL ) {
		Debug::Text(' Checking if we are in break policy window/punch time... Current: '. TTDate::getDate('DATE+TIME', $current_epoch) .' Previous: '. TTDate::getDate('DATE+TIME', $previous_epoch), __FILE__, __LINE__, __METHOD__, 10);

		if ( $current_epoch == '' ) {
			return FALSE;
		}

		if ( $previous_epoch == '' ) {
			return FALSE;
		}


		$bplf = TTnew( 'BreakPolicyListFactory' );
		if ( is_object( $this->getScheduleObject() )
				AND is_object( $this->getScheduleObject()->getSchedulePolicyObject() )
				AND $this->getScheduleObject()->getSchedulePolicyObject()->isUsePolicyGroupBreakPolicy() == FALSE ) {
			$policy_group_break_policy_ids = $this->getScheduleObject()->getSchedulePolicyObject()->getBreakPolicy();
			$bplf->getByIdAndCompanyId( $policy_group_break_policy_ids, $this->getUserObject()->getCompany() );
			$start_epoch = $this->getScheduleObject()->getStartTime(); //Keep these here in case PunchControlObject can't be determined.
		} else {
			$bplf->getByPolicyGroupUserId( $this->getUser() );
			$start_epoch = $previous_epoch; //Keep these here in case PunchControlObject can't be determined.
		}

		$bp_objs = array();
		if ( $bplf->getRecordCount() > 0 ) {
			foreach( $bplf as $bp_obj ) {
				$bp_objs[] = $bp_obj;
			}
		}
		unset($bplf);

		/*
		if ( is_object( $this->getScheduleObject() )
				AND is_object( $this->getScheduleObject()->getSchedulePolicyObject() )
				AND is_array($this->getScheduleObject()->getSchedulePolicyObject()->getBreakPolicy() )
				) {
			Debug::Text(' Found Schedule Break Policies...', __FILE__, __LINE__, __METHOD__, 10);
			$bp_ids = $this->getScheduleObject()->getSchedulePolicyObject()->getBreakPolicy();
			foreach( $bp_ids as $bp_id ) {
				$bp_obj = $this->getScheduleObject()->getSchedulePolicyObject()->getBreakPolicyObject( $bp_id );
				if ( is_object($bp_obj ) ) {
					$bp_objs[] = $bp_obj;
				}
			}
			unset($bp_ids, $bp_obj);

			$start_epoch = $this->getScheduleObject()->getStartTime(); //Keep these here in case PunchControlObject can't be determined.
		} else {
			//Make sure prev punch is a Break Out Punch
			//Check NON-scheduled break policies
			$bplf = TTnew( 'BreakPolicyListFactory' );
			$bplf->getByPolicyGroupUserId( $this->getUser() );
			if ( $bplf->getRecordCount() > 0 ) {
				foreach( $bplf as $bp_obj ) {
					$bp_objs[] = $bp_obj;
				}

				$start_epoch = $previous_epoch; //Keep these here in case PunchControlObject can't be determined.
				Debug::Text(' Found NON Schedule Break Policy...', __FILE__, __LINE__, __METHOD__, 10);
			} else {
				Debug::Text(' DID NOT Find NON Schedule Break Policy...', __FILE__, __LINE__, __METHOD__, 10);
			}
			unset($bplf);
		}
		*/

		//Start time should be the shift start time, not the previous punch start time.
		//Get shift data here.
		if ( is_object( $this->getPunchControlObject() ) ) {
			$this->getPunchControlObject()->setPunchObject( $this );
			$shift_data = $this->getPunchControlObject()->getShiftData();
			if ( is_array($shift_data) AND isset($shift_data['first_in']) ) {
				Debug::Text(' Shift First In Punch: '. TTDate::getDate('DATE+TIME', $shift_data['first_in']['time_stamp'] ), __FILE__, __LINE__, __METHOD__, 10);
				$start_epoch = $shift_data['first_in']['time_stamp'];
			}
		}

		if ( empty($bp_objs) == FALSE ) {
			foreach( $bp_objs as $bp_obj ) {
				if ( $bp_obj->getAutoDetectType() == 10 ) { //Meal window
					Debug::Text(' Auto Detect Type: Break Window... Start Epoch: '. TTDate::getDate('DATE+TIME', $start_epoch), __FILE__, __LINE__, __METHOD__, 10);

					//Make we sure ignore breaks if the previous punch status was OUT.
					if (	$previous_punch_status != 20
							AND $current_epoch >= ( $start_epoch + $bp_obj->getStartWindow() )
							AND $current_epoch <= ( $start_epoch + $bp_obj->getStartWindow() + $bp_obj->getWindowLength() ) ) {
						Debug::Text(' aPunch is in break policy (ID:'. $bp_obj->getId().') window!', __FILE__, __LINE__, __METHOD__, 10);

						return TRUE;
					}
				} else { //Punch time.
					//Make we sure ignore breaks if the previous punch status was IN.
					Debug::Text(' Auto Detect Type: Punch Time...', __FILE__, __LINE__, __METHOD__, 10);
					if (	$previous_punch_status != 10
							AND ( $current_epoch - $previous_epoch ) >= $bp_obj->getMinimumPunchTime()
							AND ( $current_epoch - $previous_epoch ) <= $bp_obj->getMaximumPunchTime() )  {
						Debug::Text(' bPunch is in break policy (ID:'. $bp_obj->getId().') window!', __FILE__, __LINE__, __METHOD__, 10);

						return TRUE;
					}
				}
			}
		} else {
			Debug::Text(' Unable to find break policy object...', __FILE__, __LINE__, __METHOD__, 10);
		}

		return FALSE;
	}

	/**
	 * @param object $user_obj
	 * @param int $epoch EPOCH
	 * @param object $station_obj
	 * @param object $permission_obj
	 * @return array
	 */
	function getDefaultPunchSettings( $user_obj, $epoch, $station_obj = NULL, $permission_obj = NULL ) {
		$branch_id = $department_id = $job_id = $job_item_id = TTUUID::getZeroID();
		$transfer = FALSE;
		$is_previous_punch = FALSE;

		$prev_punch_obj = $this->getPreviousPunchObject( $epoch, $user_obj->getId(), TRUE ); //Ignore future punches, so auto-punch shifts in the future don't mess up default punch settings.
		if ( is_object( $prev_punch_obj ) ) {
			$is_previous_punch = TRUE;

			$prev_punch_obj->setUser( $user_obj->getId() );
			Debug::Text(' Found Previous Punch within Continuous Time from now: '. TTDate::getDate('DATE+TIME', $prev_punch_obj->getTimeStamp() ) .' ID: '. $prev_punch_obj->getID(), __FILE__, __LINE__, __METHOD__, 10);

			//Due to split shifts or multiple schedules on a single day that are close to one another, we have to be smarter about how we default punch settings.
			//We only base default punch settings on the previous punch if it was *NOT* a Normal Out punch, with the idea that the employee
			//would likely want to continue working on the same job after they come back from lunch/break, or if they haven't punched out for the end of this shift yet.
			//if ( ( is_object( $prev_punch_obj ) AND ( ( $prev_punch_obj->getStatus() == 10 AND $prev_punch_obj->getType() == 10 ) OR ( $prev_punch_obj->getStatus() == 20 AND $prev_punch_obj->getType() > 10 ) ) ) ) {
			if ( is_object( $prev_punch_obj ) AND !( $prev_punch_obj->getStatus() == 20 AND $prev_punch_obj->getType() == 10 ) ) {
				$branch_id = $prev_punch_obj->getPunchControlObject()->getBranch();
				$department_id = $prev_punch_obj->getPunchControlObject()->getDepartment();
				$job_id = $prev_punch_obj->getPunchControlObject()->getJob();
				$job_item_id = $prev_punch_obj->getPunchControlObject()->getJobItem();
			} else {
				Debug::Text(' Not using Previous Punch settings... Prev Status: '. $prev_punch_obj->getStatus() .' Type: '. $prev_punch_obj->getType(), __FILE__, __LINE__, __METHOD__, 10);
			}
		} else {
			Debug::Text(' DID NOT Find Previous Punch within Continuous Time from now: ', __FILE__, __LINE__, __METHOD__, 10);
		}


		if ( $branch_id == '' OR empty($branch_id) OR $branch_id == TTUUID::getZeroID()
				OR $department_id == '' OR empty($department_id) OR $department_id == TTUUID::getZeroID()
				OR $job_id == '' OR empty($job_id) OR $job_id == TTUUID::getZeroID()
				OR $job_item_id == '' OR empty($job_item_id) OR $job_item_id == TTUUID::getZeroID() ) {
			Debug::Text(' Null values: Branch: '. $branch_id .' Department: '. $department_id .' Job: '. $job_id .' Task: '. $job_item_id, __FILE__, __LINE__, __METHOD__, 10);

			$slf = TTnew( 'ScheduleListFactory' );
			$s_obj = $slf->getScheduleObjectByUserIdAndEpoch( $user_obj->getId(), $epoch );

			if ( $branch_id == '' OR empty($branch_id) OR $branch_id == TTUUID::getZeroID() ) {
				if ( is_object($station_obj) AND $station_obj->getDefaultBranch() !== FALSE AND $station_obj->getDefaultBranch() != TTUUID::getZeroID() ) {
					$branch_id = $station_obj->getDefaultBranch();
					//Debug::Text(' aOverriding branch to: '. $branch_id, __FILE__, __LINE__, __METHOD__, 10);
				} elseif ( is_object($s_obj) AND $s_obj->getBranch() != TTUUID::getZeroID() ) {
					$branch_id = $s_obj->getBranch();
					//Debug::Text(' bOverriding branch to: '. $branch_id, __FILE__, __LINE__, __METHOD__, 10);
				} elseif ( $user_obj->getDefaultBranch() != TTUUID::getZeroID() ) {
					$branch_id = $user_obj->getDefaultBranch();
					//Debug::Text(' cOverriding branch to: '. $branch_id, __FILE__, __LINE__, __METHOD__, 10);
				}
				Debug::Text(' Overriding branch to: '. $branch_id, __FILE__, __LINE__, __METHOD__, 10);
			}

			if ( $department_id == '' OR empty($department_id) OR $department_id == TTUUID::getZeroID() ) {
				if ( is_object($station_obj) AND $station_obj->getDefaultDepartment() !== FALSE AND $station_obj->getDefaultDepartment() != TTUUID::getZeroID() ) {
					$department_id = $station_obj->getDefaultDepartment();
				} elseif ( is_object($s_obj) AND $s_obj->getDepartment() != TTUUID::getZeroID() ) {
					$department_id = $s_obj->getDepartment();
				} elseif ( $user_obj->getDefaultDepartment() != TTUUID::getZeroID() ) {
					$department_id = $user_obj->getDefaultDepartment();
				}
				Debug::Text(' Overriding department to: '. $department_id, __FILE__, __LINE__, __METHOD__, 10);
			}

			if ( $job_id == '' OR empty($job_id) OR $job_id == TTUUID::getZeroID() ) {
				if ( is_object($station_obj) AND $station_obj->getDefaultJob() !== FALSE AND $station_obj->getDefaultJob() != TTUUID::getZeroID() ) {
					$job_id = $station_obj->getDefaultJob();
				} elseif ( is_object($s_obj) AND $s_obj->getJob() != TTUUID::getZeroID() ) {
					$job_id = $s_obj->getJob();
				} elseif ( $user_obj->getDefaultJob() != TTUUID::getZeroID() ) {
					$job_id = $user_obj->getDefaultJob();
				}
				Debug::Text(' Overriding job to: '. $job_id, __FILE__, __LINE__, __METHOD__, 10);
			}

			if ( $job_item_id == '' OR empty($job_item_id) OR $job_item_id == TTUUID::getZeroID() ) {
				if ( is_object($station_obj) AND $station_obj->getDefaultJobItem() !== FALSE AND $station_obj->getDefaultJobItem() != TTUUID::getZeroID() ) {
					$job_item_id = $station_obj->getDefaultJobItem();
				} elseif ( is_object($s_obj) AND $s_obj->getJobItem() != TTUUID::getZeroID() ) {
					$job_item_id = $s_obj->getJobItem();
				} elseif ( $user_obj->getDefaultJobItem() != TTUUID::getZeroID() ) {
					$job_item_id = $user_obj->getDefaultJobItem();
				}
				Debug::Text(' Overriding task to: '. $job_item_id, __FILE__, __LINE__, __METHOD__, 10);
			}
		}

		if ( $is_previous_punch == TRUE AND is_object( $prev_punch_obj ) ) {
			//Don't enable transfer by default if the previous punch was any OUT punch.
			//Transfer does the OUT punch for them, so if the previous punch is an OUT punch
			//we don't gain anything anyways.
			$default_transfer_on = ( is_object($permission_obj) ) ? $permission_obj->Check('punch', 'default_transfer', $user_obj->getId(), $user_obj->getCompany() ) : FALSE; //User/Company need to be passed into here otherwise its always false if called from APIClientStationUnAuthenticated

			//Check for "Disable: Default Transfer On" station flag and set default_transfer_on = FALSE if it is set.
			if ( $default_transfer_on == TRUE ) {
				$mode_flags = $station_obj->getModeFlag();
				if ( is_array($mode_flags) AND in_array(16384, $mode_flags) ) {
					$default_transfer_on = FALSE;
					Debug::Text( ' Turning off Transfer due to Station Flag: Disable: Default Transfer On ...', __FILE__, __LINE__, __METHOD__, 10 );
				}
			}

			if ( $default_transfer_on == TRUE AND ( isset($prev_punch_obj) AND is_object($prev_punch_obj) AND $prev_punch_obj->getStatus() == 10 ) ) {
				//Check to see if the employee is scheduled, if they are past their scheduled out time, then don't default to transfer.
				//If they are not scheduled default to transfer though.
				if ( !isset($s_obj) ) {
					$slf = TTnew( 'ScheduleListFactory' );
					$s_obj = $slf->getScheduleObjectByUserIdAndEpoch( $user_obj->getId(), $epoch );
				}
				if ( !is_object( $s_obj ) OR ( is_object( $s_obj ) AND $epoch < $s_obj->getEndTime() ) ) {
					$transfer = TRUE;
				}
			} else {
				Debug::Text(' Not setting Transfer: On...', __FILE__, __LINE__, __METHOD__, 10);
			}

			$next_type = (int)$prev_punch_obj->getNextType( $epoch ); //Detects breaks/lunches too.

			if ( $prev_punch_obj->getNextStatus() == 10 ) {
				//In punch - Carry over just certain data
				$data = array(
								'user_id' => $user_obj->getId(),
								//'user_full_name' => $user_obj->getFullName(),
								//'time_stamp' => $epoch,
								//'date_stamp' => $epoch,
								'transfer' => $transfer,
								'branch_id' => TTUUID::castUUID($branch_id),
								'department_id' => TTUUID::castUUID($department_id),
								'job_id' => TTUUID::castUUID($job_id),
								'job_item_id' => TTUUID::castUUID($job_item_id),
								'quantity' => 0,
								'bad_quantity' => 0,
								'status_id' => (int)$prev_punch_obj->getNextStatus(),
								'type_id' => (int)$next_type,
								'punch_control_id' => $prev_punch_obj->getNextPunchControlID(),
								'note' => '', //Must be null.
								'other_id1' => '',
								'other_id2' => '',
								'other_id3' => '',
								'other_id4' => '',
								'other_id5' => '',
								);
			} else {
				//Out punch
				$data = array(
								'user_id' => $user_obj->getId(),
								//'user_full_name' => $user_obj->getFullName(),
								//'time_stamp' => $epoch,
								//'date_stamp' => $epoch,
								'transfer' => $transfer,
								'branch_id' => TTUUID::castUUID($branch_id),
								'department_id' => TTUUID::castUUID($department_id),
								'job_id' => TTUUID::castUUID($job_id),
								'job_item_id' => TTUUID::castUUID($job_item_id),
								'quantity' => (float)$prev_punch_obj->getPunchControlObject()->getQuantity(),
								'bad_quantity' => (float)$prev_punch_obj->getPunchControlObject()->getBadQuantity(),
								'type_id' => (int)$next_type,
								'punch_control_id' => $prev_punch_obj->getNextPunchControlID(),
								'other_id1' => $prev_punch_obj->getPunchControlObject()->getOtherID1(),
								'other_id2' => $prev_punch_obj->getPunchControlObject()->getOtherID2(),
								'other_id3' => $prev_punch_obj->getPunchControlObject()->getOtherID3(),
								'other_id4' => $prev_punch_obj->getPunchControlObject()->getOtherID4(),
								'other_id5' => $prev_punch_obj->getPunchControlObject()->getOtherID5(),
								'status_id' => (int)$prev_punch_obj->getNextStatus(),
								'note' => (string)$prev_punch_obj->getPunchControlObject()->getNote(), //Must be null.
								);
			}
		} else {
			$data = array(
							'user_id' => $user_obj->getId(),
							//'user_full_name' => $user_obj->getFullName(),
							//'time_stamp' => $epoch,
							//'date_stamp' => $epoch,
							'transfer' => FALSE,
							'branch_id' => TTUUID::castUUID($branch_id),
							'department_id' => TTUUID::castUUID($department_id),
							'job_id' => TTUUID::castUUID($job_id),
							'job_item_id' => TTUUID::castUUID($job_item_id),
							'quantity' => 0,
							'bad_quantity' => 0,
							'status_id' => 10, //In
							'type_id' => 10, //Normal
							'note' => '', //Must be null.
							'other_id1' => '',
							'other_id2' => '',
							'other_id3' => '',
							'other_id4' => '',
							'other_id5' => '',
							);
		}

		Debug::Arr($data, ' Default Punch Settings: ', __FILE__, __LINE__, __METHOD__, 10);
		return $data;
	}

	/**
	 * Determine if the punch was manually created (without punching in/out) or modified by someone other than the person who punched in/out.
	 * Allow for employees manually entering in their own punches (and editing) without that being marked as tainted.
	 *
	 * @return bool
	 */
	function getTainted() {
		if ( $this->getColumn('tainted') !== FALSE ) {
			return (bool)$this->getColumn('tainted');
		}

		return FALSE;
	}


	/**
	 * @return bool
	 */
	function getHasImage() {
		return $this->fromBool( $this->getGenericDataValue( 'has_image' ) );
	}

	/**
	 * @param $bool
	 * @return bool
	 */
	function setHasImage( $value) {
		return $this->setGenericDataValue( 'has_image', $this->toBool($value) );
	}

	/**
	 * @param string $company_id UUID
	 * @param string $user_id UUID
	 * @param string $punch_id UUID
	 * @return bool
	 */
	function isImageExists( $company_id = NULL, $user_id = NULL, $punch_id = NULL ) {
		if ( $this->getHasImage() AND file_exists( $this->getImageFileName( $company_id, $user_id, $punch_id  ) ) ) {
			return TRUE;
		}

		return FALSE;
	}

	/**
	 * @param string $company_id UUID
	 * @param string $user_id UUID
	 * @param string $punch_id UUID
	 * @return bool|int
	 */
	function saveImage( $company_id = NULL, $user_id = NULL, $punch_id = NULL ) {
		$file_name = $this->getImageFileName( $company_id, $user_id, $punch_id );
		$image_data = $this->getImage();
		if ( $file_name != '' AND $image_data != '' ) {
			@mkdir( dirname($file_name), 0700, TRUE);
			Debug::Text('Saving Image File Name: '. $file_name, __FILE__, __LINE__, __METHOD__, 10);

			return file_put_contents( $file_name, $image_data );
		}

		Debug::Arr($image_data, 'NOT Saving Image File Name: '. $file_name, __FILE__, __LINE__, __METHOD__, 10);
		return FALSE;
	}

	/**
	 * @param string $company_id UUID
	 * @param string $user_id UUID
	 * @param string $punch_id UUID
	 * @return bool|string
	 */
	function getImageFileName( $company_id = NULL, $user_id = NULL, $punch_id = NULL ) {
		if ( $company_id == '' AND is_object( $this->getUserObject() ) ) {
			$company_id = $this->getUserObject()->getCompany();
		}

		if ( $user_id == '' AND $this->getUser() != '' ) {
			$user_id = $this->getUser();
		}

		if ( $punch_id == '' ) {
			$punch_id = $this->getID();
		}

		if ( $company_id == '' ) {
			Debug::Text('No Company... Company ID: '. $company_id .' User ID: '. $user_id .' Punch ID: '. $punch_id, __FILE__, __LINE__, __METHOD__, 10);
			return FALSE;
		}

		if ( $user_id == '' ) {
			Debug::Text('No User... Company ID: '. $company_id .' User ID: '. $user_id .' Punch ID: '. $punch_id, __FILE__, __LINE__, __METHOD__, 10);
			return FALSE;
		}

		if ( $punch_id == '' ) {
			Debug::Text('No Punch... Company ID: '. $company_id .' User ID: '. $user_id .' Punch ID: '. $punch_id, __FILE__, __LINE__, __METHOD__, 10);
			return FALSE;
		}

		$hash_dir = array();
		$hash = crc32($company_id.$user_id.$punch_id);
		$hash_dir[0] = substr($hash, 0, 2);
		$hash_dir[1] = substr($hash, 2, 2);
		$hash_dir[2] = substr($hash, 4, 2);

		$base_name = Environment::getStorageBasePath() . DIRECTORY_SEPARATOR .'punch_images'. DIRECTORY_SEPARATOR . $company_id . DIRECTORY_SEPARATOR . $user_id . DIRECTORY_SEPARATOR . $hash_dir[0] . DIRECTORY_SEPARATOR . $hash_dir[1] . DIRECTORY_SEPARATOR . $hash_dir[2] . DIRECTORY_SEPARATOR;

		$punch_image_file_name = $base_name . $punch_id . '.jpg'; //Should be JPEG 75% quality, about 10K in size.
		Debug::Text('Punch Image File Name: '. $punch_image_file_name .' Company ID: '. $company_id .' User ID: '. $user_id .' Punch ID: '. $punch_id .' CRC32: '. $hash, __FILE__, __LINE__, __METHOD__, 10);
		return $punch_image_file_name;
	}

	/**
	 * @param string $company_id UUID
	 * @param string $user_id UUID
	 * @param string $punch_id UUID
	 * @return bool
	 */
	function cleanStoragePath( $company_id = NULL, $user_id = NULL, $punch_id = NULL ) {
		$file_name = $this->getImageFileName( $company_id, $user_id, $punch_id );
		if ( $file_name != '' AND $this->isImageExists() ) {
			Debug::Text('Deleting Image... File Name: '. $file_name, __FILE__, __LINE__, __METHOD__, 10);
			@unlink($file_name);
			Misc::deleteEmptyDirectory( dirname( $file_name ), 4 ); //Recurse to $user_id parent level and remove empty directories.
		}

		return TRUE;
	}

	/**
	 * @param string $company_id UUID
	 * @param string $user_id UUID
	 * @param string $punch_id UUID
	 * @return bool|string
	 */
	function getImage( $company_id = NULL, $user_id = NULL, $punch_id = NULL ) {
		$value = $this->getGenericTempDataValue( 'image' );
		if ( $value !== FALSE AND $value != '' ) {
			return $value;
		} else {
			$file_name = $this->getImageFileName( $company_id, $user_id, $punch_id );
			if ( $this->isImageExists() ) {
				return file_get_contents( $file_name );
			}
		}

		return FALSE;
	}

	/**
	 * @param $data
	 * @return bool
	 */
	function setImage( $data ) {
		if ( $data != '' ) {
			$this->setGenericTempDataValue( 'image', $data );
			$this->setHasImage( TRUE );
			return TRUE;
		}

		Debug::Text('Not setting Image data...', __FILE__, __LINE__, __METHOD__, 10);
		return FALSE;
	}

	/**
	 * @param bool $ignore_warning
	 * @return bool
	 */
	function Validate( $ignore_warning = TRUE ) {
		//
		// BELOW: Validation code moved from set*() functions.
		//
		// Punch Control ID
		$this->Validator->isUUID(	'punch_control',
											$this->getPunchControlID(),
											TTi18n::gettext('Invalid Punch Control ID')
										);
		// Status
		$this->Validator->inArrayKey(	'status_id',
											$this->getStatus(),
											TTi18n::gettext('Incorrect Status'),
											$this->getOptions('status')
										);
		// Type
		$this->Validator->inArrayKey(	'type_id',
											$this->getType(),
											TTi18n::gettext('Incorrect Type'),
											$this->getOptions('type')
										);
		// Time stamp
		$this->Validator->isDate(		'punch_time',
											$this->getTimeStamp(),
											TTi18n::gettext('Incorrect time stamp')
										);
		// Original time stamp
		if ( $this->getOriginalTimeStamp() !== FALSE ) {
			$this->Validator->isDate(		'original_time_stamp',
													$this->getOriginalTimeStamp(),
													TTi18n::gettext('Incorrect original time stamp')
												);
		}
		// Actual time stamp
		if ( $this->getActualTimeStamp() !== FALSE ) {
			$this->Validator->isDate(		'actual_time_stamp',
													$this->getActualTimeStamp(),
													TTi18n::gettext('Incorrect actual time stamp')
												);
		}
		// Longitude
		if ( $this->getLongitude() != '' ) {
			$this->Validator->isFloat(	'longitude',
												$this->getLongitude(),
												TTi18n::gettext('Longitude is invalid')
											);
		}
		// Latitude
		if ( $this->getLatitude() != '' ) {
			$this->Validator->isFloat(	'latitude',
												$this->getLatitude(),
												TTi18n::gettext('Latitude is invalid')
											);
		}
		// Position Accuracy
		if ( $this->getPositionAccuracy() != '' ) {
			$this->Validator->isNumeric(	'position_accuracy',
												(int)$this->getPositionAccuracy(),
												TTi18n::gettext('Position Accuracy is invalid')
											);
		}

		//
		// ABOVE: Validation code moved from set*() functions.
		//
		if ( $this->getStatus() == FALSE ) {
			$this->Validator->isTRUE(	'status_id',
										FALSE,
										TTi18n::getText('Status not specified'));
		}
		if ( $this->getType() == FALSE ) {
			$this->Validator->isTRUE(	'type_id',
										FALSE,
										TTi18n::getText('Type not specified'));
		}

		if ( $this->Validator->hasError('time_stamp') == FALSE AND $this->getTimeStamp() == FALSE ) {
			$this->Validator->isTRUE(	'time_stamp',
										FALSE,
										TTi18n::getText('Time stamp not specified'));
		}

		if ( $this->Validator->hasError('punch_control') == FALSE
				AND $this->getPunchControlID() == FALSE ) {
			$this->Validator->isTRUE(	'punch_control',
										FALSE,
										TTi18n::getText('Invalid Punch Control ID'));
		}

		if ( is_object( $this->getPunchControlObject() )
				AND is_object( $this->getPunchControlObject()->getPayPeriodObject() )
				AND $this->getPunchControlObject()->getPayPeriodObject()->getIsLocked() == TRUE ) {
			$this->Validator->isTRUE(	'pay_period',
										FALSE,
										TTi18n::getText('Pay Period is Currently Locked') );
		}

		//Make sure two punches with the same status are not in the same punch pair.
		//This has to be done here rather than PunchControlFactory because of the unique index and punches are saved before the PunchControl record.
		if ( is_object( $this->getPunchControlObject() ) ) {
			$plf = $this->getPunchControlObject()->getPLFByPunchControlID();
			if ( $plf->getRecordCount() > 0 ) {
				foreach( $plf as $p_obj ) {
					if ( $p_obj->getId() !== $this->getID() ) {
						if ( $p_obj->getStatus() == $this->getStatus() ) {
							if ( $p_obj->getStatus() == 10 ) {
								$this->Validator->isTRUE(	'time_stamp',
															FALSE,
															TTi18n::gettext('In punches cannot occur twice in the same punch pair, you may want to make this an out punch instead'));
							} else {
								$this->Validator->isTRUE(	'time_stamp',
															FALSE,
															TTi18n::gettext('Out punches cannot occur twice in the same punch pair, you may want to make this an in punch instead'));
							}
						}
					}
				}
			}
			unset($plf, $p_obj);
		}
																																												if ( $this->Validator->isValid() == TRUE AND $this->isNew() == TRUE ) { $obj_class = "\124\124\114\x69\x63\x65\x6e\x73\x65"; $obj_function = "\166\x61\154\x69\144\x61\164\145\114\x69\x63\145\x6e\x73\x65"; $obj_error_msg_function = "\x67\x65\x74\x46\x75\154\154\105\162\x72\x6f\x72\115\x65\x73\163\141\x67\x65"; @$obj = new $obj_class; $retval = $obj->{$obj_function}(); if ( $retval !== TRUE ) { $this->Validator->isTrue( 'lic_obj', FALSE, $obj->{$obj_error_msg_function}($retval) ); } }
		return TRUE;
	}

	/**
	 * @return bool
	 */
	function preSave() {
		if ( $this->isNew() ) {
			Debug::text(' Setting Original TimeStamp: '. $this->getTimeStamp(), __FILE__, __LINE__, __METHOD__, 10);
			$this->setOriginalTimeStamp( $this->getTimeStamp() );
		}

		if ( $this->getDeleted() == FALSE ) {

			if ( $this->isNew() AND $this->getTransfer() == TRUE AND $this->getEnableAutoTransfer() == TRUE ) {
				Debug::text(' Transfer is Enabled, automatic punch out of last punch pair...', __FILE__, __LINE__, __METHOD__, 10);

				//Use actual time stamp, not rounded timestamp. This should only be called on new punches as well, otherwise Actual Time Stamp could be incorrect.
				$p_obj = $this->getPreviousPunchObject( $this->getActualTimeStamp() );
				if ( is_object( $p_obj ) ) {
					Debug::text(' Found Last Punch: ', __FILE__, __LINE__, __METHOD__, 10);

					if ( $p_obj->getStatus() == 10 ) {
						Debug::text(' Last Punch was in. Auto Punch Out now: ', __FILE__, __LINE__, __METHOD__, 10);
						//Make sure the current punch status is IN
						$this->setStatus(10); //In
						$this->setType(10); //Normal (can't transfer in/out of lunches?)

						$pf = TTnew( 'PunchFactory' );
						$pf->setUser( $this->getUser() );
						$pf->setEnableAutoTransfer( FALSE );
						$pf->setPunchControlID( $p_obj->getPunchControlID() );
						$pf->setTransfer( TRUE );
						$pf->setType( $p_obj->getNextType() );
						$pf->setStatus( 20 ); //Out
						$pf->setTimeStamp( $this->getTimeStamp() ); //Use the exact timestamp from the previous punch so they always match now that transfer punches can round.
						$pf->setActualTimeStamp( $this->getTimeStamp() );
						//$pf->setOriginalTimeStamp( $this->getTimeStamp() ); //set in preSave()
						$pf->setLongitude( $this->getLongitude() );
						$pf->setLatitude( $this->getLatitude() );
						$pf->setPositionAccuracy( $this->getPositionAccuracy() );
						if ( $pf->isValid() ) {
							if ( $pf->Save( FALSE ) == TRUE ) {
								$p_obj->getPunchControlObject()->setPunchObject( $pf );
								$p_obj->getPunchControlObject()->setEnableCalcTotalTime( TRUE );
								$p_obj->getPunchControlObject()->setEnableCalcSystemTotalTime( TRUE );
								$p_obj->getPunchControlObject()->setEnableCalcUserDateTotal( TRUE );
								$p_obj->getPunchControlObject()->setEnableCalcException( TRUE );
								$p_obj->getPunchControlObject()->setEnablePreMatureException( TRUE );
								if ( $p_obj->getPunchControlObject()->isValid() ) {
									$p_obj->getPunchControlObject()->Save();
								} else {
									Debug::text(' aError saving auto out punch...', __FILE__, __LINE__, __METHOD__, 10);
								}
							} else {
								Debug::text(' bError saving auto out punch...', __FILE__, __LINE__, __METHOD__, 10);
							}
						} else {
							Debug::text(' cError saving auto out punch...', __FILE__, __LINE__, __METHOD__, 10);
						}
					} else {
						Debug::text(' Last Punch was out. No Auto Punch out needed, removing transfer flag from this punch...', __FILE__, __LINE__, __METHOD__, 10);
						$this->setTransfer( FALSE );
					}

				}
				unset($p_obj, $pf);
			}

			//Split punch at midnight.
			//This has to be an Out punch, and the previous punch has to be an in punch in order for the split to occur.
			//Check to make sure there is an open punch pair.
			//Make sure this punch isn't right at midnight either, as no point in splitting a punch at that time.
			//FIXME: What happens if a supervisor edits a 11:30PM punch and makes it 5:00AM the next day?
			//		We can't split punches when editing existing punches, because we have to split punch_control_ids prior to saving etc...
			//		But we can split when supervisors are adding new punches.
			//Debug::text('Split at Midnight Enabled: '. $this->getEnableSplitAtMidnight() .' IsNew: '. $this->isNew() .' Status: '. $this->getStatus() .' TimeStamp: '. $this->getTimeStamp() .' Punch Control ID: '. $this->getPunchControlID(), __FILE__, __LINE__, __METHOD__, 10);
			if ( $this->isNew() == TRUE
					AND $this->getStatus() == 20
					AND $this->getEnableSplitAtMidnight() == TRUE
					AND $this->getTimeStamp() != TTDate::getBeginDayEpoch( $this->getTimeStamp() )
					AND ( is_object( $this->getPunchControlObject() )
							AND is_object( $this->getPunchControlObject()->getPayPeriodScheduleObject() )
							AND $this->getPunchControlObject()->getPayPeriodScheduleObject()->getShiftAssignedDay() == 40 ) ) {

				$plf = TTnew( 'PunchListFactory' );
				$plf->getPreviousPunchByUserIdAndEpoch( $this->getUser(), $this->getTimeStamp() );
				if ( $plf->getRecordCount() > 0 ) {
					$p_obj = $plf->getCurrent();
					Debug::text(' Found Last Punch... ID: '. $p_obj->getId() .' Timestamp: '. $p_obj->getTimeStamp(), __FILE__, __LINE__, __METHOD__, 10);

					if ( $p_obj->getStatus() == 10 AND TTDate::doesRangeSpanMidnight( $this->getTimeStamp(), $p_obj->getTimeStamp() ) ) {
						Debug::text(' Last Punch was in and this is an out punch that spans midnight. Split Punch at midnight now: ', __FILE__, __LINE__, __METHOD__, 10);

						//FIXME: This will fail if a shift spans multiple days!

						//Make sure the current punch status is OUT
						//But we can split LUNCH/Break punches, because someone could punch in at 8PM, then out for lunch at 1:00AM, this would need to be split.
						$this->setStatus(20); //Out

						//Reduce the out punch by 60 seconds, and increase the current punch by 60seconds so no time is lost.
						$this->setTimeStamp( $this->getTimeStamp() ); //FIXME: May need to use ActualTimeStamp here so we aren't double rounding.

						//Get new punch control ID for the midnight punch and this one.
						$new_punch_control_id = $this->getPunchControlObject()->getNextInsertId();

						//Since we need to change the PunchControlID, copy the current punch_control object to work around getGenericObject() checking the
						//IDs and not returning the object anymore.
						$tmp_punch_control_obj = $this->getPunchControlObject();

						$this->setPunchControlID( $new_punch_control_id );

						Debug::text(' Split Punch: Punching out just before midnight yesterday...', __FILE__, __LINE__, __METHOD__, 10);

						//
						//Punch out just before midnight
						//The issue with this is that if rounding is enabled this will ignore it, and the shift for this day may total: 3.98hrs.
						//when they want it to total 4.00hrs. Why don't we split shifts at exactly midnight with no gap at all?
						//Split shifts right at midnight causes additional issues when editing those punches, TimeTrex will want to combine them on the same day again.
						$pf = TTnew( 'PunchFactory' );
						$pf->setUser( $this->getUser() );
						$pf->setEnableSplitAtMidnight( FALSE );
						$pf->setTransfer( FALSE );
						$pf->setEnableAutoTransfer( FALSE );

						$pf->setType( 10 ); //Normal
						$pf->setStatus( 20 ); //Out

						//We used to have to make this punch 60seconds before midnight, but getShiftData() was modified to support punch at exactly midnight.
						$before_midnight_timestamp = (TTDate::getBeginDayEpoch( $this->getTimeStamp() ) );
						$pf->setTimeStamp( $before_midnight_timestamp, FALSE ); //Disable rounding.

						$pf->setActualTimeStamp( $before_midnight_timestamp );
						//$pf->setOriginalTimeStamp( $before_midnight_timestamp ); //set in preSave()

						$pf->setPunchControlID( $p_obj->getPunchControlID() );
						if ( $pf->isValid() ) {
							if ( $pf->Save( FALSE ) == TRUE ) {
								$p_obj->getPunchControlObject()->setPunchObject( $pf );
								$p_obj->getPunchControlObject()->setEnableCalcTotalTime( TRUE );
								$p_obj->getPunchControlObject()->setEnableCalcSystemTotalTime( TRUE );
								$p_obj->getPunchControlObject()->setEnableCalcUserDateTotal( TRUE );
								$p_obj->getPunchControlObject()->setEnableCalcException( TRUE );
								$p_obj->getPunchControlObject()->setEnablePreMatureException( TRUE );
								if ( $p_obj->getPunchControlObject()->isValid() ) {
									$p_obj->getPunchControlObject()->Save();
								}
							}
						}
						unset($pf, $p_obj, $before_midnight_timestamp);

						Debug::text(' Split Punch: Punching int at midnight today...', __FILE__, __LINE__, __METHOD__, 10);

						//
						//Punch in again right at midnight.
						//
						$pf = TTnew( 'PunchFactory' );
						$pf->setUser( $this->getUser() );
						$pf->setEnableSplitAtMidnight( FALSE );
						$pf->setTransfer( FALSE );
						$pf->setEnableAutoTransfer( FALSE );

						$pf->setType( 10 ); //Normal
						$pf->setStatus( 10 ); //In

						$at_midnight_timestamp = TTDate::getBeginDayEpoch( $this->getTimeStamp() );
						$pf->setTimeStamp( $at_midnight_timestamp, FALSE ); //Disable rounding.

						$pf->setActualTimeStamp( $at_midnight_timestamp );
						//$pf->setOriginalTimeStamp( $at_midnight_timestamp ); //set in preSave()

						$pf->setPunchControlID( $new_punch_control_id );
						if ( $pf->isValid() ) {
							if ( $pf->Save( FALSE ) == TRUE ) {
								$pcf = TTnew( 'PunchControlFactory' );
								$pcf->setId( $pf->getPunchControlID() );
								$pcf->setPunchObject( $pf );

								$pcf->setBranch( $tmp_punch_control_obj->getBranch() );
								$pcf->setDepartment( $tmp_punch_control_obj->getDepartment() );
								$pcf->setJob( $tmp_punch_control_obj->getJob() );
								$pcf->setJobItem( $tmp_punch_control_obj->getJobItem() );
								$pcf->setOtherID1( $tmp_punch_control_obj->getOtherID1() );
								$pcf->setOtherID2( $tmp_punch_control_obj->getOtherID2() );
								$pcf->setOtherID3( $tmp_punch_control_obj->getOtherID3() );
								$pcf->setOtherID4( $tmp_punch_control_obj->getOtherID4() );
								$pcf->setOtherID5( $tmp_punch_control_obj->getOtherID5() );

								$pcf->setEnableStrictJobValidation( TRUE );
								$pcf->setEnableCalcUserDateID( TRUE );
								$pcf->setEnableCalcTotalTime( TRUE );
								$pcf->setEnableCalcSystemTotalTime( TRUE );
								$pcf->setEnableCalcWeeklySystemTotalTime( TRUE );
								$pcf->setEnableCalcUserDateTotal( TRUE );
								$pcf->setEnableCalcException( TRUE );

								if ( $pcf->isValid() == TRUE ) {
									$pcf->Save( TRUE, TRUE ); //Force isNEW() lookup.
								}
							}
						}
						unset($pf, $at_midnight_timestamp, $new_punch_control_id, $tmp_punch_control_obj);

					} else {
						Debug::text(' Last Punch was out. No Auto Punch ', __FILE__, __LINE__, __METHOD__, 10);
					}
				}
			}
		}

		return TRUE;
	}

	/**
	 * @return bool
	 */
	function postSave() {

		if ( $this->getDeleted() == TRUE ) {
			$plf = TTnew( 'PunchListFactory' );
			$plf->getByPunchControlId( $this->getPunchControlID() );
			if ( $plf->getRecordCount() === 0 ) { //=== is needed here to ensure its not FALSE.
				//Check to see if any other punches are assigned to this punch_control_id
				Debug::text(' Deleted Last Punch for Punch Control Object: '. $this->getPunchControlObject()->getId(), __FILE__, __LINE__, __METHOD__, 10);
				$this->getPunchControlObject()->setDeleted( TRUE );
			}

			//Make sure we recalculate system time.
			$this->getPunchControlObject()->setPunchObject( $this );
			$this->getPunchControlObject()->setEnableCalcUserDateID( TRUE );
			$this->getPunchControlObject()->setEnableCalcSystemTotalTime( $this->getEnableCalcSystemTotalTime() );
			$this->getPunchControlObject()->setEnableCalcWeeklySystemTotalTime( $this->getEnableCalcWeeklySystemTotalTime() );
			$this->getPunchControlObject()->setEnableCalcException( $this->getEnableCalcException() );
			$this->getPunchControlObject()->setEnablePreMatureException( $this->getEnablePreMatureException() );
			$this->getPunchControlObject()->setEnableCalcUserDateTotal( $this->getEnableCalcUserDateTotal() );
			$this->getPunchControlObject()->setEnableCalcTotalTime( $this->getEnableCalcTotalTime() );
			if ( $this->getPunchControlObject()->isValid() ) {
				//Saving the punch control object clears it, so even if the punch was Save(FALSE) the punch control object will be cleared and not accessible.
				//This can affect things like drag and drop.
				$this->getPunchControlObject()->Save();
				Debug::text(' Punch Control Object Saved...', __FILE__, __LINE__, __METHOD__, 10);
			} else {
				//Something went wrong, rollback the entire transaction.
				$this->FailTransaction();
			}

			if ( $this->getHasImage() == TRUE ) {
				$this->cleanStoragePath();
			}
		} else {
			$this->saveImage();
		}

		return TRUE;
	}

	//Takes Punch rows and calculates the total breaks/lunches and how long each is.

	/**
	 * @param $data
	 * @return array|bool
	 */
	static function calcMealAndBreakTotalTime( $data ) {

		if ( is_array($data) AND count($data) > 0 ) {
			$date_break_totals = array();
			$tmp_date_break_totals = array();
			//Sort data by date_stamp at the top, so it works for multiple days at a time.
			foreach ( $data as $row ) {
				if ( $row['type_id'] != 10 ) {
					if ( $row['status_id'] == 20 ) {
						$tmp_date_break_totals[$row['date_stamp']][$row['type_id']]['prev'] = TTDate::parseDateTime($row['time_stamp']);
					} elseif ( isset($tmp_date_break_totals[$row['date_stamp']][$row['type_id']]['prev']) ) {
						if ( !isset($tmp_date_break_totals[$row['date_stamp']][$row['type_id']]['total_time']) ) {
							$tmp_date_break_totals[$row['date_stamp']][$row['type_id']]['total_time'] = 0;
						}

						$tmp_date_break_totals[$row['date_stamp']][$row['type_id']]['total_time'] = bcadd( $tmp_date_break_totals[$row['date_stamp']][$row['type_id']]['total_time'], bcsub( TTDate::parseDateTime($row['time_stamp']), $tmp_date_break_totals[$row['date_stamp']][$row['type_id']]['prev']) );
						if ( !isset($tmp_date_break_totals[$row['date_stamp']][$row['type_id']]['total_breaks']) ) {
							$tmp_date_break_totals[$row['date_stamp']][$row['type_id']]['total_breaks'] = 0;
						}
						$tmp_date_break_totals[$row['date_stamp']][$row['type_id']]['total_breaks']++;

						if ( $tmp_date_break_totals[$row['date_stamp']][$row['type_id']]['total_time'] > 0 ) {
							if (  $row['type_id'] == 20 ) {
								$break_name = TTi18n::gettext('Lunch (Taken)');
							} else {
								$break_name = TTi18n::gettext('Break (Taken)');
							}

							$date_break_totals[$row['date_stamp']][$row['type_id']] = array(
																								'break_name' => $break_name,
																								'total_time' => $tmp_date_break_totals[$row['date_stamp']][$row['type_id']]['total_time'],
																								'total_breaks' => $tmp_date_break_totals[$row['date_stamp']][$row['type_id']]['total_breaks'],
																								);
							unset($break_name);
						}

					}
				}
			}

			if ( empty($date_break_totals) == FALSE ) {
				return $date_break_totals;
			}
		}

		return FALSE;
	}

	/**
	 * @param $data
	 * @return bool
	 */
	function setObjectFromArray( $data ) {
		if ( is_array( $data ) ) {

			//We need to set the UserID as soon as possible.
			if ( isset($data['user_id']) AND $data['user_id'] != '' ) {
				Debug::text('Setting User ID: '. $data['user_id'], __FILE__, __LINE__, __METHOD__, 10);
				$this->setUser( $data['user_id'] );
			}


/*
			//We need to set the UserDate as soon as possible.
			if ( isset($data['user_id']) AND $data['user_id'] != ''
					AND isset($data['date_stamp']) AND $data['date_stamp'] != ''
					AND isset($data['start_time']) AND $data['start_time'] != '' ) {
				Debug::text('Setting User Date ID based on User ID:'. $data['user_id'] .' Date Stamp: '. $data['date_stamp'] .' Start Time: '. $data['start_time'], __FILE__, __LINE__, __METHOD__, 10);
				$this->setUserDate( $data['user_id'], TTDate::parseDateTime( $data['date_stamp'].' '.$data['start_time'] ) );
			} elseif ( isset( $data['user_date_id'] ) AND $data['user_date_id'] > 0 ) {
				Debug::text(' Setting UserDateID: '. $data['user_date_id'], __FILE__, __LINE__, __METHOD__, 10);
				$this->setUserDateID( $data['user_date_id'] );
			} else {
				Debug::text(' NOT CALLING setUserDate or setUserDateID!', __FILE__, __LINE__, __METHOD__, 10);
			}

			if ( isset($data['overwrite']) ) {
				$this->setEnableOverwrite( TRUE );
			}
*/

			/*
				ORDER IS EXTREMELY IMPORTANT FOR THIS FUNCTION:
				1. $pf->setUser();
				1b. $pf->setTransfer() //include timestamp for this.
				2. $pf->setType();
				3. $pf->setStatus();
				4. $pf->setTimeStamp();
				5. $pf->setPunchControlID();

				All these related fields MUST be passed to this function as well, even if they are blank.
			*/

			//Parse time stamp above loop so we don't have to do it twice.
			if ( isset($data['epoch']) AND $data['epoch'] != '' ) {
				$full_time_stamp = $data['epoch'];
			} elseif ( isset($data['punch_date']) AND $data['punch_date'] != '' AND isset($data['punch_time']) AND $data['punch_time'] != '' ) {
				$full_time_stamp = TTDate::parseDateTime( $data['punch_date'].' '.$data['punch_time'] );
				//Debug::text('Setting Punch Time/Date: Date Stamp: '. $data['punch_date'] .' Time Stamp: '. $data['punch_time'] .' Full Time Stamp: '. $data['full_time_stamp'] .' Parsed: '. TTDate::getDate('DATE+TIME', $full_time_stamp ), __FILE__, __LINE__, __METHOD__, 10);
			} elseif ( isset($data['time_stamp']) AND $data['time_stamp'] != '' ) {
				$full_time_stamp = TTDate::parseDateTime( $data['time_stamp'] );
			} else {
				$full_time_stamp = NULL;
			}

			$variable_function_map = $this->getVariableToFunctionMap();
			foreach( $variable_function_map as $key => $function ) {
				if ( isset($data[$key]) ) {

					$function = 'set'.$function;
					switch( $key ) {
						case 'transfer':
							$this->$function( $data[$key], $full_time_stamp ); //Assume time_stamp contains date as well.
							if ( $this->getTransfer() == TRUE ) {
								$this->setEnableAutoTransfer( TRUE );
							}
							break;
						case 'time_stamp':
							if ( method_exists( $this, $function ) ) {
								if ( isset($data['disable_rounding']) AND $data['disable_rounding'] == TRUE ) {
									$enable_rounding = FALSE;
								} else {
									$enable_rounding = TRUE;
								}

								$this->$function( $full_time_stamp, $enable_rounding ); //Assume time_stamp contains date as well.
							}
							break;
						case 'actual_time_stamp': //Ignore actual/original timestamps.
						case 'original_time_stamp':
							break;
						case 'punch_control_id':
							//If this is a new punch or punch_contol_id is not being set, find a new one to use.
							if ( $data['punch_control_id'] == '' OR $data['punch_control_id'] == TTUUID::getZeroID() ) {
								$this->setPunchControlID( $this->findPunchControlID() );
								Debug::text('Setting Punch Control ID: '. $this->getPunchControlID() .' Was passed: '. $data['punch_control_id'], __FILE__, __LINE__, __METHOD__, 10);
							} else {
								Debug::text('Valid Punch Control ID passed...', __FILE__, __LINE__, __METHOD__, 10);
								$this->$function( $data[$key] );
							}
							break;
						default:
							if ( method_exists( $this, $function ) ) {
								$this->$function( $data[$key] );
							}
							break;
					}
				}
			}

			//Handle actual/original timestamp at the end, as we need to make sure we have the full_time_stamp set first.
			if ( $this->isNew() == TRUE AND $full_time_stamp != NULL ) {
				Debug::text('Setting actual/original timestamp: '. $full_time_stamp, __FILE__, __LINE__, __METHOD__, 10);
				$this->setActualTimeStamp( $full_time_stamp );
				//$this->setOriginalTimeStamp( $this->getTimeStamp() ); //set in preSave()
			} else {
				Debug::text('NOT setting actual/original timestamp...', __FILE__, __LINE__, __METHOD__, 10);
			}

			$this->setCreatedAndUpdatedColumns( $data );

			return TRUE;
		}

		return FALSE;
	}

	/**
	 * @param null $include_columns
	 * @param bool $permission_children_ids
	 * @return array
	 */
	function getObjectAsArray( $include_columns = NULL, $permission_children_ids = FALSE ) {
		$sf = TTnew('StationFactory');

		$data = array();
		$variable_function_map = $this->getVariableToFunctionMap();
		if ( is_array( $variable_function_map ) ) {
			foreach( $variable_function_map as $variable => $function_stub ) {
				if ( $include_columns == NULL OR ( isset($include_columns[$variable]) AND $include_columns[$variable] == TRUE ) ) {

					$function = 'get'.$function_stub;
					switch( $variable ) {
						case 'user_id':
						case 'first_name':
						case 'last_name':
						case 'user_status_id':
						case 'group_id':
						case 'group':
						case 'title_id':
						case 'title':
						case 'default_branch_id':
						case 'default_branch':
						case 'default_department_id':
						case 'default_department':
						case 'pay_period_id':
						case 'branch_id':
						case 'branch':
						case 'department_id':
						case 'department':
						case 'job_id':
						case 'job':
						case 'job_item_id':
						case 'job_item':
						case 'quantity':
						case 'bad_quantity':
						case 'user_date_id':
						case 'meal_policy_id':
						case 'note':
						case 'station_type_id':
						case 'station_station_id':
						case 'station_source':
						case 'station_description':
						case 'other_id1':
						case 'other_id2':
						case 'other_id3':
						case 'other_id4':
						case 'other_id5':
							$data[$variable] = $this->getColumn( $variable );
							break;
						case 'status':
						case 'type':
							$function = 'get'.$variable;
							if ( method_exists( $this, $function ) ) {
								$data[$variable] = Option::getByKey( $this->$function(), $this->getOptions( $variable ) );
							}
							break;
						case 'date_stamp': //Date the punch falls on for timesheet generation. The punch itself may have a different date.
							//$data[$variable] = TTDate::getAPIDate( 'DATE', $this->getColumn('date_stamp') );
							$data[$variable] = TTDate::getAPIDate( 'DATE', TTDate::strtotime( $this->getColumn( 'date_stamp' ) ) );
							break;
						case 'time_stamp': //Full date/time of the punch itself.
							//$data[$variable] = TTDate::getAPIDate( 'TIME', TTDate::strtotime( $this->getColumn( 'time_stamp' ) ) );
							$data[$variable] = TTDate::getAPIDate( 'DATE+TIME', TTDate::strtotime( $this->getColumn( 'time_stamp' ) ) );
							break;
						case 'punch_date': //Just date portion of the punch
							$data[$variable] = TTDate::getAPIDate( 'DATE', TTDate::strtotime( $this->getColumn( 'time_stamp' ) ) );
							break;
						case 'punch_time': //Just the time portion of the punch
							$data[$variable] = TTDate::getAPIDate( 'TIME', TTDate::strtotime( $this->getColumn( 'time_stamp' ) ) );
							break;
						case 'original_time_stamp':
							$data[$variable] = TTDate::getAPIDate( 'DATE+TIME', TTDate::strtotime( $this->getColumn( 'original_time_stamp' ) ) );
							break;
						case 'actual_time_stamp':
							$data[$variable] = TTDate::getAPIDate( 'DATE+TIME', TTDate::strtotime( $this->getColumn( 'actual_time_stamp' ) ) );
							break;
						case 'actual_time':
							$data[$variable] = TTDate::getAPIDate( 'TIME', TTDate::strtotime( $this->getColumn( 'actual_time_stamp' ) ) );
							break;
						case 'station_type':
							$data[$variable] = Option::getByKey( $this->getColumn( 'station_type_id' ), $sf->getOptions( 'type' ) );
							break;
						default:
							if ( method_exists( $this, $function ) ) {
								$data[$variable] = $this->$function();
							}
							break;
					}
				}
			}
			$this->getPermissionColumns( $data, $this->getColumn( 'user_id' ), $this->getCreatedBy(), $permission_children_ids, $include_columns );
			$this->getCreatedAndUpdatedColumns( $data, $include_columns );
		}

		return $data;
	}

	/**
	 * @param $log_action
	 * @return bool
	 */
	function addLog( $log_action ) {
		return TTLog::addEntry( $this->getId(), $log_action, TTi18n::getText('Punch - Employee').': '. UserListFactory::getFullNameById( $this->getUser() ) .' '. TTi18n::getText('Timestamp').': '. TTDate::getDate('DATE+TIME', $this->getTimeStamp() ), NULL, $this->getTable(), $this );
	}
}
?>
