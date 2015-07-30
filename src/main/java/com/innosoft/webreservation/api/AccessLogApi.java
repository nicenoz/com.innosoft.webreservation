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
import com.innosoft.webreservation.entity.TrnAccessLog;
import com.innosoft.webreservation.service.AccessLogService;

@Controller
@RequestMapping("api/accessLog")
public class AccessLogApi {
	@Autowired
	private AccessLogService accessLogService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<TrnAccessLog> listAccessLog() {
		List<TrnAccessLog> list = accessLogService.listAccessLog();
		return list;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<TrnAccessLog> updateCharge(@RequestBody TrnAccessLog accessLog) {
		try {
			if(accessLog.getALOG_ID() == 0) {
				TrnAccessLog newAccessLog = accessLogService.addAccessLog(accessLog);
				return new ResponseEntity<TrnAccessLog>(newAccessLog, HttpStatus.OK);
			} else {
				TrnAccessLog editAccessLog = accessLogService.editAccessLog(accessLog);
				return new ResponseEntity<TrnAccessLog>(editAccessLog, HttpStatus.OK);
			}
		} catch(Exception e) {
			return new ResponseEntity<TrnAccessLog>(accessLog, HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteAccessLog(@PathVariable("id") int id) {
		try {
			boolean deleteReturn = accessLogService.deleteAccessLog(id);
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
