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

import com.innosoft.webreservation.entity.MstCode;
import com.innosoft.webreservation.service.CodeService;
import com.innosoft.webreservation.service.SecurityService;
/**
 * 
 * Code CRUD API
 *
 */
@Controller
@RequestMapping("api/code")
public class CodeApi {
	/**
	 * Code service property
	 */
	@Autowired
	private CodeService codeService;
	/**
	 * Security service property
	 */
	@Autowired
	private SecurityService securityService;
	/**
	 * Return list of code 
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<MstCode> listCode() {
		List<MstCode> list = codeService.listCode();
		return list;
	}
	/**
	 * Return list of code by customer
	 * @param kind
	 * @return
	 */
	@RequestMapping(value = "/listByKind", method = RequestMethod.GET, produces = "application/json",  params = {"kind"})
	public @ResponseBody List<MstCode> listByCustomer(@RequestParam(value="kind") String kind) {
		List<MstCode> list = codeService.listCodeByKind(kind);
		return list;
	}
	/**
	 * Update code 
	 * @param code
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<MstCode> updateCode(@RequestBody MstCode code) {
		try {
			if(code.getCODE_ID()==0) {
				code = (MstCode)securityService.stampCreated(code);
				MstCode newCode = codeService.addCode(code);
				return new ResponseEntity<MstCode>(newCode, HttpStatus.OK);
			} else {
				code = (MstCode)securityService.stampUpdated(code);
				MstCode editCode = codeService.editCode(code);
				return new ResponseEntity<MstCode>(editCode, HttpStatus.OK);
			}
		} catch(Exception e) {
			return new ResponseEntity<MstCode>(code, HttpStatus.BAD_REQUEST);
		}
	}	
	/**
	 * Delete Code
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteCode(@PathVariable("id") int id) {
		try {
			boolean deleteReturn = codeService.deleteCode(id);
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
