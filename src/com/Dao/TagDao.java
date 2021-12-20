/**  
 * @Title: TagDao.java
 * @Package com.Dao
 * @Description: TODO(声明标签的增删改查)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月16日 下午2:51:26
 * @version V1.0  
 * */
package com.Dao;

import java.util.List;

import com.Entity.Page;
import com.Entity.Tag;

/**
 * @ClassName: TagDao
 * @Description: TODO(数据操作接口（标签类）)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月16日 下午2:51:26
 *
 * */
public interface TagDao {
	
	/**
	 * @Title: addTag
	 * @Description: TODO(根据标签名称添加标签)
	 * @param TagName 标签名称
	 * @return boolean 为真，添加成功，反之亦然
	 */
	boolean addTag(String TagName);

	/**
	 * @Title: delTag
	 * @Description: TODO(根据点选的标签的ID删除标签)
	 * @param TagID 点选删除的标签的ID
	 * @return boolean 为真，删除成功，反之亦然
	 *
	 */
	boolean delTag(int TagID);
	
	/**
	 * @Title: modifyTag
	 * @Description: TODO(根据点选的标签的ID修改标签的名称)
	 * @param TagID 点选的标签的ID
	 * @param NewTagName 新的标签名称
	 * @return boolean 为真，修改成功，反之亦然
	 */
	boolean modifyTag(int TagID,String NewTagName);
	
	/**
	 * @Title: findAllTag
	 * @Description: TODO(根据名称查找单个标签（用于查重）)
	 * @return int 已经存在的标签数量
	 */
	int findEqTag(String TagName);
	
	/**
	 * @Title: getAllTag
	 * @Description: TODO(根据名称查找总标签数量（用于获取总条数）)
	 * @return int 已经存在的标签数量
	 */
	int getTagCount();
	
	/**
	 * @Title: findAllTag
	 * @Description: TODO(查找所有标签)
	 * @return List<Tag> 包括所有标签的List
	 */
	List<Tag> findAllTag();
	
	/**
	 * @Title: findAllTag
	 * @Description: TODO(根据页码查找对应标签)
	 * @param p 保存当前页条数与
	 * @return List<Tag> 包括限制标签量的List
	 */
	List<Tag> findTagByPage(Page p);
	
	/**
	 * @Title: HasBlogByTagID
	 * @Description: TODO(查找是否有对应标签在博文中)
	 * @param ID 标签ID
	 * @return boolean 返回是否存在符合条件的博文
	 */
	boolean HasBlogByTagID(int ID);
	
	/**
	 * @Title: findBlogNumByTagID
	 * @Description: TODO(根据标签ID查找对应博文数量)
	 * @param ID 标签数量
	 * @return int 博文数量
	 */
	int findBlogNumByTagID(int ID);
	
	/**
	 * @Title: findTagByID
	 * @Description: TODO(找到指定ID的Tag)
	 * @param ID 需要查询的TagID
	 * @return Tag Tag对象
	 */
	Tag findTagByID(int ID);
	
}
