package com.innosoft.webreservation.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.innosoft.webreservation.entity.MstMessage;
import com.innosoft.webreservation.service.MessageService;

@Controller
@RequestMapping("api/message")
public class MessageApi {
	@Autowired
	private MessageService messageService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<MstMessage> listMessage() {
		List<MstMessage> list = messageService.listMessage();
		return list;
	}
}
