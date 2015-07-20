package com.innosoft.webreservation.dao;

import java.util.List;

import com.innosoft.webreservation.entity.MstMessage;

public interface MessageDao {
	public List<MstMessage> listMessage();
	public MstMessage addMessage(MstMessage message);
	public MstMessage editMessage(MstMessage message);
	public boolean deleteMessage(int id);
}
