package com.innosoft.webreservation.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.innosoft.webreservation.entity.MstCalendarActivity;
import com.innosoft.webreservation.entity.MstCustomerMember;
import com.innosoft.webreservation.entity.MstSecurityUser;
import com.innosoft.webreservation.service.CalendarActivityService;
import com.innosoft.webreservation.service.CustomerMemberService;
import com.innosoft.webreservation.service.SecurityService;
import com.innosoft.webreservation.service.UserService;

/**
 * Calendar activity CRUD API
 */
@Controller
@RequestMapping("api/calendarActivity")
public class CalendarActivityApi {
	/**
	 * Customer member service property
	 */
	@Autowired
	private CustomerMemberService customerMemberService;	
	/**
	 * Calendar activity service property
	 */
	@Autowired
	private CalendarActivityService calendarActivityService;
	/**
	 * Security service property
	 */
	@Autowired
	private SecurityService securityService;
	/**
	 * Return list of calendar activities
	 * @return
	 */
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<MstCalendarActivity> listCalendarActivity() {
		List<MstCalendarActivity> list = null;
		
		MstSecurityUser currentUser = securityService.getCurrentUser();
		if(currentUser.getUSER_ROLES() == 2)
		{
			MstCustomerMember currentUserMember = (customerMemberService.getMemberByUserId(currentUser.getUSER_ID())).get(0);
			
			list = calendarActivityService.listCalendarActivityByCustomer(currentUserMember.getMEBR_CUST_ID());
		}
		else
		{
			 list = calendarActivityService.listCalendarActivity();
		}
		return list;
	}	
	/**
	 * Return list of calendar activity per customer
	 * @param customerId
	 * @return
	 */
	@RequestMapping(value = "/listByCustomer", method = RequestMethod.GET, produces = "application/json", params = {"customerId"})
	public @ResponseBody List<MstCalendarActivity> listCalendarActivityByCustomer(@RequestParam(value="customerId") int customerId) {
		List<MstCalendarActivity> list = calendarActivityService.listCalendarActivityByCustomer(customerId);
		
		return list;
	}
	/**
	 * Update calendar activity
	 * @param calendarActivity
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<MstCalendarActivity> updateCalendarActivity(@RequestBody MstCalendarActivity calendarActivity) {
		try {
				if(calendarActivity.getCACT_ID()==0) {
					if(calendarActivityService.listCalendarActivityByCalendarDate(calendarActivity).size() == 0){
						calendarActivity = (MstCalendarActivity)securityService.stampCreated(calendarActivity);
						MstCalendarActivity newCalendarActivity = calendarActivityService.addCalendarActivity(calendarActivity);
						return new ResponseEntity<MstCalendarActivity>(newCalendarActivity, HttpStatus.OK);
					}else{
						return new ResponseEntity<MstCalendarActivity>(HttpStatus.BAD_REQUEST);
					}
				} else {
					MstCalendarActivity old = calendarActivityService.getCalendarActivityById(calendarActivity.getCACT_ID());
					
					if(old.CACT_CLDR_ID == calendarActivity.getCACT_CLDR_ID()){
						calendarActivity = (MstCalendarActivity)securityService.stampUpdated(calendarActivity);
						MstCalendarActivity editCalendarActivity = calendarActivityService.editCalendarActivity(calendarActivity);
						return new ResponseEntity<MstCalendarActivity>(editCalendarActivity, HttpStatus.OK);
					}else{
						if(calendarActivityService.listCalendarActivityByCalendarDate(calendarActivity).size() == 0){
							calendarActivity = (MstCalendarActivity)securityService.stampUpdated(calendarActivity);
							MstCalendarActivity editCalendarActivity = calendarActivityService.editCalendarActivity(calendarActivity);
							return new ResponseEntity<MstCalendarActivity>(editCalendarActivity, HttpStatus.OK);
						}else{
							return new ResponseEntity<MstCalendarActivity>(HttpStatus.BAD_REQUEST);
						}
					}
				}
			
		} catch(Exception e) {
			return new ResponseEntity<MstCalendarActivity>(HttpStatus.BAD_REQUEST);
		}	
	}	
	/**
	 * Delete calendar activity
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteCalendarActivity(@PathVariable("id") int id) {
		try {
			boolean deleteCalendar = calendarActivityService.deleteCalendarActivity(id);
			if (deleteCalendar==true) {
				return new ResponseEntity<String>(HttpStatus.OK);
			} else {
				return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
			}
		}catch(Exception e) {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}	
}
