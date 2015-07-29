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
import org.springframework.web.bind.annotation.ResponseBody;

import com.innosoft.webreservation.entity.MstCustomerMember;
import com.innosoft.webreservation.service.CustomerMemberService;

@Controller
@RequestMapping("api/customerMember")
public class CustomerMemberApi {
	@Autowired
	private CustomerMemberService customerMemberService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<MstCustomerMember> listCustomerMember() {
		List<MstCustomerMember> list = customerMemberService.listCustomerMember();
		return list;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<MstCustomerMember> updateCharge(@RequestBody MstCustomerMember member) {
		try {
			if(member.getMEBR_ID() == 0) {
				MstCustomerMember newCustomerMember = customerMemberService.addCustomerMember(member);
				return new ResponseEntity<MstCustomerMember>(newCustomerMember, HttpStatus.OK);
			} else {
				MstCustomerMember editCustomerMember = customerMemberService.editCustomerMember(member);
				return new ResponseEntity<MstCustomerMember>(editCustomerMember, HttpStatus.OK);
			}
		} catch(Exception e) {
			return new ResponseEntity<MstCustomerMember>(member, HttpStatus.BAD_REQUEST);
		}
	}
	
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
