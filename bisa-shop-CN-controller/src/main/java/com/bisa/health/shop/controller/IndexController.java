package com.bisa.health.shop.controller;

import com.bisa.health.shop.model.GoodsImg;
import com.bisa.health.shop.service.IGoodsImgService;
import com.bisa.health.shop.utils.InternationalizationUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Locale;
import java.util.Scanner;

/**
 * 商城首页
 * @author Administrator
 */

@Controller
public class IndexController {

    @Autowired
    private IGoodsImgService goodsImgService;
    

    /**
     * 商城首页   http://localhost:8080/health-shop/index
     * @return
     */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
        public String index(HttpServletRequest request,Model model,Locale locale) {

    	Locale mlocale=(Locale) request.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
    	model.addAttribute("lang",mlocale.toString());
        return "/index";
    }
 

    /**
     *手机版
     */
    @RequestMapping(value = "/m_index", method = RequestMethod.GET)
    public String m_index() {
        return "m/m_index";
    }

    @RequestMapping(value = "/m_product", method = RequestMethod.GET)
    public String m_product() {
        return "m/m_product";
    }

    @RequestMapping(value = "/m_choose_payment", method = RequestMethod.GET)
    public String m_choose_payment() {
        return "m/m_choose_payment";
    }

    @RequestMapping(value = "/m_serviceCard", method = RequestMethod.GET)
    public String m_serviceCard() {
        return "m/m_serviceCard";
    }
}
