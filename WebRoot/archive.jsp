<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

<head>
    <base href="<%=basePath%>">
    
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="HandheldFriendly" content="true">
    <meta charset="UTF-8">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>YuMing 归档</title>
    <!-- <link rel="stylesheet" href="css/d-audio.css"> -->
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="css/pace-theme-flash.css">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/archive.css">
    <link rel="shortcut icon" href="img/head.jpg">
    <style rel="stylesheet">
        .lazy-image {
            background: url('img/loading.gif') no-repeat center;
            background-size: 26% 35%;
            height: 100%;
            width: 100%;
        }
    </style>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<body onload="navDefault()">
    <!--PC导航栏-->
    <nav class="nav-bar-holder"></nav>
    <!--mobile导航栏-->
    <nav class="mobile-nav">
        <div class="logo-box">
            <a href="index.jsp" class="blog-title ta-c">
                <img style="vertical-align: top;" alt="logo" src="img/head.jpg" /></a>
        </div>
        <a id="mobile_cate" style="background-image: url('img/cate.svg')" href="javascript:void(0);"></a>
    </nav>
    <ul id="nav-m-list">
        <li id="cancel-li"><a class="fr" id="cancel" href="javascript:void(0);"></a></li>
        <li id="m-img-li">
            <img id="m-img" alt="" src="img/head.jpg">
        </li>
        <li>
            <span class="search-s fl">
                <label for="search-input-m"></label><input class="fl" type="text" id="search-input-m" placeholder="关键词">
                <a class="search-icon fl" onclick="m_search()" href="javascript:void(0);"></a>
            </span>
        </li>
        <li><a class="w-h-100 fl" href="index.jsp">首页</a></li>
        <li><a class="w-h-100 fl" href="login.jsp">登录</a></li>
        <li><a class="w-h-100 fl" href="tag.jsp">标签墙</a></li>
        <li><a class="w-h-100 fl" href="archive.jsp">归档</a></li>
    </ul>
    <main class="big-container">
        <article class="article">
            <ul class="achieve-box">
                <li class="year">
                    2019年 12月 <span style="color: #3aa4ff">2</span> 篇
                </li>
                <li class="detail-item">
                    <span class="date">12-05</span>
                    <a href="article.jsp" target="_blank" class="title">栈和队列</a>
                </li>
                <li class="detail-item">
                    <span class="date">12-05</span>
                    <a href="article.jsp" target="_blank" class="title">栈和队列</a>
                </li>
            </ul>
        </article>
    </main>
    <!--尾部-->
    <footer class="footer"></footer>
</body>

<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript" src="js/sweetalert.min.js"></script>
<script type="text/javascript" src="js/pace.min.js"></script>
<script src="js/archiveInit.js"></script>

<script defer>
    //图片懒加载
    const lazyImage = new LazyImage('.lazy-image'); 
    // 在body标签后加入onload事件，该事件总是最后执行
 	function navDefault(){
        $(".nav-bar-holder *").removeClass("active");
        $("#nav-bar div:eq(3) > a").addClass("active");
	}
</script>

</html>