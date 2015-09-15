package com.innosoft.webreservation.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.innosoft.webreservation.entity.SysSetting;

@Repository
@Transactional
public class SysSettingImpl implements SysSettingDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public int getMaxId()
	{
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(SysSetting.class).setProjection(Projections.max("SSET_ID"));
	    Integer maxId = (Integer)criteria.uniqueResult();
		if(maxId == null){
			maxId = 0;
		}
		return 	maxId;
	}

	public SysSetting addSetting(SysSetting time) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			tx = session.beginTransaction();
			SysSetting settings = new SysSetting();
			settings.setSSET_ID(getMaxId() + 1);
			settings.setSSET_NOTIFICATION_TIME(time.SSET_NOTIFICATION_TIME);
			session.save(settings);
			tx.commit();
			session.close();
			
			return settings;			
		} catch(Exception e) {
			return time;	
		}
	}

	@SuppressWarnings("unchecked")
	public SysSetting getSetting(SysSetting time) {
		List<SysSetting> timVal = new ArrayList<SysSetting>();
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createQuery("from SysSetting u where u.SSET_ID = :id");
		query.setParameter("id", time.SSET_ID);
		timVal = query.list();
		if (timVal.size() > 0)
			return timVal.get(0);
		else
			return new SysSetting();
		
	}
	

}
