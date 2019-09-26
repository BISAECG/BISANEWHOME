package com.bisa.health.shop.admin.service;

import com.bisa.health.shop.admin.dto.OrderListPageDto;
import com.bisa.health.shop.model.News;
import com.bisa.health.shop.model.NewsInLink;

import java.util.List;

/**
 * news表
 * @author Administrator
 */
public interface IAdminNewsService {

    /**
     * 新闻表的id,加载新闻数据
     * @param id
     * @return
     */
    News getNewsById(int id);
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
     * 根据新闻ID和语言ID
     * @param news_id
     * @param lang_id
     * @return
     */
    public News getNewsByNewsidAndLang(long news_id,int lang_id);
    /**
     * 添加新闻
     * @param news
     * @return
     */
    News addNews(News news);

    /**
     * 更新新闻信息
     * @param news
     * @return
     */
    News updateNews(News news);
    
    
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
     * 查询  (所有新闻)
     * @param page        第几页
     * @param limit       每页有多少数据
     * @param incontent   input输入的内容   和下面对应
     * @param searchabout option选择   1 文章标题  2 文章ID
     * @return
     */
    OrderListPageDto<News> selectAllNews(Integer page, Integer limit, String incontent, String searchabout);

    /**
     * 查询所有的内链接文本
     * @param page
     * @param limit
     * @return
     */
    OrderListPageDto<NewsInLink> selectInnerChainList(Integer page, Integer limit);
    /**
     * 查询所有的内链接文本
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
