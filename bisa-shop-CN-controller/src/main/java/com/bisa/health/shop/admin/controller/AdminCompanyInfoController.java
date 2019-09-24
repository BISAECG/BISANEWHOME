package com.bisa.health.shop.admin.controller;

import com.bisa.health.shop.admin.service.IAdminCompanyInfoService;
import com.bisa.health.shop.model.CompanyInfo;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

@Controller
@RequestMapping(value = "/admin")
@RequiresRoles(value = {"ROLE_ADMIN", "ROLE_CUSTOMER", "ROLE_STORE"}, logical = Logical.OR)
public class AdminCompanyInfoController {
    @Autowired
    private IAdminCompanyInfoService companyInfoService;

    /**
     * 修改公司显示信息
     * @param companyInfo
     * @return
     */
    @RequestMapping(value = "/UpCompanyInfo", method = RequestMethod.POST)
    @ResponseBody
    public CompanyInfo UpCompanyInfo(@RequestBody CompanyInfo companyInfo){
        companyInfo.setUpdate_time(new Date());
        companyInfo = companyInfoService.updateCompanyInfo(companyInfo);
        return companyInfo;
    }
    @RequestMapping(value = "/SelectCompanyInfo", method = RequestMethod.POST)
    @ResponseBody
    public CompanyInfo SelectCompanyInfo(){
        CompanyInfo  companyInfo = companyInfoService.selectCompanyInfo();
        return companyInfo;
    }
}
