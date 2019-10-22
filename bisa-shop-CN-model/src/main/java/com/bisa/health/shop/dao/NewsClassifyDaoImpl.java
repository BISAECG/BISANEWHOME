package com.bisa.health.shop.dao;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.shop.model.NewsClassify;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class NewsClassifyDaoImpl extends BaseDao<NewsClassify> implements INewsClassifyDao {

    @Override
    public List<NewsClassify> selectNewsClassify() {
        String sql = "SELECT * FROM s_news_classify ";
        return super.listBySql(sql, new Object[]{}, NewsClassify.class);
    }
}
