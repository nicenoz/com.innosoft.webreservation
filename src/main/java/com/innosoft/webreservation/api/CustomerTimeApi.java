package com.innosoft.webreservation.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.innosoft.webreservation.entity.MstCustomerTime;
import com.innosoft.webreservation.service.CustomerTimeService;


@Controller
@RequestMapping("api/customerTime")
public class CustomerTimeApi {
	
	@Autowired
	private CustomerTimeService customerTimeService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<MstCustomerTime> listCustomerTime() {
		List<MstCustomerTime> list = customerTimeService.listCustomerTime();
		return list;
	}
}
