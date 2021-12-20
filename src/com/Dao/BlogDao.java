/**  
 * @Title: BlogDao.java
 * @Package com.Dao
 * @Description: TODO(用一句话描述该文件做什么)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月18日 下午3:29:26
 * @version V1.0  
 * */
package com.Dao;

import java.util.Date;
import java.util.List;

import com.Entity.BlogArticle;
import com.Entity.BlogInfo;

/**
 * @ClassName: BlogDao
 * @Description: TODO(数据操作接口（博文）)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月18日 下午3:29:26
 *
 * */
public interface BlogDao {
	
	/**
	 * @Title: addBlog
	 * @param BlogInfo 博客基本信息
	 * @param BlogArticle 博客正文
	 * @Description: TODO(添加博文)
	 * @return boolean 为真，添加成功，反之亦然
	 */
	boolean addBlog(BlogInfo bi, BlogArticle ba);
	
	/**
	 * @Title: delBlog
	 * @Description: TODO(根据博文ID删除博客)
	 * @param BlogID 博文唯一ID
	 * @return boolean 为真，删除成功，反之亦然
	 */
	boolean delBlog(int BlogID);
	
	/**
	 * @Title: modBlog
	 * @Description: TODO(根据传入的所有信息中的ID修改博文)
	 * @param oldBi 修改前的博文基本信息
	 * @param newBi 修改后的博文基本信息，不包括发布时间
	 * @param ba 修改后的博文正文
	 * @return boolean 是否修改成功
	 */
	boolean modBlog(BlogInfo oldBi,BlogInfo newBi, BlogArticle ba);
	
	/**
	 * @Title: findAllBlog
	 * @Description: TODO(找到所有博客的对应信息并保存至键值对列表中)
	 * @return HashMap<BlogInfo,BlogArticle>    返回类型
	 * .注意，hashMap不能存在重复的信息！
	 */
	List<BlogArticle> findAllBlogArticle();
	
	/**
	 * @Title: findBlogInfo
	 * @Description: TODO(查找所有博文实例并保存在List中)
	 * @param 设定文件
	 * @return BlogInfo 所有博文实例
	 */
	List<BlogInfo> findAllBlogInfo();
	
	/**
	 * @Title: findBlogFromStr
	 * @Description: TODO(通过传入的字符串模糊查找文章，根据标题与正文内容)
	 * @param str 传入的搜索内容
	 * @return List<BlogInfo>  查找成功后的文章基本信息List
	 */
	List<BlogInfo> findBlogFromStr(String str);
	
	/**
	 * @Title: getSelfBlog
	 * @Description: TODO(通过ID获取博文以及基本信息，用于修改)
	 * @param ID 博文基本信息ID
	 * @return HashMap<BlogInfo,BlogArticle>    返回类型
	 */
	List<Object> getSelfBlog(int ID);
	
	/**
	 * @Title: findBlogArticleByID
	 * @Description: TODO(找到对应发布时间的博文正文)
	 * @param PublishTime 博文发布时间
	 * @return BlogArticle 博文正文实例
	 */
	BlogArticle findBlogArticleByPublishTime(Date PublishTime);
	
	/**
	 * @Title: findBlogInfoByPublishTime
	 * @Description: TODO(根据ID查找对应博文的发布时间)
	 * @param ID 博文ID
	 * @return BlogInfo 博文实体类
	 */
	BlogInfo findBlogInfoByID(int ID);
	
	/**
	 * @Title: modReadNum
	 * @Description: TODO(根据ID修改阅读数量)
	 * @param ID
	 * @param readNum
	 * @return boolean 修改成功与否
	 */
	boolean modReadNum(int ID,int readNum);
	
	/**
	 * @Title: getBlogClickTop10
	 * @Description: TODO(获取博文点击量前十)
	 * @return TreeSet<BlogInfo> 有序博文实例，正序
	 */
	List<BlogInfo> getBlogClickTop10();
	
	/**
	 * @Title: getAllCount
	 * @Description: TODO(获取所有信息(标签、博文)的计数)
	 * @return List<Integer> 所有计数信息
	 */
	List<Integer> getAllCount();
}
