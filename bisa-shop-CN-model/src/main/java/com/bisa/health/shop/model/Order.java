package com.bisa.health.shop.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.bisa.health.entity.bind.CustomDateSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * 订单
 * @author Administrator
 *
 */

@Entity
@Table(name = "s_order")
@org.hibernate.annotations.Proxy(lazy = false)
public class Order implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	/**
	 * 用户id
	 */
	private int user_id;
	/**
	 * 商品编号
	 */
	private String goods_num;
	/**
	 * 商品类型
	 */
	private int goods_type;
	/**
	 * 商品价格
	 */
	private double goods_price;
	/**
	 * 商品数量
	 */
	private int goods_count;
	/**
	 * 订单编号
	 */
	private String order_num;
	/**
	 * 订单总价
	 */
	private double order_total;
	
	/**
	 * 订单实际金额
	 */
	private double order_price;
	/**
	 * 订单状态
	 */
	private int order_status; //0 未支付 1已支付
	/**
	 * 订单地址ID
	 */
	private int address_id;
	
	/**
	 * 订单地址
	 */
	private String order_address;
	
	/**
	 * 订单电话
	 */
	private String order_phone;

	/**
	 * 是否支付
	 */
	private int is_pay; //0未支付 1已支付
	/**
	 * 是否优惠
	 */
	private int is_coupon;
	/**
	 * 优惠号码
	 */
	private String coupon_num;
	/**
	 * 优惠价格
	 */
	private double coupon_price;
	
	/**
	 * 快递单号查询 暂时未用方便以后开发
	 */
	private String ems_num;
	
	private Date c_time;
	
    @Id
    @GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	@Column(length=32)
	public String getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(String goods_num) {
		this.goods_num = goods_num;
	}
	public int getGoods_type() {
		return goods_type;
	}
	public void setGoods_type(int goods_type) {
		this.goods_type = goods_type;
	}
	public double getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(double goods_price) {
		this.goods_price = goods_price;
	}
	public int getGoods_count() {
		return goods_count;
	}
	public void setGoods_count(int goods_count) {
		this.goods_count = goods_count;
	}
	@Column(length=32)
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public double getOrder_total() {
		return order_total;
	}
	public void setOrder_total(double order_total) {
		this.order_total = order_total;
	}
	public int getOrder_status() {
		return order_status;
	}
	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}
	
	
	public int getAddress_id() {
		return address_id;
	}
	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}
	public int getIs_pay() {
		return is_pay;
	}
	public void setIs_pay(int is_pay) {
		this.is_pay = is_pay;
	}
	public int getIs_coupon() {
		return is_coupon;
	}
	public void setIs_coupon(int is_coupon) {
		this.is_coupon = is_coupon;
	}
	@Column(length=32)
	public String getCoupon_num() {
		return coupon_num;
	}
	public void setCoupon_num(String coupon_num) {
		this.coupon_num = coupon_num;
	}
	public double getCoupon_price() {
		return coupon_price;
	}
	public void setCoupon_price(double coupon_price) {
		this.coupon_price = coupon_price;
	}
	
	@Column(length=64)
	public String getEms_num() {
		return ems_num;
	}
	public void setEms_num(String ems_num) {
		this.ems_num = ems_num;
	}
	@JsonSerialize(using = CustomDateSerializer.class)
	@Column(name="c_time",columnDefinition="timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP")
	public Date getC_time() {
		return c_time;
	}
	public void setC_time(Date c_time) {
		this.c_time = c_time;
	}
	
	
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public String getOrder_phone() {
		return order_phone;
	}
	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}
	public double getOrder_price() {
		return order_price;
	}
	public void setOrder_price(double order_price) {
		this.order_price = order_price;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", user_id=" + user_id + ", goods_num=" + goods_num + ", goods_type=" + goods_type
				+ ", goods_price=" + goods_price + ", goods_count=" + goods_count + ", order_num=" + order_num
				+ ", order_total=" + order_total + ", order_price=" + order_price + ", order_status=" + order_status
				+ ", address_id=" + address_id + ", order_address=" + order_address + ", order_phone=" + order_phone
				+ ", is_pay=" + is_pay + ", is_coupon=" + is_coupon + ", coupon_num=" + coupon_num + ", coupon_price="
				+ coupon_price + ", ems_num=" + ems_num + ", c_time=" + c_time + "]";
	}
	
	
	
}
