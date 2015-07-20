package com.innosoft.webreservation.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
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
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			MstCode newCode = new MstCode();

			newCode.setCODE_KIND_CODE(code.getCODE_KIND_CODE());
			newCode.setCODE_CODE_VALUE(code.getCODE_CODE_VALUE());
			newCode.setCODE_NOTE(code.getCODE_NOTE());
			newCode.setCODE_TEXT(code.getCODE_TEXT());
			newCode.setCODE_ISDISPLAY(code.getCODE_ISDISPLAY());
			
			session.save(newCode);
			tx.commit();
			session.close();
			
			return newCode;			
		} catch(Exception e) {
			return code;	
		}		
	}

	public MstCode editCode(MstCode code) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			MstCode updateCode = (MstCode)session.get(MstCode.class, code.CODE_ID); 
			
			updateCode.setCODE_KIND_CODE(code.getCODE_KIND_CODE());
			updateCode.setCODE_CODE_VALUE(code.getCODE_CODE_VALUE());
			updateCode.setCODE_NOTE(code.getCODE_NOTE());
			updateCode.setCODE_TEXT(code.getCODE_TEXT());
			updateCode.setCODE_ISDISPLAY(code.getCODE_ISDISPLAY());
			
			session.update(updateCode); 
			tx.commit();
			session.close();
			
			return updateCode;
		} catch (Exception e) 
		{
			return new MstCode();
		}		
	}
	
	public boolean deleteCode(int id) {
	    try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
	    	tx = session.beginTransaction();
	    	MstCode deleteCode = (MstCode)session.get(MstCode.class, id); 
	    	
	    	session.delete(deleteCode); 
	    	
	    	tx.commit();
	    	session.close();
	    	
	    	return true;
	    } catch (Exception e) {
	    	return false; 
	    }	
	}	
	
}