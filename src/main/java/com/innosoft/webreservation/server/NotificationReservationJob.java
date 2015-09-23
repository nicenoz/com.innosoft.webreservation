package com.innosoft.webreservation.server;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;

/**
 * Notification of reservation job
 */
public class NotificationReservationJob extends QuartzJobBean {
	/**
	 * Notification reservation service property
	 */
	@Autowired
	private NotificationReservationService notificationReservationService;
	/**
	 * Set notification reservation service method
	 * @param notificationReservationService
	 */
	public void setNotificationReservationService(
			NotificationReservationService notificationReservationService) {
		this.notificationReservationService = notificationReservationService;
	}
 
	/**
	 * Execute job method
	 */
	@Override
	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {
		notificationReservationService.process();
	}
}

