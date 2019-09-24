package com.bisa.health.shop.admin.controller;

import com.bisa.fastdfs.FastDFSClient;
import com.bisa.health.client.remote.RemoteInterface;
import com.bisa.health.shop.admin.dto.SelectBean;
import com.bisa.health.shop.admin.model.AppServer;
import com.bisa.health.shop.admin.model.AppUpdate;
import com.bisa.health.shop.admin.service.IAdminAppServerService;
import com.bisa.health.shop.admin.service.IAdminAppUpdateService;
import com.bisa.health.shop.admin.service.IAdminGoodsImgService;
import com.bisa.health.shop.admin.service.IAdminHtmlInfoService;
import com.bisa.health.shop.admin.util.JsonResult;
import com.bisa.health.shop.enumerate.IndexImgEnum;
import com.bisa.health.shop.enumerate.InternationalizationEnum;
import com.bisa.health.shop.model.GoodsImg;
import com.bisa.health.shop.model.HtmlInfo;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * bisa管理系统后台   主页
 * @author Administrator
 */

@Controller
@RequestMapping(value = "/admin")
@RequiresRoles(value = {"ROLE_ADMIN", "ROLE_CUSTOMER", "ROLE_STORE"}, logical = Logical.OR)
public class AdminIndexController {

    @Autowired
    private IAdminGoodsImgService goodsImgService;
    
    @Autowired
    private IAdminAppUpdateService appUpdateService;

    @Autowired
    private RemoteInterface remoteService;
    
    @Autowired
    private IAdminAppServerService serverUpdateService;
    
    @Autowired
    private IAdminHtmlInfoService adminHtmlInfoService;

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
    /**
     * 加载首页的图片
     * @param lang 语言版本
     * @return
     */
    @RequestMapping(value = "/indexImgs")
    @ResponseBody
    public List<GoodsImg> getIndexImgs(Integer lang) {
        List<GoodsImg> indexImgs = goodsImgService.getIndexImgsByLang(String.valueOf(IndexImgEnum.index_img.getValue()), lang);
        return indexImgs;
    }

    /**
     * 获取还没有国际化图片的版本
     */
    @RequestMapping(value = "/selectLanguage")
    @ResponseBody
    public List<SelectBean> addIndexImg() {

        List<SelectBean> list = new ArrayList<>();
        SelectBean bean;

        //下拉框用的国际化数据
        for (InternationalizationEnum e : InternationalizationEnum.values()) {
            bean = new SelectBean();
            bean.setKey(e.getValue());
            bean.setValue(e.getMsg());
            bean.setFlag(true);
            list.add(bean);
        }
        return list;
    }

    /**
     * 上传首页图片 (单张上传)
     * @param file                 接收图片的对象
     * @param internationalization 国际化语言
     * @param position             图片的位置
     */
    @RequestMapping(value = "/uploadIndexImg", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult uploadIndexImg( MultipartFile file,Integer internationalization, Integer position) {

        JsonResult jsonResult = null;

        //后台判断一下这个值，前台判断不了
        if (internationalization == null) {
            return new JsonResult("300", false, "语言版本为null，不符合要求");
        }

        String filename = UUID.randomUUID().toString() + ".jpg";
        try {
            // 上传图片到服务器返回一个图片的地址
            String url = fastDFSClient.uploadFile(filename,file.getBytes());
            //String url = FastDFSKit.getInstance().uploadPicToFastDFS(file.getBytes(), filename);
            // 上传图片的时候,根据语言和位置 去判断下远程有没有图片
            GoodsImg goodImg = goodsImgService.getImgByPosition(String.valueOf(IndexImgEnum.index_img.getValue()), position, internationalization);

            if (goodImg == null) {
                goodsImgService.addGoodsImg(new GoodsImg(null, String.valueOf(IndexImgEnum.index_img.getValue()), url, position, internationalization));
            } else {
                goodsImgService.updateGoodsImg(url, String.valueOf(IndexImgEnum.index_img.getValue()), position, internationalization);
               // FastDFSKit.getInstance().deleteFromFastDfs(goodImg.getImgUrl());
                fastDFSClient.delete_file(goodImg.getImgUrl());
            }
            jsonResult = new JsonResult("200", true);
        } catch (Exception e) {
            e.printStackTrace();
            jsonResult = new JsonResult("500", false, "添加图片错误");
        }
        return jsonResult;
    }

}
