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
import com.bisa.health.shop.enumerate.LangEnum;
import com.bisa.health.shop.model.NewsClassify;
import com.bisa.health.shop.model.NewsInLink;
import com.bisa.health.shop.service.INewsClassifyService;
import com.bisa.health.shop.service.INewsService;
import com.bisa.health.shop.utils.TradeNoUtils;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.common.entity.ResultData;
import com.bisa.health.common.utils.RandomUtils;
import com.bisa.health.shop.admin.util.JsonResult;
import com.bisa.health.shop.component.FreemarkerComponent;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.entity.SysStatusCode;
import com.bisa.health.shop.model.Goods;
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
    FreemarkerComponent freemarkerComponent;
    
	@Autowired
	private InternationalizationUtil i18nUtil;
    
 

   
    /**
     * 进去 bisa 新闻列表 页面
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list() {
        return "admin/news/list";
    }

 
    /**
     * 进去 bisa 新闻列表 内容 页面
     */
    @RequestMapping(value = "/body/{news_num}/{language}", method = RequestMethod.GET)
    public String body(@PathVariable(value = "news_num") String news_num,@PathVariable(value = "language") String language,Model model) {
    	
    	News news=newsService.getNewsByNewsnumAndLanguage(news_num, language);
    	
    	model.addAttribute("news", news);
        return "admin/news/body";

    }
 
    /**
     * 进去添加新闻页面
     * @return
     */
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add(@RequestParam(required=false,defaultValue="0") int id,@RequestParam(required=false,defaultValue="") String news_num,@RequestParam(required=false,defaultValue="") String language,Model model){
    		model.addAttribute("language",StringUtils.isEmpty(language)?i18nUtil.lang():language);
    		model.addAttribute("news_num",news_num);
    		model.addAttribute("id",id);
            return "admin/news/add";
    }
  
    /**
     * 进去 bisa 新闻列表 关键词内联
     */
    @RequestMapping(value = "/addkey", method = RequestMethod.GET)
    public String addkey() {
        return "admin/news/addkey";
    }

    /**
     * 加载新闻数据
     * @param id 新闻表的id
     * @return
     */
    @RequestMapping(value = "/load", method = RequestMethod.GET)
    @ResponseBody
    public News loadById(Integer id) {

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
    @RequestMapping(value = "/load/{news_num}/{language}", method = RequestMethod.GET)
    @ResponseBody
    public News loadBylang(@PathVariable String news_num,@PathVariable String language) {
    	News news=newsService.getNewsByNewsnumAndLanguage(news_num, language);
    	if(news==null){
    		return null;
    	}
    	return news;
    }
    

    
    /**
     * 查询新闻页面
     */
    @RequestMapping(value = "/ajax/list",method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    public ResponseEntity<Pager<News>> listAjax() {
    	  SystemContext.setSort("release_time");
          SystemContext.setOrder("desc");
    	  Pager<News> page=newsService.getPageNewsGroupNum(SystemContext.getPageOffset());
    	  return new ResponseEntity<Pager<News>>(page, HttpStatus.OK);
    }

    
    /**
     * 查询新闻
     * @param number
     * @param language
     * @return
     */
	@RequestMapping(value = "/ajax/load", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> loadAjaxGoods(@RequestParam(required = true) String number,
			@RequestParam(required = true) String language) {
		News news =newsService.getNewsByNewsnumAndLanguage(number, language);
		if (news != null) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess), news),
					HttpStatus.OK);
		}
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptSuccess), new News()), HttpStatus.OK);
	}
	
	 /**
     * 删除新闻
     *
     * @param id 新闻表  id
     * @return
             */
    @RequestMapping(value = "/delect/{new_id}",produces = "application/json; charset=utf-8")
    @ResponseBody
    public ResponseEntity<ResultData> delectNews(@PathVariable(value = "id") int id) {
    	newsService.deleteNewsById(id);
    	return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
    }

    /**
     * 新增、编辑新闻
     * @param news 新闻表对象
     * @return
     */
    @RequestMapping(value = "/ajax/save", method = RequestMethod.POST,produces = "application/json; charset=utf-8")
    @ResponseBody
    public ResponseEntity<ResultData> save(@Validated News news,BindingResult br) {
    	
    	if (br.hasErrors()) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.RequestFormat)), HttpStatus.OK);
		}
		
    	if(news.getRead_quantity()<=0){
    		news.setRead_quantity(Integer.valueOf(RandomUtils.randomUtil()));
    	}
    	
		if (StringUtils.isEmpty(news.getNews_num()))
			news.setNews_num(RandomUtils.RandomOfDateTime());
    	
		
		if (news.getId() == 0)
			newsService.addNews(news);
		else
			newsService.updateNews(news);
            
            List<News> listNews=new ArrayList<News>();
            List<NewsInLink>  inLinkList = newsService.selectAllInnerChainList();
            String inLinkStr="";
            for(NewsInLink m :inLinkList){
	            	if(news.getLanguage().toLowerCase()==LangEnum.zh_CN.getName().toLowerCase()){
	            		inLinkStr= " <a  style=\"color: #3f3b3c;text-decoration:none;\" href=\""+m.getInner_chain_url()+"\">"+m.getInner_chain_text_CN()+"</a>";
	            		news.setNews_content(news.getNews_content().replaceAll(m.getInner_chain_text_CN(),inLinkStr));
	            	}else if(news.getLanguage().toLowerCase()==LangEnum.zh_HK.getName().toLowerCase()){
	            		inLinkStr= " <a  style=\"color: #3f3b3c;text-decoration:none;\" href=\""+m.getInner_chain_url()+"\">"+m.getInner_chain_text_HK()+"</a>";
	            		news.setNews_content(news.getNews_content().replaceAll(m.getInner_chain_text_HK(),inLinkStr));
	            	}else{
	            		inLinkStr= " <a  style=\"color: #3f3b3c;text-decoration:none;\" href=\""+m.getInner_chain_url()+"\">"+m.getInner_chain_text_EN()+"</a>";
	            		news.setNews_content(news.getNews_content().replaceAll(m.getInner_chain_text_EN(),inLinkStr));
	            	}
	            	listNews.add(news);
            }
            
            freemarkerComponent.generateNews(listNews);
            
             return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
    }
  
    /**
     * 查询所有新闻
     *
     * @param page  第几页
     * @param limit 每页有多少数据
     */
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    @ResponseBody
    public Pager<News> load(Integer page,Integer limit, HttpServletRequest request) {
        String incontent = request.getParameter("key[incontent]");
        String searchabout = request.getParameter("key[searchabout]");
        Pager<News> listPageDto = newsService.selectAllNews(page, limit, incontent, searchabout);
        return listPageDto;
    }

   
    /**
     * 查询所有内链文本信息
     * @return
     */
    @RequestMapping(value = "/pageInLink", method = RequestMethod.GET)
    @ResponseBody
    public Pager<NewsInLink> listLink(Integer page, Integer limit, HttpServletRequest request) {
    	Pager<NewsInLink> listPageDto = newsService.selectInnerChainList(page, limit);
        return listPageDto;
    }
    /**
     * 新增内链文本
     *newsInnerChain 新闻内链文本对象
     * @return
     */
    @RequestMapping(value = "/addInLink", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult addInLink(NewsInLink newsInnerChain) {

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
    @RequestMapping(value = "/delectInLink", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult delectInLink(Integer id) {

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
    @RequestMapping(value = "/generate/html", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult generateall() {
    	 JsonResult json=new JsonResult();
    	 List<News> list=newsService.listNews();
         List<News> listNews=new ArrayList<News>(list.size());
         List<NewsInLink>  inLinkList = newsService.selectAllInnerChainList();
         String inLinkStr="";
         for(NewsInLink m :inLinkList){
	            for(News n:list){
	            	if(n.getLanguage().toLowerCase()==LangEnum.zh_CN.getName().toLowerCase()){
	            		inLinkStr= " <a  style=\"color: #3f3b3c;text-decoration:none;\" href=\""+m.getInner_chain_url()+"\">"+m.getInner_chain_text_CN()+"</a>";
	            		n.setNews_content(n.getNews_content().replaceAll(m.getInner_chain_text_CN(),inLinkStr));
	            	}else if(n.getLanguage().toLowerCase()==LangEnum.zh_HK.getName().toLowerCase()){
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