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

import com.innosoft.webreservation.entity.TrnSendLog;
import com.innosoft.webreservation.service.SendLogService;
/**
 *Send log CRUD API
 */
@Controller
@RequestMapping("api/sendLog")
public class SendLogApi {
	/**
	 * Send log service property
	 */
	@Autowired
	private SendLogService sendLogService;
	/**
	 * Return list of send log
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<TrnSendLog> listSendLog() {
		List<TrnSendLog> list = sendLogService.listSendLog();
		return list;
	}
	/**
	 * Update send log
	 * @param sendLog
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<TrnSendLog> updateSendLog(@RequestBody TrnSendLog sendLog) {
		try {
			if(sendLog.getSLOG_ID() == 0) {
				TrnSendLog newSendLog = sendLogService.addSendLog(sendLog);
				return new ResponseEntity<TrnSendLog>(newSendLog, HttpStatus.OK);
			} else {
				TrnSendLog editSendLog = sendLogService.editSendLog(sendLog);
				return new ResponseEntity<TrnSendLog>(editSendLog, HttpStatus.OK);
			}
		} catch(Exception e) {
			return new ResponseEntity<TrnSendLog>(sendLog, HttpStatus.BAD_REQUEST);
		}
	}
	/**
	 * Delete send log
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteSendLog(@PathVariable("id") int id) {
		try {
			boolean deleteReturn = sendLogService.deleteSendLog(id);
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
