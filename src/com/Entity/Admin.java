/**  
 * @Title: Admin.java
 * @Package com.Entity
 * @Description: TODO(管理员相关信息实体类)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月14日 下午4:07:55
 * @version V1.0  
 * */
package com.Entity;

/**
 * @ClassName: Admin
 * @Description: TODO(保存管理员相关信息)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月14日 下午4:07:55
 * */
public class Admin {
	private String Account;		// 账户
	private String PassWord;	// 密码
	
	
	/**
	 * @param account 	账户
	 * @param passWord  密码
	 */
	public Admin(String account, String passWord) {
		Account = account;
		PassWord = passWord;
	}
	
	/**
	 * @return the account
	 */
	public String getAccount() {
		return Account;
	}
	/**
	 * @param account the account to set
	 */
	public void setAccount(String account) {
		Account = account;
	}
	/**
	 * @return the passWord
	 */
	public String getPassWord() {
		return PassWord;
	}
	/**
	 * @param passWord the passWord to set
	 */
	public void setPassWord(String passWord) {
		PassWord = passWord;
	}
	
	
}
