package com.bisa.health.shop.controller;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.admin.service.IAdminNewsService;
import com.bisa.health.shop.enumerate.InternationalizationEnum;
import com.bisa.health.shop.model.News;
import com.bisa.health.shop.service.INewsService;
import com.bisa.health.shop.utils.InternationalizationUtil;

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
@RequestMapping(value = "/web/call")
public class NewsController {

    @Autowired
    private INewsService newsService;
    @Autowired
    private IAdminNewsService adminNewsService;
    /**
     * 健康咨询
     * @return
     */
    @RequestMapping(value = "/healthInquiry", method = RequestMethod.GET)
    public String healthInquiry() {
        return "news/newsIndex";
    }

    /**
     * 跳转到新闻详情页
     * @return
     */
    @RequestMapping(value = "/newsContent.html", method = RequestMethod.GET)
    public String newsDetail(HttpSession session, int news_id) {
        String lang = InternationalizationUtil.getLang(session);
        System.out.println("---------"+lang);
        if (InternationalizationEnum.zh_CN.getName().equals(lang)) {
                //简体
                lang="CN";
            } else if (InternationalizationEnum.en_US.getName().equals(lang)) {
                //英文
                lang="US";
        } else if (InternationalizationEnum.zh_HK.getName().equals(lang)) {
            //繁体
            lang="HK";
        }
        News news = adminNewsService.getNewsById(news_id);
        news.setRead_quantity(news.getRead_quantity() + 1);
        newsService.updateNews(news);
        return "news/newsContent_"+lang+"_"+news_id;
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
    @RequestMapping(value = "/loadNewsDatas", method = RequestMethod.GET)
    @ResponseBody
    public Pager<News> loadNewsDatas(Integer page, Integer limit, HttpSession session,String keyWord ) {
        String lang = InternationalizationUtil.getLang(session);
        Pager<News>  newsPager = null;
        if(keyWord==null||keyWord==""){
            //查询所有新闻
            newsPager = newsService.getPagerNews(page, limit, lang);
        }else{
            //根据关键字或者新闻标题模糊搜索新闻
            newsPager =  newsService.getPagerNews1(page,limit,lang,keyWord);
        }
        if (InternationalizationEnum.zh_CN.getName().equals(lang)) {
            //简体
            lang="CN";
        } else if (InternationalizationEnum.en_US.getName().equals(lang)) {
            //英文
            lang="US";
        } else if (InternationalizationEnum.zh_HK.getName().equals(lang)) {
            //繁体
            lang="HK";
        }
        return newsPager;
    }
    /**
     * 获得置顶消息
     * @return
             */
    @RequestMapping(value = "/loadPlacementNews", method = RequestMethod.GET)
    @ResponseBody
    public  List<News> loadPlacementNews(HttpSession session) {
        String lang = InternationalizationUtil.getLang(session);
        List<News>  newsPager = null;
        newsPager = newsService.getPlacementNews(lang);
        if (InternationalizationEnum.zh_CN.getName().equals(lang)) {
            //简体
            lang="CN";
        } else if (InternationalizationEnum.en_US.getName().equals(lang)) {
            //英文
            lang="US";
        } else if (InternationalizationEnum.zh_HK.getName().equals(lang)) {
            //繁体
            lang="HK";
        }
        return newsPager;
    }
    /**
     * 新闻详情
     * @param news_id 新闻的id
     * @return
     */
    @RequestMapping(value = "/loadNewsDetail", method = RequestMethod.GET)
    @ResponseBody
    public String newsDetail(int news_id, HttpSession session) {
        //获取当前语言类型
        String lang = InternationalizationUtil.getLang(session);
        News last = null;
        News next = null;
        News current = null;
        List<News> newsList = newsService.getListNews(lang);
        int amount = newsList.size();

        for (int i = 0; i < amount; i++) {
            if (newsList.get(i).getNews_id() == news_id) {
                current = newsList.get(i);
                if (amount >= 2) {
                    if (i == 0) { //下一篇
                        next = newsList.get(i + 1);
                    }
                    if (i == (amount - 1)) { //上一篇
                        last = newsList.get(i - 1);
                    }
                    if (amount > 2 && i != 0 && i != (amount - 1)) {
                        last = newsList.get(i - 1);
                        next = newsList.get(i + 1);
                    }
                }
            }
        }

        //增加阅读量
        current.setRead_quantity(current.getRead_quantity() + 1);
        newsService.updateNews(current);

        try {
            // 相关新闻（显示点击量最高的四篇）
            List<News> relativeNews = newsService.getTop4ListNews(lang);
            JSONObject object = new JSONObject();
            object.put("currentDetail", current);
            object.put("lastNew", last);
            object.put("nextNew", next);
            object.put("relativeNews", relativeNews);
            return object.toString();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
