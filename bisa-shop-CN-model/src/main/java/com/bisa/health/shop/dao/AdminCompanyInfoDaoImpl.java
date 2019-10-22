package com.bisa.health.shop.dao;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.shop.model.CompanyInfo;
import com.bisa.health.shop.model.HtmlInfo;
import org.springframework.stereotype.Repository;

@Repository
public class AdminCompanyInfoDaoImpl extends BaseDao<CompanyInfo> implements ICompanyInfoDao {
    @Override
    public CompanyInfo updateCompanyInfo(CompanyInfo companyInfo) {
        String sql = "UPDATE s_company_info SET company_address_CN=?,company_address_HK=?,company_address_US=?,company_domain=?, " +
                "company_logo_url=?,company_phone=?,company_name_CN=?,company_name_HK=?,company_name_US=?,update_time=? where id=1 ";
        int result = super.updateBySql(sql, new Object[]{companyInfo.getCompany_address_CN(),companyInfo.getCompany_address_HK(),companyInfo.getCompany_address_US(),companyInfo.getCompany_domain(),
                companyInfo.getCompany_logo_url(),companyInfo.getCompany_phone(),companyInfo.getCompany_name_CN(),companyInfo.getCompany_name_HK(),companyInfo.getCompany_name_US(),companyInfo.getUpdate_time()});
        return result >= 1 ? companyInfo : null;
    }

    @Override
    public CompanyInfo selectCompanyInfo() {
        String sql = "select * FROM s_company_info";
        return super.queryObjectBySql(sql, null, CompanyInfo.class, true);
    }
}
