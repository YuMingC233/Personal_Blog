/**  
 * @Title: BlogDaoImpl.java
 * @Package com.Dao.impl
 * @Description: TODO(BlogDao接口中所有的方法实现)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月18日 下午4:33:47
 * @version V1.0  
 * */
package com.Dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.Dao.BaseDao;
import com.Dao.BlogDao;
import com.Entity.BlogArticle;
import com.Entity.BlogInfo;

/**
 * @ClassName: BlogDaoImpl
 * @Description: TODO(实现BlogDao接口中所有的方法)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月18日 下午4:33:47
 *
 * */
public class BlogDaoImpl extends BaseDao implements BlogDao {
	String sqlCode;

	/**
	 * @param con
	 */
	public BlogDaoImpl(Connection con) {
		super(con);
	}

	/* (non-Javadoc)
	 * @see com.Dao.BlogDao#addBlog( com.Entity.BlogInfo, com.Entity.BlogArticle)
	 */
	@Override
	public boolean addBlog(BlogInfo bi, BlogArticle ba) {
		// TODO 添加博文
		// 首先添加博文基本信息
		sqlCode = "insert into BlogInfo"
				+ "(`Title`, `Writer`, `isOriginal`," + 
				  " `TagsID`, `Description`, `ReadNum`, " + 
				  " `CommentNum`, `PublishTime`, `LastUpdateTime`) " + 
				  "value (?, ?, ?, ?, ?, ?, ?, ?, ?);";
		Object[] Info = {
			 bi.getTitle(),bi.getWriter(),bi.isOriginal(),
			 bi.getTagsID(),bi.getDescription(),bi.getReadNum(),
			 bi.getCommentNum(),bi.getPublishTime(),bi.getLastUpdateTime()
		};
		
		if (excuteUpdate(sqlCode, Info) > 0) {
			// 最后添加正文信息
			sqlCode = "insert into BlogArticle(`PublishTime`, `BlogText_Content`,"
					+ "`BlogText_HTML`, `BlogImageName`, `BlogImageByte`) " + 
					  "value (?, ?, ?, ?, ?);";
			if (excuteUpdateArticle(sqlCode, bi.getPublishTime(), ba.getBlogContent(), 
					ba.getBlogHTML(), ba.getBlogImageName(), ba.getBlogImageIS()) > 0) 
				return true;
			return false;
		}
		return false;
	}

	/* (non-Javadoc)
	 * @see com.Dao.BlogDao#delBlog(int)
	 */
	@Override
	public boolean delBlog(int ID) {
		// TODO 根据Id删除博文（博文正文与博文基本信息）
		BlogInfo bi = findBlogInfoByID(ID);
		sqlCode = "delete from BlogArticle where PublishTime = ?;";
		Object[] temp = { bi.getPublishTime() };
		if (excuteUpdate(sqlCode, temp) > 0) {
			sqlCode = "delete from BlogInfo where ID = ?;";
			Object[] Time = { ID };
			if (excuteUpdate(sqlCode, Time) > 0) 
				return true;
			return false;
		}
		return false;
	}
	
	/* (non-Javadoc)
	 * @see com.Dao.BlogDao#modBlog(com.Entity.BlogInfo, com.Entity.BlogArticle)
	 */
	@Override
	public boolean modBlog(BlogInfo oldBi, BlogInfo newBi, BlogArticle ba) {
		// TODO 根据博文相关类的所有信息修改现有博文
		// 不需要填写发布时间，没写对应的sql表达式
		sqlCode = "update BlogInfo " + 
				  "set `Title` = ?," + 
				  	  "`Writer` = ?," + 
				  	  "`isOriginal` = ?," + 
				  	  "`TagsID` = ?," + 
				  	  "`Description` = ?," + 
				  	  "`LastUpdateTime` = ? " + 
				  "where `ID` = ?;";
		Object[] Info = {
			 newBi.getTitle(),newBi.getWriter(),newBi.isOriginal(),
			 newBi.getTagsID(),newBi.getDescription(),
			 newBi.getLastUpdateTime(),newBi.getID()
		};
		if (excuteUpdate(sqlCode, Info) > 0) {
			if (ba.getBlogImageIS() != null) {
				sqlCode = "update BlogArticle " + 
						  "set `BlogText_Content` = ?," + 
						  	  "`BlogText_HTML` = ?," + 
						  	  "`BlogImageName` = ?," + 
						  	  "`BlogImageByte` = ? " + 
						  "where `PublishTime` = ?;";
				Object[] Article = {
						ba.getBlogContent(), ba.getBlogHTML(), ba.getBlogImageName(),
						ba.getBlogImageIS(), ba.getPublishTime()
				};
				if (excuteUpdate(sqlCode, Article) > 0) 
					return true;
			} else {
				sqlCode = "update BlogArticle " + 
						  "set `BlogText_Content` = ?, " + 
						  	  "`BlogText_HTML` = ? " + 
						  "where `PublishTime` = ?;";
				Object[] Article = {
						ba.getBlogContent(), ba.getBlogHTML(), oldBi.getPublishTime()
				};
				if (excuteUpdate(sqlCode, Article) > 0) 
					return true;
			}
			return false;
		}
		return false;
	}
	
	/* (non-Javadoc)
	 * @see com.Dao.BlogDao#findBlogArticleByID(int)
	 */
	@Override
	public BlogArticle findBlogArticleByPublishTime(Date PublishTime) {
		// TODO 根据博文基本信息中的发布时间查找对应博文正文，返回博文正文对象
		sqlCode = "select `BlogText_Content`, `BlogText_HTML`, `BlogImageName`, `BlogImageByte` "
				+ "from BlogArticle where PublishTime = ?;";
		Object[] param = {PublishTime};
		BlogArticle temp = null;
		try {
			ResultSet rs = excuteQuery(sqlCode, param);
			while (rs.next()) {
				temp = new BlogArticle(
							PublishTime, rs.getString(1), rs.getString(2), rs.getString(3), rs.getBytes(4)
						);
			}
			return temp;
		} catch (Exception e) {
			// TODO: handle exception
			log.warn("在查询博文正文时出现错误  " + e.getMessage());
		}
		return null;
	}
	
	/* (non-Javadoc)
	 * @see com.Dao.BlogDao#findBlogInfoByID(int)
	 */
	@Override
	public BlogInfo findBlogInfoByID(int ID) {
		// TODO 通过博文ID查找对应博文
		sqlCode = "select `Title`, `Writer`, "
				+ "`isOriginal`, `TagsID`, `Description`, "
				+ "`ReadNum`, `CommentNum`, `PublishTime`, "
				+ "`LastUpdateTime` "
				+ "from BlogInfo "
				+ "where ID = ?;";
		Object[] param = { ID };
		ResultSet rs = excuteQuery(sqlCode, param);
		try {
				rs.next();
				return new BlogInfo(ID, rs.getString(1),rs.getString(2),rs.getBoolean(3),
									rs.getString(4),rs.getString(5),rs.getInt(6),
									rs.getInt(7),rs.getTimestamp(8),rs.getTimestamp(9)
									);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/* (non-Javadoc)
	 * @see com.Dao.BlogDao#getSelfBlog(int)
	 */
	@Override
	public List<Object> getSelfBlog(int ID) {
		// TODO Auto-generated method stub
		List<Object> temp = new ArrayList<Object>();
		BlogInfo bi = findBlogInfoByID(ID);
		temp.add(bi);
		temp.add(findBlogArticleByPublishTime(bi.getPublishTime()));
		return temp;
	}
	
	/* (non-Javadoc)
	 * @see com.Dao.BlogDao#findBlogInfo()
	 */
	@Override
	public List<BlogInfo> findAllBlogInfo() {
		// TODO 查找所有博文基本信息并返回List集合
		sqlCode = "select `ID`, `Title`, `Writer`, "
				+ "`isOriginal`, `TagsID`, `Description`, "
				+ "`ReadNum`, `CommentNum`, `PublishTime`, "
				+ "`LastUpdateTime` "
				+ "from BlogInfo;";
		List<BlogInfo> temp = new ArrayList<BlogInfo>();
		try {
			ResultSet rs = excuteQuery(sqlCode, null);
			while (rs.next()) {
				temp.add(new BlogInfo(
							rs.getInt(1),rs.getString(2),rs.getString(3),
							rs.getBoolean(4),rs.getString(5),rs.getString(6),
							rs.getInt(7),rs.getInt(8), rs.getTimestamp(9),
							rs.getTimestamp(10)
							));
			}
			return temp;
		} catch (Exception e) {
			// TODO: handle exception
			log.warn("在查询所有博文基本信息时出现错误  " + e.getMessage());
		}
		return null;
	}

	/* (non-Javadoc)
	 * @see com.Dao.BlogDao#findAllBlogArticle()
	 */
	@Override
	public List<BlogArticle> findAllBlogArticle() {
		// TODO 查找所有博文正文并返回为list
		sqlCode = "select `PublishTime`, `BlogText_Content`, `BlogText_HTML`,"
				+ "`BlogImageName`, `BlogImageByte` "
				+ "from BlogArticle;";
		List<BlogArticle> temp = new ArrayList<BlogArticle>();
		try {
			ResultSet rs = excuteQuery(sqlCode, null);
			while (rs.next()) {
				temp.add(new BlogArticle(rs.getTimestamp(1),rs.getString(2),rs.getString(3),
										 rs.getString(4),rs.getBinaryStream(5)));
			}
			return temp;
		} catch (Exception e) {
			// TODO: handle exception
			log.warn("在查询所有博文时出现错误  " + e.getMessage());
		}
		return null;
	}

	/* (non-Javadoc)
	 * @see com.Dao.BlogDao#addReadNum(int, int)
	 */
	@Override
	public boolean modReadNum(int ID, int readNum) {
		// TODO 通过ID修改阅读数量
		sqlCode = "update BlogInfo " + 
				  "set `ReadNum` = ? " + 
				  "where `ID` = ?;";
		Object[] param = {readNum, ID};
		try {
			if (excuteUpdate(sqlCode, param) > 0) 
				return true;
			else 
				return false;
		} catch (Exception e) {
			// TODO: handle exception
			log.warn("在修改指定ID博文阅读数量时出现错误  " + e.getMessage());
		}
		return false;
	}

	/* (non-Javadoc)
	 * @see com.Dao.BlogDao#getBlogClickTop10()
	 */
	@Override
	public List<BlogInfo> getBlogClickTop10() {
		// TODO 获取点击量排行前10的博文
		sqlCode = "select `ID`, `Title`, `ReadNum`, `PublishTime` "
				+ "from BlogInfo "
				+ "order by `ReadNum` desc "
				+ "limit 0,10;";
		List<BlogInfo> temp = new ArrayList<BlogInfo>();
		ResultSet rs = excuteQuery(sqlCode, null);
		try {
			while (rs.next()) {
				temp.add(new BlogInfo(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getTimestamp(4)));
			}
			return temp;	
		} catch (Exception e) {
			// TODO: handle exception
			log.warn("在获取博文点击量排行时出现错误  " + e.getMessage());
		}
		return null;
	}

	/* (non-Javadoc)
	 * @see com.Dao.BlogDao#findBlogFromStr(java.lang.String)
	 */
	@Override
	public List<BlogInfo> findBlogFromStr(String str) {
		// TODO 搜索框搜索方法
		sqlCode = "select `ID`, `Title`, `Writer`," + 
				  		 "`isOriginal`, `TagsID`, `Description`," + 
				  		 "`ReadNum`, `CommentNum`, `PublishTime`," + 
				  		 "`LastUpdateTime` " + 
				  "from BlogInfo " + 
				  "where `Title` like  \"%\"?\"%\" or `Description` like \"%\"?\"%\";";
		Object[] param = { str , str };
		ResultSet rs = excuteQuery(sqlCode, param);
		List<BlogInfo> temp = new ArrayList<BlogInfo>();
		try {
			while (rs.next()) {
				temp.add(new BlogInfo(
						rs.getInt(1), rs.getString(2),rs.getString(3),
						rs.getBoolean(4), rs.getString(5),rs.getString(6),
						rs.getInt(7),rs.getInt(8),rs.getTimestamp(9),
						rs.getTimestamp(10)
						));
			}
			return temp;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			log.warn("在用户查询指定博文时出现错误  " + e.getMessage());
		}
		return null;
	}

	/* (non-Javadoc)
	 * @see com.Dao.BlogDao#getAllCount()
	 */
	@Override
	public List<Integer> getAllCount() {
		// TODO 获取博文与标签的数量
		sqlCode = "select count(`ID`) from BlogInfo " + 
				  "union all " + 
				  "select count(`ID`) from Tag;";
		ResultSet rs = excuteQuery(sqlCode, null);
		List<Integer> temp = new ArrayList<Integer>();
		try {
			while (rs.next()) {
				temp.add(rs.getInt(1));
			}
			return temp;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			log.warn("在查询所有计数信息时出现错误  " + e.getMessage());
		}
		return null;
	}

}
