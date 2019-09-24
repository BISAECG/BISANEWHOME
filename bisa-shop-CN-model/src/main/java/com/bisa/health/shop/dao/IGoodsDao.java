package com.bisa.health.shop.dao;

import com.bisa.health.shop.model.Goods;

import java.util.List;

/**
 * 商品 表
 */

public interface IGoodsDao {

    /**
     * 根据goods编号 查对象
     * @param goods_number
     * @return
     */
    Goods selectGoodsByGoodsNumber(String goods_number);

    /**
     * 修改评论数量
     * @param goods
     * @return
     */
    int updateAppraiseNumber(Goods goods);

    /**
     * 获得指定商品的子级商品列表
     * @param id
     * @return
     */
    List<Goods> listChildrenGoods(Integer id);

    /**
     * 根据id查询
     * @return
     */
    Goods SelectGoodsById(int id);
    
    
    /**
     * 付款成功后,修改商品的 销量和 库存数量
     * @param goods_number_id 商品的id
     * @param count           买的数量
     * @return
     */
    boolean updateGoodsStoreAndSalesNumber(String goods_number_id, Integer count);

    /**
     * 更新商品的状态
     * @param goodsNumber
     * @param value
     */
    int updateGoodsStatus(String goodsNumber, int value);
}
