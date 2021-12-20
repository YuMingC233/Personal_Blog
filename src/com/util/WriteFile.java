/**  
 * @Title: WriteJsonFile.java
 * @Package com.util
 * @Description: TODO(用一句话描述该文件做什么)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月19日 下午5:18:47
 * @version V1.0  
 * */
package com.util;

import java.io.*;
import java.nio.charset.StandardCharsets;

/**
 * @ClassName: WriteJsonFile
 * @Description: TODO(写入JSON字段到指定路径下的JSON文件中去)
 * 
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月19日 下午5:18:47
 *
 * */
public class WriteFile {

    public static void WriteInfoJson(String args) {
        String webAppSrc = "C:\\Apache\\apache-tomcat-8.5.56\\webapps\\MainProject\\YuMing Blog Admin\\data\\BlogInfo.json";
        String sourceSrc = "E:\\YuMingBlogJSP\\MainProject\\WebRoot\\YuMing Blog Admin\\data\\BlogInfo.json";

        File webAppFile = new File(webAppSrc);
        File sourceFile = new File(sourceSrc);

        /**
         * .在文件中覆写标准的json字符
         */
        try {
            BufferedWriter out = new BufferedWriter(new FileWriter(webAppFile));
            out.write(toUtf8(args));
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        /**
         * .在文件中覆写标准的json字符
         */
        try {
            BufferedWriter out = new BufferedWriter(new FileWriter(sourceFile));
            out.write(toUtf8(args));
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public static void WriteArticleJson(String args) {
        String webAppSrc = "C:\\Apache\\apache-tomcat-8.5.56\\webapps\\MainProject\\YuMing Blog Admin\\data\\BlogArticle.json";
        String sourceSrc = "E:\\YuMingBlogJSP\\MainProject\\WebRoot\\YuMing Blog Admin\\data\\BlogArticle.json";

        File webAppFile = new File(webAppSrc);
        File sourceFile = new File(sourceSrc);

        /**
         * .在文件中覆写标准的json字符
         */
        try {
            BufferedWriter out = new BufferedWriter(new FileWriter(webAppFile));
            out.write(toUtf8(args));
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        /**
         * .在文件中覆写标准的json字符
         */
        try {
            BufferedWriter out = new BufferedWriter(new FileWriter(sourceFile));
            out.write(toUtf8(args));
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public static void WriteTagJson(String args) {
        String webAppSrc = "C:\\Apache\\apache-tomcat-8.5.56\\webapps\\MainProject\\YuMing Blog Admin\\data\\Tag.json";
        String sourceSrc = "E:\\YuMingBlogJSP\\MainProject\\WebRoot\\YuMing Blog Admin\\data\\Tag.json";

        File webAppFile = new File(webAppSrc);
        File sourceFile = new File(sourceSrc);

        /**
         * .在文件中覆写标准的json字符
         */
        try {
            BufferedWriter out = new BufferedWriter(new FileWriter(webAppFile));
            out.write(toUtf8(args));
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        /**
         * .在文件中覆写标准的json字符
         */
        try {
            BufferedWriter out = new BufferedWriter(new FileWriter(sourceFile));
            out.write(toUtf8(args));
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public static void WriteImage2File(String imgName, InputStream imageIs) {
        String webAppSrc = "C:\\Apache\\apache-tomcat-8.5.56\\webapps\\MainProject\\img\\" + imgName;
        String sourceSrc = "E:\\YuMingBlogJSP\\MainProject\\WebRoot\\img\\" + imgName;

        ImageUtil.readBin2Image(imageIs, webAppSrc);
        ImageUtil.readBin2Image(imageIs, sourceSrc);
    }

    public static String toUtf8(String str) {
        return new String(str.getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
    }
}