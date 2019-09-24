package com.bisa.health.shop.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 商品套餐中间表
 * @author Administrator
 */

@Entity
@Table(name = "h_goods_combo")
public class GoodsCombo implements Serializable {

    private Integer id;
    private String goodsNumber; // 商品编号
    private String comboGuid; // 套餐guid(uuid)

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

    @Column(name = "combo_guid")
    public String getComboGuid() {
        return comboGuid;
    }

    public void setComboGuid(String comboGuid) {
        this.comboGuid = comboGuid;
    }

    public GoodsCombo() {
        super();
    }

    public GoodsCombo(Integer id, String goodsNumber, String comboGuid) {
        super();
        this.id = id;
        this.goodsNumber = goodsNumber;
        this.comboGuid = comboGuid;
    }

    @Override
    public String toString() {
        return "GoodsCombo [id=" + id + ", goodsNumber=" + goodsNumber + ", comboGuid=" + comboGuid + "]";
    }

}
