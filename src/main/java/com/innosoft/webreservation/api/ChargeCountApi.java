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

import com.innosoft.webreservation.entity.TrnChargeCount;
import com.innosoft.webreservation.service.ChargeCountService;
import com.innosoft.webreservation.service.SecurityService;

@Controller
@RequestMapping("api/chargeCount")
public class ChargeCountApi {
	@Autowired
	private ChargeCountService chargeCountService;
	@Autowired
	private SecurityService securityService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<TrnChargeCount> listChargeCount() {
		List<TrnChargeCount> list = chargeCountService.listChargeCount();
		return list;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<TrnChargeCount> updateCode(@RequestBody TrnChargeCount chargeCount) {
		try {
			if(chargeCount.getCUNT_ID()==0) {
				chargeCount = (TrnChargeCount)securityService.stampCreated(chargeCount);
				TrnChargeCount newChargeCount = chargeCountService.addChargeCount(chargeCount);
				return new ResponseEntity<TrnChargeCount>(newChargeCount, HttpStatus.OK);
			} else {
				chargeCount = (TrnChargeCount)securityService.stampUpdated(chargeCount);
				TrnChargeCount editChargeCount = chargeCountService.editChargeCount(chargeCount);
				return new ResponseEntity<TrnChargeCount>(editChargeCount, HttpStatus.OK);
			}
		} catch(Exception e) {
			return new ResponseEntity<TrnChargeCount>(chargeCount, HttpStatus.BAD_REQUEST);
		}
	}	
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteChargeCount(@PathVariable("id") int id) {
		try {
			boolean deleteReturn = chargeCountService.deleteChargeCount(id);
			if (deleteReturn==true) {
				return new ResponseEntity<String>(HttpStatus.OK);
			} else {
				return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
			}
		}catch(Exception e) {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}	
}
