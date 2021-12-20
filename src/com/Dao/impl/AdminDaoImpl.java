/**  
 * @Title: AdminDaoImpl.java
 * @Package com.Dao.impl
 * @Description: TODO(实现所有AdminDao中的方法)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月14日 下午4:17:34
 * @version V1.0  
 * */
package com.Dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Dao.AdminDao;
import com.Dao.BaseDao;

/**
 * @ClassName: AdminDaoImpl
 * @Description: TODO(AdminDao接口实现类)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月14日 下午4:17:34
 *
 * */
public class AdminDaoImpl extends BaseDao implements AdminDao {
	String sqlCode;

	/**
	 * @param con 连接实例
	 */
	public AdminDaoImpl(Connection con) {
		super(con);
		// TODO Auto-generated constructor stub
	}

	/* (non-Javadoc)
	 * @see com.Dao.AdminDao#login(java.lang.String, java.lang.String)
	 */
	@Override
	public boolean login(String Name, String Pwd) {
		// TODO 实现验证登录
		sqlCode = "select count(Email) from admin_user where Email = ? and PassWord = ?";
		Object[] param = {Name, Pwd};
		ResultSet rs = excuteQuery(sqlCode, param);
		try {
			while (rs.next()) {
				if (rs.getInt(1) == 0)
					return false;
				else 
					return true;
			}
		} catch (SQLException e) {
			// TODO 
			log.warn(""+e.getMessage());
		}
		return false;
	}

}
