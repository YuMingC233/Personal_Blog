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
    <nav class="nav-bar-holder">
        <div class="nav-bar" id="nav-bar">
            <div class="logo-box">
                <a href="index.jsp" class="blog-title ta-c">
                    <img style="vertical-align: top;" alt="" src="#" />
                </a>
            </div>

            <div class="nb-a-holder" id="home">
                <a class="nb-a ta-c" href="index.jsp">首页</a>
            </div>
            <div class="nb-a-holder">
                <a class="nb-a ta-c" href="tag.jsp">标签墙</a>
            </div>
            <div class="nb-a-holder">
                <a class="nb-a ta-c" href="archive.jsp">归档</a>
            </div>
            
            <!--搜索框-->
            <div id="search-nb">
                <span class="search-s fl">
                    <label for="search-input"></label><input class="fl" type="text" id="search-input"
                        placeholder="请输入标题名称或描述中的内容（支持模糊查询）">
                    <a class="search-icon fl" onclick="search_by_key()" href="javascript:void(0);"></a>
                </span>
            </div>
            <div class="nb-a-holder-last">
                <div class="nb-a-holder-small">
                    <a class="a-login" href="login.jsp">登录</a>
                </div>
            </div>
        </div>
    </nav>
</body>

</html>