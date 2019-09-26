package com.bisa.health.shop.admin.dao;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.News;
import com.bisa.health.shop.model.NewsInLink;

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
     *  新闻ID和语言ID
     * @param news_id
     * @param lang_id
     * @return
     */
    public News getNewsByNewsidAndLang(long news_id,int lang_id);

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
     * 查询3个语言版本
     * @param new_id
     * @return
     */
    public List<News> listNewsByNewsid(long news_id);
    
    /**
     * 查询所有
     * @param new_id
     * @return
     */
    public List<News> listNews();

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
     * 更新分类
     * @param news
     * @return
     */
    void updateNewsByClassify(long news_id,int classify_id);

    /**
     * 删除新闻信息
     * @param id
     * @return
     */
    public boolean deleteNewsById(int id);
    
    /**
     * 删除新闻信息
     * @param new_id
     * @return
     */
    public boolean deleteNewsByNewid(long new_id);
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
