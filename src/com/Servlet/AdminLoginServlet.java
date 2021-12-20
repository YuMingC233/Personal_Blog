/**  
 * @Title: AdminLoginServlet.java
 * @Package com.Servlet
 * @Description: TODO(登录页面跳转时的servlet)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月14日 下午4:36:37
 * @version V1.0  
 * */
package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Entity.Admin;
import com.Service.AdminService;
import com.Service.impl.AdminServiceImpl;

/**
 * @ClassName: AdminLoginServlet
 * @Description: TODO(登录Servlet处理类)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月14日 下午4:36:37
 *
 * */
public class AdminLoginServlet extends HttpServlet {
	String flag;
	
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		Admin adm = new Admin(req.getParameter("Email"),req.getParameter("Password"));
		AdminService as = new AdminServiceImpl();
		Admin result = as.login(adm);
		HttpSession session = req.getSession();
		if (result != null) {
			flag = "0";		// 0为通过，1为不通过
	        req.getSession().setAttribute("account", "abaaba");
			req.setAttribute("flag", flag);
			req.getRequestDispatcher("YuMing Blog Admin/dashboard.jsp").forward(req, resp);
		} else {
			flag = "1";
	        session.setAttribute("account", null);
			req.setAttribute("flag", flag);
			req.getRequestDispatcher("loginAdmin.jsp").forward(req, resp);
		}
	}
}
