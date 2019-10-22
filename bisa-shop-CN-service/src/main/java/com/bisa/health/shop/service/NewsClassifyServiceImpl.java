package com.bisa.health.shop.service;

import com.bisa.health.shop.dao.INewsClassifyDao;
import com.bisa.health.shop.model.NewsClassify;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsClassifyServiceImpl implements INewsClassifyService {
    @Autowired
    private INewsClassifyDao adminNewsClassifyDao;
    @Override
    public List<NewsClassify> selectNewsClassify() {
        return adminNewsClassifyDao.selectNewsClassify();
    }
}
