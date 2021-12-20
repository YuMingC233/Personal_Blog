/**  
 * @Title: TagServiceImpl.java
 * @Package com.Service.impl
 * @Description: TODO(实现所有对应服务接口)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月16日 下午3:25:04
 * @version V1.0  
 * */
package com.Service.impl;

import java.sql.Connection;
import java.util.List;

import com.Dao.TagDao;
import com.Dao.impl.TagDaoImpl;
import com.Entity.Page;
import com.Entity.Tag;
import com.Service.TagService;
import com.alibaba.fastjson.JSON;
import com.util.DataBaseUtil;

/**
 * @ClassName: TagServiceImpl
 * @Description: TODO(TagService接口实现类)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月16日 下午3:25:04
 *
 * */
public class TagServiceImpl implements TagService {
	Connection con;
	boolean flag = false;
	TagDao td = null;
	
	/* (non-Javadoc)
	 * @see com.Service.TagService#addTag(java.lang.String)
	 */
	@Override
	public boolean addTag(String TagName) {
		// TODO 增加标签，因为输入框传入的值可以为多个，且由 , 分割，所以要写判断传入的数据是否存在 ,
		con = DataBaseUtil.getCon();
		if (TagName.indexOf(",") > 0) {
			String[] temp = TagName.split(",");
			try {
				con.setAutoCommit(false);
				// 关闭数据库事务的手动提交
				td = new TagDaoImpl(con);
				for (String str : temp) {
					if (td.findEqTag(str) == 0) {
						// 提交事务
						td.addTag(str);
						con.commit();
						continue;
					} else
						return false;
				}
				return true;
			} catch (Exception e) {
				// TODO: 当添加失败时，回滚事务
				DataBaseUtil.rollbackWork(con);
			} finally {
				DataBaseUtil.closeAll(null, null, con);
			}
			return false;
		} else {
			try {
				// 关闭数据库事务的手动提交
				con.setAutoCommit(false);
				td = new TagDaoImpl(con);
				if (td.findEqTag(TagName) == 0) {
					// 提交事务
					flag = td.addTag(TagName);
					con.commit();
					return flag;
				} else
					return false;
			} catch (Exception e) {
				// TODO: 当添加失败时，回滚事务
				DataBaseUtil.rollbackWork(con);
			} finally {
				DataBaseUtil.closeAll(null, null, con);
			}
		}
		return false;
	}

	/* (non-Javadoc)
	 * @see com.Service.TagService#delTag(int)
	 */
	@Override
	public boolean delTag(int TagID) {
		// TODO 删除标签
		con = DataBaseUtil.getCon();
		try {
			// 关闭数据库事务的手动提交
			con.setAutoCommit(false);
			td = new TagDaoImpl(con);
			flag = td.delTag(TagID);
			// 提交事务
			con.commit();
			return flag;
		} catch (Exception e) {
			// TODO: 当删除失败时，回滚事务
			DataBaseUtil.rollbackWork(con);
		} finally {
			DataBaseUtil.closeAll(null, null, con);
		}
		return false;
	}

	/* (non-Javadoc)
	 * @see com.Service.TagService#modifyTag(com.Entity.Tag)
	 */
	@Override
	public boolean modifyTag(Tag nt) {
		// TODO 修改标签
		con = DataBaseUtil.getCon();
		try {
			// 关闭数据库事务的手动提交
			con.setAutoCommit(false);
			td = new TagDaoImpl(con);
			flag = td.modifyTag(nt.getID(), nt.getName());
			// 提交事务
			con.commit();
			return flag;
		} catch (Exception e) {
			// TODO: 当修改失败时，回滚事务
			DataBaseUtil.rollbackWork(con);
		} finally {
			DataBaseUtil.closeAll(null, null, con);
		}
		return false;
	}

	/* (non-Javadoc)
	 * @see com.Service.TagService#findAllTag()
	 */
	@Override
	public List<Tag> findAllTag() {
		// TODO 返回所有标签
		con = DataBaseUtil.getCon();
		try {
			td = new TagDaoImpl(con);
			return td.findAllTag();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DataBaseUtil.closeAll(null, null, con);
		}
		return null;
	}

	/* (non-Javadoc)
	 * @see com.Service.TagService#findTagByPage(com.Entity.Page)
	 */
	@Override
	public String findTagByPage(Page p) {
		// TODO 通过传入的分页类返回对象JSON数组
		con = DataBaseUtil.getCon();
		try {
			td = new TagDaoImpl(con);
			// 将传入的list转换为Json
			return JSON.toJSONString(td.findTagByPage(p));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DataBaseUtil.closeAll(null, null, con);
		}
		return null;
	}

	/* (non-Javadoc)
	 * @see com.Service.TagService#getTagCount()
	 */
	@Override
	public int getTagCount() {
		// TODO 返回标签总数量
		con = DataBaseUtil.getCon();
		try {
			td = new TagDaoImpl(con);
			return td.getTagCount();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DataBaseUtil.closeAll(null, null, con);
		}
		return -1;
	}

	/* (non-Javadoc)
	 * @see com.Service.TagService#findTagByID(int)
	 */
	@Override
	public String findTagByID(int ID) {
		// TODO 通过传入的标签ID寻找标签，返回JSON对象
		con = DataBaseUtil.getCon();
		try {
			td = new TagDaoImpl(con);
			return JSON.toJSONString(td.findTagByID(ID));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DataBaseUtil.closeAll(null, null, con);
		}
		return null;
	}

	
}
