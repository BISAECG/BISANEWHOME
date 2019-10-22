package com.bisa.health.shop.dao;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.News;
import com.bisa.health.shop.model.NewsInLink;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NewsDaoImpl extends BaseDao<News> implements INewsDao {
	
	
	
	 @Override
	    public Pager<News> getPagerNews(int lang) {
	        String sql = "select * from s_news  where lang_id=?";
	        return super.findBySql(sql, new Object[]{lang}, News.class, true);
	    }

	    @Override
	    public Pager<News> getListNewsByKeyWord(String keyWord, int lang) {
	        String sql = "select * from s_news where lang_id=? and news_title LIKE "+keyWord+"'%' or '%"+keyWord+"%' or '%'"+keyWord;
	        return super.findBySql(sql, new Object[]{lang}, News.class, true);
	    }
	    @Override
	    public List<News> getTop4ListNews(int lang) {
	        String sql = "SELECT * FROM s_news where lang_id=? ORDER BY READ_QUANTITY DESC LIMIT 0,4";
	        return super.listBySql(sql, new Object[]{lang}, News.class);
	    }
	    @Override
	    public List<News> getListNews(int lang) {
	        String sql = "select * from s_news where lang_id=?";
	        return super.listBySql(sql, new Object[]{lang}, News.class);
	    }

	    @Override
	    public List<News> getPlacementNews(int lang) {
	        String sql = "select * from s_news where lang_id=? and news_roofPlacement=1 limit 0,4";
	        return super.listBySql(sql, new Object[]{lang}, News.class);
	    }

    @Override
	public News getNewsByNewsidAndLang(long news_id, int lang_id) {
    	  String sql = "SELECT * FROM s_news WHERE news_id=? and lang_id=?";
          return super.queryObjectBySql(sql, new Object[]{news_id,lang_id}, News.class);
	}

	@Override
    public News getNewsById(int id) {
        String sql = "SELECT * FROM s_news WHERE ID=?";
        return super.queryObjectBySql(sql, new Object[]{id}, News.class);
    }
    
	@Override
	public List<News> listNewsByNewsid(long news_id) {
        String sql = "SELECT * FROM s_news WHERE news_id=?";
        return super.listBySql(sql, new Object[]{news_id},  News.class);
	}
    
    @Override
    public News addNews(News news) {
        return super.add(news);
    }

    @Override
    public News updateNews(News news) {
    	super.update(news); 
        return news;
    }
    @Override
    public boolean deleteNewsById(int id) {
        String sql = "DELETE FROM s_news WHERE ID=?";
        int result = super.deleteBySql(sql, new Object[]{id});
        return result >= 1 ? true : false;
    }
    
    @Override
    public boolean deleteNewsByNewid(long new_id) {
        String sql = "DELETE FROM s_news WHERE news_id=?";
        int result = super.deleteBySql(sql, new Object[]{new_id});
        return result >= 1 ? true : false;
    }
    @Override
    public Pager<News> getPagerNews() {
        String sql = "select * from s_news";
        return super.findBySql(sql, null, News.class, true);
    }

    @Override
    public Pager<News> selectNewsByArticleTitle(String incontent) {
        String sql = "select * from s_news where news_title = ?";
        return super.findBySql(sql, new Object[]{incontent}, News.class, true);
    }
    @Override
    public Pager<News> selectNewsByArticleID(String incontent) {
        String sql = "select * from s_news where id = ?";
        return super.findBySql(sql, new Object[]{incontent}, News.class, true);
    }

    @Override
    public Pager<NewsInLink> selectInnerChainList() {
        String sql = "select * from s_news_inlink";
        return super.findBySql(sql, null, NewsInLink.class, true);
    }

    @Override
    public List<NewsInLink> selectAllInnerChainList() {
        String sql = "select * from s_news_inlink";
        return super.listBySql(sql, null, NewsInLink.class, true);
    }

    @Override
    public boolean addInnerChain(NewsInLink newsInnerChain) {
        String sql = "INSERT INTO s_news_inlink (inner_chain_text_CN,inner_chain_text_EN,inner_chain_text_HK,inner_chain_url," +
                "creation_time)  VALUES(?,?,?,?,?)";
        int result = super.addBySql(sql, new Object[]{newsInnerChain.getInner_chain_text_CN(),newsInnerChain.getInner_chain_text_EN(),newsInnerChain.getInner_chain_text_HK(),newsInnerChain.getInner_chain_url(),newsInnerChain.getCreation_time()});
        return result >= 1 ? true : false;
    }

    @Override
    public boolean delectInnerChain(int id) {
        String sql = "DELETE FROM s_news_inlink WHERE ID=?";
        int result = super.deleteBySql(sql, new Object[]{id});
        return result >= 1 ? true : false;
    }

	@Override
	public void updateNewsByClassify(long news_id, int classify_id) {
		  String sql = "Update s_news set news_classify_id=? where news_id=?";
	      super.updateBySql(sql, new Object[]{classify_id,news_id});
	}

	@Override
	public List<News> listNews() {
	       String sql = "SELECT * FROM s_news";
	       return super.listBySql(sql, null,  News.class);
	}

}
