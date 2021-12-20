/**  
 * @Title: TagService.java
 * @Package com.Service
 * @Description: TODO(执行TagDao中的所有方法)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月16日 下午3:17:06
 * @version V1.0  
 * */
package com.Service;

import java.util.List;

import com.Entity.Page;
import com.Entity.Tag;

/**
 * @ClassName: TagService
 * @Description: TODO(执行TagDao中方法的接口)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月16日 下午3:17:06
 * */
public interface TagService {
	
	boolean addTag(String TagName);
	
	boolean delTag(int TagID);
	
	/**
	 * @Title: modifyTag
	 * @Description: TODO(根据点选的标签的ID修改标签的名称)
	 * @param newTag 旧ID与新名称の实例
	 */
	boolean modifyTag(Tag newTag);
	
	List<Tag> findAllTag();
	
	/**
	 * @Title: findTagByPage
	 * @Description: TODO(返回Json字符串类型的TagList)
	 * @param p 
	 * @return String Json格式的普通字符串
	 */
	String findTagByPage(Page p);
	
	/**
	 * @Title: findTagByID
	 * @Description: TODO(返回Json字符串类型的Tag)
	 * @param ID
	 * @return String json类型的Tag
	 */
	String findTagByID(int ID);
	
	int getTagCount();
}
