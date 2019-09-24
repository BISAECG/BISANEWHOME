package com.bisa.health.shop.model;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 订单细节model
 * @author Administrator
 */

@Entity
@Table(name = "h_order_goods")
public class OrderGoods implements Serializable {

    private static final long serialVersionUID = 4394092941703621156L;

    private Integer id;
    private Integer orderId;        //订单id
    private String goodsNumber;  //商品编号

    private Integer count;             //购买的商品数量
    private BigDecimal goodsPrice;         //(下单时间的价格，不会根据变价而改动)单价  1000
    private BigDecimal discountPrice; //(下单时间的价格，不会根据变价而改动)优惠价格  800

    private Integer goodsType;  //商品类型（单品/套餐）
    private String goodsName; //商品名称
    private String imgUrl;  //商品图片

    @Id
    @GeneratedValue
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "order_id")
    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    @Column(name = "goods_number")
    public String getGoodsNumber() {
        return goodsNumber;
    }

    public void setGoodsNumber(String goodsNumber) {
        this.goodsNumber = goodsNumber;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Column(name = "goods_price")
    public BigDecimal getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(BigDecimal goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    @Column(name = "discount_price")
    public BigDecimal getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(BigDecimal discountPrice) {
        this.discountPrice = discountPrice;
    }

    @Column(name = "goods_type")
    public Integer getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(Integer goodsType) {
        this.goodsType = goodsType;
    }

    @Column(name = "goods_name")
    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    @Column(name = "img_url")
    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public OrderGoods() {
        super();
    }

    public OrderGoods(Integer id, Integer orderId, String goodsNumber, String goodsName, String imgUrl, Integer count,
                      BigDecimal goodsPrice, BigDecimal discountPrice, Integer goodsType) {
        super();
        this.id = id;
        this.orderId = orderId;
        this.goodsNumber = goodsNumber;
        this.goodsName = goodsName;
        this.imgUrl = imgUrl;
        this.count = count;
        this.goodsPrice = goodsPrice;
        this.discountPrice = discountPrice;
        this.goodsType = goodsType;
    }

    @Override
    public String toString() {
        return "OrderGoods [id=" + id + ", orderId=" + orderId + ", goodsNumber=" + goodsNumber + ", goodsName="
                + goodsName + ", imgUrl=" + imgUrl + ", count=" + count + ", goodsPrice=" + goodsPrice
                + ", discountPrice=" + discountPrice + ", goodsType=" + goodsType + "]";
    }


}