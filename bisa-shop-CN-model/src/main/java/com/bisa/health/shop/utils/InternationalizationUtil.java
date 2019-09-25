package com.bisa.health.shop.utils;

import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import static org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME;

import java.util.Locale;

/**
 * 判断处理国际化语言 工具类
 */

public class InternationalizationUtil {

    /**
     * 根据springmvc的session 获取当前语言的类型
     * @param session
     * @return
     */
    public static String getLang(HttpSession session) {

        //获取springmvc中的国际化语言
    	Locale lang = (Locale) session.getAttribute(LOCALE_SESSION_ATTRIBUTE_NAME);
    	Locale mlocale = null; 
        if (lang == null) {
        	mlocale = new Locale("en", "US"); 
        	session.setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME,mlocale);
        }else{
        	mlocale=lang;
        }
        return mlocale.toString();
    }
}
