package com.bisa.health.shop.admin.controller;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.bisa.fastdfs.FastDFSClient;
import com.bisa.health.shop.admin.service.IAdminClassifyService;
import com.bisa.health.shop.admin.service.IAdminNewsClassifyService;
import com.bisa.health.shop.enumerate.InternationalizationEnum;
import com.bisa.health.shop.model.NewsClassify;
import com.bisa.health.shop.model.NewsInnerChain;
import com.bisa.health.shop.utils.InternationalizationUtil;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bisa.health.common.utils.RandomUtils;
import com.bisa.health.shop.admin.dto.OrderListPageDto;
import com.bisa.health.shop.admin.service.IAdminNewsService;
import com.bisa.health.shop.admin.util.JsonResult;
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
    private IAdminNewsService newsService;


    @Autowired
    private IAdminNewsClassifyService adminNewsClassifyService;
    
    @Autowired
    private FastDFSClient fastDFSClient;
    /**
     * 进去 bisa 新闻列表 页面
     */
    @RequestMapping(value = "/listNews", method = RequestMethod.GET)
    public String listNews() {
        return "admin/admin_news/adminNewsList";
    }

    @RequestMapping(value = "/adminNewsInternationalization",method = RequestMethod.GET)
    public String adminNewsInternationalization(){
        return "admin/admin_news/adminNewsInternationalization";
    }
    /**
     * 进去 bisa 新闻列表 内容 页面
     */
    @RequestMapping(value = "/newsContent", method = RequestMethod.GET)
    public String newsContent(Integer news_id) {
        return "admin/admin_news/adminNewsContent";

    }
    @RequestMapping(value = "/newsInfo", method = RequestMethod.GET)
    public String newsInfo(Integer news_id) {
        return "news/newsContent_HK_"+news_id;
    }
    /**
     * 进去添加新闻页面
     * @return
     */
    @RequestMapping(value = "addNews",method = RequestMethod.GET)
    public String addNews(){
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

    /**
     * 新闻图片上传
     * @param file 接收图片的对象
     * @return
     */
    @RequestMapping(value = "/newsPictureUpload", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult newsPictureUpload(MultipartFile file) {

        JsonResult jsonResult = new JsonResult();
        String filename = UUID.randomUUID().toString() + ".jpg";
        try {
            // 上传图片到服务器返回一个图片的地址
            String url = fastDFSClient.uploadFile(filename,file.getBytes());

            jsonResult.setMsg(url);
            jsonResult.setFlag(true);
        } catch (Exception e) {
            e.printStackTrace();
            jsonResult.setFlag(false);
        }
        return jsonResult;
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
     * 加载国际化新闻数据
     * @param id
     * @param internationalization
     * @return
     */
    @RequestMapping(value = "/selectNewsInternationalizationById", method = RequestMethod.GET)
    @ResponseBody
    public News selectNewsInternationalizationById(Integer id,int internationalization) {
        int new_id=id;
        News news=new News();
//        try {
//            News news1= newsService.getNewsById(id);
//            NewsInternationalization newsInternationalization=newsInternationalizationService.selectNewsInternation(new_id,internationalization);
//            if (newsInternationalization!=null){
//            news.setAuthor(newsInternationalization.getAuthor());
//            news.setNews_title(newsInternationalization.getNews_title());
//            news.setNews_subhead(newsInternationalization.getNews_subhead());
//            news.setRead_quantity(news1.getRead_quantity());
//            news.setImg_url(newsInternationalization.getImg_url());
//            news.setNews_content(newsInternationalization.getNews_content());
//            news.setNews_classify_id(news1.getNews_classify_id());
//            news.setNews_describe(newsInternationalization.getNews_describe());
//            news.setNews_keyWord(newsInternationalization.getNews_keyWord());
//            news.setNews_roofPlacement(news1.getNews_roofPlacement());
//            news.setHtml_description(news1.getHtml_description());
//            news.setHtml_title(news1.getHtml_title());
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        return news;
    }
    /**
     * 新增、编辑新闻
     * @param news 新闻表对象
     * @return
     */
    @RequestMapping(value = "/addUpdateNews", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult addUpdateNews(@RequestBody  News news) {

        JsonResult jsonResult = new JsonResult();
//        NewsInternationalization newsInternationalization=new NewsInternationalization();
//        try {
//            if (news.getId() == 0) {
//                // 新增操作
//               int news_id= Integer.parseInt(RandomUtils.randomSixNum());
//                news.setNews_id(news_id);
//                news.setRelease_time(new Date());
//                newsService.addNews(news);
//                News news1 =newsService.getNewsByNewsId(news_id);
//                newsInternationalization.setNew_id(news1.getId());
//                newsInternationalization.setInternationalization(2);
//                newsInternationalization.setImg_url(news.getImg_url());
//                newsInternationalization.setAuthor(news.getAuthor());
//                newsInternationalization.setNews_title(news.getNews_title());
//                newsInternationalization.setNews_subhead(news.getNews_subhead());
//                newsInternationalization.setNews_content(news.getNews_content());
//                newsInternationalization.setNews_keyWord(news.getNews_keyWord());
//                newsInternationalization.setNews_describe(news.getNews_describe());
//                newsInternationalization.setHtml_description(news.getHtml_description());
//                newsInternationalization.setHtml_title(news.getHtml_title());
//                newsInternationalizationService.addNewsInternationalization(newsInternationalization);
//                //GenerateHTMLUtil.GenerateNewHTML(news,2);
//                jsonResult.setFlag(true);
//                jsonResult.setMsg("100");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            jsonResult.setFlag(false);
//        }
        return jsonResult;
    }
    /**
     * 新增、新闻国际化
     *NewsInternationalization 新闻国际化对象
     * @return
     */
    @RequestMapping(value = "/addNewsInternationalization", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult addNewsInternationalization() {

        JsonResult jsonResult = new JsonResult();
//        NewsInternationalization news= newsInternationalizationService.selectNewsInternation(newsInternationalization.getNew_id(),newsInternationalization.getInternationalization());
//        try {
//            if (news==null){
//                newsInternationalizationService.addNewsInternationalization(newsInternationalization);
//
//                //创建Html文件
//                News news1= newsService.getNewsById(newsInternationalization.getNew_id());
//                news1.setHtml_title(newsInternationalization.getHtml_title());
//                news1.setHtml_description(newsInternationalization.getHtml_description());
//                news1.setNews_keyWord(newsInternationalization.getNews_keyWord());
//                news1.setImg_url(newsInternationalization.getImg_url());
//                news1.setNews_subhead(newsInternationalization.getNews_subhead());
//                news1.setNews_content(newsInternationalization.getNews_content());
//                news1.setAuthor(newsInternationalization.getAuthor());
//                news1.setNews_describe(newsInternationalization.getNews_describe());
//                news1.setNews_title(newsInternationalization.getNews_title());
//               // GenerateHTMLUtil.GenerateNewHTML(news1,newsInternationalization.getInternationalization());
//                jsonResult.setFlag(true);
//            }else{
//                jsonResult.setFlag(false);
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            jsonResult.setFlag(false);
//        }
        return jsonResult;
    }

    /**
     * 编辑新闻国际化
     * @param news
     * @return
     */
    @RequestMapping(value = "/updateNewsInternationalization",method =RequestMethod.POST)
    @ResponseBody
    public JsonResult updateNewsInternationalization(News news,int internationalization){
        JsonResult jsonResult=new JsonResult();
//        NewsInternationalization newsInternationalization=new NewsInternationalization();
//        News n= newsService.getNewsById(news.getId());
//        try {
//            if(!news.getNews_title().isEmpty()&& !news.getNews_subhead().isEmpty()&&!news.getNews_content().isEmpty()
//            &&!news.getAuthor().isEmpty()&&!news.getImg_url().isEmpty()&&!news.getNews_keyWord().isEmpty()&&!news.getNews_describe().isEmpty()){
//                newsInternationalization.setAuthor(news.getAuthor());
//                newsInternationalization.setNews_title(news.getNews_title());
//                newsInternationalization.setNews_content(news.getNews_content());
//                newsInternationalization.setImg_url(news.getImg_url());
//                newsInternationalization.setNews_subhead(news.getNews_subhead());
//                newsInternationalization.setNew_id(news.getId());
//                newsInternationalization.setInternationalization(internationalization);
//                newsInternationalization.setNews_describe(news.getNews_describe());
//                newsInternationalization.setNews_keyWord(news.getNews_keyWord());
//                newsInternationalization.setHtml_title(news.getHtml_title());
//                newsInternationalization.setHtml_description(news.getHtml_description());
//                newsInternationalizationService.updateNewsInternationalization(newsInternationalization);
//                if (internationalization==2){
//                    news.setRelease_time(n.getRelease_time());
//                    news.setNews_id(n.getNews_id());
//                    newsService.updateNews(news);
//                }
//                news.setRelease_time(n.getRelease_time());
//                news.setNews_id(n.getNews_id());
//                //创建Html文件
//              //  GenerateHTMLUtil.GenerateNewHTML(news,internationalization);
//                jsonResult.setFlag(true);
//            }else{
//                jsonResult.setFlag(false);
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            jsonResult.setFlag(false);
//        }
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
    public OrderListPageDto<News> selectOrderList(Integer page,Integer limit, HttpServletRequest request) {
        String incontent = request.getParameter("key[incontent]");
        String searchabout = request.getParameter("key[searchabout]");
        OrderListPageDto<News> listPageDto = newsService.selectAllNews(page, limit, incontent, searchabout);
        return listPageDto;
    }

    /**
            * 删除新闻
     *
             * @param id 新闻表  id
     * @return
             */
    @RequestMapping(value = "/delectNews", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult delectNews(Integer id) {
        JsonResult jsonResult = new JsonResult();
//        int new_id=id;
//        try {
//            newsService.deleteNews(id);
//            newsInternationalizationService.delNewsInternational(new_id);
//            //删除HTML文件
//            File file = new File(System.getProperty("user.dir")+"/src/main/webapp/WEB-INF/html/news/newsContent_CN_"+new_id+".html");
//            if (file.exists()){
//                file.delete();
//            }
//             file = new File(System.getProperty("user.dir")+"/src/main/webapp/WEB-INF/html/news/newsContent_HK_"+new_id+".html");
//            if (file.exists()){
//                file.delete();
//            }
//             file = new File(System.getProperty("user.dir")+"/src/main/webapp/WEB-INF/html/news/newsContent_US_"+new_id+".html");
//            if (file.exists()){
//                file.delete();
//            }
//            jsonResult.setFlag(true);
//        } catch (Exception e) {
//            e.printStackTrace();
//            jsonResult.setFlag(false);
//        }
        return jsonResult;
    }
    /**
     * 查询所有内链文本信息
     * @return
     */
    @RequestMapping(value = "/selectInnerChainList", method = RequestMethod.GET)
    @ResponseBody
    public OrderListPageDto<NewsInnerChain> selectInnerChainList(Integer page, Integer limit, HttpServletRequest request) {
        OrderListPageDto<NewsInnerChain> listPageDto = newsService.selectInnerChainList(page, limit);
        return listPageDto;
    }
    /**
     * 新增内链文本
     *newsInnerChain 新闻内链文本对象
     * @return
     */
    @RequestMapping(value = "/addInnerChain", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult addInnerChain(NewsInnerChain newsInnerChain) {

        JsonResult jsonResult = new JsonResult();
        try {
            if (newsInnerChain!=null){
                newsInnerChain.setCreation_time(new Date());
                newsService.addInnerChain(newsInnerChain);
                 GenerateHTMLs();
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
            GenerateHTMLs();
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
    @RequestMapping(value = "/GenerateHTML", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult GenerateHTML() {
        return GenerateHTMLs();
    }

    private  JsonResult GenerateHTMLs() {
        JsonResult jsonResult = new JsonResult();
//        try {
//            List<NewsInternationalization> list = newsInternationalizationService.selectAllNewsInternational();
//            List<NewsInnerChain>  newsInnerChainList = newsService.selectAllInnerChainList();
//            News news =null;
//            String innerChainInfo="";
//            for (int i = 0; i < list.size(); i++) {
//                news= newsService.getNewsById(list.get(i).getNew_id());
//              if (newsInnerChainList.size()>0){
//                  for (int j = 0; j <newsInnerChainList.size() ; j++) {
//                        if(list.get(i).getInternationalization()==1){
//                            innerChainInfo= " <a  style=\"color: #3f3b3c;text-decoration:none;\" href=\""+newsInnerChainList.get(j).getInner_chain_url()+"\">"+newsInnerChainList.get(j).getInner_chain_text_CN()+"</a>";
//                            list.get(i).setNews_title(list.get(i).getNews_title().replaceAll(newsInnerChainList.get(j).getInner_chain_text_CN(),innerChainInfo));
//                            list.get(i).setNews_content(list.get(i).getNews_content().replaceAll(newsInnerChainList.get(j).getInner_chain_text_CN(),innerChainInfo));
//                        }else if(list.get(i).getInternationalization()==2){
//                            innerChainInfo= " <a style=\"color: #3f3b3c;text-decoration:none;\" href=\""+newsInnerChainList.get(j).getInner_chain_url()+"\">"+newsInnerChainList.get(j).getInner_chain_text_HK()+"</a>";
//                            list.get(i).setNews_title(list.get(i).getNews_title().replaceAll(newsInnerChainList.get(j).getInner_chain_text_HK(),innerChainInfo));
//                            list.get(i).setNews_content(list.get(i).getNews_content().replaceAll(newsInnerChainList.get(j).getInner_chain_text_HK(),innerChainInfo));
//                        }else{
//                            innerChainInfo= " <a style=\"color: #3f3b3c;text-decoration:none;\"  href=\""+newsInnerChainList.get(j).getInner_chain_url()+"\"  >"+newsInnerChainList.get(j).getInner_chain_text_EN()+"</a>";
//                            list.get(i).setNews_title(list.get(i).getNews_title().replaceAll(newsInnerChainList.get(j).getInner_chain_text_EN(),innerChainInfo));
//                            list.get(i).setNews_content(list.get(i).getNews_content().replaceAll(newsInnerChainList.get(j).getInner_chain_text_EN(),innerChainInfo));
//                        }
//                  }
//              }
//                news.setHtml_title(list.get(i).getHtml_title());
//                news.setHtml_description(list.get(i).getHtml_description());
//                news.setNews_keyWord(list.get(i).getNews_keyWord());
//                news.setImg_url(list.get(i).getImg_url());
//                news.setNews_subhead(list.get(i).getNews_subhead());
//                news.setNews_content(list.get(i).getNews_content());
//                news.setAuthor(list.get(i).getAuthor());
//                news.setNews_describe(list.get(i).getNews_describe());
//                news.setNews_title(list.get(i).getNews_title());
//               // GenerateHTMLUtil.GenerateNewHTML(news,list.get(i).getInternationalization());
//            }
//            jsonResult.setFlag(true);
//        } catch (Exception e) {
//            e.printStackTrace();
//            jsonResult.setFlag(false);
//        }
        return jsonResult;
    }
}
