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
    <meta name="keywords" content="" />
    <meta name="description" content="">
    <meta name="author" content="">
    <title>YuMing 标签墙</title>
    <!-- <link rel="stylesheet" href="css/d-audio.css"> -->
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/pace-theme-flash.css">
    <link rel="stylesheet" href="css/myPagination.css">
    <link rel="stylesheet" href="css/index.css">
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
                <img style="vertical-align: top;" alt="logo" src="img/user.jpeg" /></a>
        </div>
        <a id="mobile_cate" style="background-image: url('img/cate.svg')" href="javascript:void(0);"></a>
    </nav>
    <ul id="nav-m-list">
        <li id="cancel-li"><a class="fr" id="cancel" href="javascript:void(0);"></a></li>
        <li id="m-img-li">
            <img id="m-img" alt="" src="#">
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
    <!--主体-->
    <div class="big-container">
        <article class="article">

            <!-- 左容器 -->
            <div class="right-holder">

                <div class="column-container">
                    <ul class="column_box" id="like-box">
                        <li class="column-title">
                            <span class="at-sort b-b-ece fl"><a class="at-sort-comment-a c-666 fl">标签墙</a></span>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- 右容器 -->
            <div class="result-box fl">
                <!--文章内容-->
                <div id="article-holder" style="width: 100%; float: left">

                </div>

                <!--分页指示器-->
                <div id="pagination" class="pagination fl"></div>
            </div>

        </article>
    </div>

    <!--尾部-->
    <footer class="footer"></footer>
</body>

<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript" src="js/sweetalert.min.js"></script>
<script type="text/javascript" src="js/pace.min.js"></script>
<script type="text/javascript" src="js/TagPagination.js"></script>
<script type="text/javascript" src="js/TagListInit.js"></script>

<script>
    //图片懒加载
    const lazyImage = new LazyImage('.lazy-image');
	// 在body标签后加入onload事件，该事件总是最后执行
 	function navDefault(){
        $(".nav-bar-holder *").removeClass("active");
        $("#nav-bar div:eq(2) > a").addClass("active");
	}
</script>


</html>