/**  
 * @Title: TagDaoImpl.java
 * @Package com.Dao.impl
 * @Description: TODO(实现所有TagDao中的方法)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月16日 下午3:02:00
 * @version V1.0  
 * */
package com.Dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Dao.BaseDao;
import com.Dao.TagDao;
import com.Entity.Page;
import com.Entity.Tag;

/**
 * @ClassName: TagDaoImpl
 * @Description: TODO(tagDao实现)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月16日 下午3:02:00
 *
 * */
public class TagDaoImpl extends BaseDao implements TagDao {
	String sqlCode;
	
	/**
	 * @param con
	 */
	public TagDaoImpl(Connection con) {
		super(con);
		// TODO Auto-generated constructor stub
	}

	/* (non-Javadoc)
	 * @see com.Dao.TagDao#addTag(java.lang.String)
	 */
	@Override
	public boolean addTag(String TagName) {
		// TODO 添加标签
		sqlCode = "insert into Tag(Name) value (?);";
		Object[] param = {TagName};
		if (excuteUpdate(sqlCode, param) > 0)
			return true;
		else 
			return false;
	}

	/* (non-Javadoc)
	 * @see com.Dao.TagDao#delTag(int)
	 */
	@Override
	public boolean delTag(int TagID) {
		// TODO 删除标签
		if (!HasBlogByTagID(TagID)) {
			sqlCode = "delete from Tag where ID = ?;";
			Object[] param = {TagID};
			if (excuteUpdate(sqlCode, param) > 0)
				return true;
			else 
				return false;
		} else 
			return false;
	}

	/* (non-Javadoc)
	 * @see com.Dao.TagDao#modifyTag(int, java.lang.String)
	 */
	@Override
	public boolean modifyTag(int TagID, String NewTagName) {
		// TODO 修改标签
		sqlCode = "update Tag set Name = ? where ID = ?;";
		Object[] param = {NewTagName, TagID};
		if (excuteUpdate(sqlCode, param) > 0)
			return true;
		else 
			return false;
	}

	/* (non-Javadoc)
	 * @see com.Dao.TagDao#findAllTag()
	 */
	@Override
	public List<Tag> findAllTag() {
		// TODO 返回所有在数据库中的标签
		sqlCode = "select ID, Name from Tag;";
		ResultSet rs = excuteQuery(sqlCode, null);
		List<Tag> temp = new ArrayList<Tag>();
		try {
			while (rs.next()) {
				int ID = rs.getInt(1);
				temp.add(new Tag(ID, rs.getString(2), findBlogNumByTagID(ID)));
			}
			return temp;
		} catch (SQLException e) {
			// TODO 
			log.warn(""+e.getMessage());
		}
		return null;
	}

	/* (non-Javadoc)
	 * @see com.Dao.TagDao#findOneTag()
	 */
	@Override
	public int findEqTag(String TagName) {
		// TODO Auto-generated method stub
		sqlCode = "select count(Name) from Tag where Name = ?;";
		Object[] param = {TagName};
		ResultSet rs = excuteQuery(sqlCode, param);
		try {
			if (rs.next()) 
				return rs.getInt(1);
			else 
				return -1;				
		} catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
	}

	/* (non-Javadoc)
	 * @see com.Dao.TagDao#findTagByPage(int, int)
	 */
	@Override
	public List<Tag> findTagByPage(Page p) {
		// TODO Auto-generated method stub
		// 从哪里开始，往下数几个
		sqlCode = "select ID, Name from Tag limit ?, ?;";
		Object[] tempObj = {(p.getCurrPage() - 1) * p.getPageSize(), p.getPageSize()};
		ResultSet rs = excuteQuery(sqlCode, tempObj);
		List<Tag> temp = new ArrayList<Tag>();
		try {
			while (rs.next()) 
				temp.add(new Tag(rs.getInt(1),rs.getString(2)));
			return temp;
		} catch (SQLException e) {
			// TODO 
			log.warn(""+e.getMessage());
		}
		return null;
	}

	/* (non-Javadoc)
	 * @see com.Dao.TagDao#getTagCount()
	 */
	@Override
	public int getTagCount() {
		// TODO Auto-generated method stub
		sqlCode = "select count(Name) from Tag;";
		ResultSet rs = excuteQuery(sqlCode, null);
		try {
			if (rs.next()) 
				return rs.getInt(1);
			else 
				return -1;				
		} catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
	}

	/* (non-Javadoc)
	 * @see com.Dao.TagDao#HasBlogByTagID(int)
	 */
	@Override
	public boolean HasBlogByTagID(int ID) {
		// TODO Auto-generated method stub
		sqlCode = "select TagsID from BlogInfo;";
		ResultSet rs = excuteQuery(sqlCode, null);
		try {
			StringBuffer sbTemp = new StringBuffer();
			while (rs.next()) {
				sbTemp.append(rs.getString(1));
			}
			if (sbTemp.indexOf(Integer.toString(ID)) > -1) 
				return true;
		} catch (Exception e) {
			// TODO: handle exception
			log.warn(e.getMessage());
		}
		return false;
	}
	
	/* (non-Javadoc)
	 * @see com.Dao.TagDao#findBlogNumByTagID(int)
	 */
	@Override
	public int findBlogNumByTagID(int ID) {
		// TODO Auto-generated method stub
		sqlCode = "select TagsID from BlogInfo;";
		ResultSet rs = excuteQuery(sqlCode, null);
		int count = 0;
		String[] sTemp;
		try {
			while (rs.next()) {
				sTemp = rs.getString(1).split(",");
				for (String str : sTemp) {
					if (Integer.parseInt(str) == ID) {
						count++;
						break;
					} else
						continue;
				}
				sTemp = null;
			}
				return count;
		} catch (Exception e) {
			// TODO: handle exception
			log.warn(e.getMessage());
		}
		return -1;
	}

	/* (non-Javadoc)
	 * @see com.Dao.TagDao#findTagByID(int)
	 */
	@Override
	public Tag findTagByID(int ID) {
		// TODO Auto-generated method stub
		sqlCode = "select Name from Tag where ID = ?;";
		Object[] temp = {ID};
		ResultSet rs = excuteQuery(sqlCode, temp);
		try {
			while (rs.next()) 
				return new Tag(ID,rs.getString(1));
		} catch (Exception e) {
			// TODO: handle exception
			log.warn(e.getMessage());
		}
		return null;
	
	}


}
