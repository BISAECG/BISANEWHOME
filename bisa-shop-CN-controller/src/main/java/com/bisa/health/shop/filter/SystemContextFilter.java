package com.bisa.health.shop.filter;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import org.apache.shiro.web.filter.PathMatchingFilter;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

import com.bisa.health.basic.entity.SystemContext;

public class SystemContextFilter implements Filter  {
	
	private Integer pageSizeDefalut=10;
	private Integer pageSize=pageSizeDefalut;
	
	@Override
	public void destroy() {
		
	}
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		Integer offset = 0;
		try {
			offset = Integer.parseInt(req.getParameter("pager.offset"));
		} catch (NumberFormatException e) {}
		try {
			SystemContext.setOrder(req.getParameter("order"));
			SystemContext.setSort(req.getParameter("sort"));
			SystemContext.setPageOffset(offset);
			SystemContext.setPageSize(pageSize);
			SystemContext.setRealPath(((HttpServletRequest)req).getSession().getServletContext().getRealPath("/")+"/WEB-INF");
			chain.doFilter(req,resp);
		} finally {
			SystemContext.removeOrder();
			SystemContext.removeSort();
			SystemContext.removePageOffset();
			SystemContext.removePageSize();
			SystemContext.removeRealPath();
		}
	}

	@Override
	public void init(FilterConfig cfg) throws ServletException {
		try {
			pageSize = Integer.parseInt(cfg.getInitParameter("pageSize"));
		} catch (NumberFormatException e) {
			pageSize = 15;
		}
	}
	
	

}
