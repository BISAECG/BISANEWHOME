package com.bisa.health.shop.admin.service;

import com.bisa.health.shop.admin.dao.IAdminNewsClassifyDao;
import com.bisa.health.shop.model.NewsClassify;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminNewsClassifyServiceImpl implements IAdminNewsClassifyService {
    @Autowired
    private IAdminNewsClassifyDao adminNewsClassifyDao;
    @Override
    public List<NewsClassify> selectNewsClassify() {
        return adminNewsClassifyDao.selectNewsClassify();
    }
}
