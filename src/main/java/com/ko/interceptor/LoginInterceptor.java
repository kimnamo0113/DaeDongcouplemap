package com.ko.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ko.domain.Guest;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("LoginInterceptor...........preHandler");
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("LoginInterceptor...........postHandler");
		
		HttpSession session=request.getSession();
		
		
		Object loginDTO = modelAndView.getModel().get("loginDTO");
		logger.info(loginDTO+"");
		if(loginDTO !=null) {
			
			Guest guest=(Guest) modelAndView.getModel().get("guest");
			
			if(!guest.getgCertification().equalsIgnoreCase("true")&&!guest.getgCertification().equalsIgnoreCase("false")){
				response.sendRedirect("noCertification");
				return;
			}
			
			session.setAttribute("Auth", loginDTO);
			Object dest = session.getAttribute("dest");
			String path = (dest != null)?(String) dest:request.getContextPath();
			
			if(modelAndView.getModel().get("update")!=null) {
				response.sendRedirect("updatePassword");
				return;
			}
			
			if(guest.getgCertification().equalsIgnoreCase("false")) {
				response.sendRedirect("joinNext");
				return;
			}
			response.sendRedirect(path);
			
		}
//		else {
//			response.sendRedirect(request.getContextPath()+"/auth/login");
//		}
		
		
		
	}

	
	
}
