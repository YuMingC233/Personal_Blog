/**  
 * @Title: DataBaseUtil.java
 * @Package com.util
 * @Description: TODO(获取数据库的连接或关闭连接)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月14日 下午3:38:12
 * @version V1.0  
 * */
package com.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;


/**
 * @ClassName: DataBaseUtil
 * @Description: TODO(数据库获取工具类)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月14日 下午3:38:12
 *
 * */
public class DataBaseUtil {
	private static Logger log = LogManager.getLogger(DataBaseUtil.class);
	
	/**
	 * 初始化驱动
	 */
	static{
		try {
			// 使用ConfigManager类中getProperty的方法获取Driver的value
			String driver = (String)ConfigManager.getProperty("Driver");
			Class.forName(driver);
		} catch (Exception e) {
			// TODO: 
			log.error("初始化驱动时出现异常",e);
		}
	}
	
	/**
	 * 获取数据库连接
	 * @return Connection
	 */
	public static Connection getCon(){
		Connection con = null;
		try {
	    	Context context = new InitialContext();
	    	// 获取到datasource资源
	    	DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/blogCon");
	    	if(ds.getConnection() != null){
	    		con = ds.getConnection();
	    	}else{
	    		throw new Exception("连接实例化时出现异常");
	    	}
		} catch (Exception e) {
			// TODO: 
			log.error("获取连接时出现异常",e);
		}
		return con;
	}
	
	/**
	 * @Title: closeAll
	 * @Description: TODO(关闭所有组件与连接)
	 * @return void    返回类型
	 */
	public static void closeAll(ResultSet rs, PreparedStatement ps, Connection con) {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				// TODO: handle exception
				log.error("结果集关闭失败！");
			}
		}else if (ps != null) {
			try {
				ps.close();
			} catch (Exception e) {
				// TODO: handle exception
				log.error("Prepared Statement关闭失败！");
			}
		}else if (con != null) {
			try {
				con.close();
			} catch (Exception e) {
				// TODO: handle exception
				log.error("连接关闭失败！");
			}
		}
	}
	
	public static void rollbackWork (Connection con) {
		if(con != null){
			try {
				// 回滚事务
				con.rollback();
			} catch (SQLException sqlE) {
				// TODO Auto-generated catch block
				sqlE.printStackTrace();
			}
		}
	}
	
}
