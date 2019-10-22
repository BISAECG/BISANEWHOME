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

@Entity
@Table(name = "s_server")
public class AppServer implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String phoneCode;
	private String countryCode;
	private String domain;
	private int status;
	private String time_zone;
	private String en_country;
	private String hk_country;
	private String cn_country;
	private String datserver;
	private String shopserver;
	private String version;
	private Date createTime;
	
	
    @Id
    @GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name = "phone_code")
	public String getPhoneCode() {
		return phoneCode;
	}
	public void setPhoneCode(String phoneCode) {
		this.phoneCode = phoneCode;
	}
	@Column(name = "country_code")
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getTime_zone() {
		return time_zone;
	}
	public void setTime_zone(String time_zone) {
		this.time_zone = time_zone;
	}
	public String getEn_country() {
		return en_country;
	}
	public void setEn_country(String en_country) {
		this.en_country = en_country;
	}
	
	public String getHk_country() {
		return hk_country;
	}
	public void setHk_country(String hk_country) {
		this.hk_country = hk_country;
	}
	public String getCn_country() {
		return cn_country;
	}
	public void setCn_country(String cn_country) {
		this.cn_country = cn_country;
	}
	public String getDatserver() {
		return datserver;
	}
	public void setDatserver(String datserver) {
		this.datserver = datserver;
	}
	public String getShopserver() {
		return shopserver;
	}
	public void setShopserver(String shopserver) {
		this.shopserver = shopserver;
	}
	
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	@JsonSerialize(using = CustomDateSerializer.class)
	@Column(name="create_time",columnDefinition="timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP")
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	
	
	
	
}
