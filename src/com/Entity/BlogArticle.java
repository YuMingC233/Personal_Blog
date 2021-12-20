/**  
 * @Title: BlogArticle.java
 * @Package com.Entity
 * @Description: TODO(存储博文正文)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月18日 下午3:17:40
 * @version V1.0  
 * */
package com.Entity;

import java.io.InputStream;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * @ClassName: BlogArticle
 * @Description: TODO(博文正文存储类)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月18日 下午3:17:40
 *
 * */
public class BlogArticle {
	@JSONField(name = "PublishTime")
	private Date PublishTime;	// 博文发布时间
	
	@JSONField(name = "BlogContent")
	private String BlogContent;	// 博文纯文本正文

	@JSONField(name = "BlogHTML")
	private String BlogHTML;	// 博文html格式正文
	
	@JSONField(name = "BlogImageName")
	private String BlogImageName;	// 博文展示视图中的图片名称

	@JSONField(name = "BlogImageByte")
	private byte[] BlogImageByte;	// 博文展示视图中的图片，在正文中不会出现
	
	@JSONField(name = "BlogImageIS")
	private InputStream BlogImageIS;	// 图片数据流，用于写入图片
	
	public BlogArticle() {}

	/**
	 * @return the publishTime
	 */
	public Date getPublishTime() {
		return PublishTime;
	}

	/**
	 * @param publishTime
	 * @param blogContent
	 * @param blogHTML
	 * @param blogImageName
	 * @param blogImageByte
	 */
	public BlogArticle(Date publishTime, String blogContent, String blogHTML, String blogImageName,
			byte[] blogImageByte) {
		super();
		PublishTime = publishTime;
		BlogContent = blogContent;
		BlogHTML = blogHTML;
		BlogImageName = blogImageName;
		BlogImageByte = blogImageByte;
	}

	/**
	 * @param publishTime
	 * @param blogContent
	 * @param blogHTML
	 * @param blogImageName
	 * @param blogImageIS
	 */
	public BlogArticle(Date publishTime, String blogContent, String blogHTML, String blogImageName,
			InputStream blogImageIS) {
		super();
		PublishTime = publishTime;
		BlogContent = blogContent;
		BlogHTML = blogHTML;
		BlogImageName = blogImageName;
		BlogImageIS = blogImageIS;
	}

	/**
	 * @param publishTime the publishTime to set
	 */
	public void setPublishTime(Date publishTime) {
		PublishTime = publishTime;
	}

	/**
	 * @return the blogImageIS
	 */
	public InputStream getBlogImageIS() {
		return BlogImageIS;
	}

	/**
	 * @param blogImageIS the blogImageIS to set
	 */
	public void setBlogImageIS(InputStream blogImageIS) {
		BlogImageIS = blogImageIS;
	}
	
	/**
	 * @return the blogContent
	 */
	public String getBlogContent() {
		return BlogContent;
	}

	/**
	 * @param blogContent the blogContent to set
	 */
	public void setBlogContent(String blogContent) {
		BlogContent = blogContent;
	}

	/**
	 * @return the blogHTML
	 */
	public String getBlogHTML() {
		return BlogHTML;
	}

	/**
	 * @param blogHTML the blogHTML to set
	 */
	public void setBlogHTML(String blogHTML) {
		BlogHTML = blogHTML;
	}

	/**
	 * @return the blogImageName
	 */
	public String getBlogImageName() {
		return BlogImageName;
	}

	/**
	 * @param blogImageName the blogImageName to set
	 */
	public void setBlogImageName(String blogImageName) {
		BlogImageName = blogImageName;
	}

	/**
	 * @return the blogImageByte
	 */
	public byte[] getBlogImageByte() {
		return BlogImageByte;
	}

	/**
	 * @param blogImageByte the blogImageByte to set
	 */
	public void setBlogImageByte(byte[] blogImageByte) {
		BlogImageByte = blogImageByte;
	}

}
