package com.bisa.health.shop.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 商品推荐
 * @author Administrator
 *
 */

@Entity
@Table(name = "s_recommend")
public class GoodsRecommend implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	/**
	 * 商品ID
	 */
	private int goods_id;
	/**
	 * 商品编号
	 */
	private String goods_num;
	
    @Id
    @GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	
	@Column(length=32)
	public String getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(String goods_num) {
		this.goods_num = goods_num;
	}
	@Override
	public String toString() {
		return "GoodsRecommend [id=" + id + ", goods_id=" + goods_id + ", goods_num=" + goods_num + "]";
	}
	
	
}
