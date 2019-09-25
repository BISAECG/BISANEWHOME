package com.bisa.health.shop.dao;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.News;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NewsDaoImpl extends BaseDao<News> implements INewsDao {

    @Override
    public News updateNews(News news) {
    	super.update(news);
        return news;
    }

    @Override
    public Pager<News> getPagerNews(int lang) {
        String sql = "select * from h_news  where lang_id=?";
        return super.findBySql(sql, new Object[]{lang}, News.class, true);
    }

    @Override
    public Pager<News> getListNewsByKeyWord(String keyWord, int lang) {
        String sql = "select * from h_news where lang_id=? and news_title LIKE "+keyWord+"'%' or '%"+keyWord+"%' or '%'"+keyWord;
        return super.findBySql(sql, new Object[]{lang}, News.class, true);
    }
    @Override
    public List<News> getTop4ListNews(int lang) {
        String sql = "SELECT * FROM h_news where lang_id=? ORDER BY READ_QUANTITY DESC LIMIT 0,4";
        return super.listBySql(sql, new Object[]{lang}, News.class);
    }
    @Override
    public List<News> getListNews(int lang) {
        String sql = "select * from h_news where lang_id=?";
        return super.listBySql(sql, new Object[]{lang}, News.class);
    }

    @Override
    public List<News> getPlacementNews(int lang) {
        String sql = "select * from h_news where lang_id=? and news_roofPlacement=1 limit 0,4";
        return super.listBySql(sql, new Object[]{lang}, News.class);
    }
}
