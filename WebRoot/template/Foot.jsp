<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

<head>
    <base href="<%=basePath%>">
</head>

<body>
    <footer class="footer lowin-footer">
        <div class="footer-line">
            <div class="icon-center">
                <span class="icon-box">
                    <a id="github-icon" target="_blank" href="https://github.com/YuMingC233" class="foot-icon"></a>
                    查看我的Github项目
                </span>
                <span class="icon-box">
                    <a id="qq-icon" target="_blank"
                        href="tencent://Message/?Uin=1305972026&amp;websiteName=q-zone.qq.com&amp;Menu=yes"
                        class="foot-icon"></a>
                    私聊博主？
                </span>
            </div>
        </div>
        <div class="footer-line">湘ICP备 ? 号<a href="index.jsp" target="_blank">站点地图</a></div>
        </div>
        <div class="footer-line">特别鸣谢本网站模板提供者：<a href="https://github.com/zhaoyangkun">苍茫误此生</a></div>
    </footer>
</body>

</Html>