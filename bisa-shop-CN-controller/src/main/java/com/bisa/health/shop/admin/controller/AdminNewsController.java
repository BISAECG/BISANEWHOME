package com.bisa.health.shop.admin.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import com.bisa.fastdfs.FastDFSClient;
import com.bisa.health.shop.enumerate.InternationalizationEnum;
import com.bisa.health.shop.model.NewsClassify;
import com.bisa.health.shop.model.NewsInLink;
import com.bisa.health.shop.service.INewsClassifyService;
import com.bisa.health.shop.service.INewsService;
import com.bisa.health.shop.utils.InternationalizationUtil;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bisa.health.common.utils.RandomUtils;
import com.bisa.health.shop.admin.dto.PageJsonDto;
import com.bisa.health.shop.admin.util.JsonResult;
import com.bisa.health.shop.component.FreemarkerComponent;
import com.bisa.health.shop.model.News;


/**
 * 新闻管理
 *
 * @author Administrator
 */

@Controller
@RequestMapping(value = "/admin/news")
@RequiresRoles(value = {"ROLE_ADMIN", "ROLE_CUSTOMER"}, logical = Logical.OR)
public class AdminNewsController {

    @Autowired
    private INewsService newsService;


    @Autowired
    private INewsClassifyService adminNewsClassifyService;
    
    @Autowired
    FreemarkerComponent freemarkerComponent;
   
    /**
     * 进去 bisa 新闻列表 页面
     */
    @RequestMapping(value = "/listNews", method = RequestMethod.GET)
    public String listNews() {
        return "admin/admin_news/adminNewsList";
    }

 
    /**
     * 进去 bisa 新闻列表 内容 页面
     */
    @RequestMapping(value = "/newsContent/{news_id}/{lang_id}", method = RequestMethod.GET)
    public String newsContent(@PathVariable(value = "news_id") long news_id,@PathVariable(value = "lang_id") int lang_id,Model model) {
    	
    	News news=newsService.getNewsByNewsidAndLang(news_id, lang_id);
    	
    	model.addAttribute("news", news);
        return "admin/admin_news/adminNewsContent";

    }
 
    /**
     * 进去添加新闻页面
     * @return
     */
    @RequestMapping(value = "addNews",method = RequestMethod.GET)
    public String addNews(Model model){
    		model.addAttribute("lang_id",InternationalizationEnum.zh_HK.getValue());
            return "admin/admin_news/addNews";
    }
    /**
     * 进去 bisa 新闻列表 内容 页面
     */
    @RequestMapping(value = "/addNewsPicture", method = RequestMethod.GET)
    public String addNewsPicture() {
        return "admin/admin_news/addNewsPicture";
    }
    /**
     * 进去 bisa 新闻列表 关键词内联
     */
    @RequestMapping(value = "/addkeyword", method = RequestMethod.GET)
    public String addkeyword() {
        return "admin/admin_news/addkeyword";
    }

  

    @ResponseBody
    @RequestMapping(value = "/selectNewsClassify",method = RequestMethod.GET)
    public List<NewsClassify> selectNewsClassify(){
        return adminNewsClassifyService.selectNewsClassify();
    }
    /**
     * 加载新闻数据
     * @param id 新闻表的id
     * @return
     */
    @RequestMapping(value = "/selectNewsById", method = RequestMethod.GET)
    @ResponseBody
    public News selectNewsById(Integer id) {

        if (id == null) {
            return null;
        } else {
            return newsService.getNewsById(id);
        }
    }
    

    /**
     * 新增、编辑新闻
     * @param news 新闻表对象
     * @return
     */
    @RequestMapping(value = "/loadNewsBylang/{news_id}/{lang_id}", method = RequestMethod.GET)
    @ResponseBody
    public News loadNewsBylang(@PathVariable long news_id,@PathVariable int lang_id) {
    	News news=newsService.getNewsByNewsidAndLang(news_id, lang_id);
    	if(news==null){
    		return null;
    	}
    	return news;
    }
    


    /**
     * 新增、编辑新闻
     * @param news 新闻表对象
     * @return
     */
    @RequestMapping(value = "/addUpdateNews", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult addUpdateNews(@RequestBody @Validated News news,BindingResult bindingResult) {
    	
    	  JsonResult jsonResult = new JsonResult();
    	if(bindingResult.hasErrors()){
    	      jsonResult.setFlag(false);
    	      return jsonResult;
    	}
    	News mNews=newsService.getNewsByNewsidAndLang(news.getNews_id(), news.getLang_id());
        try {
            if (mNews==null) {
                // 新增操作
            	long news_id=0;
            	if(news.getNews_id()==0){
            		 news_id= RandomUtils.RandomOfDateTimeToInt();
            		 news.setNews_id(news_id);
            	}
                news.setRelease_time(new Date());
                newsService.addNews(news);
                //GenerateHTMLUtil.GenerateNewHTML(news,2);
                jsonResult.setFlag(true);
                jsonResult.setMsg("100");
            }else{
            	
            	if(mNews.getNews_classify_id()!=news.getNews_classify_id()){
            		newsService.updateNewsByClassify(mNews.getNews_id(), mNews.getNews_classify_id());
            	}
            	 mNews.toNews(news);
            	 newsService.updateNews(mNews);
            	 
            	 
            	 jsonResult.setFlag(true);
                 jsonResult.setMsg("100");
            }
            
            List<News> list=newsService.listNewsByNewsid(news.getNews_id());
            List<News> listNews=new ArrayList<News>(list.size());
            List<NewsInLink>  inLinkList = newsService.selectAllInnerChainList();
            String inLinkStr="";
            for(NewsInLink m :inLinkList){
	            for(News n:list){
	            	if(n.getLang_id()==InternationalizationEnum.zh_CN.getValue()){
	            		inLinkStr= " <a  style=\"color: #3f3b3c;text-decoration:none;\" href=\""+m.getInner_chain_url()+"\">"+m.getInner_chain_text_CN()+"</a>";
	            		n.setNews_content(n.getNews_content().replaceAll(m.getInner_chain_text_CN(),inLinkStr));
	            	}else if(n.getLang_id()==InternationalizationEnum.zh_HK.getValue()){
	            		inLinkStr= " <a  style=\"color: #3f3b3c;text-decoration:none;\" href=\""+m.getInner_chain_url()+"\">"+m.getInner_chain_text_HK()+"</a>";
	            		n.setNews_content(n.getNews_content().replaceAll(m.getInner_chain_text_HK(),inLinkStr));
	            	}else{
	            		inLinkStr= " <a  style=\"color: #3f3b3c;text-decoration:none;\" href=\""+m.getInner_chain_url()+"\">"+m.getInner_chain_text_EN()+"</a>";
	            		n.setNews_content(n.getNews_content().replaceAll(m.getInner_chain_text_EN(),inLinkStr));
	            	}
	            	listNews.add(n);
	            }
            }
            
            freemarkerComponent.generateNews(listNews);
            
        } catch (Exception e) {
            e.printStackTrace();
            jsonResult.setFlag(false);
        }
        return jsonResult;
    }
  
    /**
     * 查询所有新闻
     *
     * @param page  第几页
     * @param limit 每页有多少数据
     */
    @RequestMapping(value = "/selectNewsList", method = RequestMethod.GET)
    @ResponseBody
    public PageJsonDto<News> selectOrderList(Integer page,Integer limit, HttpServletRequest request) {
        String incontent = request.getParameter("key[incontent]");
        String searchabout = request.getParameter("key[searchabout]");
        PageJsonDto<News> listPageDto = newsService.selectAllNews(page, limit, incontent, searchabout);
        return listPageDto;
    }

    /**
     * 删除新闻
     *
     * @param id 新闻表  id
     * @return
             */
    @RequestMapping(value = "/delectNews/{new_id}")
    public String delectNews(@PathVariable(value = "new_id") long new_id) {
    	newsService.deleteNewsByNewid(new_id);
    	 return "redirect:/admin/news/listNews";
    }
    /**
     * 查询所有内链文本信息
     * @return
     */
    @RequestMapping(value = "/selectInnerChainList", method = RequestMethod.GET)
    @ResponseBody
    public PageJsonDto<NewsInLink> selectInnerChainList(Integer page, Integer limit, HttpServletRequest request) {
    	PageJsonDto<NewsInLink> listPageDto = newsService.selectInnerChainList(page, limit);
        return listPageDto;
    }
    /**
     * 新增内链文本
     *newsInnerChain 新闻内链文本对象
     * @return
     */
    @RequestMapping(value = "/addInnerChain", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult addInnerChain(NewsInLink newsInnerChain) {

        JsonResult jsonResult = new JsonResult();
        try {
            if (newsInnerChain!=null){
                newsInnerChain.setCreation_time(new Date());
                newsService.addInnerChain(newsInnerChain);
                jsonResult.setFlag(true);
            }else{
                jsonResult.setFlag(false);
            }

        } catch (Exception e) {
            e.printStackTrace();
            jsonResult.setFlag(false);
        }
        return jsonResult;
    }
    /**
     * 删除内链文本
     * @param id 内链文本id
     * @return
     */
    @RequestMapping(value = "/delectInnerChain", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult delectInnerChain(Integer id) {

        JsonResult jsonResult = new JsonResult();
        int new_id=id;
        try {
            newsService.delectInnerChain(id);
            jsonResult.setFlag(true);
        } catch (Exception e) {
            e.printStackTrace();
            jsonResult.setFlag(false);
        }
        return jsonResult;
    }

    /**
     * 创建所有新闻页面
     * @return
     */
    @RequestMapping(value = "/generateall", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult generateall() {
    	 JsonResult json=new JsonResult();
    	 List<News> list=newsService.listNews();
         List<News> listNews=new ArrayList<News>(list.size());
         List<NewsInLink>  inLinkList = newsService.selectAllInnerChainList();
         String inLinkStr="";
         for(NewsInLink m :inLinkList){
	            for(News n:list){
	            	if(n.getLang_id()==InternationalizationEnum.zh_CN.getValue()){
	            		inLinkStr= " <a  style=\"color: #3f3b3c;text-decoration:none;\" href=\""+m.getInner_chain_url()+"\">"+m.getInner_chain_text_CN()+"</a>";
	            		n.setNews_content(n.getNews_content().replaceAll(m.getInner_chain_text_CN(),inLinkStr));
	            	}else if(n.getLang_id()==InternationalizationEnum.zh_HK.getValue()){
	            		inLinkStr= " <a  style=\"color: #3f3b3c;text-decoration:none;\" href=\""+m.getInner_chain_url()+"\">"+m.getInner_chain_text_HK()+"</a>";
	            		n.setNews_content(n.getNews_content().replaceAll(m.getInner_chain_text_HK(),inLinkStr));
	            	}else{
	            		inLinkStr= " <a  style=\"color: #3f3b3c;text-decoration:none;\" href=\""+m.getInner_chain_url()+"\">"+m.getInner_chain_text_EN()+"</a>";
	            		n.setNews_content(n.getNews_content().replaceAll(m.getInner_chain_text_EN(),inLinkStr));
	            	}
	            	listNews.add(n);
	            }
         }
         
         freemarkerComponent.generateNews(listNews);
         json.setFlag(true);
    	return json;
    }

}