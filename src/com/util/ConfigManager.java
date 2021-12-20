/**  
 * @Title: ConfigManager.java
 * @Package com.util
 * @Description: TODO(读取Database中的所有信息)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月14日 下午3:32:53
 * @version V1.0  
 * */
package com.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * @ClassName: ConfigManager
 * @Description: TODO(数据库信息读取类)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月14日 下午3:32:53
 *
 * */
public class ConfigManager {
	private static Logger log = LogManager.getLogger(ConfigManager.class);
	private static Properties pro = null;
	
	/**
	 * 读取Database配置文件中的所有信息并
	 * 保存在Properties实体中
	 */
	static {
		InputStream is = null;
		is = ConfigManager.class.getClassLoader().getResourceAsStream("Database.properties");	
		if(is == null){
			throw new RuntimeException("文件流读取数据库信息时出现异常!");
		}
		pro = new Properties();
		try {
			//properties对象加载is流中的内容
			pro.load(is);
		} catch (IOException e) {
			log.error("properties对象在加载is流中的内容时出错！"+ e.getMessage());
		}
	}
	
	/**
	 * @Title: getProperty
	 * @Description: TODO
	 * 根据参数中的名称获取值的方法
	 * （例如：Driver将会获取到com.mysql.jdbc.Driver）
	 * @param key
	 * @return    设定文件
	 * @return Object    返回类型
	 */
	public static Object getProperty(String key){
		return pro.get(key);
	}
	
}
