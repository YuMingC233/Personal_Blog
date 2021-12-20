/**  
 * @Title: BlogPageServlet.java
 * @Package com.Servlet
 * @Description: TODO(用一句话描述该文件做什么)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月18日 下午7:58:17
 * @version V1.0  
 * */
package com.Servlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.Entity.BlogArticle;
import com.Entity.BlogInfo;
import com.Entity.Tag;
import com.Service.BlogService;
import com.Service.TagService;
import com.Service.impl.BlogServiceImpl;
import com.Service.impl.TagServiceImpl;
import com.alibaba.fastjson.JSON;
import com.util.WriteFile;

/**
 * @ClassName: BlogPageServlet
 * @Description: TODO(博客操作Servlet集合)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月18日 下午7:58:17
 * .此标识 @MultipartConfig 代表支持文件上传
 * */
@MultipartConfig
public class BlogPageServlet extends HttpServlet {
	
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
		// TODO 
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		BlogService bs = new BlogServiceImpl();
		int ID = 0; int ReadNum = 0;
		Part part = null;String fileName = null;InputStream inputStream;
		Calendar calendar; Date time;
		String[] pres; StringBuffer sb;
		BlogInfo bi; BlogArticle ba;
		if (req.getParameter("sendMode") != null) {
			resp.setContentType("text/html;charset=UTF-8");
			switch (req.getParameter("sendMode")) {
				case "init":
					WriteFile.WriteInfoJson(bs.findAllBlogInfo());
					break;
				case "add":
					// 获取part对象 参数为name属性的值
					part = req.getPart("sideImage");
					// Servlet3没有提供直接获取文件名的方法,需要从请求头中解析出来
					// getSubmit function获取文件名
					fileName = part.getSubmittedFileName();
					// 获取数据的流
					inputStream = part.getInputStream();
					// 获取当前时间
					calendar = Calendar.getInstance();
					time = calendar.getTime();
					
					// 将标签集合整合成一个字符串
					pres = req.getParameterValues("tagId");
					sb = new StringBuffer();
					for (String str : pres) {
						sb.append(str + ",");
					}
					sb.replace(sb.length() - 1, sb.length(), "");
					
					bi = new BlogInfo(
									-1,
									req.getParameter("title"),
									req.getParameter("Writter"),
									req.getParameter("creationType").equals("原创") ? true : false,
									sb.toString(),
									req.getParameter("description"),
									0,
									0, 
									time,
									time
								);
					ba = new BlogArticle(
								bi.getPublishTime(),
								req.getParameter("content"),
								req.getParameter("editormd-html-code"),
								fileName,
								inputStream
							);
					if (bs.addBlog(bi, ba))
						resp.getWriter().write("true");
					else 
						resp.getWriter().write("false");
					break;
				case "del":
					ID = Integer.parseInt(req.getParameter("ID"));
					if (bs.delBlog(ID)) 
				        resp.getWriter().write("true");
					else 
						resp.getWriter().write("false");	
					break;
				case "delMany":
					String temp = req.getParameter("manyID");
					for (String str : temp.split(",")) {
						if (bs.delBlog(Integer.parseInt(str))) 
							continue;
						else
							resp.getWriter().write("false");
							return;
					}
					resp.getWriter().write("true");
					break;
				case "mod":
					ID = Integer.parseInt(req.getParameter("IDs"));
					/**
					 * 判断传入的sideImage控件的大小不为0
					 */
					if (req.getPart("sideImage").getSize() != 0) {
						// 获取part对象 参数为name属性的值
						part = req.getPart("sideImage");
						// Servlet3没有提供直接获取文件名的方法,需要从请求头中解析出来
						// 获取文件名
						fileName = part.getSubmittedFileName();
						// 获取数据的流
						inputStream = part.getInputStream();
					} else {
						inputStream = null;
					}
					calendar = Calendar.getInstance();
					time = calendar.getTime();
					
					// 将标签集合整合成一个字符串
					pres = req.getParameterValues("tagId");
					sb = new StringBuffer();
					for (String str : pres) {
						sb.append(str + ",");
					}
					sb.replace(sb.length()-1, sb.length(), "");
					
					bi = new BlogInfo(
									ID,
									req.getParameter("title"),
									req.getParameter("Writter"),
									req.getParameter("creationType").equals("原创") ? true : false,
									sb.toString(),
									req.getParameter("description"),
									0,
									0,
									null,
									time
								);
					ba = new BlogArticle(
								bs.findBlogPublishTime(bi.getID()),
								req.getParameter("content"),
								req.getParameter("editormd-html-code"),
								fileName,
								inputStream
							);
					if (bs.modBlog(bi, ba)) 
						resp.getWriter().write("true");
					else 
						resp.getWriter().write("false");
					break;
				case "findAll":
					WriteFile.WriteInfoJson(bs.findAllBlogInfo());
					WriteFile.WriteArticleJson(bs.findAllBlogArticle());
					
					TagService ts = new TagServiceImpl();
					List<Tag> tempTagList = ts.findAllTag();
					WriteFile.WriteTagJson(JSON.toJSONString(tempTagList));
					break;
				case "getSelfBlog":
					resp.setContentType("json; charset=utf-8");
					ID = Integer.parseInt(req.getParameter("ID"));
					resp.getWriter().write(bs.getSelfBlog(ID));
					break;
				case "addReadNum":
					ID = Integer.parseInt(req.getParameter("ID"));
					ReadNum = Integer.parseInt(req.getParameter("ReadNum"));
					if (bs.modReadNum(ID, ReadNum)) 
						resp.getWriter().write("true");
					else 
						resp.getWriter().write("false");
					break;
				case "getTop10":
					resp.setContentType("json; charset=utf-8");
					resp.getWriter().write(bs.sendBlogClickTop10());
					break;
				case "search":
					resp.setContentType("json; charset=utf-8");
					temp = req.getParameter("data");
					resp.getWriter().write(bs.sendBlogFromStr(temp));					
					break;
				case "getCount":
					resp.setContentType("json; charset=utf-8");
					resp.getWriter().write(bs.sendAllCount());		
					break;					
			}
		}
	}
}
