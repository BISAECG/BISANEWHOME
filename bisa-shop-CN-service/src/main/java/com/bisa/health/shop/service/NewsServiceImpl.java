package com.bisa.health.shop.service;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.shop.admin.dao.IAdminNewsDao;
import com.bisa.health.shop.dao.INewsDao;
import com.bisa.health.shop.dao.INewsInternationalizationDao;
import com.bisa.health.shop.enumerate.InternationalizationEnum;
import com.bisa.health.shop.model.News;
import com.bisa.health.shop.model.NewsInternationalization;
import com.bisa.health.shop.service.INewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@CacheConfig(cacheNames = "NewsServiceImpl")
public class NewsServiceImpl implements INewsService {

    @Autowired
    private INewsDao iNewsDao;
    @Autowired
    private INewsInternationalizationDao newsInternationalizationDao;
    @Autowired
    private IAdminNewsDao iAdminNewsDao;
    /**
     * 这里的方法是，增加阅读量，就不删除缓存了
     */
    @Override
    public boolean updateNews(News news) {
        return iNewsDao.updateNews(news);
    }


    @Override
    @Cacheable(key = "targetClass.name+methodName+#page.toString()+#limit.toString()+#lang")
    public Pager<News> getPagerNews(Integer page, Integer limit, String lang) {

        SystemContext.setPageOffset((page - 1) * limit);
        SystemContext.setPageSize(limit);
        SystemContext.setSort("release_time");
        SystemContext.setOrder("desc");

        //获取的是新闻表的数据，在去判断要不要回去，国际化的语言
        Pager<News> pagerNews = iNewsDao.getPagerNews();
        List<News> datas = pagerNews.getDatas();

        List<News> list = new ArrayList<>();
        if (InternationalizationEnum.zh_CN.getName().equals(lang)) {
            //简体
            for (News news : datas) {
                news = langStyle(news, InternationalizationEnum.zh_CN.getValue());
                list.add(news);
            }
            pagerNews.setDatas(list);
        } else if (InternationalizationEnum.en_US.getName().equals(lang)) {
            //英文
            for (News news : datas) {
                news = langStyle(news, InternationalizationEnum.en_US.getValue());
                list.add(news);
            }
            pagerNews.setDatas(list);
        } else if (InternationalizationEnum.zh_HK.getName().equals(lang)) {
            //繁体
            for (News news : datas) {
                news = langStyle(news, InternationalizationEnum.zh_HK.getValue());
                list.add(news);
            }
            pagerNews.setDatas(list);
        }
        return pagerNews;
    }
    @Override
    @Cacheable(key = "targetClass.name+methodName+#page.toString()+#limit.toString()+#lang+#keyWord")
    public Pager<News> getPagerNews1(Integer page, Integer limit, String lang,String keyWord) {

        SystemContext.setPageOffset((page - 1) * limit);
        SystemContext.setPageSize(limit);
        SystemContext.setSort("release_time");
        SystemContext.setOrder("desc");

        int langInt = 0;
        if (InternationalizationEnum.zh_CN.getName().equals(lang)) {
                //简体
             langInt=InternationalizationEnum.zh_CN.getValue();
        } else if (InternationalizationEnum.en_US.getName().equals(lang)) {
            //英文
            langInt=InternationalizationEnum.en_US.getValue();
        } else if (InternationalizationEnum.zh_HK.getName().equals(lang)) {
            //繁体
            langInt=InternationalizationEnum.zh_HK.getValue();
        }
        //获取的是新闻表的数据，在查询过程中已经国际化
        Pager<News> pagerNews = iNewsDao.getListNewsByKeyWord(keyWord,langInt);
        return pagerNews;
    }

    //语言处理
    private News langStyle(News news, int lang) {
        try {
            NewsInternationalization newsInternationalization = newsInternationalizationDao.selectNewsInternationalizationByNewsId(news.getId() , lang);
            if (newsInternationalization!=null){
                news.setAuthor(newsInternationalization.getAuthor());
                news.setNews_title(newsInternationalization.getNews_title());
                news.setNews_subhead(newsInternationalization.getNews_subhead());
                news.setNews_content(newsInternationalization.getNews_content());
                news.setImg_url(newsInternationalization.getImg_url());

            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return news;
    }


    @Override
    @Cacheable(key = "targetClass.name+methodName+#lang")
    public List<News> getTop4ListNews(String lang) {
        List<News> listNews = iNewsDao.getTop4ListNews();
        List<News> list = getNews(lang, listNews);
        return list;
    }

    //获取国家化新闻list
    private List<News> getNews(String lang, List<News> listNews) {
        List<News> list = new ArrayList<>();
        List<News> list2 = new ArrayList<>();
        list2.add(null);
        for (News news : listNews) {
            if (InternationalizationEnum.zh_CN.getName().equals(lang)) {
                news = langStyle(news, InternationalizationEnum.zh_CN.getValue());
                list.add(news);
                list.removeAll(list2);
            } else if (InternationalizationEnum.en_US.getName().equals(lang)) {
                news = langStyle(news, InternationalizationEnum.en_US.getValue());
                list.add(news);
                list.removeAll(list2);
            } else if (InternationalizationEnum.zh_HK.getName().equals(lang)){
                news = langStyle(news, InternationalizationEnum.zh_HK.getValue());
                list.add(news);
                list.removeAll(list2);
            }
        }
        return list;
    }

    @Override
    @Cacheable(key = "targetClass.name+methodName+#lang")
    public List<News> getListNews(String lang) {
        List<News> listNews = iNewsDao.getListNews();
        List<News> list = getNews(lang, listNews);
        return list;
    }

    /**
     * 获取置顶新闻
     */
    @Override
    public List<News> getPlacementNews(String lang) {
        SystemContext.setSort("release_time");
        SystemContext.setOrder("desc");
        List<News> listNews = iNewsDao.getPlacementNews();
        List<News> list = getNews(lang, listNews);
        return list;
    }

}
