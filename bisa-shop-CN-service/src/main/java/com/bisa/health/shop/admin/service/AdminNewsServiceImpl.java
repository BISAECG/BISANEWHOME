package com.bisa.health.shop.admin.service;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.shop.admin.dao.IAdminNewsDao;
import com.bisa.health.shop.admin.dto.OrderListPageDto;
import com.bisa.health.shop.model.News;
import com.bisa.health.shop.model.NewsInLink;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@CacheConfig(cacheNames = "NewsServiceImpl")
public class AdminNewsServiceImpl implements IAdminNewsService {

    @Autowired
    private IAdminNewsDao iNewsDao;

    @Override
    @Cacheable(key = "targetClass.name+methodName+#id")
    public News getNewsById(int id) {
        return iNewsDao.getNewsById(id);
    }
    @Override
    @Cacheable(key = "targetClass.name+methodName+#news_id")
	public List<News> listNewsByNewsid(long news_id) {
		return iNewsDao.listNewsByNewsid(news_id);
	}

    @Override
    @CacheEvict(value = "NewsServiceImpl", allEntries = true)
    public News addNews(News news) {
        return iNewsDao.addNews(news);
    }

    @Override
    @CacheEvict(value = "NewsServiceImpl", allEntries = true)
    public News updateNews(News news) {
        iNewsDao.updateNews(news);
        return news;
    }

    @Override
    @CacheEvict(value = "NewsServiceImpl", allEntries = true)
    public boolean deleteNewsById(int id) {
        return iNewsDao.deleteNewsById(id);
    }
    
    @Override
    @CacheEvict(value = "NewsServiceImpl", allEntries = true)
    public boolean deleteNewsByNewid(long new_id) {
        return iNewsDao.deleteNewsByNewid(new_id);
    }

    @Override
    @Cacheable(key = "targetClass.name+methodName+#page+# limit+#incontent+#searchabout")
    public OrderListPageDto<News> selectAllNews(Integer page, Integer limit, String incontent, String searchabout) {
        // * @param incontent input输入的内容 和下面对应
        // * @param searchabout option选择 1 文章标题 2 文章ID
        SystemContext.setPageOffset((page - 1) * limit);
        SystemContext.setPageSize(limit);
        SystemContext.setSort("release_time"); // 默认按订单时间倒序
        SystemContext.setOrder("desc");

        // 高级查询
        Pager<News> pagerOrder = null;
        if (searchabout == null) {
            pagerOrder = iNewsDao.getPagerNews();
        } else if (searchabout.equals("1")) {// 1 文章标题
            pagerOrder = iNewsDao.selectNewsByArticleTitle(incontent);
        } else if (searchabout.equals("2")) {// 2 文章ID
            pagerOrder = iNewsDao.selectNewsByArticleID(incontent);
        }

        // 封装layui要的数据结构
        OrderListPageDto<News> listPageDto = new OrderListPageDto<>();
        listPageDto.setCode(0);
        listPageDto.setMsg("''");
        listPageDto.setCount(pagerOrder.getTotal());
        listPageDto.setData(pagerOrder.getDatas());
        return listPageDto;
    }

    @Override
    public OrderListPageDto<NewsInLink> selectInnerChainList(Integer page, Integer limit){
        // * @param incontent input输入的内容 和下面对应
        // * @param searchabout option选择 1 文章标题 2 文章ID
        SystemContext.setPageOffset((page - 1) * limit);
        SystemContext.setPageSize(limit);
        SystemContext.setSort("creation_time"); // 默认按订单时间倒序
        SystemContext.setOrder("desc");

        // 高级查询
        Pager<NewsInLink> pagerOrder = iNewsDao.selectInnerChainList();;

        // 封装layui要的数据结构
        OrderListPageDto<NewsInLink> listPageDto = new OrderListPageDto<>();
        listPageDto.setCode(0);
        listPageDto.setMsg("''");
        listPageDto.setCount(pagerOrder.getTotal());
        listPageDto.setData(pagerOrder.getDatas());
        return listPageDto;
    }

    @Override
    public List<NewsInLink> selectAllInnerChainList() {
        return iNewsDao.selectAllInnerChainList();
    }

    @Override
    public boolean delectInnerChain(int id) {
        return iNewsDao.delectInnerChain(id);
    }

    @Override
    public boolean addInnerChain(NewsInLink newsInnerChain) {
        return iNewsDao.addInnerChain(newsInnerChain);
    }
	@Override
	public News getNewsByNewsidAndLang(long news_id, int lang_id) {
		return iNewsDao.getNewsByNewsidAndLang(news_id, lang_id);
	}
	@Override
	public void updateNewsByClassify(long news_id, int classify_id) {
		iNewsDao.updateNewsByClassify(news_id, classify_id);
	}
	@Override
	public List<News> listNews() {
		return iNewsDao.listNews();
	}
	
}
