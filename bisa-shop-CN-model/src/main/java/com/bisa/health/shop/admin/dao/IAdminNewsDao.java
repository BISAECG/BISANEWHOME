package com.bisa.health.shop.admin.dao;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.News;
import com.bisa.health.shop.model.NewsInnerChain;

import java.util.List;

/**
 * 新闻表
 * @author Administrator
 */

public interface IAdminNewsDao {

    /**
     * 新闻表的id,加载新闻数据
     * @param id
     * @return
     */
    public News getNewsById(int id);
    /**
     * 新闻表的news_id,加载新闻数据
     * @param news_id
     * @return
     */
    public News getNewsByNewsId(int news_id);

    /**
     * 新闻列表的新闻分页
     * @return
     */
    public Pager<News> getPagerNews();

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
     * 添加新闻
     * @param news
     * @return
     */
    public News addNews(News news);

    /**
     * 更新新闻信息
     * @param news
     * @return
     */
    public News updateNews(News news);

    /**
     * 删除新闻信息
     * @param id
     * @return
     */
    public boolean deleteNews(int id);
    /**
     * 分页查询内链接
     * @return
     */
    public Pager<NewsInnerChain> selectInnerChainList();
    /**
     * 查询所有内链接
     * @return
     */
    List<NewsInnerChain> selectAllInnerChainList();
    /**
     * 添加内链接
     * @param newsInnerChain
     * @return
     */
    boolean addInnerChain(NewsInnerChain newsInnerChain);
    /**
     * 删除内链接
     * @param id
     * @return
     */
    boolean delectInnerChain(int id);
}
