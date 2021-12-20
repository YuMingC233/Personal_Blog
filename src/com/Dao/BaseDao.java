/**  
 * @Title: BaseDao.java
 * @Package com.Dao
 * @Description: TODO(基础Dao)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月14日 下午3:43:41
 * @version V1.0  
 * */
package com.Dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * @ClassName: BaseDao
 * @Description: TODO(基础运行方法集合类)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月14日 下午3:43:41
 *
 * */
public class BaseDao {
	public static Logger log = LogManager.getLogger(BaseDao.class);
	private Connection con = null;
	
	public BaseDao(Connection con){
		this.con = con;
	}
	
	/**
	 * 更新的通用方法
	 * @param sql 操作数据库的语句
	 * @param os 传入的参数的值(数组)
	 * @return int 执行后影响的行数
	 */
	public int excuteUpdate(String sqlCode,Object[] os){
		PreparedStatement ps = null;
		int n = 0;
		try {
			
			ps = con.prepareStatement(sqlCode);
			// 设置参数值
			if(os != null && os.length != 0){
				for(int i = 0;i < os.length;i++){
					ps.setObject((i+1), os[i]);
				}
			}
			
			n = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO 
			log.error("更新数据时出现异常！", e);
		}
		return n;
	}
	
	/**
	 * 查询的通用方法
	 * @param sql
	 * @param os
	 * @return 返回ResultSet结果集
	 */
	public ResultSet excuteQuery(String sqlCode,Object[] os){
		ResultSet rs = null;
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sqlCode);
			
			// 设置参数值
			if(os != null && os.length != 0){
				for(int i = 0;i < os.length; i++){
					ps.setObject((i+1), os[i]);
				}
			}
			rs = ps.executeQuery();
		} catch (Exception e) {
			// TODO: handle exception
			log.error("查询时出现异常  "+ e.getMessage());
		}
		return rs;
	}
	
	/**
	 * 更新博文正文的独有方法
	 * @param sql 操作数据库的语句
	 * @param os 传入的参数的值(数组)
	 * @return int 执行后影响的行数
	 */
	public int excuteUpdateArticle(String sqlCode,Date PublishTime,String Content,
			String HTML,String imageName,InputStream in){
		PreparedStatement ps = null;
		int n = 0;
		try {
			ps = con.prepareStatement(sqlCode);
			// 设置参数值
	        ps.setObject(1, PublishTime);
	        ps.setString(2, Content);
	        ps.setString(3, HTML);
	        ps.setString(4, imageName);
	        ps.setBinaryStream(5, in, in.available());
			return ps.executeUpdate();
		} catch (SQLException e) {
			// TODO 
			log.error("更新正文数据时出现异常！", e);
		} catch (IOException e) {
			// TODO 
			log.error("更新正文数据时数据流出现异常！", e);
		}
		return n;
	}
}
