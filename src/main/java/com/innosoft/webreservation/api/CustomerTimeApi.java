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
import com.innosoft.webreservation.entity.MstCustomerTime;
import com.innosoft.webreservation.service.CustomerTimeService;
import com.innosoft.webreservation.service.SecurityService;


@Controller
@RequestMapping("api/customerTime")
public class CustomerTimeApi {
	@Autowired
	private CustomerTimeService customerTimeService;
	@Autowired
	private SecurityService securityService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<MstCustomerTime> listCustomerTime() {
		List<MstCustomerTime> list = customerTimeService.listCustomerTime();
		return list;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<MstCustomerTime> updateCharge(@RequestBody MstCustomerTime time) {
		try {
			if(time.getCTIM_ID() == 0) {
				time = (MstCustomerTime)securityService.stampCreated(time, "Time");
				MstCustomerTime newCustomerTime = customerTimeService.addCustomerTime(time);
				return new ResponseEntity<MstCustomerTime>(newCustomerTime, HttpStatus.OK);
			} else {
				time = (MstCustomerTime)securityService.stampUpdated(time, "Time");
				MstCustomerTime editCustomerTime = customerTimeService.editCustomerTime(time);
				return new ResponseEntity<MstCustomerTime>(editCustomerTime, HttpStatus.OK);
			}
		} catch(Exception e) {
			return new ResponseEntity<MstCustomerTime>(time, HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteCharge(@PathVariable("id") int id) {
		try {
			boolean deleteReturn = customerTimeService.deleteCustomerTime(id);
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
