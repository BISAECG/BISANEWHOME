package com.bisa.health.shop.admin.controller;

import com.bisa.fastdfs.FastDFSClient;
import com.bisa.health.client.remote.RemoteInterface;
import com.bisa.health.shop.admin.util.JsonResult;
import com.bisa.health.shop.enumerate.IndexImgEnum;
import com.bisa.health.shop.enumerate.InternationalizationEnum;
import com.bisa.health.shop.model.AppServer;
import com.bisa.health.shop.model.AppUpdate;
import com.bisa.health.shop.model.HtmlInfo;
import com.bisa.health.shop.service.IAppServerService;
import com.bisa.health.shop.service.IAppUpdateService;
import com.bisa.health.shop.service.IHtmlInfoService;
import com.bisa.health.shop.validator.ValidAdminBean;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.Date;

/**
 * bisa管理系统后台   主页
 * @author Administrator
 */

@Controller
@RequestMapping(value = "/admin")
@RequiresRoles(value = {"ROLE_ADMIN", "ROLE_CUSTOMER", "ROLE_STORE"}, logical = Logical.OR)
public class AdminIndexController {

    
    @Autowired
    private IAppUpdateService appUpdateService;

    @Autowired
    private RemoteInterface remoteService;
    
    @Autowired
    private IAppServerService serverUpdateService;
    
    @Autowired
    private IHtmlInfoService adminHtmlInfoService;

    @Autowired
    private FastDFSClient fastDFSClient;
    
    private static Logger logger = LogManager.getFormatterLogger(AdminIndexController.class);

	 String appname = "Bishealth-release_";
    /**
     * 进去 bisa 后台管理系统的主页
     */
    @RequestMapping(value = "/index")
    public String index() {
        return "admin/index";
    }
    
    /**
     * 进去 bisa 后台管理系统的主页
     */
    @RequestMapping(value = "/main")
    public String home() {
        return "admin/admin_sys/main";
    }
    /**
     * 系统设置
     * @return
     */
    @RequestMapping(value = "/config", method = RequestMethod.GET)
    public String sysConfig() {

        return "admin/admin_sys/config";
    }
   

    /**
     * 页面跳转设置
     * @return
     */
    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String pageProfile() {

        return "admin/admin_sys/profile";
    }
    
    @RequestMapping(value = "/profile", method = RequestMethod.POST)
    public String pageProfile(Model model,@Validated HtmlInfo htmlInfo,BindingResult bindingResult) {
    	
    	System.out.println(htmlInfo);
    	if (bindingResult.hasErrors()) {
    		logger.error(bindingResult.getFieldError().toString());
    		model.addAttribute("ex", bindingResult.getFieldError().toString());
		}
    	HtmlInfo mHtmlInfo=adminHtmlInfoService.selectHtmlInfoById(htmlInfo.getId());
    	if(mHtmlInfo==null){
    		htmlInfo.setUpdate_time(new Date());
    	  	adminHtmlInfoService.addHtmlInfo(htmlInfo);
    	}else{
    		mHtmlInfo.toHtmlInfo(htmlInfo);
    	  	adminHtmlInfoService.updateHtmlInfo(mHtmlInfo);
    	}
        return "admin/admin_sys/profile";
    }
    
    /**
     * APP更新管理
     * @return
     */
    @RequestMapping(value = "/system", method = RequestMethod.GET)
    public String updateManagement() {
    	
        return "admin/admin_sys/app";
    }
    
    /**
     * APP更新管理
     * @return
     */
    @RequestMapping(value = "/uploadapp", method = RequestMethod.POST)
    public String updateManagementApp(@Validated ValidAdminBean.AppUpdateBean appBean,BindingResult br) {
    	
    	if(!br.hasErrors()){
    		if(!StringUtils.isEmpty(appBean.getApkurl())){
    			AppUpdate appUpdate=appUpdateService.loadByVersion(appBean.getVersion());
    			if(appUpdate==null){
    				 appUpdate=new AppUpdate();
    				appUpdate.setAppUrl(appBean.getApkurl());
        			appUpdate.setFileName(appname+appBean.getVersion()+".apk");
        			appUpdate.setVersion(appBean.getVersion());
        			appUpdate.setStatus(1);
        			AppUpdate mAppUpdate=appUpdateService.saveAppUpdate(appUpdate);
        			appUpdateService.updateStatus(mAppUpdate.getId());
    			}
    			
    			
    		}
    	}
        return "redirect:/admin/system";
    }
    
    /**
     * Server更新管理
     * @return
     */
    @RequestMapping(value = "/uploadserver", method = RequestMethod.POST)
    public String updateManagementServer(@Validated ValidAdminBean.ServerBean serverBean,BindingResult br) {
    	
    	if(!br.hasErrors()){
    		
    		if(serverBean.getId()!=null){
    			AppServer appServer=serverUpdateService.loadByID(serverBean.getId());
    			appServer.setVersion(serverBean.getVersion());
        		appServer.setCn_country(serverBean.getCn_country());
        		appServer.setCountryCode(serverBean.getCountry_code());
        		appServer.setShopserver(serverBean.getShopserver());
        		appServer.setDatserver(serverBean.getDatserver());
        		appServer.setDomain(serverBean.getDomain());
        		appServer.setEn_country(serverBean.getEn_country());
        		appServer.setHk_country(serverBean.getHk_country());
        		appServer.setPhoneCode(serverBean.getPhone_code());
        		appServer.setTime_zone(serverBean.getTime_zone());
        		appServer.setStatus(1);
        		serverUpdateService.updateAppServer(appServer);
    		}else{
    			AppServer appServer=new AppServer();
    			appServer.setVersion(serverBean.getVersion());
        		appServer.setCn_country(serverBean.getCn_country());
        		appServer.setCountryCode(serverBean.getCountry_code());
        		appServer.setShopserver(serverBean.getShopserver());
        		appServer.setDatserver(serverBean.getDatserver());
        		appServer.setDomain(serverBean.getDomain());
        		appServer.setEn_country(serverBean.getEn_country());
        		appServer.setHk_country(serverBean.getHk_country());
        		appServer.setPhoneCode(serverBean.getPhone_code());
        		appServer.setTime_zone(serverBean.getTime_zone());
        		appServer.setStatus(1);
        		serverUpdateService.saveAppServer(appServer);
        		serverUpdateService.updateStatus(serverBean.getVersion());
    		}
    		
    		
    	}
        return "redirect:/admin/system";
    }
  
   

}
