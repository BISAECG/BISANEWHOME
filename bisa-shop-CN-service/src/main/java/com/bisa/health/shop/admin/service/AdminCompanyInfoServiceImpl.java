package com.bisa.health.shop.admin.service;

import com.bisa.health.shop.admin.dao.IAdminCompanyInfoDao;
import com.bisa.health.shop.model.CompanyInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

@Service
@CacheConfig(cacheNames = "CompanyInfoServiceImpl")
public class AdminCompanyInfoServiceImpl implements IAdminCompanyInfoService {
    @Autowired
    private IAdminCompanyInfoDao companyInfoDao;
    @Override
    public CompanyInfo updateCompanyInfo(CompanyInfo companyInfo) {
        return companyInfoDao.updateCompanyInfo(companyInfo);
    }

    @Override
    public CompanyInfo selectCompanyInfo() {
        return companyInfoDao.selectCompanyInfo();
    }
}
