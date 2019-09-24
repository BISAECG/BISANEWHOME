package com.bisa.health.shop.dto;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 用于存储国际化商品信息
 */

public class InternationalizationGoodsDto implements Serializable {

    private  String title;  // 国际化商品标题
    private  String imgUrl;// 国际化商品图片路径
    private  String goodsName;// 国际化商品姓名
    private String description;// 国际化商品描述
    private BigDecimal goodsPrice;  //单价
    private String goodsNumber;//商品编号(uuid)
    private Integer parentId;  //商品父类id
    private Integer needPost;        //0-不需要邮递；1-需要邮递
    private Integer storeNumber;   //商品库存数量
    private Integer classifyId;    //商品分类编号

    public Integer getClassifyId() {
        return classifyId;
    }

    public void setClassifyId(Integer classifyId) {
        this.classifyId = classifyId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(BigDecimal goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public String getGoodsNumber() {
        return goodsNumber;
    }

    public void setGoodsNumber(String goodsNumber) {
        this.goodsNumber = goodsNumber;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getNeedPost() {
        return needPost;
    }

    public void setNeedPost(Integer needPost) {
        this.needPost = needPost;
    }

    public Integer getStoreNumber() {
        return storeNumber;
    }

    public void setStoreNumber(Integer storeNumber) {
        this.storeNumber = storeNumber;
    }

    @Override
    public String toString() {
        return "InternationalizationGoodsDto{" +
                "title='" + title + '\'' +
                ", imgUrl='" + imgUrl + '\'' +
                ", goodsName='" + goodsName + '\'' +
                ", description='" + description + '\'' +
                ", goodsPrice=" + goodsPrice +
                ", goodsNumber='" + goodsNumber + '\'' +
                ", parentId=" + parentId +
                ", needPost=" + needPost +
                ", storeNumber=" + storeNumber +
                ", classifyId=" + classifyId +
                '}';
    }
}
