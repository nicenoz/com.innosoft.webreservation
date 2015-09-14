package com.innosoft.webreservation.server;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;


public class NotificationReservationJob extends QuartzJobBean {
	
	public void setNotificationReservationService(
			NotificationReservationService notificationReservationService) {
		this.notificationReservationService = notificationReservationService;
	}

	@Autowired
	private NotificationReservationService notificationReservationService;

	@Override
	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {
		notificationReservationService.process();
	}
}

