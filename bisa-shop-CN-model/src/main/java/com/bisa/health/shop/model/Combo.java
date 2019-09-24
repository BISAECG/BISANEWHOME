package com.bisa.health.shop.model;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 套餐表
 * @author Administrator
 */

@Entity
@Table(name = "h_combo")
public class Combo implements Serializable {

    private static final long serialVersionUID = -6928121695837409247L;

    private Integer id;
    private String comboGuid; // 套餐guid（可重复，确认同套餐）
    private Integer classifyId; // 商品分类编号
    private String goodsNumber; // 商品编号
    private Integer count; // 套餐内单品数量
    private String goodsName; // 商品名字
    private BigDecimal goodsPrice; // 单价 1000
    private BigDecimal discountPrice; // 优惠价格 800

    private String imgUrl; // 主图

    private Integer needPost; // 0-不需要邮递；1-需要邮递

    @Id
    @GeneratedValue
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "combo_guid")
    public String getComboGuid() {
        return comboGuid;
    }

    public void setComboGuid(String comboGuid) {
        this.comboGuid = comboGuid;
    }

    @Column(name = "classify_id")
    public Integer getClassifyId() {
        return classifyId;
    }

    public void setClassifyId(Integer classifyId) {
        this.classifyId = classifyId;
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

    @Column(name = "goods_name")
    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
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

    @Column(name = "img_url")
    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    @Column(name = "need_post")
    public Integer getNeedPost() {
        return needPost;
    }

    public void setNeedPost(Integer needPost) {
        this.needPost = needPost;
    }

    public Combo() {
        super();
    }

    public Combo(Integer id, String comboGuid, Integer classifyId, String goodsNumber, Integer count, String goodsName,
                 BigDecimal goodsPrice, BigDecimal discountPrice, String imgUrl, Integer needPost) {
        super();
        this.id = id;
        this.comboGuid = comboGuid;
        this.classifyId = classifyId;
        this.goodsNumber = goodsNumber;
        this.count = count;
        this.goodsName = goodsName;
        this.goodsPrice = goodsPrice;
        this.discountPrice = discountPrice;
        this.imgUrl = imgUrl;
        this.needPost = needPost;
    }

    @Override
    public String toString() {
        return "Combo [id=" + id + ", comboGuid=" + comboGuid + ", classifyId=" + classifyId + ", goodsNumber="
                + goodsNumber + ", count=" + count + ", goodsName=" + goodsName + ", goodsPrice=" + goodsPrice
                + ", discountPrice=" + discountPrice + ", imgUrl=" + imgUrl + ", needPost=" + needPost + "]";
    }

}