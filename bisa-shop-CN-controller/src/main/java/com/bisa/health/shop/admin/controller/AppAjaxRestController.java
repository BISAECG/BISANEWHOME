package com.bisa.health.shop.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.bisa.fastdfs.FastDFSClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.shop.model.AppServer;
import com.bisa.health.shop.model.AppUpdate;
import com.bisa.health.shop.service.IAppServerService;
import com.bisa.health.shop.service.IAppUpdateService;

import net.sf.json.JSONObject;

@RestController
@RequestMapping(value = "/admin/ajax")
public class AppAjaxRestController {
	
	
	
    @Autowired
    private IAppUpdateService appUpdateService;

    @Autowired
    private IAppServerService serverUpdateService;
	@Autowired
	private FastDFSClient fastDFSClient;
    @RequestMapping(value = "/app/list")
	public Object listAppUpdate(){
		List<AppUpdate> list=appUpdateService.listAll();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("code", 0);
		jsonObject.put("msg", "");
		jsonObject.put("count", 10);
		jsonObject.put("data", list);
		return jsonObject;
	}
    
    @RequestMapping(value = "/server/list")
   	public Object listServer(@RequestParam(defaultValue="0") Integer page,@RequestParam(defaultValue="10") Integer limit){
    	
		SystemContext.setSort("create_time"); // 默认根据报告状态排序，待查看优先
		SystemContext.setOrder("desc");
		SystemContext.setPageSize(limit);
		SystemContext.setPageOffset((page-1)*limit);
    	Pager<AppServer> pager=serverUpdateService.listPager();
    	
   		JSONObject jsonObject = new JSONObject();
   		jsonObject.put("code", 0);
   		jsonObject.put("msg", "");
   		jsonObject.put("count", pager.getTotal());
   		jsonObject.put("data", pager.getDatas());
   		return jsonObject;
   	}
    
    @RequestMapping(value = "/server/delete")
   	public Object serverDelete(@RequestParam(defaultValue="0") Integer id){
    	
    	AppServer appServer=serverUpdateService.loadByID(id);
    	if(appServer!=null){
    		serverUpdateService.deleteAppServer(appServer);
    	}
   		return "ok";
   	}
    
    @RequestMapping(value = "/app/upload")
    @ResponseBody
   	public Object uploadApk(MultipartFile  file,HttpServletResponse response) throws IOException{

    	String appurl=fastDFSClient.uploadFile(file.getName()+".apk",file.getBytes());
    	JSONObject jsonObject = new JSONObject();
    	jsonObject.put("pathurl", appurl);
   		return jsonObject;
   	}
}
