package com.innosoft.webreservation.service;

import java.util.List;

import com.innosoft.webreservation.entity.MstMessage;

public interface MessageService {
	public List<MstMessage> listMessage();
	public MstMessage addMessage(MstMessage message);
}
