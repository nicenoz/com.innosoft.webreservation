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

import com.innosoft.webreservation.entity.TrnChargeCount;
import com.innosoft.webreservation.service.ChargeCountService;
import com.innosoft.webreservation.service.SecurityService;

/**
 * Charge count CRUD API
 */
@Controller
@RequestMapping("api/chargeCount")
public class ChargeCountApi {
	/**
	 * Charge count service property
	 */
	@Autowired
	private ChargeCountService chargeCountService;
	/**
	 * Security service
	 */
	@Autowired
	private SecurityService securityService;

	/**
	 * Return list of charge count
	 * 
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<TrnChargeCount> listChargeCount() {
		List<TrnChargeCount> list = chargeCountService.listChargeCount();
		return list;
	}

	/**
	 * Return list of report
	 * 
	 * @param from
	 * @param to
	 * @return
	 */
	@RequestMapping(value = "/report", method = RequestMethod.GET, produces = "application/json", params = {
			"from", "to" })
	public @ResponseBody List<TrnChargeCount> getReport(
			@RequestParam(value = "from") String from,
			@RequestParam(value = "to") String to) {
		List<TrnChargeCount> list = chargeCountService.getReport(from, to);
		return list;
	}

	/**
	 * Update charge count
	 * 
	 * @param chargeCount
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<TrnChargeCount> updateChargeCount(
			@RequestBody TrnChargeCount chargeCount) {
		try {
			if (chargeCount.getCUNT_ID() == 0) {
				chargeCount = (TrnChargeCount) securityService
						.stampCreated(chargeCount);
				TrnChargeCount newChargeCount = chargeCountService
						.addChargeCount(chargeCount);
				return new ResponseEntity<TrnChargeCount>(newChargeCount,
						HttpStatus.OK);
			} else {
				chargeCount = (TrnChargeCount) securityService
						.stampUpdated(chargeCount);
				TrnChargeCount editChargeCount = chargeCountService
						.editChargeCount(chargeCount);
				return new ResponseEntity<TrnChargeCount>(editChargeCount,
						HttpStatus.OK);
			}
		} catch (Exception e) {
			return new ResponseEntity<TrnChargeCount>(chargeCount,
					HttpStatus.BAD_REQUEST);
		}
	}

	/**
	 * Delete charge count
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteChargeCount(@PathVariable("id") int id) {
		try {
			boolean deleteReturn = chargeCountService.deleteChargeCount(id);
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
