package com.innosoft.webreservation.api;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.innosoft.webreservation.entity.TrnChargeCount;
import com.innosoft.webreservation.entity.TrnReservation;
import com.innosoft.webreservation.service.ChargeCountService;
import com.innosoft.webreservation.service.ReservationService;
import com.innosoft.webreservation.service.SecurityService;
/**
 *Reservation CRUD API (This API is used for CRUD and other reporting functions)
 */
@Controller
@RequestMapping("api/reservation")
public class ReservationApi {
	/**
	 * Reservation service property	
	 */
	@Autowired
	private ReservationService reservationService;
	/**
	 *Security service property
	 */
	@Autowired
	private SecurityService securityService;
	
	/**
	 * Charge count service property
	 */
	@Autowired
	private ChargeCountService chargeCountService;
	/**
	 *return list of reservation
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<TrnReservation> listReservation() {
		List<TrnReservation> list = reservationService.listReservation();
		return list;
	}
	/**
	 * Return list of reservation by customer
	 * @param customerId
	 * @return
	 */
	@RequestMapping(value = "/listByCustomer", method = RequestMethod.GET, produces = "application/json",  params = {"customerId"})
	public @ResponseBody List<TrnReservation> listReservationByCustomer(@RequestParam(value="customerId") int customerId) {
		List<TrnReservation> list = reservationService.listByCustomer(customerId);
		return list;
	}
	
	/**
	 * Return list of reservation by customer
	 * @param customerId
	 * @return
	 */
	@RequestMapping(value = "/listByDates", method = RequestMethod.GET, produces = "application/json",  params = {"customerId", "calendarActivityIds"})
	public @ResponseBody List<TrnReservation> listReservationsByDates(@RequestParam(value="customerId") int customerId, @RequestParam(value="calendarActivityIds") String calendarActivityIds) {
		List<TrnReservation> list = reservationService.scheduleReservation(customerId, calendarActivityIds);
		return list;
	}
	/**
	 * List of reservation between dates
	 * @param from
	 * @param to
	 * @return
	 */
	@RequestMapping(value = "/report", method = RequestMethod.GET, produces = "application/json",  params = {"from", "to"})
	public @ResponseBody List<TrnReservation> reportReservation(@RequestParam(value="from") String from, @RequestParam(value="to") String to) {
		List<TrnReservation> list = reservationService.reportReservation(from, to);
		return list;
	}
	/**
	 * Update reservation
	 * @param reservation
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<TrnReservation> updateReservation(@RequestBody TrnReservation reservation) {
		try {
			if(reservation.getRESV_ID() == 0) {
				reservation = (TrnReservation)securityService.stampCreated(reservation);
				TrnReservation newReservation = reservationService.addReservation(reservation);
				
				if(newReservation.getRESV_ID() == -1){
					return new ResponseEntity<TrnReservation>(HttpStatus.NOT_FOUND);
				}else if(newReservation.getRESV_ID() == -2){
					return new ResponseEntity<TrnReservation>(HttpStatus.CONFLICT);
				}else{
					TrnChargeCount newChargeCount = new TrnChargeCount();
					
					newChargeCount.setCUNT_TIME_STAMP(new Date());
					newChargeCount.setCUNT_CUST_ID(reservation.getRESV_CUST_ID());
					newChargeCount.setCUNT_MEBR_ID(reservation.getRESV_MEBR_ID());
					newChargeCount.setCUNT_EMAIL_ADDRESS(securityService.getCurrentUser().getUSER_LOGIN());
					newChargeCount.setCUNT_RESV_ID(newReservation.RESV_ID);
					newChargeCount = (TrnChargeCount)securityService.stampCreated(newChargeCount);
					
					chargeCountService.addChargeCount(newChargeCount);
					return new ResponseEntity<TrnReservation>(newReservation, HttpStatus.OK);
				}
			} else {
				reservation = (TrnReservation)securityService.stampUpdated(reservation);
				TrnReservation editReservation = reservationService.editReservation(reservation);
				
				if(editReservation.getRESV_ID() == -1){
					return new ResponseEntity<TrnReservation>(HttpStatus.NOT_FOUND);
				}else if(editReservation.getRESV_ID() == -2){
					return new ResponseEntity<TrnReservation>(HttpStatus.CONFLICT);
				}else{
					return new ResponseEntity<TrnReservation>(editReservation, HttpStatus.OK);
				}
			}
		} catch(Exception e) {
			System.out.println(e.toString());
			return new ResponseEntity<TrnReservation>(reservation, HttpStatus.BAD_REQUEST);
		}
	}
	/**
	 * Change isDeleted column from 0 to 1
	 * @param reservation
	 * @return
	 */
	@RequestMapping(value = "/sdelete", method = RequestMethod.POST)
	public ResponseEntity<TrnReservation> softDeleteReservation(@RequestBody TrnReservation reservation) {
		try {
			reservation = (TrnReservation)securityService.stampDeleted(reservation);
			TrnReservation deleteReservation = reservationService.editReservation(reservation);
			
			TrnChargeCount deleteChargeCount = chargeCountService.getReservationById(deleteReservation.getRESV_ID());
			deleteChargeCount = (TrnChargeCount)securityService.stampDeleted(deleteChargeCount);
			chargeCountService.editChargeCount(deleteChargeCount);
		
			return new ResponseEntity<TrnReservation>(deleteReservation, HttpStatus.OK);
		} catch(Exception e) {
			System.out.println(e.toString());
			return new ResponseEntity<TrnReservation>(reservation, HttpStatus.BAD_REQUEST);
		}
	}
	/**
	 * Delete reservation
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteReservation(@PathVariable("id") int id) {
		try {
			boolean deleteReturn = reservationService.deleteReservation(id);
			if (deleteReturn == true) {
				return new ResponseEntity<String>(HttpStatus.OK);
			} else {
				return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
			}
		} catch (Exception e) {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
}
