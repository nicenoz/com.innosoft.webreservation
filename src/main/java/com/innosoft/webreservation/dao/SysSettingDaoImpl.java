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

import com.innosoft.webreservation.entity.MstCharge;
import com.innosoft.webreservation.entity.SysSetting;

@Repository
@Transactional
public class SysSettingDaoImpl implements SysSettingDao{
	
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

	public SysSetting addSetting(SysSetting setting) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			SysSetting updateSettings = (SysSetting)session.get(SysSetting.class, setting.SSET_ID); 
			updateSettings.setSSET_NOTIFICATION_TIME(setting.SSET_NOTIFICATION_TIME);
			updateSettings.setSSET_NOTIFICATION_DATE(setting.SSET_NOTIFICATION_DATE);
			session.update(updateSettings); 
			tx.commit();
			session.close();
			
			return updateSettings;		
		} catch(Exception e) {
			return setting;	
		}
	}

	@SuppressWarnings("unchecked")
	public SysSetting getSetting(int id) {
		List<SysSetting> timVal = new ArrayList<SysSetting>();
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createQuery("from SysSetting u where u.SSET_ID = :id");
		query.setParameter("id", id);
		timVal = query.list();
		if (timVal.size() > 0)
			return timVal.get(0);
		else
			return new SysSetting();
		
	}
	
	public SysSetting editSetting(SysSetting setting) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			SysSetting updateSetting = (SysSetting)session.get(SysSetting.class, setting.SSET_ID); 
			
			if(setting.SSET_NOTIFICATION_TIME != null) {
				updateSetting.setSSET_NOTIFICATION_TIME(setting.SSET_NOTIFICATION_TIME);
			}
			
			if(setting.SSET_NOTIFICATION_DATE != null) {
				updateSetting.setSSET_NOTIFICATION_DATE(setting.SSET_NOTIFICATION_DATE);
			}
			
			session.update(updateSetting); 
			tx.commit();
			session.close();
			
			return updateSetting;
		} catch (Exception e) 
		{
			return new SysSetting();
		}			
	}
}
