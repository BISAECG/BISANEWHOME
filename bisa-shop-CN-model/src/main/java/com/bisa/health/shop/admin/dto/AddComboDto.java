package com.bisa.health.shop.admin.dto;

import com.bisa.health.shop.dto.AssistantGoods;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
 * 接收  添加  套餐信息  的dto
 * @author Administrator
 */

public class AddComboDto implements Serializable {

    private String mainGoodsNumber;        // 主商品-编号
    private BigDecimal mainGoodsPrice;    // 主商品-套餐价格
    private Integer mainGoodsCount;    // 主商品-套餐数量

    List<AssistantGoods> goodsList;     //关联副商品集合

    public List<AssistantGoods> getGoodsList() {
        return goodsList;
    }

    public void setGoodsList(List<AssistantGoods> goodsList) {
        this.goodsList = goodsList;
    }

    public String getMainGoodsNumber() {
        return mainGoodsNumber;
    }

    public void setMainGoodsNumber(String mainGoodsNumber) {
        this.mainGoodsNumber = mainGoodsNumber;
    }

    public BigDecimal getMainGoodsPrice() {
        return mainGoodsPrice;
    }

    public void setMainGoodsPrice(BigDecimal mainGoodsPrice) {
        this.mainGoodsPrice = mainGoodsPrice;
    }

    public Integer getMainGoodsCount() {
        return mainGoodsCount;
    }

    public void setMainGoodsCount(Integer mainGoodsCount) {
        this.mainGoodsCount = mainGoodsCount;
    }



}
