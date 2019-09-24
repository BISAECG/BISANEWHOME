package com.bisa.health.shop.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 商品图片model
 */

@Entity
@Table(name = "h_goods_img")
public class GoodsImg implements Serializable {

    private static final long serialVersionUID = 6982202429029890618L;

    private Integer id;
    private String goodsNumber;     //商品编号
    private String imgUrl;          // 商品图片地址
    private Integer position;        //位置
    private Integer internationalization;//国际化 图片

    @Id
    @GeneratedValue
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "goods_number")
    public String getGoodsNumber() {
        return goodsNumber;
    }

    public void setGoodsNumber(String goodsNumber) {
        this.goodsNumber = goodsNumber;
    }

    @Column(name = "img_url")
    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public Integer getPosition() {
        return position;
    }

    public void setPosition(Integer position) {
        this.position = position;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getInternationalization() {
        return internationalization;
    }

    public void setInternationalization(Integer internationalization) {
        this.internationalization = internationalization;
    }

    public GoodsImg() {
    }

    public GoodsImg(Integer id, String goodsNumber, String imgUrl, Integer position, Integer internationalization) {
        this.id = id;
        this.goodsNumber = goodsNumber;
        this.imgUrl = imgUrl;
        this.position = position;
        this.internationalization = internationalization;
    }

    @Override
    public String toString() {
        return "GoodsImg{" +
                "id=" + id +
                ", goodsNumber='" + goodsNumber + '\'' +
                ", imgUrl='" + imgUrl + '\'' +
                ", position=" + position +
                ", internationalization=" + internationalization +
                '}';
    }
}