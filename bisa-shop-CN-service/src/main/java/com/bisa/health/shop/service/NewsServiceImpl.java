package com.bisa.health.shop.service;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.shop.dao.INewsDao;
import com.bisa.health.shop.model.News;
import com.bisa.health.shop.model.NewsInLink;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@CacheConfig(cacheNames = "NewsServiceImpl")
public class NewsServiceImpl implements INewsService {

    @Autowired
    private INewsDao iNewsDao;

    @Override
    @Cacheable(key = "targetClass.name+methodName+#id")
    public News getNewsById(int id) {
        return iNewsDao.getNewsById(id);
    }
    @Override
    @Cacheable(key = "targetClass.name+methodName+#news_num")
	public List<News> listNewsByNewsnum(String news_num) {
		return iNewsDao.listNewsByNewsnum(news_num);
	}

    @Override
    @CacheEvict(value = "NewsServiceImpl", allEntries = true)
    public News addNews(News news) {
        return iNewsDao.add(news);
    }


    @Override
    @CacheEvict(value = "NewsServiceImpl", allEntries = true)
    public void deleteNewsById(int id) {
         iNewsDao.delete(id);
    }
    
    @Override
    @CacheEvict(value = "NewsServiceImpl", allEntries = true)
    public boolean deleteNewsByNewsnum(String news_num) {
        return iNewsDao.deleteNewsByNewsnum(news_num);
    }

    @Override
    @Cacheable(key = "targetClass.name+methodName+#page+# limit+#incontent+#searchabout")
    public Pager<News> selectAllNews(Integer page, Integer limit, String incontent, String searchabout) {
//        // * @param incontent input输入的内容 和下面对应
//        // * @param searchabout option选择 1 文章标题 2 文章ID
//        SystemContext.setPageOffset((page - 1) * limit);
//        SystemContext.setPageSize(limit);
//        SystemContext.setSort("release_time"); // 默认按订单时间倒序
//        SystemContext.setOrder("desc");
//
//        // 高级查询
//        Pager<News> pagerOrder = null;
//        if (searchabout.equals("1")) {// 1 文章标题
//            pagerOrder = iNewsDao.selectNewsByArticleTitle(incontent);
//        } else if (searchabout.equals("2")) {// 2 文章ID
//            pagerOrder = iNewsDao.selectNewsByArticleID(incontent);
//        }
//        return pagerOrder;
    	return null;
    }

    @Override
    public Pager<NewsInLink> selectInnerChainList(Integer page, Integer limit){
        // * @param incontent input输入的内容 和下面对应
        // * @param searchabout option选择 1 文章标题 2 文章ID
        SystemContext.setPageOffset((page - 1) * limit);
        SystemContext.setPageSize(limit);
        SystemContext.setSort("creation_time"); // 默认按订单时间倒序
        SystemContext.setOrder("desc");

        // 高级查询
        Pager<NewsInLink> pagerOrder = iNewsDao.selectInnerChainList();;
        return pagerOrder;
    }

    @Override
    public List<NewsInLink> selectAllInnerChainList() {
        return iNewsDao.selectAllInnerChainList();
    }

    @Override
    public boolean delectInnerChain(int id) {
        return iNewsDao.delectInnerChain(id);
    }

    @Override
    public boolean addInnerChain(NewsInLink newsInnerChain) {
        return iNewsDao.addInnerChain(newsInnerChain);
    }
	@Override
	public News getNewsByNewsnumAndLanguage(String news_num, String language) {
		return iNewsDao.getNewsByNewsnumAndLanguage(news_num, language);
	}

	@Override
	public List<News> listNews() {
		return iNewsDao.listNews();
	}
	 /**
     * 这里的方法是，增加阅读量，就不删除缓存了
     */
    @Override
    public News updateNews(News news) {
        return iNewsDao.updateNews(news);
    }


    @Override
    @Cacheable(key = "targetClass.name+methodName+#offset")
    public Pager<News> getPageNewsGroupNum(Integer offset) {
        //获取的是新闻表的数据，在去判断要不要回去，国际化的语言
        Pager<News> pagerNews = iNewsDao.getPageNewsGroupNum();
        return pagerNews;
    }
    @Override
    @Cacheable(key = "targetClass.name+methodName+#page+#limit+#language+#keyWord")
    public Pager<News> getPageNews(String language, String vKey, String vVal){

        //获取的是新闻表的数据，在查询过程中已经国际化
        Pager<News> pagerNews = iNewsDao.getPageNews(language, vKey, vVal);
        return pagerNews;
    }


    @Override
    @Cacheable(key = "targetClass.name+methodName+#language")
    public List<News> getTop4ListNews(String language) {
        List<News> listNews = iNewsDao.getTop4ListNews(language);
        return listNews;
    }

    @Override
    @Cacheable(key = "targetClass.name+methodName+#language")
    public List<News> getListNews(String language) {
        List<News> listNews = iNewsDao.getListNews(language);
        return listNews;
    }

    /**
     * 获取置顶新闻
     */
    @Override
    public List<News> getPlacementNews(String language) {
        List<News> listNews = iNewsDao.getPlacementNews(language);
        return listNews;
    }
}
