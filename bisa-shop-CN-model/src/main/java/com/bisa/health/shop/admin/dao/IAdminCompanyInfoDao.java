package com.bisa.health.shop.admin.dao;

import com.bisa.health.shop.model.CompanyInfo;

public interface IAdminCompanyInfoDao {

    /**
     * 修改公司信息
     * @param companyInfo
     * @return
     */
    CompanyInfo updateCompanyInfo(CompanyInfo companyInfo);

    /**
     * 查询公司信息
     * @return
     */
    CompanyInfo selectCompanyInfo();
}
