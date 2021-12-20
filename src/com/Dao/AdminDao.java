/**  
 * @Title: AdminDao.java
 * @Package com.Dao
 * @Description: TODO(声明管理员信息验证接口)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月14日 下午4:11:46
 * @version V1.0  
 * */
package com.Dao;

/**
 * @ClassName: AdminDao
 * @Description: TODO(管理员信息操作接口)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月14日 下午4:11:46
 * */
public interface AdminDao {
	
	/**
	 * @Title: login
	 * @Description: TODO(验证登录接口)
	 * @param Name
	 * @param Pwd
	 * @return boolean 真为存在，反之亦然
	 */
	boolean login(String Name,String Pwd);
}
