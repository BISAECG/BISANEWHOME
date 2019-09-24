package com.bisa.health.shop.pay.dao;


import com.bisa.health.pay.model.Trade;

/**
 * 流水 交易表
 * @author Administrator
 */
public interface ITradeDao {

    boolean insertTrade(Trade trade);//新增 一条流水对象

}
