package com.bisa.health.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.dao.IAppUpdateDao;
import com.bisa.health.shop.model.AppUpdate;

@Service
@CacheConfig(cacheNames = "AdminAppUpdateServiceImpl")
public class AppUpdateServiceImpl implements IAppUpdateService{

	
	@Autowired
	private IAppUpdateDao appUpdateDao;
	
	
	@Override
	@CacheEvict(value="AdminAppUpdateServiceImpl",allEntries=true)
	public void updateStatus(int id) {
		appUpdateDao.updateStatus(id);
	}

	@Override
	@Cacheable(key="targetClass.name+methodName")
	public List<AppUpdate> listAll() {
		return appUpdateDao.listAll();
	}

	@Override
	@Cacheable(key="targetClass.name+methodName+#status")
	public AppUpdate loadByStatus(int status) {
		return appUpdateDao.loadByStatus(status);
	}

	@Override
	@Cacheable(key="targetClass.name+methodName+#id")
	public AppUpdate load(int id) {
		return appUpdateDao.load(id);
	}

	@Override
	@Cacheable(key="targetClass.name+methodName+#keyword")
	public Pager<AppUpdate> listLikeAll(String keyword) {
		return appUpdateDao.listLikeAll(keyword);
	}

	@Override
	@CacheEvict(value="AdminAppUpdateServiceImpl",allEntries=true)
	public AppUpdate saveAppUpdate(AppUpdate appUpdate) {
		return appUpdateDao.saveAppUpdate(appUpdate);
	}

	@Override
	@CacheEvict(value="AdminAppUpdateServiceImpl",allEntries=true)
	public void updateAppUpdate(AppUpdate appUpdate) {
		appUpdateDao.updateAppUpdate(appUpdate);
	}

	@Override
	@Cacheable(key="targetClass.name+methodName+#version")
	public AppUpdate loadByVersion(String version) {
		return appUpdateDao.loadByVersion(version);
	}
	
	

}
