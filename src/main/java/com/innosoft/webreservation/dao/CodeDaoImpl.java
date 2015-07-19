package com.innosoft.webreservation.dao;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.innosoft.webreservation.entity.MstCode;


@Repository
@Transactional
public class CodeDaoImpl implements CodeDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public List<MstCode> listCode() {
		Session session = this.sessionFactory.getCurrentSession();
		List<MstCode> list = session.createQuery("from MstCode").list();	
		return list;
	}
	
	public MstCode addCode(MstCode code) {
		Session session = this.sessionFactory.getCurrentSession();

		MstCode newCode = new MstCode();
		
		newCode.setCODE_KIND_CODE(code.getCODE_KIND_CODE());
		newCode.setCODE_CODE_VALUE(code.getCODE_CODE_VALUE());
		newCode.setCODE_NOTE(code.getCODE_NOTE());
		newCode.setCODE_TEXT(code.getCODE_TEXT());
		newCode.setCODE_ISDISPLAY(code.getCODE_ISDISPLAY());
		
		session.save(newCode);
		
		return newCode;
	}

	
	
}