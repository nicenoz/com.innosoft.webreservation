package com.innosoft.webreservation.service;

import javax.transaction.Transactional;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.dao.UserDao;
import com.innosoft.webreservation.entity.MstCalendar;
import com.innosoft.webreservation.entity.MstCharge;
import com.innosoft.webreservation.entity.MstCode;
import com.innosoft.webreservation.entity.MstCustomer;
import com.innosoft.webreservation.entity.MstCustomerMember;
import com.innosoft.webreservation.entity.MstCustomerTime;
import com.innosoft.webreservation.entity.MstMessage;
import com.innosoft.webreservation.entity.MstSecurityUser;
import com.innosoft.webreservation.entity.TrnChargeCount;
import com.innosoft.webreservation.entity.TrnReservation;

@Service
@Transactional
public class AuditServiceImpl extends AuditService implements SecurityService {

	@Autowired
	private UserDao userDao;
	public AuditService log = new AuditService();
	
	public MstSecurityUser getCurrentUser() {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String login = user.getUsername();
		return userDao.getUser(login);
	}
	
	public Object stampCreated(Object object, String objectType) {
		
		if (objectType == "Message") {
			MstMessage message = (MstMessage) object;
			message = (MstMessage) log.fillStamp(this.getCurrentUser());
			log.setMessage(message);

		} else if (objectType == "Calendar") {

			MstCalendar calendar = (MstCalendar) object;
			calendar = (MstCalendar) log.fillStamp(this.getCurrentUser());
			log.setCalendar(calendar);

		} else if (objectType == "CalendarActivity") {

		} else if (objectType == "Charge") {

			MstCharge charge = (MstCharge) object;
			charge = (MstCharge) log.fillStamp(this.getCurrentUser());
			log.setCharge(charge);

		} else if (objectType == "ChargeCount") {

			TrnChargeCount chargeCount = (TrnChargeCount) object;
			chargeCount = (TrnChargeCount) log.fillStamp(this.getCurrentUser());
			log.setChargeCount(chargeCount);

		} else if (objectType == "Code") {

			MstCode code = (MstCode) object;
			code = (MstCode) log.fillStamp(this.getCurrentUser());
			log.setCode(code);

		} else if (objectType == "Customer") {

			MstCustomer customer = (MstCustomer) object;
			customer = (MstCustomer) log.fillStamp(this.getCurrentUser());
			log.setCustomer(customer);

		} else if (objectType == "CustomerMember") {

			MstCustomerMember customerMember = (MstCustomerMember) object;
			customerMember = (MstCustomerMember) log.fillStamp(this.getCurrentUser());
			log.setCustomerMember(customerMember);

		} else if (objectType == "CustomerTime") {

			MstCustomerTime time = (MstCustomerTime) object;
			time = (MstCustomerTime) log.fillStamp(this.getCurrentUser());
			log.setTime(time);

		} else if (objectType == "Reservation") {

			TrnReservation reservation = (TrnReservation) object;
			reservation = (TrnReservation) log.fillStamp(this.getCurrentUser());
			log.setReservation(reservation);

		}
		return object;
	}

	public Object stampUpdated(Object object, String objectType) {

		if (objectType == "Message") {

			MstMessage message = (MstMessage) object;
			message = (MstMessage) log.UpdateStamp(this.getCurrentUser());
			log.setMessage(message);

		} else if (objectType == "Calendar") {

			MstCalendar calendar = (MstCalendar) object;
			calendar = (MstCalendar) log.UpdateStamp(this.getCurrentUser());
			log.setCalendar(calendar);

		} else if (objectType == "CalendarActivity") {

		} else if (objectType == "Charge") {

			MstCharge charge = (MstCharge) object;
			charge = (MstCharge) log.UpdateStamp(this.getCurrentUser());
			log.setCharge(charge);

		} else if (objectType == "ChargeCount") {

			TrnChargeCount chargeCount = (TrnChargeCount) object;
			chargeCount = (TrnChargeCount) log.UpdateStamp(this.getCurrentUser());
			log.setChargeCount(chargeCount);

		} else if (objectType == "Code") {

			MstCode code = (MstCode) object;
			code = (MstCode) log.UpdateStamp(this.getCurrentUser());
			log.setCode(code);

		} else if (objectType == "Customer") {

			MstCustomer customer = (MstCustomer) object;
			customer = (MstCustomer) log.UpdateStamp(this.getCurrentUser());
			log.setCustomer(customer);

		} else if (objectType == "CustomerMember") {

			MstCustomerMember customerMember = (MstCustomerMember) object;
			customerMember = (MstCustomerMember) log.UpdateStamp(this.getCurrentUser());
			log.setCustomerMember(customerMember);

		} else if (objectType == "CustomerTime") {

			MstCustomerTime time = (MstCustomerTime) object;
			time = (MstCustomerTime) log.UpdateStamp(this.getCurrentUser());
			log.setTime(time);

		} else if (objectType == "Reservation") {
			TrnReservation reservation = (TrnReservation) object;
			reservation = (TrnReservation) log.UpdateStamp(this.getCurrentUser());
			log.setReservation(reservation);
		}
		return object;
	}
}
