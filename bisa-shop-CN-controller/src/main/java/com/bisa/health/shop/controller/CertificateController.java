package com.bisa.health.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/***
 * 关于碧沙
 * @author Administrator
 */

@Controller
public class CertificateController {

	/**
	 *心电仪产品证书
	 * @return
	 */
	@RequestMapping(value = "/certificate", method = RequestMethod.GET)
	public String index() {
		return "certificate/certificate";
	}

	/**
	 *正在建设中
	 * @return
	 */
	@RequestMapping(value = "/certificateing", method = RequestMethod.GET)
	public String certificateing() {
		return "other/solution2";
	}
}
