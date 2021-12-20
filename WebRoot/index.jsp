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
    <title>YuMing Blog</title>
    <!-- <link rel="stylesheet" href="css/d-audio.css"> -->
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/pace-theme-flash.css">
    <link rel="stylesheet" href="css/myPagination.css">
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
                <img style="vertical-align: top;" alt="" src="#" /></a>
        </div>
        <a id="mobile_cate" style="background-image: url('img/cate.svg')" href="javascript:void(0);"></a>
    </nav>
    <ul id="nav-m-list">
        <li id="cancel-li"><a class="fr" id="cancel" href="javascript:void(0);"></a></li>
        <li id="m-img-li">
            <img id="m-img" alt="" src="">
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

    <!-- banner区域 -->
    <div id="banner" class="not_index_bg"></div>

    <!--主体-->
    <div class="big-container" id="particles-js">
        <article class="article">
            <!--左容器-->
            <div class="left-holder">
                <!-- 文章内容列表 -->
                <div id="article-holder" style="width: 100%; float: left">

                </div>
                <!--分页指示器-->
                <div id="pagination" class="pagination fl"></div>
            </div>

            <!--右容器-->
            <div class="right-holder">
                <!--个人介绍-->
                <div class="column-container">
                    <ul class="column_box" id="Introduction-box">
                        <li class="column-title">
                            <span class="at-sort b-b-ece fl"><a class="at-sort-comment-a c-666 fl" id="self-Tilte">我是谁？</a></span>
                        </li>
                        <li class="person-img-li">
                            <img alt="头像" id="person-img" src="img/head.jpg">
                        </li>
                        <li class="person-intro-detail gradient-text">
                            <h1>这里是YuMingC233的屑站</h1>
                        </li>
                        <li class="person-intro-detail">
                            <h3>个人随笔以及记录，心得等等</h3>
                        </li>
                        <li class="person-intro-detail">
                            <h3>现阶段缺少社会毒打</h3>
                        </li>                                                                                
                        <li class="person-intro-detail">
                            <h3>我现在位于：湖南长沙</h3>
                        </li>
                        <li class="person-intro-detail">
                            <h3>中意的事情：编程，音乐，听锡兰扯皮</h3>
                        </li>
                    </ul>
                </div>
                <!--点击排行-->
                <div class="column-container">
                    <ul class="column_box" id="like-box">
                        <li class="column-title">
                            <span class="at-sort b-b-ece fl">
                                <a class="at-sort-comment-a c-666 fl" id="TopClickTitle">Top10 点击排行</a>
                            </span>
                        </li>
                    </ul>
                </div>
            </div>
        </article>
    </div>
    <!--尾部-->
    <footer class="footer"></footer>
</body>

<!-- <script type="text/javascript" src="js/d-audio.js"></script> -->
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript" src="js/sweetalert.min.js"></script>
<script type="text/javascript" src="js/pace.min.js"></script>
<script type="text/javascript" src="js/myPagination.js"></script>
<script type="text/javascript" src="js/indexInit.js"></script>

<script>
    // 图片懒加载
    const lazyImage = new LazyImage('.lazy-image');
	// 在body标签后加入onload事件，该事件总是最后执行
 	function navDefault(){
		$(".nav-bar-holder *").removeClass("active");
        $("#nav-bar #home > a").addClass("active");
        
        /**
         * 列表中的单条文章中的描述与评论的点击事件
         */
        $(".article-detail-box,.article-tail-box").click(function (e) {
            location.href = $($(this).prevAll(".article-title").find("a")).attr("href");
        });
	}
</script>

</html>