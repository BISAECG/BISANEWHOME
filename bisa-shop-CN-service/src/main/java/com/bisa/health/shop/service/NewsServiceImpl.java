package com.bisa.health.shop.service;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.shop.admin.dao.IAdminNewsDao;
import com.bisa.health.shop.dao.INewsDao;
import com.bisa.health.shop.enumerate.InternationalizationEnum;
import com.bisa.health.shop.model.News;
import com.bisa.health.shop.service.INewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@CacheConfig(cacheNames = "NewsServiceImpl")
public class NewsServiceImpl implements INewsService {

    @Autowired
    private INewsDao iNewsDao;
    /**
     * 这里的方法是，增加阅读量，就不删除缓存了
     */
    @Override
    public News updateNews(News news) {
        return iNewsDao.updateNews(news);
    }


    @Override
    @Cacheable(key = "targetClass.name+methodName+#page+#limit+#lang")
    public Pager<News> getPagerNews(Integer page, Integer limit, String lang) {

        SystemContext.setPageOffset((page - 1) * limit);
        SystemContext.setPageSize(limit);
        SystemContext.setSort("release_time");
        SystemContext.setOrder("desc");

        //获取的是新闻表的数据，在去判断要不要回去，国际化的语言
        Pager<News> pagerNews = iNewsDao.getPagerNews(InternationalizationEnum.getByName(lang));
        return pagerNews;
    }
    @Override
    @Cacheable(key = "targetClass.name+methodName+#page+#limit+#lang+#keyWord")
    public Pager<News> getPagerNews(Integer page, Integer limit, String lang,String keyWord) {

        SystemContext.setPageOffset((page - 1) * limit);
        SystemContext.setPageSize(limit);
        SystemContext.setSort("release_time");
        SystemContext.setOrder("desc");
        //获取的是新闻表的数据，在查询过程中已经国际化
        Pager<News> pagerNews = iNewsDao.getListNewsByKeyWord(keyWord,InternationalizationEnum.getByName(lang));
        return pagerNews;
    }


    @Override
    @Cacheable(key = "targetClass.name+methodName+#lang")
    public List<News> getTop4ListNews(String lang) {
        List<News> listNews = iNewsDao.getTop4ListNews(InternationalizationEnum.getByName(lang));
        return listNews;
    }

    @Override
    @Cacheable(key = "targetClass.name+methodName+#lang")
    public List<News> getListNews(String lang) {
        List<News> listNews = iNewsDao.getListNews(InternationalizationEnum.getByName(lang));
        return listNews;
    }

    /**
     * 获取置顶新闻
     */
    @Override
    public List<News> getPlacementNews(String lang) {
        List<News> listNews = iNewsDao.getPlacementNews(InternationalizationEnum.getByName(lang));
        return listNews;
    }

}
