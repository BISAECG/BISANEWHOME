package com.bisa.health.shop.dao;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.RechargeCard;

@Repository
public class RechargeCardDaoImpl extends BaseDao<RechargeCard> implements IRechargeCardDao {


	@Override
	public RechargeCard getRechargeCardById(int id) {
		String sql = "SELECT * FROM s_recharge_card WHERE ID=?";
		return super.queryObjectBySql(sql, new Object[] { id }, RechargeCard.class);
	}


	@Override
	public Pager<RechargeCard> getPageRechargeCard(String vKey, String vVal) {

		String sql = "SELECT * " + "FROM s_recharge_card ";

		if (!StringUtils.isEmpty(vKey)) {
			sql = "SELECT * FROM s_recharge_card WHERE  " + vKey + " LIKE '" + vVal + "%'";

		}
		return super.findBySql(sql,null, RechargeCard.class, true);
	}


	@Override
	public List<RechargeCard> listRechargeCard() {
		String sql = "SELECT * FROM s_recharge_card";
		return super.listBySql(sql, null, RechargeCard.class);
	}
}
