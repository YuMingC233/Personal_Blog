/**  
 * @Title: BlogDao.java
 * @Package com.Service
 * @Description: TODO(执行BlogDao中的所有方法)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月18日 下午5:31:42
 * @version V1.0  
 * */
package com.Service;

import java.util.Date;

import com.Entity.BlogArticle;
import com.Entity.BlogInfo;

/**
 * @ClassName: BlogDao
 * @Description: TODO(执行BlogDao中方法的接口)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月18日 下午5:31:42
 *
 * */
public interface BlogService {
	
	boolean addBlog(BlogInfo bi, BlogArticle ba);
	
	boolean delBlog(int ID);
	
	boolean modBlog(BlogInfo bi, BlogArticle ba);
	
	boolean modReadNum(int ID,int readNum);
	
	/**
	 * @Title: findAllBlog
	 * @Description: TODO(查找所有博文正文)
	 * @return String 返回HashMap
	 */
	String findAllBlogArticle();
	
	/**
	 * @Title: findAllBlogInfo
	 * @Description: TODO(查找所有博文基本信息)
	 * @return String 返回对应的json对象
	 */
	String findAllBlogInfo();
	
	Date findBlogPublishTime(int ID);
	
	String getSelfBlog(int ID);
	
	/**
	 * @Title: sendBlogClickTop10
	 * @Description: TODO(将排行前10的博文使用json Send 到前端)
	 * @return String json类型字符串
	 */
	String sendBlogClickTop10();
	
	/**
	 * @Title: sendBlogFromStr
	 * @Description: TODO(将模糊查找的指定BlogInfo Send 到前端)
	 * @return String json类型字符串
	 */
	String sendBlogFromStr(String str);

	/**
	 * @Title: sendAllCount
	 * @Description: TODO(返回json 计数信息)
	 * @return String json信息
	 */
	String sendAllCount();
}
