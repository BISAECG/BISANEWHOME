package com.bisa.health.shop.component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.shop.enumerate.LangEnum;
import com.bisa.health.shop.model.CompanyInfo;
import com.bisa.health.shop.model.HtmlInfo;
import com.bisa.health.shop.model.News;
import com.bisa.health.shop.utils.FreemarkerUtil;

@Component
public class FreemarkerComponent {
	
	
	private String outPath;
	
	private FreemarkerUtil util;
	
	@Autowired(required=true)
	public FreemarkerComponent(String ftlPath, String outPath) {
		super();
		if(util==null) {
			this.outPath = outPath;
			util = FreemarkerUtil.getInstance(ftlPath);
		}
	}
	public void generateTop(List<HtmlInfo> list,CompanyInfo companyInfo) {
		//生成简体
		Map<String,Object> root = new HashMap<String,Object>();
		root.put("company_phone", companyInfo.getCompany_phone());
		root.put("empList", list);
		util.fprint(root, "/web/zh_CN/header.ftl", SystemContext.getRealPath()+outPath+"/zh_CN/header.html");
		util.fprint(root, "/web/zh_HK/header.ftl", SystemContext.getRealPath()+outPath+"/zh_HK/header.html");
		util.fprint(root, "/web/en_US/header.ftl", SystemContext.getRealPath()+outPath+"/en_US/header.html");
		
		//生成二级目录头部
		util.fprint(root, "/web/zh_CN/inheader.ftl", SystemContext.getRealPath()+outPath+"/zh_CN/inheader.html");
		util.fprint(root, "/web/zh_HK/inheader.ftl", SystemContext.getRealPath()+outPath+"/zh_HK/inheader.html");
		util.fprint(root, "/web/en_US/inheader.ftl", SystemContext.getRealPath()+outPath+"/en_US/inheader.html");

	}
	
	public void generateBottom(CompanyInfo companyInfo) {
		
		//中文
		Map<String,Object> root = new HashMap<String,Object>();
		root.put("company_name",companyInfo.getCompany_name_CN());
		root.put("company_address",companyInfo.getCompany_address_CN());
		root.put("company_phone",companyInfo.getCompany_phone());
		util.fprint(root, "/web/zh_CN/footer.ftl", SystemContext.getRealPath()+outPath+"/zh_CN/footer.html");
		util.fprint(root, "/web/zh_CN/infooter.ftl", SystemContext.getRealPath()+outPath+"/zh_CN/infooter.html");
		//繁体
		root = new HashMap<String,Object>();
		root.put("company_name",companyInfo.getCompany_name_HK());
		root.put("company_address",companyInfo.getCompany_name_HK());
		root.put("company_phone",companyInfo.getCompany_phone());
		util.fprint(root, "/web/zh_HK/infooter.ftl", SystemContext.getRealPath()+outPath+"/zh_HK/footer.html");
		util.fprint(root, "/web/zh_HK/footer.ftl", SystemContext.getRealPath()+outPath+"/zh_HK/infooter.html");
		//英文
		root = new HashMap<String,Object>();
		root.put("company_name",companyInfo.getCompany_name_US());
		root.put("company_address",companyInfo.getCompany_address_US());
		root.put("company_phone",companyInfo.getCompany_phone());
		util.fprint(root, "/web/en_US/footer.ftl", SystemContext.getRealPath()+outPath+"/en_US/footer.html");
		util.fprint(root, "/web/en_US/infooter.ftl", SystemContext.getRealPath()+outPath+"/en_US/infooter.html");
	}
	
	public void generateBody(Map<String,Object> root,String language,String ftlName,String htmlName) {
		util.fprint(root, "/web/"+language+"/"+ftlName, SystemContext.getRealPath()+outPath+"/"+language+"/"+htmlName);
	}
	
	public void generateNews(List<News> list) {
		for(News nn:list){
			
        	Map<String,Object> root=new HashMap<String,Object>();
        	root.put("news_keyWord", nn.getHtml_keyWord());
        	root.put("news_description", nn.getHtml_description());
        	root.put("news_title", nn.getNews_title());
        	root.put("release_time", nn.getRelease_time());
        	root.put("read_quantity", nn.getRead_quantity());
        	root.put("news_content", nn.getNews_content());
        	util.fprint(root, "/web/"+nn.getLanguage()+"/newbody.ftl", SystemContext.getRealPath()+outPath+"/"+nn.getLanguage()+"/news/"+nn.getId()+".html");
        }
		
	}
	
}
