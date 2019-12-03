package com.bisa.health.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.common.utils.PhoneTypeUtil;
import com.bisa.health.shop.admin.controller.AdminNewsController;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.model.Goods;
import com.bisa.health.shop.model.News;
import com.bisa.health.shop.model.NewsClassify;
import com.bisa.health.shop.model.NewsInLink;
import com.bisa.health.shop.service.IGoodsService;
import com.bisa.health.shop.service.INewsClassifyService;
import com.bisa.health.shop.service.INewsService;
import com.bisa.health.shop.service.IOrderService;
import com.bisa.health.shop.service.NewsServiceImpl;



@Controller
public class OrderController {
	
	@Autowired
	private InternationalizationUtil i18nUtil;
	
	@Autowired
	private IGoodsService goodService;
	
	@Autowired
	private IOrderService orderService;
	
	private final static Logger log = LogManager.getLogger(AdminNewsController.class);
	
    @RequestMapping(value = "/html/{language}/order", method = RequestMethod.POST)
    public String index(HttpServletRequest request,Model model, @PathVariable String language,@RequestParam int goods_id,@RequestParam int goods_count) {
    	Goods goods=goodService.loadById(goods_id);
    	log.info(goods);
    	log.info("goods_id:"+goods_id);
    	log.info("goods_count:"+goods_count);
        return "order/details";
    }
    
}
