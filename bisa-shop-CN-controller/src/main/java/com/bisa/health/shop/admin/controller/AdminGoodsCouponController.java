package com.bisa.health.shop.admin.controller;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.client.entity.User;
import com.bisa.health.common.app.service.ISmsService;
import com.bisa.health.common.email.utils.SendMailUtils;
import com.bisa.health.common.entity.ResultData;
import com.bisa.health.common.utils.RandomUtils;
import com.bisa.health.shiro.web.bind.CurrentUser;
import com.bisa.health.shop.admin.util.JsonResult;
import com.bisa.health.shop.component.FreemarkerComponent;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.component.MqttComponent;
import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.entity.SysStatusCode;
import com.bisa.health.shop.enumerate.ActivateEnum;
import com.bisa.health.shop.enumerate.CouponTypeEnum;
import com.bisa.health.shop.enumerate.LangEnum;
import com.bisa.health.shop.model.CompanyInfo;
import com.bisa.health.shop.model.HtmlInfo;
import com.bisa.health.shop.model.GoodsCoupon;
import com.bisa.health.shop.service.ICompanyInfoService;
import com.bisa.health.shop.service.IGoodsCouponService;
import com.bisa.health.shop.service.IHtmlInfoService;
import com.bisa.health.shop.service.IGoodsCouponService;
import com.bisa.health.shop.service.IGoodsCouponService;
import com.bisa.health.shop.utils.TradeNoUtils;

import org.apache.commons.httpclient.util.LangUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 优惠券管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "/admin/coupon")
@RequiresRoles(value = {"ROLE_ADMIN", "ROLE_CUSTOMER", "ROLE_STORE"}, logical = Logical.OR)
public class AdminGoodsCouponController {
	

	private final static Logger log = LogManager.getLogger(MqttComponent.class);
	
	@Autowired
	private IGoodsCouponService goodsCouponService;
	
	
	@Autowired
	private InternationalizationUtil i18nUtil;
	
	 
    /**
     * 进去 bisa 新闻列表 页面
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list() {
        return "admin/card/coupon";
    }
    
    
	@RequestMapping(value = "/ajax/load", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> loadAjaxGoods(@RequestParam(required = true) int id) {
		GoodsCoupon mGoodsCoupon = goodsCouponService.getGoodsCouponById(id);
		if (mGoodsCoupon != null) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess), mGoodsCoupon),
					HttpStatus.OK);
		}
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail), mGoodsCoupon), HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/del/{mId}", method = RequestMethod.DELETE, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> delAjaxGoods(@PathVariable int mId) {
		goodsCouponService.deleteGoodsCoupon(mId);
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/add", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> addAjaxGoods(@CurrentUser  User user ,@Validated GoodsCoupon goodsCoupon, BindingResult br, Model model) {
		if (br.hasErrors()) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.RequestFormat)), HttpStatus.OK);
		}
		if (goodsCoupon.getId() == 0){
			for(int i=0;i<goodsCoupon.getVersion();i++){
				GoodsCoupon mGoodsCoupon=new GoodsCoupon();
				mGoodsCoupon.setCoupon_num(""+RandomUtils.RandomOfDaterRandom(8));
				mGoodsCoupon.setCoupon_status(ActivateEnum.ACTIVATE.getValue());
				mGoodsCoupon.setCoupon_disprice(goodsCoupon.getCoupon_disprice());
				mGoodsCoupon.setCoupon_disrate(goodsCoupon.getCoupon_disrate());
				mGoodsCoupon.setCoupon_total(goodsCoupon.getCoupon_total());
				mGoodsCoupon.setCoupon_type(goodsCoupon.getCoupon_type());
				goodsCouponService.addGoodsCoupon(mGoodsCoupon);
			}
		}
		log.info(user.getUsername()+" add "+goodsCoupon);
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Pager<GoodsCoupon>> lsitAjaxGoods(@RequestParam(required=false) String vKey,@RequestParam(required=false) String vVal) {
		Pager<GoodsCoupon> list = goodsCouponService.getPageGoodsCoupon(SystemContext.getPageOffset(),vKey, vVal);
		return new ResponseEntity<Pager<GoodsCoupon>>(list, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/ajax/number", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> ajaxNumber() {
		Long number=RandomUtils.RandomOfDateTimeToInt();
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess),number), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/ajax/disable", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> updateDisable(@RequestParam(required = true) int id,@RequestParam(required = true)  int status) {
		
		GoodsCoupon mGoodsCoupon = goodsCouponService.getGoodsCouponById(id);
		if (mGoodsCoupon == null) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail), mGoodsCoupon),
					HttpStatus.OK);
		}
		
		if(status==ActivateEnum.INACTIVATED.getValue()&&status!=mGoodsCoupon.getCoupon_status()){
			mGoodsCoupon.setCoupon_status(status);
			mGoodsCoupon.setVersion(mGoodsCoupon.getVersion()+1);
			goodsCouponService.updateGoodsCoupon(mGoodsCoupon);
			
		}
		
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess), mGoodsCoupon), HttpStatus.OK);
	}

}
