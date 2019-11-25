package com.bisa.health.shop.controller;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.enumerate.LangEnum;
import com.bisa.health.shop.model.News;
import com.bisa.health.shop.service.INewsService;
import com.bisa.health.shop.service.INewsService;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 新闻
 * @author Administrator
 */

@Controller
public class NewsController {

    @Autowired
    private INewsService newsService;
    @Autowired
    private INewsService adminNewsService;
  
    @Autowired
	private InternationalizationUtil i18nUtil;
    
    @Autowired
    String outPath;
    /**
     * 跳转到新闻详情页
     * @return
     */
    @RequestMapping(value = "/news/body", method = RequestMethod.GET)
    public String view(HttpSession session,int id) {
        News news = adminNewsService.getNewsById(id);
        news.setRead_quantity(news.getRead_quantity() + 1);
        newsService.updateNews(news);
        return "redirect:"+outPath+"/"+i18nUtil.lang()+"/news/"+news.getId()+".html";
    }
    /**
            * 健康A&Q
     * @return
             */
    @RequestMapping(value = "/healthQA", method = RequestMethod.GET)
    public String healthQA() {
        return "news/newQA";
    }
    /**
     * 获得所有新闻数据
     * @param page  分页页码0,10,20
     * @param limit 每页显示数量
     * @return
            */
    @RequestMapping(value = "/news/list", method = RequestMethod.GET)
    @ResponseBody
    public Pager<News> loadNewsDatas(Integer page, Integer limit, HttpSession session,String keyWord ) {
        Pager<News>  newsPager = null;
        if(keyWord==null||keyWord==""){
            //查询所有新闻
            newsPager = newsService.getPageNews(i18nUtil.lang(),null,null);
        }else{
            //根据关键字或者新闻标题模糊搜索新闻
            newsPager =  newsService.getPageNews(i18nUtil.lang(),null,null);
        }
        return newsPager;
    }
    /**
     * 获得置顶消息
     * @return
             */
    @RequestMapping(value = "/new/tops", method = RequestMethod.GET)
    @ResponseBody
    public  List<News> loadPlacementNews(HttpSession session) {
        List<News>  newsPager = newsService.getPlacementNews(i18nUtil.lang());
        return newsPager;
    }
}
