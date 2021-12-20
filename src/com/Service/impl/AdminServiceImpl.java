/**  
 * @Title: AdminServiceImpl.java
 * @Package com.Service.impl
 * @Description: TODO(实现AdminService)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月14日 下午4:29:39
 * @version V1.0  
 * */
package com.Service.impl;

import java.sql.Connection;

import com.Dao.AdminDao;
import com.Dao.impl.AdminDaoImpl;
import com.Entity.Admin;
import com.Service.AdminService;
import com.util.DataBaseUtil;

/**
 * @ClassName: AdminServiceImpl
 * @Description: TODO(实现AdminService中的所有方法)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月14日 下午4:29:39
 *
 * */
public class AdminServiceImpl implements AdminService {
	Connection con;

	/* (non-Javadoc)
	 * @see com.Service.AdminService#login(com.Dao.impl.AdminDaoImpl)
	 */
	@Override
	public Admin login(Admin adm) {
		// TODO 登录，返回对象
		con = DataBaseUtil.getCon();
		try {
			AdminDao ad = new AdminDaoImpl(con);
			if (ad.login(adm.getAccount(), adm.getPassWord()))
				return adm;
			else 
				return null;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DataBaseUtil.closeAll(null, null, con);
		}
		return null;
	}
	
}
