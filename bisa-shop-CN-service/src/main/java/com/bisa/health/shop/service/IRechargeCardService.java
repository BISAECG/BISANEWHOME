package com.bisa.health.shop.service;

import java.util.List;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.RechargeCard;

public interface IRechargeCardService {
	

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
     public Pager<RechargeCard> getPageRechargeCard(int offset,String vKey, String vVal);
    
    /**
     * 查询所有
     * @param
     * @return
     */
    public List<RechargeCard> listRechargeCard();
    
    /**
     * 增加充值卡
     * @param rechargeCard
     * @return
     */
    public RechargeCard addRechargeCard(RechargeCard rechargeCard);
    
    /**
     * 更新充值卡
     * @param rechargeCard
     * @return
     */
    public RechargeCard updateRechargeCard(RechargeCard rechargeCard);
    
    /**
     * 删除充值卡
     * @param id
     */
    public void deleteRechargeCard(int id);
    

}
