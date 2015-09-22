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

import com.innosoft.webreservation.entity.MstCustomer;
import com.innosoft.webreservation.service.CustomerService;
import com.innosoft.webreservation.service.SecurityService;
/**
 * Customer CRUD API
 */
@Controller
@RequestMapping("api/customer")
public class CustomerApi {
	/**
	 * Customer service property
	 */
	@Autowired
	private CustomerService customerService;
	/**
	 * Security service property
	 */
	@Autowired
	private SecurityService securityService;
	/**
	 * Return list of customer
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<MstCustomer> listCustomer() {
		List<MstCustomer> list = customerService.listCustomer();
		return list;
	}
	/**
	 * Update Customer
	 * @param customer
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<MstCustomer> updateCustomer(@RequestBody MstCustomer customer) {
		try {
			if(customer.getCUST_ID()==0) {
				customer = (MstCustomer)securityService.stampCreated(customer);
				MstCustomer newCustomer = customerService.addCustomer(customer);
				return new ResponseEntity<MstCustomer>(newCustomer, HttpStatus.OK);
			} else {
				customer = (MstCustomer)securityService.stampUpdated(customer);
				MstCustomer editCustomer = customerService.editCustomer(customer);
				return new ResponseEntity<MstCustomer>(editCustomer, HttpStatus.OK);
			}
		} catch(Exception e) {
			return new ResponseEntity<MstCustomer>(customer, HttpStatus.BAD_REQUEST);
		}	
	}	
	/**
	 * Delete customer
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteCustomer(@PathVariable("id") int id) {
		try {
			boolean deleteReturn = customerService.deleteCustomer(id);
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
