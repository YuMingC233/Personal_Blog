/**  
 * @Title: BlogServiceImpl.java
 * @Package com.Service.impl
 * @Description: TODO(实现所有对应服务接口方法)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月18日 下午5:37:53
 * @version V1.0  
 * */
package com.Service.impl;

import java.sql.Connection;
import java.util.Date;
import java.util.List;

import com.Dao.BlogDao;
import com.Dao.impl.BlogDaoImpl;
import com.Entity.BlogArticle;
import com.Entity.BlogInfo;
import com.Service.BlogService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.util.DataBaseUtil;
import com.util.WriteFile;

/**
 * @ClassName: BlogServiceImpl
 * @Description: TODO(博文服务实现类，实现所有服务接口方法)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月18日 下午5:37:53
 *
 * */
public class BlogServiceImpl implements BlogService {
	Connection con;
	boolean flag = false;
	BlogDao bd = null;

	/* 提交从servlet传入的基本信息与正文对象
	 * @see com.Service.BlogService#addBlog(com.Entity.BlogInfo, com.Entity.BlogArticle)
	 */
	@Override
	public boolean addBlog(BlogInfo bi, BlogArticle ba) {
		// TODO 提交从servlet传入的基本信息与正文对象
		con = DataBaseUtil.getCon();
		bd = new BlogDaoImpl(con);
		try {
			// 关闭自动提交
			con.setAutoCommit(false);
			// 判断返回值
			if (bd.addBlog(bi, ba)) {
				con.commit();
				return true;
			}
		} catch (Exception e) {
			// TODO: 当添加失败时，回滚事务
			// 调用DataBaseUtil中的回滚
			DataBaseUtil.rollbackWork(con);
			e.printStackTrace();
		} finally {
			DataBaseUtil.closeAll(null, null, con);
		}
		return false;
	}

	/* 提交从Servlet传入的博文ID
	 * @see com.Service.BlogService#delBlog(int)
	 */
	@Override
	public boolean delBlog(int ID) {
		// TODO 提交从Servlet传入的博文ID
		// 1
		bd = new BlogDaoImpl(con);
		// 2
		
		try {
			// 关闭自动提交
			// 3
			con.setAutoCommit(false);
			// 判断返回值
			// 4
			if (bd.delBlog(ID)) {
				// 5
				con.commit();
				// 6
				return true;
			}
		} catch (Exception e) {
			// TODO: 当删除失败时，回滚事务
			// 7 
			DataBaseUtil.rollbackWork(con);
			e.printStackTrace();
		} finally {
			// 8
			DataBaseUtil.closeAll(null, null, con);
		}
		return false;
	}

	/* 提交从Servlet传入的新博文基本信息与正文
	 * @see com.Service.BlogService#modBlog(com.Entity.BlogInfo, com.Entity.BlogArticle)
	 */
	@Override
	public boolean modBlog(BlogInfo newBi, BlogArticle ba) {
		// TODO 提交从Servlet传入的新博文基本信息与正文
		con = DataBaseUtil.getCon();
		bd = new BlogDaoImpl(con);
		try {
			// 关闭自动提交
			con.setAutoCommit(false);
			// 判断返回值
			BlogInfo oldBi = bd.findBlogInfoByID(newBi.getID());
			if (bd.modBlog(oldBi, newBi, ba)) {
				con.commit();
				return true;
			}
		} catch (Exception e) {
			// TODO: 当修改失败时，回滚事务
			DataBaseUtil.rollbackWork(con);
			e.printStackTrace();
		} finally {
			DataBaseUtil.closeAll(null, null, con);
		}
		return false;
	}

	/* 找到所有博文正文,并将图片写入img文件下
	 * @see com.Service.BlogService#findAllBlog()
	 */
	@Override
	public String findAllBlogArticle() {
		// TODO 找到所有博文正文,并将图片写入img文件下， 返回键名为data的String格式JSON对象
		con = DataBaseUtil.getCon();
		try {
			bd = new BlogDaoImpl(con);
			List<BlogArticle> temp = bd.findAllBlogArticle();
			
			// 创建jsonArray对象保存被转为JSONStr的List对象
			JSONArray dataArray = JSONArray.parseArray(JSON.toJSONString(temp));
			
			// 实例化新JSON对象，以data键保存上面的jsonArray对象
			JSONObject jsonMainObj = new JSONObject();
			jsonMainObj.put("data",dataArray);
			
			for (BlogArticle obj : temp) {
				WriteFile.WriteImage2File(obj.getBlogImageName(),obj.getBlogImageIS());
			}
			
			return jsonMainObj.toJSONString();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DataBaseUtil.closeAll(null, null, con);
		}
		return null;
	}

	/* 返回JSON格式字符串
	 * @see com.Service.BlogService#findAllBlogInfo()
	 */
	@Override
	public String findAllBlogInfo() {
		// TODO 返回JSON格式字符串
		con = DataBaseUtil.getCon();
		try {
			bd = new BlogDaoImpl(con);
			JSONArray dataArray = JSONArray.parseArray(JSON.toJSONString(bd.findAllBlogInfo()));
			JSONObject jsonMainObj = new JSONObject();
			jsonMainObj.put("data", dataArray);
			return jsonMainObj.toJSONString();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DataBaseUtil.closeAll(null, null, con);
		}
		return null;
	}

	/* 提交从Servlet传入的ID，返回JSON格式对象
	 * @see com.Service.BlogService#getSelfBlog(int)
	 */
	@Override
	public String getSelfBlog(int ID) {
		// TODO 提交从Servlet传入的ID，返回JSON格式对象
		con = DataBaseUtil.getCon();
		try {
			bd = new BlogDaoImpl(con);
			return JSON.toJSONString(bd.getSelfBlog(ID));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DataBaseUtil.closeAll(null, null, con);
		}
		return null;
	}

	/* 返回对应博文ID的阅读量
	 * @see com.Service.BlogService#addReadNum(int, int)
	 */
	@Override
	public boolean modReadNum(int ID, int readNum) {
		// TODO 返回对应博文ID的阅读量
		con = DataBaseUtil.getCon();
		try {
			bd = new BlogDaoImpl(con);
			if (bd.modReadNum(ID, readNum)) 
				return true;
			else 
				return false;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DataBaseUtil.closeAll(null, null, con);
		}
		return false;
	}

	/* 返回JSON格式对象数组
	 * @see com.Service.BlogService#sendBlogClickTop10()
	 */
	@Override
	public String sendBlogClickTop10() {
		// TODO 返回JSON格式对象数组
		con = DataBaseUtil.getCon();
		try {
			bd = new BlogDaoImpl(con);
			return JSON.toJSONString(bd.getBlogClickTop10());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DataBaseUtil.closeAll(null, null, con);
		}
		return null;
	}

	/* 传入需要查询的字符串，返回JSON格式对象数组
	 * @see com.Service.BlogService#sendBlogFromStr(java.lang.String)
	 */
	@Override
	public String sendBlogFromStr(String str) {
		// TODO 传入需要查询的字符串，返回JSON格式对象数组
		con = DataBaseUtil.getCon();
		try {
			bd = new BlogDaoImpl(con);
			return JSON.toJSONString(bd.findBlogFromStr(str));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DataBaseUtil.closeAll(null, null, con);
		}
		return null;
	}

	/* 返回标签与博文数量的JSON数组
	 * @see com.Service.BlogService#sendAllCount()
	 */
	@Override
	public String sendAllCount() {
		// TODO 返回标签与博文数量的JSON数组
		con = DataBaseUtil.getCon();
		try {
			bd = new BlogDaoImpl(con);
			return JSON.toJSONString(bd.getAllCount());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DataBaseUtil.closeAll(null, null, con);
		}
		return null;
	}

	/* 传入博文ID，返回日期
	 * @see com.Service.BlogService#findBlogPublishTime(int)
	 */
	@Override
	public Date findBlogPublishTime(int ID) {
		// TODO 传入博文ID，返回日期
		con = DataBaseUtil.getCon();
		try {
			bd = new BlogDaoImpl(con);
			BlogInfo bi = bd.findBlogInfoByID(ID);
			return bi.getPublishTime();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DataBaseUtil.closeAll(null, null, con);
		}
		return null;
	}

}
