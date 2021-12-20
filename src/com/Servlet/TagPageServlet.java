/**  
 * @Title: TagPageServlet.java
 * @Package com.Servlet
 * @Description: TODO(Tag页页面交互)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月17日 上午8:56:03
 * @version V1.0  
 * */
package com.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Entity.Page;
import com.Entity.Tag;
import com.Service.TagService;
import com.Service.impl.TagServiceImpl;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * @ClassName: TagPageServlet
 * @Description: TODO(Tag页servlet页)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月17日 上午8:56:03
 *
 * */
public class TagPageServlet extends HttpServlet {

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
		TagService ts = new TagServiceImpl();

		Page p;
		String TagName = null;
		int ID = 0;
		int tempNum;
		
		if (req.getParameter("sendMode") != null) {
			// 默认传出的值为String类型的true 或 false 所以需要全局定义text/html
			resp.setContentType("text/html;charset=UTF-8");
			switch (req.getParameter("sendMode")) {
				case "init":
					p = new Page(1, 10, ts.getTagCount());;
					resp.setContentType("json; charset=utf-8");
					resp.getWriter().write(ts.findTagByPage(p));
					break;
				case "pageBar":
					p = new Page(1, 10, ts.getTagCount());;
					JSONArray ja = new JSONArray();
					JSONObject jo = new JSONObject();
					jo.put("MaxTagPage", p.getTotalPageCount());
					ja.add(jo);
					resp.getWriter().write(ja.toJSONString());
					break;
				case "add":
					TagName = req.getParameter("TagName");
					if (TagName == "" || TagName.equals(null)) 
						resp.getWriter().write("null");										
					else if (ts.addTag(TagName)) 
				        resp.getWriter().write("true");
					else 
						resp.getWriter().write("false");
					break;
				case "del":
					ID = Integer.parseInt(req.getParameter("ID"));
					if (ts.delTag(ID)) 
				        resp.getWriter().write("true");
					else 
						resp.getWriter().write("false");					
					break;
				case "update":
					if (ts.modifyTag(new Tag(Integer.parseInt(req.getParameter("ID")),req.getParameter("TagName")))) 
						resp.getWriter().write("true");
					else 
						resp.getWriter().write("false");
					break;
				case "nextPage":
				case "prevPage":
				case "jumpPage":
					resp.setContentType("json; charset=utf-8");
					tempNum = Integer.parseInt(req.getParameter("currPage"));
					p = new Page(tempNum, 10, ts.getTagCount());
					resp.getWriter().write(ts.findTagByPage(p));
					break;
				case "getAllTag":
					resp.setContentType("json; charset=utf-8");
					List<Tag> tempTagList = ts.findAllTag();
					// 将List对象转换为JSON对象
					String jsonStr = JSONObject.toJSONString(tempTagList);
					resp.getWriter().write(jsonStr);
					break;
				case "getTagByID":
					resp.setContentType("json; charset=utf-8");
					tempNum = Integer.parseInt(req.getParameter("ID"));
					resp.getWriter().write(ts.findTagByID(tempNum));
					break;
			}
		}
	}

}
