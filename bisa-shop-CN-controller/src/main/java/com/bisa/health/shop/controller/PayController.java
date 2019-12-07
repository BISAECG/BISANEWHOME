package com.bisa.health.shop.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bisa.health.shop.admin.controller.AdminNewsController;
import com.bisa.health.shop.component.EasylinkPayComponnent;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.component.VisaPayComponent;
import com.bisa.health.shop.entity.PayResponse;
import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.entity.WebException;
import com.bisa.health.shop.enumerate.PayEnum;
import com.bisa.health.shop.enumerate.PayTypeEnum;
import com.bisa.health.shop.model.Order;
import com.bisa.health.shop.service.IGoodsService;
import com.bisa.health.shop.service.IOrderService;

@Controller
public class PayController {

	@Autowired
	private InternationalizationUtil i18nUtil;

	@Autowired
	private IGoodsService goodService;

	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private EasylinkPayComponnent easyLink; 
	
	@Autowired
	private VisaPayComponent visaPay; 


	private final static Logger log = LogManager.getLogger(AdminNewsController.class);

	@RequestMapping(value = "html/{language}/pay", method = RequestMethod.GET)
	public String index(Model model, @PathVariable String language, @RequestParam String orderNum,
			@RequestParam long timestamp) {

		Order order = orderService.getOrderByNum(orderNum);
		model.addAttribute("language", language);
		model.addAttribute("orderNum", orderNum);
		model.addAttribute("timestamp", timestamp);
		return "order/choosepay";
	}

	@RequestMapping(value = "html/{language}/pay", method = RequestMethod.POST)
	public void index(HttpServletRequest request,HttpServletResponse response, Model model, @PathVariable String language,
			@RequestParam String orderNum, @RequestParam long timestamp,@RequestParam int payType) {
		Order order = orderService.getOrderByNum(orderNum);
		if(order==null||order.getIs_pay()==PayEnum.PAY.getValue()){
			throw new WebException("订单不存在或订单已经支付");
		}
		if(payType==PayTypeEnum.EASY.getValue()){
			PayResponse payResponse=easyLink.easylickPay(request, order);
			try {
				easyLink.autoBuildPost(request, response, payResponse);
			} catch (IOException e) {
				e.printStackTrace();
				log.info(e.getMessage()+"["+order.getOrder_num()+"]");
				throw new WebException(SysErrorCode.PayError);
			}
		}
		
	}
	
    /**
     * 银联支付成功后的同步方法
     */
    @RequestMapping(value = "/user/easylinkPay/return_url", method = RequestMethod.POST)
    @ResponseBody
    public void easylinkCall(Model model, HttpServletRequest request) {
    	
    	Map<String, String[]> paramMap = request.getParameterMap();
        HashMap<String, String> signMap = new HashMap<String, String>();
        for (String key : paramMap.keySet()) {
            String[] value = paramMap.get(key);
            signMap.put(key, value[0]);
        }
    	
           String payment_id = easyLink.payCompleted(request);
           
         
    }

    /**
     * VISA同步回调
     */
    @RequestMapping(value = "/user/ebcPay/return_url", method = RequestMethod.POST)
    @ResponseBody
    public void cbcCall(Model model, HttpServletRequest request) {
    	String out_trade_no = request.getParameter("req_reference_number");
    	String orderNo=visaPay.verifyVisaSign(request);
    	if(orderNo==null){
    		model.addAttribute("order_no", out_trade_no);
       	   // return "order/fail";
        }
    	log.info("visa-orderNo："+orderNo);
    	model.addAttribute("order_no",out_trade_no);
       //return "order/sync_success";
    }
	
	

}
