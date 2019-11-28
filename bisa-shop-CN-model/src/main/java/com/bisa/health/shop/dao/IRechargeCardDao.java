package com.bisa.health.shop.dao;

import java.util.List;

import com.bisa.health.basic.dao.IBaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.RechargeCard;

public interface IRechargeCardDao extends IBaseDao<RechargeCard>{


	

    /**
     * 充值卡表的id,加载充值卡数据
     * @param id
     * @return
     */
    public RechargeCard getRechargeCardById(int id);
    
     
     /**
      * 充值卡分页
      * @param 
      * @return
      */
     public Pager<RechargeCard> getPageRechargeCard(String vKey, String vVal);

    
    
    /**
     * 查询所有
     * @param
     * @return
     */
    public List<RechargeCard> listRechargeCard();
    
  
    
}
