package com.bisa.health.shop.dao;

import com.bisa.health.basic.dao.IBaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.News;
import com.bisa.health.shop.model.NewsInLink;

import java.util.List;

/**
 * 新闻表
 * @author Administrator
 */

public interface INewsDao extends IBaseDao<News>{
	
	

    /**
     * 获取所有的新闻
     * @return
     */
    Pager<News> getListNewsByKeyWord(String keyWord, String language);
    /**
     * 更新新闻
     * @param news
     * @return
     */
    News updateNews(News news);

    /**
     * 上一篇，本文，下一篇文章
     * @return
     */
    List<News> getTop4ListNews(String language);

    /**
     * 获取所有的新闻
     * @return
     */
    List<News> getListNews(String language);

    /**
     * 获取置顶新闻
     * @return
     */
    List<News> getPlacementNews(String language);

	

    /**
     * 新闻表的id,加载新闻数据
     * @param id
     * @return
     */
    public News getNewsById(int id);
    
    
    /**
     *  新闻ID和语言ID
     * @param news_id
     * @param language
     * @return
     */
    public News getNewsByNewsnumAndLanguage(String news_num, String language);

    /**
     * 按新闻编号分页
     * @return
     */
    public Pager<News> getPageNewsGroupNum();
    
    /**
     * 新闻分页
     * @param language
     * @return
     */
     public Pager<News> getPageNews(String language,String vKey,String vVal);

    /**
     * 文章标题
     * @param incontent
     * @return
     */
    public Pager<News> selectNewsByArticleTitle(String incontent);

    /**
     * 文章ID
     * @param incontent
     * @return
     */
    public Pager<News> selectNewsByArticleID(String incontent);
    
    
    /**
     * 查询3个语言版本
     * @param new_id
     * @return
     */
    public List<News> listNewsByNewsnum(String news_num);
    
    /**
     * 查询所有
     * @param new_id
     * @return
     */
    public List<News> listNews();
    
    /**
     * 删除新闻信息
     * @param new_id
     * @return
     */
    public boolean deleteNewsByNewsnum(String news_num);
    /**
     * 分页查询内链接
     * @return
     */
    public Pager<NewsInLink> selectInnerChainList();
    /**
     * 查询所有内链接
     * @return
     */
    List<NewsInLink> selectAllInnerChainList();
    /**
     * 添加内链接
     * @param newsInnerChain
     * @return
     */
    boolean addInnerChain(NewsInLink newsInnerChain);
    /**
     * 删除内链接
     * @param id
     * @return
     */
    boolean delectInnerChain(int id);
}
