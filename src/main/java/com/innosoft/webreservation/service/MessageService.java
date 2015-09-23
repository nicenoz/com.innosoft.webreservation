package com.innosoft.webreservation.service;

import java.util.List;

import com.innosoft.webreservation.entity.MstMessage;
/**
 * Service interface for emails
 */
public interface MessageService {
	/**
	 * List message method
	 * @return
	 */
	public List<MstMessage> listMessage();
	/**
	 * Add message method
	 * @param message
	 * @return
	 */
	public MstMessage addMessage(MstMessage message);
	/**
	 * Edit message method
	 * @param message
	 * @return
	 */
	public MstMessage editMessage(MstMessage message);
	/**
	 * Delete message method
	 * @param id
	 * @return
	 */
	public boolean deleteMessage(int id);
}
