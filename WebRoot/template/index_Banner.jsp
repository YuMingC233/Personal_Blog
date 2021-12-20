﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=5">
    <title>不才才 bucaicai</title>
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="css/index_Banner.css">
    <script src="js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
        if (!!window.ActiveXObject || "ActiveXObject" in window) { //is IE?
            alert('朋友，上古浏览器不支持呢~');
        }
    </script>
</head>

<body>
    <nav class="not_index_bg" id="nav" style="background-image:url(https://api.ixiaowai.cn/gqapi/gqapi.php)">
        <div id="bgBlindfold">
            <div id="page_site-info">
                <div id="site-title">
                    <span class="blogtitle"></span>
                    <script src="js/typed.js"></script>
                    <script>
                        var typed = new Typed(".blogtitle", {
                            strings: ['从一而终', "连霸王都下跪了，京剧能不亡么？","人呐，要自个儿成全自个儿......","笑骂由人 洒脱地做人"],
                            startDelay: 300,
                            typeSpeed: 200,
                            loop: true,
                            backSpeed: 80,
                            showCursor: true
                        });
                    </script>
                </div>
            </div>
        </div>
    </nav>
</body>

</html>