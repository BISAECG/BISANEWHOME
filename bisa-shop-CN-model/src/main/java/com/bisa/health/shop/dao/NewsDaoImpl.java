package com.bisa.health.shop.dao;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.News;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NewsDaoImpl extends BaseDao<News> implements INewsDao {

    @Override
    public boolean updateNews(News news) {
        String sql = "UPDATE h_news SET read_quantity = ? WHERE id = ?";
        int result = super.updateBySql(sql, new Object[]{news.getRead_quantity(), news.getId()});
        return result >= 1 ? true : false;
    }

    @Override
    public Pager<News> getPagerNews() {
        String sql = "select * from h_news s where s.news_roofPlacement=0";
        return super.findBySql(sql, null, News.class, true);
    }

    @Override
    public Pager<News> getListNewsByKeyWord(String keyWord, int lang) {
        String sql = "SELECT s.id AS 'id',s.release_time AS 'release_time',s.news_id as 'news_id',s.read_quantity as 'read_quantity',s.news_roofPlacement AS 'news_roofPlacement',s.news_classify_id AS 'news_classify_id' ,n.author as 'author',n.img_url AS 'img_url',n.news_content as 'news_content',"+
                "n.news_title as 'news_title',n.news_subhead as 'news_subhead',n.news_keyWord as 'news_keyWord',n.news_describe as 'news_describe',n.html_description AS 'html_description',n.html_title as 'html_title' from h_news s INNER JOIN h_new_internationalization n ON n.new_id=s.id WHERE  s.news_roofPlacement=0 AND n.id in (SELECT i.id FROM h_new_internationalization i  WHERE i.internationalization=?  AND ((i.news_keyWord like '%"+keyWord+"%') or (i.news_title like '%"+keyWord+"%')))";
        return super.findBySql(sql, new Object[]{lang}, News.class, true);
    }
    @Override
    public List<News> getTop4ListNews() {
        String sql = "SELECT * FROM h_news ORDER BY READ_QUANTITY DESC LIMIT 0,4";
        return super.listBySql(sql, null, News.class);
    }
    @Override
    public List<News> getListNews() {
        String sql = "select * from h_news";
        return super.listBySql(sql, null, News.class);
    }

    @Override
    public List<News> getPlacementNews() {
        String sql = "select * from h_news where news_roofPlacement=1 limit 0,4";
        return super.listBySql(sql, null, News.class);
    }
}
