package com.innosoft.webreservation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.MessageDao;
import com.innosoft.webreservation.entity.MstMessage;
/**
 * Service implementation for emails
 */
@Service
@Transactional
public class MessageServiceImpl implements MessageService{
	/**
	 * Message property
	 */
	@Autowired
    private MessageDao messageDao;
	/**
	 * List message method
	 */
	public List<MstMessage> listMessage(){
		return messageDao.listMessage();
	}
	/**
	 * Add message
	 */
	public MstMessage addMessage(MstMessage message){
		return messageDao.addMessage(message);
	}	
	/**
	 * Edit message
	 */
	public MstMessage editMessage(MstMessage message){
		return messageDao.editMessage(message);
	}
	/**
	 * Delete message
	 */
	public boolean deleteMessage(int id){
		return messageDao.deleteMessage(id);
	}
}
