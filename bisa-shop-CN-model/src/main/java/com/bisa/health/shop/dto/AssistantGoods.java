package com.bisa.health.shop.dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class AssistantGoods implements Serializable {
    private String assistantGoodsNumber;    //配套商品-编号
    private BigDecimal assistantGoodsPrice;    //配套商品-套餐价格
    private Integer assistantGoodsCount;    //配套商品-套餐数量

    public String getAssistantGoodsNumber() {
        return assistantGoodsNumber;
    }

    public void setAssistantGoodsNumber(String assistantGoodsNumber) {
        this.assistantGoodsNumber = assistantGoodsNumber;
    }

    public BigDecimal getAssistantGoodsPrice() {
        return assistantGoodsPrice;
    }

    public void setAssistantGoodsPrice(BigDecimal assistantGoodsPrice) {
        this.assistantGoodsPrice = assistantGoodsPrice;
    }

    public Integer getAssistantGoodsCount() {
        return assistantGoodsCount;
    }

    public void setAssistantGoodsCount(Integer assistantGoodsCount) {
        this.assistantGoodsCount = assistantGoodsCount;
    }
}
