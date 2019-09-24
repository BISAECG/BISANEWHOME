package com.bisa.health.shop.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.admin.model.AppUpdate;

@Repository
public class AdminAppUpdateDaoImpl extends BaseDao<AppUpdate> implements IAdminAppUpdateDao {

	@Override
	public void updateStatus(int id) {
		String sql="UPDATE h_app SET status=0 WHERE id!=?";
		this.queryBySql(sql, new Object[]{id});
	}


	@Override
	public List<AppUpdate> listAll() {
		String sql="SELECT * FROM h_app order by id desc LIMIT 0,10 ";
		return this.listBySql(sql,null, AppUpdate.class);
	}

	@Override
	public AppUpdate loadByStatus(int status) {
		String sql="SELECT * FROM h_app WHERE status=?";
		return this.queryObjectBySql(sql, new Object[]{status}, AppUpdate.class);
	}

	@Override
	public Pager<AppUpdate> listLikeAll(String keyword) {
		String sql="SELECT * FROM h_app  LIKE '"+keyword+"%'";
		return this.findBySql(sql, AppUpdate.class, true);
	}




	@Override
	public AppUpdate saveAppUpdate(AppUpdate appUpdate) {
		return this.add(appUpdate);
	}


	@Override
	public void updateAppUpdate(AppUpdate appUpdate) {
		this.update(appUpdate);
	}


	@Override
	public AppUpdate loadByVersion(String version) {
		String sql="SELECT * FROM h_app WHERE version=?";
		return this.queryObjectBySql(sql, new Object[]{version}, AppUpdate.class);
	}

}
