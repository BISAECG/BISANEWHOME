package com.bisa.health.shop.admin.dto;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 打印 订单集合的对象 下面的商品明细
 * @author Administrator
 */
public class PrintOrderGoodsListDto implements Serializable {

    private String product_name;// 商品的名称
    private String ascription_guid;// 商品的编号
    private Integer count;// 购买的数量
    private BigDecimal price;// 单项实际支付价价格
    private BigDecimal goods_price;// 商品单价
    private BigDecimal discount_price;// 商品优惠后单价

    public BigDecimal getGoods_price() {
        return goods_price;
    }

    public void setGoods_price(BigDecimal goods_price) {
        this.goods_price = goods_price;
    }

    public BigDecimal getDiscount_price() {
        return discount_price;
    }

    public void setDiscount_price(BigDecimal discount_price) {
        this.discount_price = discount_price;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getAscription_guid() {
        return ascription_guid;
    }

    public void setAscription_guid(String ascription_guid) {
        this.ascription_guid = ascription_guid;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

}
