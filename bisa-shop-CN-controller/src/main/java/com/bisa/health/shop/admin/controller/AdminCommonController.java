package com.bisa.health.shop.admin.controller;

import com.bisa.fastdfs.FastDFSClient;
import com.bisa.health.shop.admin.util.JsonResult;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import java.util.UUID;

/**
 * 评价管理
 *
 * @author Administrator
 */
@Controller
@RequestMapping(value = "/admin/common")
@RequiresRoles(value = {"ROLE_ADMIN", "ROLE_CUSTOMER"}, logical = Logical.OR)
public class AdminCommonController {

    
    @Autowired
    private FastDFSClient fastDFSClient;

    
    /**
     * 图片上传Ajax
     * @param file 接收图片的对象
     * @return
     */
    @RequestMapping(value = "/uppic", method = RequestMethod.POST)
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
    
}
