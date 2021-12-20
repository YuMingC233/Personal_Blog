/**  
 * @Title: Tag.java
 * @Package com.Entity
 * @Description: TODO(声明标签实例)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月16日 下午2:49:30
 * @version V1.0  
 * */
package com.Entity;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * @ClassName: Tag
 * @Description: TODO(标签属性（ID、名称）)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月16日 下午2:49:30
 *
 * */
public class Tag {
	@JSONField(name = "ID")
	private int ID;
	@JSONField(name = "Name")
	private String Name;
	@JSONField(name = "HaveBlogNum")
	private int HaveBlogNum;
	
	public Tag() {};
	
	/**
	 * @param iD
	 * @param name
	 */
	public Tag(int iD, String name) {
		super();
		ID = iD;
		Name = name;
	}
	
	
	/**
	 * @param iD
	 * @param name
	 */
	public Tag(int iD, String name, int haveBlogNum) {
		super();
		ID = iD;
		Name = name;
		HaveBlogNum = haveBlogNum;
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
	 * @return the name
	 */
	public String getName() {
		return Name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		Name = name;
	}

	/**
	 * @return the haveBlogNum
	 */
	public int getHaveBlogNum() {
		return HaveBlogNum;
	}

	/**
	 * @param haveBlogNum the haveBlogNum to set
	 */
	public void setHaveBlogNum(int haveBlogNum) {
		HaveBlogNum = haveBlogNum;
	}
}
