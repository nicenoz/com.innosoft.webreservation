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
import com.innosoft.webreservation.entity.MstCharge;
import com.innosoft.webreservation.service.ChargeService;
import com.innosoft.webreservation.service.SecurityService;

@Controller
@RequestMapping("api/charge")
public class ChargeApi {
	@Autowired
	private ChargeService chargeService;
	@Autowired
	private SecurityService securityService;

	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<MstCharge> listCharge() {
		List<MstCharge> list = chargeService.listCharge();
		return list;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<MstCharge> updateCharge(@RequestBody MstCharge charge) {
		try {
			if(charge.getCHRG_ID() == 0) {
				charge = (MstCharge)securityService.stampCreated(charge, "Charge");
				MstCharge newCharge = chargeService.addCharge(charge);
				return new ResponseEntity<MstCharge>(newCharge, HttpStatus.OK);
			} else {
				charge = (MstCharge)securityService.stampUpdated(charge, "Charge");
				chargeService.editCharge(charge);
				return new ResponseEntity<MstCharge>(charge, HttpStatus.OK);
			}
		} catch(Exception e) {
			return new ResponseEntity<MstCharge>(charge, HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteCharge(@PathVariable("id") int id) {
		try {
			boolean deleteReturn = chargeService.deleteCharge(id);
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
