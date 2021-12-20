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
    <title>登录到YuMing的Blog</title>
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="shortcut icon" href="img/user.jpeg">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <div class="main">
        <div class="form">
            <a class="on" id="landing" href="javascript:void(0);"><b>带评论家</b> 登录入口</a>
            <!-- <a class="not-on" id="registered" href="javascript:void(0);">注册</a> -->
            <div class="fix"></div>

            <form type="POST" action="" id="landing-content" data-form="ajax">
                <input type="hidden" name="csrfmiddlewaretoken" value="ATVqa3VWx0vdl5KGcfhDx3l3EjAmcluacR4lCLph0eUZzj8H74pC4Gpm8gbXF0iF">
                <div class="auth-inp">
                    <div id="GithubIcon-box">
                        <a onclick="github_login()" class="git-icon" href="javascript:void(0);"></a>
                        <div class="tips">
                            <p class="fl">Github授权登录</p>
                        </div>
                    </div>

                    <div id="QQIcon-box">
                        <a onclick="github_login()" class="qq-icon" href="javascript:void(0);"></a>
                        <div class="tips">
                            <p class="fl">QQ授权登录</p>
                        </div>
                    </div>

                </div>
                <!--错误信息提示-->
                <span class="error ta-c"></span>
                <div id="bottom">
                    <a href="index.jsp" id="registeredtxt">回到首页</a>
                </div>
            </form>
        </div>
    </div>

    <!--尾部-->
    <footer class="footer lowin-footer"></footer>

    <script type="text/javascript" src="js/base.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
    <script type="text/javascript" src="js/sweetalert.min.js"></script>
    <script type="text/javascript" src="js/verJs.js"></script>
    <script type="text/javascript">
        $("#code_img").click(function () {

        });

        const verJs_login = new VerJs({
            form: "#landing-content",
            success: function (data) {
                data = JSON.parse(data);
                console.log(data);
            },
            fail: function (data) {
                console.log(data);
            }
        });

        function github_login() {
            $.ajax({
                type: 'GET',
                url: '',
                dataType: 'JSON',
                success: function (data) {
                    console.log(data);
                },
                error: function (data) {
                    console.log(data);
                }
            });
        }
    </script>
</body>

</html>