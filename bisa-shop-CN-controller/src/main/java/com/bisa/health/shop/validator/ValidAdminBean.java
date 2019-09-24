package com.bisa.health.shop.validator;



import java.io.Serializable;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import com.bisa.health.shop.contast.HttpMsgConstant;


public class ValidAdminBean {
	
	
	public static class AppUpdateBean implements Serializable{
	
		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;

		@NotBlank(message = HttpMsgConstant.ParamError+"file")
		private String apkurl;

		@NotBlank(message = HttpMsgConstant.ParamError+"version")
		private String version; // 报告编码


		public String getApkurl() {
			return apkurl;
		}

		public void setApkurl(String apkurl) {
			this.apkurl = apkurl;
		}

		public String getVersion() {
			return version;
		}

		public void setVersion(String version) {
			this.version = version;
		}

		@Override
		public String toString() {
			return "AppUpdateBean [apkurl=" + apkurl + ", version=" + version + "]";
		}
		
		
		
	}
	
public static class ServerBean implements Serializable{
		
		
		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
		private Integer id;
		@NotBlank(message=HttpMsgConstant.ParamError+"phoneCode")
		private String phone_code;
		@NotBlank(message=HttpMsgConstant.ParamError+"countryCode")
		private String country_code;
		
		@NotBlank(message=HttpMsgConstant.ParamError+"domain")
		private String domain;

		@NotBlank(message=HttpMsgConstant.ParamError+"time_zone")
		private String time_zone;
		@NotBlank(message=HttpMsgConstant.ParamError+"en_country")
		private String en_country;
		@NotBlank(message=HttpMsgConstant.ParamError+"hk_country")
		private String hk_country;
		@NotBlank(message=HttpMsgConstant.ParamError+"cn_country")
		private String cn_country;
		@NotBlank(message=HttpMsgConstant.ParamError+"datserver")
		private String datserver;
		@NotBlank(message=HttpMsgConstant.ParamError+"shopserver")
		private String shopserver;
		@NotBlank(message=HttpMsgConstant.ParamError+"version")
		private String version;
		
		
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public String getPhone_code() {
			return phone_code;
		}
		public void setPhone_code(String phone_code) {
			this.phone_code = phone_code;
		}
		public String getCountry_code() {
			return country_code;
		}
		public void setCountry_code(String country_code) {
			this.country_code = country_code;
		}
		public String getDomain() {
			return domain;
		}
		public void setDomain(String domain) {
			this.domain = domain;
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
		@Override
		public String toString() {
			return "ServerBean [id=" + id + ", phone_code=" + phone_code + ", country_code=" + country_code
					+ ", domain=" + domain + ", time_zone=" + time_zone + ", en_country=" + en_country + ", hk_country="
					+ hk_country + ", cn_country=" + cn_country + ", datserver=" + datserver + ", shopserver="
					+ shopserver + ", version=" + version + "]";
		}
		
		
		
		
	}
}
