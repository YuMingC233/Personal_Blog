/**  
 * @Title: BlogInfo.java
 * @Package com.Entity
 * @Description: TODO(存储博文基本信息（非正文）)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月18日 下午3:09:31
 * @version V1.0  
 * */
package com.Entity;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * @ClassName: BlogInfo
 * @Description: TODO(博文基本信息存储类)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月18日 下午3:09:31
 *
 * */
public class BlogInfo {
	/**
	 * . Description 与 BlogArticle.BlogImage 
	 * . 均为展示视图中的信息
	 * . 并非正文中的内容
	 */
	
	@JSONField(name = "ID")
	private int ID;					// 博文ID
	
	@JSONField(name = "Title")
	private String Title;			// 博文一级标题 <h1>标签中的内容
	
	@JSONField(name = "Writer")
	private String Writer;			// 博文作者
	
	@JSONField(name = "isOriginal")
	private boolean isOriginal;		// 是否为原创
	
	@JSONField(name = "TagsID")
	private String TagsID;			// 标签ID集合
	
	@JSONField(name = "Description")
	private String Description;		// 博文展示视图中的描述
	
	@JSONField(name = "ReadNum")
	private int ReadNum;			// 点击量
	
	@JSONField(name = "CommentNum")
	private int CommentNum;			// 评论量
	
	@JSONField(name = "PublishTime")
	private Date PublishTime;		// 发布时间
	
	@JSONField(name = "LastUpdateTime")
	private Date LastUpdateTime;	// 最后一次修改时间
	
	
	public BlogInfo() {}

	/**
	 * @param iD
	 * @param title
	 * @param readNum
	 * @param publishTime
	 * 排行中的对象
	 */
	public BlogInfo(int iD, String title, int readNum, Date publishTime) {
		super();
		ID = iD;
		Title = title;
		ReadNum = readNum;
		PublishTime = publishTime;
	}

	/**
	 * @param iD
	 * @param title
	 * @param writer
	 * @param isOriginal
	 * @param tagsID
	 * @param description
	 * @param readNum
	 * @param commentNum
	 * @param publishTime
	 * @param lastUpdateTime
	 */
	public BlogInfo(int iD, String title, String writer, boolean isOriginal, String tagsID, String description,
			int readNum, int commentNum, Date publishTime, Date lastUpdateTime) {
		super();
		ID = iD;
		Title = title;
		Writer = writer;
		this.isOriginal = isOriginal;
		TagsID = tagsID;
		Description = description;
		ReadNum = readNum;
		CommentNum = commentNum;
		PublishTime = publishTime;
		LastUpdateTime = lastUpdateTime;
	}

	/**
	 * @return the iD
	 */
	public int getID() {
		return ID;
	}

	/**
	 * @param iD the iD to set
	 */
	public void setID(int iD) {
		ID = iD;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return Title;
	}

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		Title = title;
	}

	/**
	 * @return the writer
	 */
	public String getWriter() {
		return Writer;
	}

	/**
	 * @param writer the writer to set
	 */
	public void setWriter(String writer) {
		Writer = writer;
	}

	/**
	 * @return the isOriginal
	 */
	public boolean isOriginal() {
		return isOriginal;
	}

	/**
	 * @param isOriginal the isOriginal to set
	 */
	public void setOriginal(boolean isOriginal) {
		this.isOriginal = isOriginal;
	}

	/**
	 * @return the tagsID
	 */
	public String getTagsID() {
		return TagsID;
	}

	/**
	 * @param tagsID the tagsID to set
	 */
	public void setTagsID(String tagsID) {
		TagsID = tagsID;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return Description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		Description = description;
	}

	/**
	 * @return the readNum
	 */
	public int getReadNum() {
		return ReadNum;
	}

	/**
	 * @param readNum the readNum to set
	 */
	public void setReadNum(int readNum) {
		ReadNum = readNum;
	}

	/**
	 * @return the commentNum
	 */
	public int getCommentNum() {
		return CommentNum;
	}

	/**
	 * @param commentNum the commentNum to set
	 */
	public void setCommentNum(int commentNum) {
		CommentNum = commentNum;
	}

	/**
	 * @return the publishTime
	 */
	public Date getPublishTime() {
		return PublishTime;
	}

	/**
	 * @param publishTime the publishTime to set
	 */
	public void setPublishTime(Date publishTime) {
		PublishTime = publishTime;
	}

	/**
	 * @return the lastUpdateTime
	 */
	public Date getLastUpdateTime() {
		return LastUpdateTime;
	}

	/**
	 * @param lastUpdateTime the lastUpdateTime to set
	 */
	public void setLastUpdateTime(Date lastUpdateTime) {
		LastUpdateTime = lastUpdateTime;
	}
}
