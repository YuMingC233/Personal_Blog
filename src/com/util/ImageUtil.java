/**  
 * @Title: ImageUtil.java
 * @Package com.util
 * @Description: TODO(图片文件层工具类，直接操作图片转为二进制，大小不可超过16M)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月19日 上午10:17:49
 * @version V1.0  
 * */
package com.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * @ClassName: ImageUtil
 * @Description: TODO(图片文件层操作工具类)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月19日 上午10:17:49
 *
 * */
public class ImageUtil {
	
	/**
	 * @Title: readImage
	 * @Description: TODO(通过文件输入流读取指定路径下的本地图片)
	 * @param path 本地路径
	 * @return FileInputStream 返回输入流对象
	 * @throws IOException 
	 * @return FileInputStream    返回类型
	 */
    public static FileInputStream readImage(String path) throws IOException {
        return new FileInputStream(new File(path));
    }
 
    /**
     * @Title: readBin2Image
     * @Description: TODO(读取图片获取输出流)
     * @param in 输入流
     * @param targetPath 存放图片的服务器img目录
     * @return void 
     */
    public static void readBin2Image(InputStream in, String targetPath) {
    	File file = new File(targetPath);
        String path = targetPath.substring(0, targetPath.lastIndexOf("\\"));
        
        if (!file.exists()) {
            new File(path).mkdir();   
        }
        
        try {
    		FileOutputStream fos = new FileOutputStream(file);
    		  
    		byte[] b = new byte[1024];
    		int nRead = 0;

    		while ((nRead = in.read(b)) != -1) {
    			fos.write(b, 0, nRead);
    		}
    		in.reset();
    		
    		fos.flush();
    		fos.close();
    		in.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
