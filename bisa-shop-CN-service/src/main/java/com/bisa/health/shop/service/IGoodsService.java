package com.bisa.health.shop.service;

import com.bisa.health.shop.dto.GoodsComboDto;
import com.bisa.health.shop.model.Goods;

import java.util.List;

/**
 * 商品goods表
 */

public interface IGoodsService {

    /**
     * 根据商品的编号,获取商品的对象
     * @param goods_number_id 商品的编号
     * @param lang            国际化语言的种类
     * @return
     */
    Goods selectGoodsByGoodsNumber(String goods_number_id, String lang);

    /**
     * 增加商品评论数
     * @param goodsNumber
     * @param count
     * @return
     */
    void updateGoodsAppraiseNumber(String goodsNumber, int count);

    /**
     * 获得某父级id所有子级商品列表
     * @param parentId
     * @param lang
     * @return
     */
    List<GoodsComboDto> listChildrenGoodsByParentId(Integer parentId, String lang);

    /**
     * 获得某父级id所有子级商品列表
     * @param id
     * @param lang
     * @return
     */
    List<Goods> listChildrenGoodsByParentId2(Integer id, String lang);

    /**
     * 根据id查询
     * @return
     */
    Goods SelectGoodsById(int id);
    
    
    /**
     * 根据商品的编号,获取商品的对象
     * @param goodsNumber
     * @return
     */
    Goods selectGoodsByGoodsNumber(String goodsNumber);
    
    
    /**
     * 付款成功后,修改商品的 销量和 库存数量
     * @param goodsNumber
     * @param count
     */
    void updateGoodsStoreAndSalesNumber(String goodsNumber, Integer count);

    /**
     * /库存改为买完了的状态
     * @param goodsNumber
     * @param value
     */
    void updateGoodsStatus(String goodsNumber, int value);

}
