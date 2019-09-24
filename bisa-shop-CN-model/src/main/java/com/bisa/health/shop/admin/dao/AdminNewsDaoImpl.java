package com.bisa.health.shop.admin.dao;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.News;
import com.bisa.health.shop.model.NewsInnerChain;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdminNewsDaoImpl extends BaseDao<News> implements IAdminNewsDao {

    @Override
    public News getNewsById(int id) {
        String sql = "SELECT * FROM h_news WHERE ID=?";
        return super.queryObjectBySql(sql, new Object[]{id}, News.class);
    }
    @Override
    public News getNewsByNewsId(int news_id) {
        String sql = "SELECT * FROM h_news WHERE news_id=?";
        return super.queryObjectBySql(sql, new Object[]{news_id}, News.class);
    }
    @Override
    public News addNews(News news) {
        String sql = "INSERT INTO h_news(NEWS_ID,NEWS_TITLE,NEWS_SUBHEAD,READ_QUANTITY,NEWS_CONTENT,IMG_URL,RELEASE_TIME,AUTHOR," +
                "news_classify_id,news_describe,news_keyWord,news_roofPlacement,html_description,html_title) VALUES(?,?,?,?,?,?,?,?,?,?," +
                "?,?,?,?)";
        int result = super.addBySql(sql, new Object[]{news.getNews_id(), news.getNews_title(), news.getNews_subhead(),
                 news.getRead_quantity(), news.getNews_content(), news.getImg_url(), news.getRelease_time(), news.getAuthor(),news.getNews_classify_id(),news.getNews_describe(),news.getNews_keyWord(),news.getNews_roofPlacement(),news.getHtml_description(),news.getHtml_title()});
        return result >= 1 ? news : null;
    }

    @Override
    public boolean updateNews(News news) {
        String sql = "UPDATE h_news SET NEWS_ID=?,NEWS_TITLE=?,NEWS_SUBHEAD=?,READ_QUANTITY=?,NEWS_CONTENT=?,IMG_URL=?,RELEASE_TIME=?,AUTHOR=?,news_classify_id=?,news_keyWord=?,news_describe=?,news_roofPlacement=? WHERE ID=?";
        int result = super.updateBySql(sql, new Object[]{news.getNews_id(), news.getNews_title(), news.getNews_subhead(), news.getRead_quantity(),
                news.getNews_content(), news.getImg_url(), news.getRelease_time(), news.getAuthor(),news.getNews_classify_id(),news.getNews_keyWord(),news.getNews_describe(),news.getNews_roofPlacement(),news.getId()});
        return result >= 1 ? true : false;
    }
    @Override
    public boolean deleteNews(int id) {
        String sql = "DELETE FROM h_news WHERE ID=?";
        int result = super.deleteBySql(sql, new Object[]{id});
        return result >= 1 ? true : false;
    }
    @Override
    public Pager<News> getPagerNews() {
        String sql = "select * from h_news";
        return super.findBySql(sql, null, News.class, true);
    }

    @Override
    public Pager<News> selectNewsByArticleTitle(String incontent) {
        String sql = "select * from h_news where news_title = ?";
        return super.findBySql(sql, new Object[]{incontent}, News.class, true);
    }
    @Override
    public Pager<News> selectNewsByArticleID(String incontent) {
        String sql = "select * from h_news where id = ?";
        return super.findBySql(sql, new Object[]{incontent}, News.class, true);
    }

    @Override
    public Pager<NewsInnerChain> selectInnerChainList() {
        String sql = "select * from h_new_innerChain";
        return super.findBySql(sql, null, NewsInnerChain.class, true);
    }

    @Override
    public List<NewsInnerChain> selectAllInnerChainList() {
        String sql = "select * from h_new_innerChain";
        return super.listBySql(sql, null, NewsInnerChain.class, true);
    }

    @Override
    public boolean addInnerChain(NewsInnerChain newsInnerChain) {
        String sql = "INSERT INTO h_new_innerChain (inner_chain_text_CN,inner_chain_text_EN,inner_chain_text_HK,inner_chain_url," +
                "creation_time)  VALUES(?,?,?,?,?)";
        int result = super.addBySql(sql, new Object[]{newsInnerChain.getInner_chain_text_CN(),newsInnerChain.getInner_chain_text_EN(),newsInnerChain.getInner_chain_text_HK(),newsInnerChain.getInner_chain_url(),newsInnerChain.getCreation_time()});
        return result >= 1 ? true : false;
    }

    @Override
    public boolean delectInnerChain(int id) {
        String sql = "DELETE FROM h_new_innerChain WHERE ID=?";
        int result = super.deleteBySql(sql, new Object[]{id});
        return result >= 1 ? true : false;
    }
}
