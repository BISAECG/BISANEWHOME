package com.bisa.health.shop.dao;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.News;
import com.bisa.health.shop.model.NewsInLink;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NewsDaoImpl extends BaseDao<News> implements INewsDao {
	
	    @Override
	    public Pager<News> getListNewsByKeyWord(String keyWord, String language) {
	        String sql = "select * from s_news where language=? and news_title LIKE "+keyWord+"'%' or '%"+keyWord+"%' or '%'"+keyWord;
	        return super.findBySql(sql, new Object[]{language},News.class,true);
	    }
	    @Override
	    public List<News> getTop4ListNews(String language) {
	        String sql = "SELECT * FROM s_news where language=? ORDER BY READ_QUANTITY DESC LIMIT 0,4";
	        return super.listBySql(sql, new Object[]{language}, News.class);
	    }
	    @Override
	    public List<News> getListNews(String language) {
	        String sql = "select * from s_news where language=?";
	        return super.listBySql(sql, new Object[]{language}, News.class);
	    }

	    @Override
	    public List<News> getPlacementNews(String language) {
	        String sql = "select * from s_news where language=? and news_roofPlacement=1 limit 0,4";
	        return super.listBySql(sql, new Object[]{language}, News.class);
	    }

    @Override
	public News getNewsByNewsnumAndLanguage(String news_num, String language) {
    	  String sql = "SELECT * FROM s_news WHERE news_num=? and language=?";
          return super.queryObjectBySql(sql, new Object[]{news_num,language}, News.class);
	}

	@Override
    public News getNewsById(int id) {
        String sql = "SELECT * FROM s_news WHERE ID=?";
        return super.queryObjectBySql(sql, new Object[]{id}, News.class);
    }
    
	@Override
	public List<News> listNewsByNewsnum(String news_num) {
        String sql = "SELECT * FROM s_news WHERE news_num=?";
        return super.listBySql(sql, new Object[]{news_num},  News.class);
	}
    

    @Override
    public News updateNews(News news) {
    	super.update(news); 
        return news;
    }
    
    @Override
    public boolean deleteNewsByNewsnum(String news_num) {
        String sql = "DELETE FROM s_news WHERE news_num=?";
        int result = super.deleteBySql(sql, new Object[]{news_num});
        return result >= 1 ? true : false;
    }
    @Override
    public Pager<News> getPageNewsGroupNum() {
    	String sql = "SELECT a.*  FROM (SELECT * FROM s_news GROUP BY news_num) AS a";
        return super.findBySql(sql, null,News.class, true);
    }
    

    @Override
	public Pager<News> getPageNews(String language, String vKey, String vVal) {
    	
		String sql="SELECT * "+
				"FROM s_news "+ 
				"WHERE language=?";
		
		if(!StringUtils.isEmpty(vKey)){
		 sql="SELECT * "+
					"FROM s_news "+ 
					"WHERE language=?  AND  "+vKey+" LIKE '"+vVal+"%'";
		
		}
		return super.findBySql(sql, new Object[]{language},News.class, true);
	}

	

	@Override
    public Pager<News> selectNewsByArticleTitle(String incontent) {
        String sql = "select * from s_news where news_title = ?";
        return super.findBySql(sql, new Object[]{incontent},News.class,true);
    }
    @Override
    public Pager<News> selectNewsByArticleID(String incontent) {
        String sql = "select * from s_news where id = ?";
        return super.findBySql(sql, new Object[]{incontent},News.class,true);
    }

    @Override
    public Pager<NewsInLink> selectInnerChainList() {
        String sql = "select * from s_news_inlink";
        return super.findBySql(sql, null,NewsInLink.class,true);
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
	public List<News> listNews() {
	       String sql = "SELECT * FROM s_news";
	       return super.listBySql(sql, null,  News.class);
	}

}
