package com.bisa.health.shop.controller;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.client.entity.User;
import com.bisa.health.common.entity.ResultData;
import com.bisa.health.common.utils.PhoneTypeUtil;
import com.bisa.health.shiro.web.bind.CurrentUser;
import com.bisa.health.shop.admin.controller.AdminNewsController;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.entity.SysStatusCode;
import com.bisa.health.shop.enumerate.CouponTypeEnum;
import com.bisa.health.shop.enumerate.GoodsTypeEnum;
import com.bisa.health.shop.enumerate.ONOFFEnum;
import com.bisa.health.shop.model.Address;
import com.bisa.health.shop.model.Goods;
import com.bisa.health.shop.model.GoodsCoupon;
import com.bisa.health.shop.model.News;
import com.bisa.health.shop.model.NewsClassify;
import com.bisa.health.shop.model.NewsInLink;
import com.bisa.health.shop.model.Order;
import com.bisa.health.shop.service.IAddressService;
import com.bisa.health.shop.service.IGoodsCouponService;
import com.bisa.health.shop.service.IGoodsService;
import com.bisa.health.shop.service.INewsClassifyService;
import com.bisa.health.shop.service.INewsService;
import com.bisa.health.shop.service.IOrderService;
import com.bisa.health.shop.service.NewsServiceImpl;
import com.bisa.health.shop.utils.TradeNoUtils;

@Controller
public class PayController {

	@Autowired
	private InternationalizationUtil i18nUtil;

	@Autowired
	private IGoodsService goodService;

	@Autowired
	private IOrderService orderService;

	@Autowired
	private IAddressService addressService;

	@Autowired
	private IGoodsCouponService goodsCouponService;

	private final static Logger log = LogManager.getLogger(AdminNewsController.class);

	@RequestMapping(value = "/call/pay", method = RequestMethod.POST)
	public String index(HttpServletRequest request, Model model, @PathVariable String language,Order order) {
		Goods goods = goodService.loadByNumAndlanguage(order.getGoods_num(), language);
		model.addAttribute("language", language);
		return "order/choosepay";
	}

	
}
