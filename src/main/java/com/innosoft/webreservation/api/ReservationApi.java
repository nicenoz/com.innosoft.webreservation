package com.innosoft.webreservation.api;

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

import com.innosoft.webreservation.entity.MstCustomerMember;
import com.innosoft.webreservation.entity.TrnReservation;
import com.innosoft.webreservation.service.ReservationService;
import com.innosoft.webreservation.service.SecurityService;

@Controller
@RequestMapping("api/reservation")
public class ReservationApi {
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private SecurityService securityService;

	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<TrnReservation> listReservation() {
		List<TrnReservation> list = reservationService.listReservation();
		return list;
	}
	
	@RequestMapping(value = "/report", method = RequestMethod.GET, produces = "application/json",  params = {"from", "to"})
	public @ResponseBody List<TrnReservation> reportReservation(@RequestParam(value="from") String from, @RequestParam(value="to") String to) {
		List<TrnReservation> list = reservationService.reportReservation(from, to);
		return list;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<TrnReservation> updateReservation(@RequestBody TrnReservation reservation) {
		try {
			if(reservation.getRESV_ID() == 0) {
				reservation = (TrnReservation)securityService.stampCreated(reservation);
				TrnReservation newReservation = reservationService.addReservation(reservation);
				return new ResponseEntity<TrnReservation>(newReservation, HttpStatus.OK);
			} else {
				reservation = (TrnReservation)securityService.stampUpdated(reservation);
				TrnReservation editReservation = reservationService.editReservation(reservation);
				return new ResponseEntity<TrnReservation>(editReservation, HttpStatus.OK);
			}
		} catch(Exception e) {
			return new ResponseEntity<TrnReservation>(reservation, HttpStatus.BAD_REQUEST);
		}
	}

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
