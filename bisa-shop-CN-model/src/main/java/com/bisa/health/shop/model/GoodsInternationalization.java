package com.bisa.health.shop.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * 商品国际化  语言 model
 */

@Entity
@Table(name = "h_goods_internationalization")
public class GoodsInternationalization implements Serializable {

    private static final long serialVersionUID = -4256398755051915154L;

    private Integer id;
    private Integer goods_id;//商品表的id
    private Integer internationalization;//国际化语言 类型

    private String goods_number;       //商品的编号
    private String img_url;            //商品的图片(这里的是图片的主图)
    private String goods_name;         //商品名字
    private String title;              //商品大标题
    private String description;        //商品描述

    @Id
    @GeneratedValue
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(Integer goods_id) {
        this.goods_id = goods_id;
    }

    public Integer getInternationalization() {
        return internationalization;
    }

    public void setInternationalization(Integer internationalization) {
        this.internationalization = internationalization;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getGoods_number() {
        return goods_number;
    }

    public void setGoods_number(String goods_number) {
        this.goods_number = goods_number;
    }

    @Override
    public String toString() {
        return "GoodsInternationalization{" +
                "id=" + id +
                ", goods_id=" + goods_id +
                ", internationalization=" + internationalization +
                ", goods_number='" + goods_number + '\'' +
                ", img_url='" + img_url + '\'' +
                ", goods_name='" + goods_name + '\'' +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}