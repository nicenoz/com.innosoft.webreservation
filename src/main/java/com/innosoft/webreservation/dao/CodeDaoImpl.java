package com.innosoft.webreservation.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.innosoft.webreservation.entity.MstCode;
import com.innosoft.webreservation.entity.MstCustomerMember;

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
	
	@SuppressWarnings("unchecked")
	public List<MstCode> listCodeByKind(String kind) {
		Session session = this.sessionFactory.getCurrentSession();	
		
		Criteria criteria = session.createCriteria(MstCode.class);
		criteria.add(Restrictions.eq("CODE_KIND_CODE", kind));
		
		List<MstCode> list = criteria.list();	
		return list;
	}
	
	public int getMaxId()
	{
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(MstCode.class).setProjection(Projections.max("CODE_ID"));
	    Integer maxId = (Integer)criteria.uniqueResult();
		if(maxId == null){
			maxId = 0;
		}
		return 	maxId;
	}
	
	public MstCode addCode(MstCode code) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			MstCode newCode = new MstCode();
			newCode.setCODE_ID(getMaxId() + 1);
			newCode.setCODE_KIND_CODE(code.getCODE_KIND_CODE());
			newCode.setCODE_CODE_VALUE(code.getCODE_CODE_VALUE());
			newCode.setCODE_NOTE(code.getCODE_NOTE());
			newCode.setCODE_TEXT(code.getCODE_TEXT());
			newCode.setCODE_ISDISPLAY(code.getCODE_ISDISPLAY());
			
			newCode.setCREATED_BY_USER_ID(code.CREATED_BY_USER_ID);
			newCode.setCREATED_DATE(code.CREATED_DATE);
			newCode.setUPDATED_BY_USER_ID(code.UPDATED_BY_USER_ID);
			newCode.setUPDATED_DATE(code.UPDATED_DATE);
			newCode.setISDELETED(code.ISDELETED);
			
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
			
			updateCode.setUPDATED_BY_USER_ID(code.UPDATED_BY_USER_ID);
			updateCode.setUPDATED_DATE(code.UPDATED_DATE);
			
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