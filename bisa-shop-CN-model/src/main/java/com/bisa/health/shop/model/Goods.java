package com.bisa.health.shop.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;

import com.bisa.health.entity.bind.CustomDateSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * 商品表
 * @author Administrator
 *
 */
@Entity
@Table(name = "s_goods")
public class Goods implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 自增ID
	 */
	private int id;
	/**
	 * 商品ID
	 */
	private String number;
	/**
	 * 商品名字
	 */
	private String name;
	/**
	 * 商品描述
	 */
	private String desc;
	/**
	 * 商品类型
	 */
	private int type;
	/**
	 * 商品价格
	 */
	private int price;
	/**
	 * 语言版本
	 */
	private String lang;
	/**
	 * 商品详情ID
	 */
	private int detail_id;
	/**
	 * 商品分类ID
	 */
	private int category_id;
	/**
	 * 商品详情名字
	 */
	private String category_name;
	/**
	 * 创建时间
	 */
	private Date c_time;
	
    @Id
    @GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(length=32)
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	@Column(length=50)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Column(length=16)
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	public int getDetail_id() {
		return detail_id;
	}
	public void setDetail_id(int detail_id) {
		this.detail_id = detail_id;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	
	@Column(length=50)
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	
	@JsonSerialize(using = CustomDateSerializer.class)
	@Column(name="c_time",columnDefinition="timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP")
	public Date getC_time() {
		return c_time;
	}
	public void setC_time(Date c_time) {
		this.c_time = c_time;
	}
	@Override
	public String toString() {
		return "Goods [id=" + id + ", number=" + number + ", name=" + name + ", desc=" + desc + ", type=" + type
				+ ", price=" + price + ", lang=" + lang + ", detail_id=" + detail_id + ", category_id=" + category_id
				+ ", category_name=" + category_name + ", c_time=" + c_time + "]";
	}
	
	
	
}
