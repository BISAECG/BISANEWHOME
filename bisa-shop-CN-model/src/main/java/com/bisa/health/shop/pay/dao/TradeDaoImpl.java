package com.bisa.health.shop.pay.dao;

import com.bisa.health.pay.model.Trade;
import org.springframework.stereotype.Repository;

import com.bisa.health.basic.dao.BaseDao;

@Repository
public class TradeDaoImpl extends BaseDao<Trade> implements ITradeDao {

    @Override
    public boolean insertTrade(Trade trade) {
        String sql = "INSERT INTO s_trade(trade_no, order_no, create_time, pay_location, pay_type, price, user_guid) VALUES(?,?,?,?,?,?,?)";
        int result = super.addBySql(sql, new Object[]{trade.getTrade_no(), trade.getOrder_no(), trade.getCreate_time(),
                trade.getPay_location(), trade.getPay_type(), trade.getPrice(), trade.getUser_guid()});
        return result >= 1 ? true : false;
    }

}
