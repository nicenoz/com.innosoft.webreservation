package com.innosoft.webreservation.api;

import java.util.Date;
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

import com.innosoft.webreservation.entity.MstCustomerMember;
import com.innosoft.webreservation.entity.TrnSendLog;
import com.innosoft.webreservation.service.CustomerMemberService;
import com.innosoft.webreservation.service.SecurityService;
import com.innosoft.webreservation.service.SendLogService;

/**
 *Customer Member(user) CRUD API
 */
@Controller
@RequestMapping("api/customerMember")
public class CustomerMemberApi {
	/**
	 * CustomerMember service property
	 */
	@Autowired
	private CustomerMemberService customerMemberService;
	/**
	 * Security service property	
	 */
	@Autowired
	private SecurityService securityService;
	/**
	 * Send log service variable
	 */
	@Autowired
	private SendLogService sendLogService;
	/**
	 * Return list of customer member
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<MstCustomerMember> listCustomerMember() {
		List<MstCustomerMember> list = customerMemberService.listCustomerMember();
		return list;
	}
	/**
	 * Return list of report of customer member
	 * @param customerId
	 * @return
	 */
	@RequestMapping(value = "/report", method = RequestMethod.GET, produces = "application/json",  params = {"customerId"})
	public @ResponseBody List<MstCustomerMember> reportCustomerMember(@RequestParam(value="customerId") int customerId) {
		List<MstCustomerMember> list = customerMemberService.reportCustomerMember(customerId);
		return list;
	}
	/**
	 * Return list of customer member login 
	 * @return
	 */
	@RequestMapping(value = "/getloggedinmember", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<MstCustomerMember> getLoggedInCustomerMember() {
		List<MstCustomerMember> list = customerMemberService.getMemberByUserId(securityService.getCurrentUser().getUSER_ID());
		return list;
	}
	/**
	 * Update customer member
	 * @param member
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<MstCustomerMember> updatecustomerMember(@RequestBody MstCustomerMember member) {
		try {
			if(member.getMEBR_ID() == 0) {
				member = (MstCustomerMember)securityService.stampCreated(member);
				MstCustomerMember newCustomerMember = customerMemberService.addCustomerMember(member);
				
				TrnSendLog newSendLog = new TrnSendLog();
				
				newSendLog.SLOG_TIME_STAMP = new Date();
				newSendLog.SLOG_EMAIL_ADDRESS = newCustomerMember.getMEBR_EMAIL_ADDRESS();
				newSendLog.SLOG_MEBR_ID = newCustomerMember.getMEBR_ID();
				newSendLog.SLOG_PURPOSE_DIVISION = "Add Free User";
				
				sendLogService.addSendLog(newSendLog);
				
				return new ResponseEntity<MstCustomerMember>(newCustomerMember, HttpStatus.OK);
			} else {
				member = (MstCustomerMember)securityService.stampUpdated(member);
				MstCustomerMember editCustomerMember = customerMemberService.editCustomerMember(member);
				return new ResponseEntity<MstCustomerMember>(editCustomerMember, HttpStatus.OK);
			}
		} catch(Exception e) {
			return new ResponseEntity<MstCustomerMember>(member, HttpStatus.BAD_REQUEST);
		}
	}
	/**
	 * Delete customer member
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteCharge(@PathVariable("id") int id) {
		try {
			boolean deleteReturn = customerMemberService.deleteCustomerMember(id);
			if (deleteReturn == true) {
				return new ResponseEntity<String>(HttpStatus.OK);
			} else {
				return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
			}
		} catch (Exception e) {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
	
	
}
