package com.bisa.health.shop.admin.controller;

import com.bisa.health.shop.admin.dto.OrderListPageDto;
import com.bisa.health.shop.admin.dto.PageJsonDto;
import com.bisa.health.shop.admin.service.IAdminCompanyInfoService;
import com.bisa.health.shop.admin.service.IAdminHtmlInfoService;
import com.bisa.health.shop.admin.util.JsonResult;
import com.bisa.health.shop.component.FreemarkerComponent;
import com.bisa.health.shop.model.CompanyInfo;
import com.bisa.health.shop.model.HtmlInfo;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * bisa管理系统后台   页面生成
 * @author Administrator
 */
@Controller
@RequestMapping(value = "/admin")
@RequiresRoles(value = {"ROLE_ADMIN", "ROLE_CUSTOMER", "ROLE_STORE"}, logical = Logical.OR)
public class AdminHtmlInfoController {

    @Autowired
    private IAdminHtmlInfoService adminHtmlInfoService;
    @Autowired
    private IAdminCompanyInfoService companyInfoService;
    
    @Autowired
    FreemarkerComponent freemarkerComponent;
    
    /**
     * 系统设置
     * @return
     */
    @RequestMapping(value = "/UpPageContent", method = RequestMethod.GET)
    public String UpPageContent(Integer id) {
        return "admin/admin_sys/PageContent";
    }

    /**
     * 查询所有网页信息
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping(value = "/listnav")
    @ResponseBody
    public PageJsonDto<HtmlInfo> listNav(Integer page,Integer limit){
    	   PageJsonDto<HtmlInfo> listPageDto=adminHtmlInfoService.selectHtmlInfoList(page,limit);
        return listPageDto;
    }

    /**
     * 根据id查询网页信息
     * @param id
     * @return
     */
    @RequestMapping(value = "/SelectHtmlInfoById", method = RequestMethod.POST)
    @ResponseBody
    public HtmlInfo SelectHtmlInfoById(Integer id){
        HtmlInfo htmlInfo=adminHtmlInfoService.selectHtmlInfoById(id);
        return htmlInfo;
    }
    /**
     * 根据id删除网页信息
     * @param id
     * @return
     */
    @RequestMapping(value = "/delectHtmlInfoById", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult delectHtmlInfoById(Integer id){
        JsonResult jsonResult = new JsonResult();
        jsonResult.setFlag(adminHtmlInfoService.delectHtmlInfoById(id));
        return jsonResult;
    }
    
    /**
     * 根据id生成网页信息
     * @param id
     * @return
     */
    @RequestMapping(value = "/addHtmlInfoById", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult addHtmlInfoById(Integer id){
        JsonResult jsonResult = new JsonResult();
        HtmlInfo htmlInfo = adminHtmlInfoService.selectHtmlInfoById(id);
        Map<String,Object> root =new HashMap<String,Object>();
        root.put("html_keyWord", htmlInfo.getHtml_keyWord_CN());
        root.put("html_description",htmlInfo.getHtml_description_CN());
        root.put("html_title", htmlInfo.getHtml_title_CN());
        freemarkerComponent.generateBody(root, htmlInfo.getName()+".ftl", htmlInfo.getName()+".html");
        jsonResult.setFlag(true);
        return jsonResult;
    }
    /**
     * 创建首页页面
     * @return
     */
    @RequestMapping(value = "/generateAllHTML", method = RequestMethod.POST)
    @ResponseBody
    public void CreateAllPages(){
        List<HtmlInfo> list = adminHtmlInfoService.selectHtmlInfo();
        Map<String,Object> root=null;
        for(HtmlInfo info : list){
        	 //生成首页
            root =new HashMap<String,Object>();
            root.put("html_keyWord", info.getHtml_keyWord_CN());
            root.put("html_description", info.getHtml_description_CN());
            root.put("html_title", info.getHtml_title_CN());
        	 freemarkerComponent.generateBody(root, info.getName()+".ftl", info.getName()+".html");
        }
       
       
    }
    /**
     * 创建头部页面
     * @return
     */
    @RequestMapping(value = "/generateHeaderHTML", method = RequestMethod.POST)
    @ResponseBody
    public void GenerateHeaderHTML(HttpServletRequest request){
        List<HtmlInfo> list = adminHtmlInfoService.selectHtmlInfo();
        CompanyInfo companyInfo =  companyInfoService.selectCompanyInfo();
        freemarkerComponent.generateTop(list,companyInfo);

    }
    /**
     * 创建尾部页面
     * @return
     */
    @RequestMapping(value = "/generateFooterHTML", method = RequestMethod.POST)
    @ResponseBody
    public void GenerateFooterHTML(){
        CompanyInfo companyInfo =  companyInfoService.selectCompanyInfo();
        freemarkerComponent.generateBottom(companyInfo);
    }

}
