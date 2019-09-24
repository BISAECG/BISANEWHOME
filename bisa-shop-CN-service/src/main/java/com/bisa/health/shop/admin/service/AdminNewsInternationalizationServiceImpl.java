package com.bisa.health.shop.admin.service;

import com.bisa.health.shop.admin.dao.IAdminNewsInternationalizationDao;
import com.bisa.health.shop.model.NewsInternationalization;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@CacheConfig(cacheNames = "NewsInternationalizationServiceImpl")
public class AdminNewsInternationalizationServiceImpl implements IAdminNewsInternationalizationService {

    @Autowired
    private IAdminNewsInternationalizationDao newsInternationalizationDao;


    @Override
    //@CacheEvict(value = "NewsInternationalizationServiceImpl", allEntries = true)
    public NewsInternationalization addNewsInternationalization(NewsInternationalization newsInternationalization) {
       return newsInternationalizationDao.addNewsInternationalization(newsInternationalization);
    }

    @Override
    //@Cacheable(key = "targetClass.name+methodName+#new_id")
    public NewsInternationalization selectNewsInternation(int new_id,int internationalization){
        return newsInternationalizationDao.selectNewsInternation(new_id,internationalization);
    }

    @Override
    @CacheEvict(value = "NewsInternationalizationServiceImpl", allEntries = true)
    public int updateNewsInternationalization(NewsInternationalization newsInternationalization) {
        return newsInternationalizationDao.updateNewsInternationalization(newsInternationalization);
    }

    @Override
    @CacheEvict(value = "NewsInternationalizationServiceImpl", allEntries = true)
    public boolean delNewsInternational(int new_id) {
        return newsInternationalizationDao.delNewsInternational(new_id);
    }

    @Override
    public List<NewsInternationalization> selectAllNewsInternational() {
        return newsInternationalizationDao.selectAllNewsInternational();
    }
}
