package com.bisa.health.shop.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.admin.dao.IAdminAppServerDao;
import com.bisa.health.shop.admin.model.AppServer;

@Service
@CacheConfig(cacheNames = "AdminAppServerServiceImpl")
public class AdminAppServerServiceImpl implements IAdminAppServerService{

	@Autowired
	private IAdminAppServerDao appServerDao;
	
	@Override
	@Cacheable(key="targetClass.name+methodName")
	public Pager<AppServer> listPager(){
		return appServerDao.listPager();
	}


	@Override
	@Cacheable(key="targetClass.name+methodName+#id")
	public AppServer loadByID(int id) {
		return appServerDao.load(id);
	}


	@Override
	@CacheEvict(value="AdminAppServerServiceImpl",allEntries=true)
	public AppServer saveAppServer(AppServer appServer) {
		return appServerDao.saveAppServer(appServer);
	}

	@Override
	@CacheEvict(value="AdminAppServerServiceImpl",allEntries=true)
	public void updateAppServer(AppServer appServer) {
		appServerDao.updateAppServer(appServer);
	}

	@Override
	@CacheEvict(value="AdminAppServerServiceImpl",allEntries=true)
	public void deleteAppServer(AppServer appServer) {
		appServerDao.delete(appServer.getId());
	}


	@Override
	@CacheEvict(value="AdminAppServerServiceImpl",allEntries=true)
	public void updateStatus(String version) {
		appServerDao.updateStatus(version);
	}


	@Override
	@Cacheable(key="targetClass.name+methodName")
	public AppServer loadByVersion() {
		return appServerDao.loadByVersion();
	}


	@Override
	@Cacheable(key="targetClass.name+methodName")
	public List<AppServer> list() {
		return appServerDao.list();
	}
	
	
}
