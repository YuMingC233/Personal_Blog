/**  
 * @Title: AdminService.java
 * @Package com.Service
 * @Description: TODO(执行AdminDao中的方法)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月14日 下午4:24:40
 * @version V1.0  
 * */
package com.Service;

import com.Entity.Admin;

/**
 * @ClassName: AdminService
 * @Description: TODO(执行AdminDao中方法的接口)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月14日 下午4:24:40
 *
 * */
public interface AdminService {

	/**
	 * @Title: login
	 * @Description: TODO(执行AdminDao中的验证方法)
	 * @param adi 管理员类实体
	 * @return 管理员实体
	 */
	Admin login(Admin adm);
	
}
