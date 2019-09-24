package com.bisa.health.shop.model;



import javax.persistence.*;
import java.io.Serializable;

/**
 * 产品相关实体类
 */
@Entity
@Table(name = "h_product_service")
public class ProductService implements Serializable {
    private int id;
    private  int class_id;//classify表的ID
    private String introduce; //介绍商品的内容
    private int internationalization; //国际化字段
    private String imgurl; //图片地址
    private int good_id;//关联商品表id
    private String goods_number;


    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "class_id")
    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }
    @Column(name = "introduce")
    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }
    @Column(name = "internationalization")
    public int getInternationalization() {
        return internationalization;
    }

    public void setInternationalization(int internationalization) {
        this.internationalization = internationalization;
    }
    @Column(name = "imgurl")
    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }
    @Column(name = "good_id")
    public int getGood_id() {
        return good_id;
    }

    public void setGood_id(int good_id) {
        this.good_id = good_id;
    }
    @Column(name = "goods_number")
    public String getGoods_number() {
        return goods_number;
    }

    public void setGoods_number(String goods_number) {
        this.goods_number = goods_number;
    }

    public ProductService() {
        super();
    }


    public ProductService(int id, int class_id, String introduce, int internationalization, String imgurl, int good_id, String goods_number) {
        this.id = id;
        this.class_id = class_id;
        this.introduce = introduce;
        this.internationalization = internationalization;
        this.imgurl = imgurl;
        this.good_id = good_id;
        this.goods_number = goods_number;
    }

    @Override
    public String toString() {
        return "ProductService{" +
                "id=" + id +
                ", class_id=" + class_id +
                ", introduce='" + introduce + '\'' +
                ", internationalization=" + internationalization +
                ", imgurl='" + imgurl + '\'' +
                ", good_id=" + good_id +
                ", goods_number='" + goods_number + '\'' +
                '}';
    }
}
