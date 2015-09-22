package com.innosoft.webreservation.dao;

import java.util.List;

import com.innosoft.webreservation.entity.MstMessage;
/**
 * CRUD interface for message data object.
 */
public interface MessageDao {
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
	 * Add message method
	 * @param message
	 * @return
	 */
	public MstMessage editMessage(MstMessage message);
	/**
	 * Edit message method
	 * @param id
	 * @return
	 */
	public boolean deleteMessage(int id);
}
