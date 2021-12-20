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
    <title></title>
    <!-- <link rel="stylesheet" href="css/d-audio.css"> -->
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/pace-theme-flash.css">
    <link rel="stylesheet" href="css/article-detail.css">
    <link rel="stylesheet" href="css/code.css">
    <link rel="stylesheet" href="css/github-markdown.css">
    <link rel="stylesheet" href="css/vditor.css">
    <link rel="shortcut icon" href="img/head.jpg">
    <style>
        .lazy-image {
            background: url('img/loading.gif') no-repeat center;
            background-size: 26% 35%;
            height: 100%;
            width: 100%;
        }

        .markdown-body {
            box-sizing: border-box;
            min-width: 200px;
            max-width: 980px;
            margin: 0 auto;
            padding: 10px;
        }

        @media (max-width: 767px) {
            .markdown-body {
                padding: 15px;
            }

            .markdown-body h1 {
                font-size: 1.35em;
            }

        }

        .codehilite {
            border-radius: 10px;
        }

        .article-content img {
            max-width: 100%;
        }

        #outerdiv {
            width: 100%;
            height: 100%;
            position: fixed;
            top: 0;
            left: 0;
            background: rgba(0, 0, 0, 0.3);
            display: none;
            z-index: 200;
        }
    </style>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<body>
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
            <img id="m-img" alt="苍茫误此生" src="img/user.jpeg">
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
    <!-- 左下角音乐盒子
    <div id="d-audio" class="d-audio" style="width: 150px; z-index: 99; position: fixed; bottom: 5px; left: 5px;"></div>
     -->

    <!--文章目录-->
    <div class="toc">
        <ul>
            <li><a href="#_1">对应二级标题</a>
                <ul>
                    <li><a href="#1">对应三级标题</a>
                        <ul>
                            <li><a href="#1_1">(1) 对应四级标题</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
    </div>

    <!--主体-->
    <section class="main">
        <label for="article_id"></label><input hidden id="article_id" name="article_id" value="55">
        <label for="user_id"></label><input hidden id="user_id" name="user_id"
            value="{{ no such element: django.contrib.sessions.backends.cache.SessionStore object[&#39;user_id&#39;] }}">
        <div class="left-box">
            <div id="outerdiv">
                <div id="innerdiv" style="position:absolute;"><img alt id="bigimg"
                        style="box-shadow: 0 0 10px rgba(0,0,0,0.38)" src="" />
                </div>
            </div>
            <!--文章内容-->
            <div class="article-container">
                <div class="article-content markdown-body">
                    <!-- 主标题 -->
                    <h1 style="margin: 10px 0" id="MainTitle"></h1>

                    <!-- 标签类型 -->
                    <div class="article-cate">
                    </div>

                    <!-- 文章相关信息 -->
                    <div class="writer-info">
                        <span style="margin: 5px 0;">作者: </span>
                        <span id="writer"></span>
                        <span id="write-time"></span>
                        <span>阅读(<span id="read-number"></span>)</span>
                        <span>评论(<span id="comment-number"></span>)</span>
                        <span>本文属于<span id="isOriginal"></span></span>
                    </div>
                </div>
                <div class="prev-next">
                    <div class="p-div">
                        <span class="fl">上一篇：</span>
                        <a class="one-line-overflow fl" href="" id="prev-a"></a>
                    </div>
                </div>
            </div>

            <!--评论-->
            <div class="comment-container" style="margin-top: 20px; margin-bottom: 10px">
                <!-- 评论文本Title -->
                <div class="sort-box">
                    <span class="at-sort-s fl"><a style="box-sizing: content-box;"
                            class="at-sort-comment-a c-666">评论</a></span>
                    <span class="location fl c-666"><a class="at-sort-detail c-666"></a> </span>
                </div>

                <!-- 输入区域 -->
                <div class="text-area-holder">
                    <div id="vditor" class="vditor" style="height: 300px; width: auto;">
                        <div class="vditor-toolbar">
                            <div>
                                <div class="vditor-tooltipped vditor-tooltipped__ne" aria-label="表情 <ctrl-e>">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="32px"
                                        height="32px">
                                        <path
                                            d="M16 24.789c-3.756 0-6.911-2.254-8.188-5.559h16.376c-1.277 3.305-4.432 5.559-8.188 5.559zM10.366 14.423c-1.352 0-2.404-1.052-2.404-2.404s1.052-2.404 2.404-2.404 2.404 1.052 2.404 2.404-1.052 2.404-2.404 2.404zM21.634 14.423c-1.352 0-2.404-1.052-2.404-2.404s1.052-2.404 2.404-2.404 2.404 1.052 2.404 2.404-1.052 2.404-2.404 2.404zM16 28.845c7.061 0 12.845-5.784 12.845-12.845s-5.784-12.845-12.845-12.845-12.845 5.784-12.845 12.845 5.784 12.845 12.845 12.845zM16 0c8.864 0 16 7.136 16 16s-7.136 16-16 16-16-7.136-16-16 7.136-16 16-16z">
                                        </path>
                                    </svg></div>
                                <div class="vditor-panel" style="display: none;">
                                    <div class="vditor-emojis" style="max-height: 220px">
                                        <span data-value="👍 " data-key="+1">👍</span>
                                        <span data-value="👎 " data-key="-1">👎</span>
                                        <span data-value="😰 " data-key="cold_sweat">😰</span>
                                        <span data-value="❤️ " data-key="heart">❤️</span>
                                        <span data-value="🙏 " data-key="pray">🙏</span>
                                        <span data-value="💔 " data-key="broken_heart">💔</span>
                                        <span data-value="👌 " data-key="ok_hand">👌</span>
                                        <span data-value="😄 " data-key="smile">😄</span>
                                        <span data-value="😆 " data-key="laughing">😆</span>
                                        <span data-value="😏 " data-key="smirk">😏</span>
                                        <span data-value="😍 " data-key="heart_eyes">😍</span>
                                        <span data-value="😁 " data-key="grin">😁</span>
                                        <span data-value="😛 " data-key="stuck_out_tongue">😛</span>
                                        <span data-value="😑 " data-key="expressionless">😑</span>
                                        <span data-value="😒 " data-key="unamused">😒</span>
                                        <span data-value="😭 " data-key="sob">😭</span>
                                        <span data-value="😂 " data-key="joy">😂</span>
                                        <span data-value="😫 " data-key="tired_face">😫</span>
                                        <span data-value="😊 " data-key="blush">😊</span>
                                        <span data-value="😢 " data-key="cry">😢</span>
                                        <span data-value="😨 " data-key="fearful">😨</span>
                                    </div>
                                    <div class="vditor-emojis__tail">
                                        <span class="vditor-emojis__tip">grin</span><span></span>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="vditor-tooltipped vditor-tooltipped__ne" aria-label="标题 <ctrl-h>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32">
                                        <path
                                            d="M4.45 0h3.594c0.595 0 1.078 0.384 1.078 0.858v30.284c0 0.474-0.482 0.858-1.078 0.858h-3.594c-0.595 0-1.078-0.384-1.078-0.858v-30.284c-0-0.474 0.482-0.858 1.078-0.858zM23.888 0h3.673c0.59 0 1.068 0.384 1.068 0.858v30.284c0 0.474-0.478 0.858-1.068 0.858h-3.673c-0.59 0-1.068-0.384-1.068-0.858v-30.284c0-0.474 0.478-0.858 1.068-0.858z">
                                        </path>
                                        <path
                                            d="M25.069 14.167v3.667c0 0.589-0.384 1.065-0.858 1.065h-15.655c-0.474 0-0.858-0.477-0.858-1.065v-3.667c0-0.589 0.384-1.065 0.858-1.065h15.655c0.474 0 0.858 0.477 0.858 1.065z">
                                        </path>
                                    </svg> </div>
                                <div class="vditor-panel" style="display: none;">
                                    <h1 data-value="# ">Heading 1</h1>
                                    <h2 data-value="## ">Heading 2</h2>
                                    <h3 data-value="### ">Heading 3</h3>
                                    <h4 data-value="#### ">Heading 4</h4>
                                    <h5 data-value="##### ">Heading 5</h5>
                                    <h6 data-value="###### ">Heading 6</h6>
                                </div>
                            </div>
                            <div>
                                <div class="vditor-tooltipped vditor-tooltipped__ne" aria-label="粗体 <ctrl-b>">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="32px"
                                        height="32px">
                                        <path
                                            d="M22.996 15.023c1.339-1.591 2.147-3.643 2.147-5.88 0-5.041-4.102-9.143-9.143-9.143h-11.429v32h13.714c5.041 0 9.143-4.102 9.143-9.143 0-3.32-1.779-6.232-4.433-7.834zM11.429 4.571h3.625c1.999 0 3.625 2.051 3.625 4.571s-1.626 4.571-3.625 4.571h-3.625v-9.143zM17.107 27.429h-5.679v-9.143h5.679c2.087 0 3.786 2.051 3.786 4.571s-1.698 4.571-3.786 4.571z">
                                        </path>
                                    </svg></div>
                            </div>
                            <div>
                                <div class="vditor-tooltipped vditor-tooltipped__ne" aria-label="斜体 <ctrl-i>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32">
                                        <path
                                            d="M29.714 0v2.286h-4.571l-11.429 27.429h4.571v2.286h-16v-2.286h4.571l11.429-27.429h-4.571v-2.286z">
                                        </path>
                                    </svg></div>
                            </div>
                            <div>
                                <div class="vditor-tooltipped vditor-tooltipped__ne" aria-label="删除线 <ctrl-s>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32">
                                        <path
                                            d="M32 16v2h-7.328c0.86 1.203 1.328 2.584 1.328 4 0 2.215-1.146 4.345-3.143 5.843-1.855 1.391-4.29 2.157-6.857 2.157s-5.002-0.766-6.857-2.157c-1.998-1.498-3.143-3.628-3.143-5.843h4c0 2.168 2.748 4 6 4s6-1.832 6-4c0-2.168-2.748-4-6-4h-16v-2h9.36c-0.073-0.052-0.146-0.104-0.217-0.157-1.998-1.498-3.143-3.628-3.143-5.843s1.146-4.345 3.143-5.843c1.855-1.391 4.29-2.157 6.857-2.157s5.002 0.766 6.857 2.157c1.997 1.498 3.143 3.628 3.143 5.843h-4c0-2.168-2.748-4-6-4s-6 1.832-6 4c0 2.168 2.748 4 6 4 2.468 0 4.814 0.709 6.64 2h9.36z">
                                        </path>
                                    </svg> </div>
                            </div>
                            
                            <div class="vditor-menu__divider"></div>

                            <div>
                                <div class="vditor-tooltipped vditor-tooltipped__n" aria-label="分隔线 <ctrl-⇧-d>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32">
                                        <path
                                            d="M31.68 14.56h-31.36c-0.176 0-0.32 0.144-0.32 0.32v2.24c0 0.176 0.144 0.32 0.32 0.32h31.36c0.176 0 0.32-0.144 0.32-0.32v-2.24c0-0.176-0.144-0.32-0.32-0.32z">
                                        </path>
                                    </svg> </div>
                            </div>
                            <div>
                                <div class="vditor-tooltipped vditor-tooltipped__n" aria-label="引用 <ctrl-.>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32">
                                        <path
                                            d="M7.024 13.003c3.862 0 6.993 3.131 6.993 6.993s-3.131 6.993-6.993 6.993-6.993-3.131-6.993-6.993l-0.031-0.999c0-7.724 6.262-13.986 13.986-13.986v3.996c-2.668 0-5.177 1.039-7.064 2.926-0.363 0.363-0.695 0.75-0.994 1.156 0.357-0.056 0.723-0.086 1.096-0.086zM25.007 13.003c3.862 0 6.993 3.131 6.993 6.993s-3.131 6.993-6.993 6.993-6.993-3.131-6.993-6.993l-0.031-0.999c0-7.724 6.262-13.986 13.986-13.986v3.996c-2.668 0-5.177 1.039-7.064 2.926-0.363 0.363-0.695 0.75-0.994 1.156 0.357-0.056 0.723-0.086 1.096-0.086z">
                                        </path>
                                    </svg></div>
                            </div>
                            <div>
                                <div class="vditor-tooltipped vditor-tooltipped__n" aria-label="无序列表 <ctrl-l>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32">
                                        <path
                                            d="M12 2h20v4h-20v-4zM12 14h20v4h-20v-4zM12 26h20v4h-20v-4zM0 4c0 2.209 1.791 4 4 4s4-1.791 4-4c0-2.209-1.791-4-4-4s-4 1.791-4 4zM0 16c0 2.209 1.791 4 4 4s4-1.791 4-4c0-2.209-1.791-4-4-4s-4 1.791-4 4zM0 28c0 2.209 1.791 4 4 4s4-1.791 4-4c0-2.209-1.791-4-4-4s-4 1.791-4 4z">
                                        </path>
                                    </svg></div>
                            </div>
                            <div>
                                <div class="vditor-tooltipped vditor-tooltipped__n" aria-label="有序列表 <ctrl-o>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32">
                                        <path
                                            d="M11 26h20v4h-20zM11 14h20v4h-20zM11 2h20v4h-20zM5 0v8h-2v-6h-2v-2zM3 16.438v1.563h4v2h-6v-4.563l4-1.875v-1.563h-4v-2h6v4.563zM7 22v10h-6v-2h4v-2h-4v-2h4v-2h-4v-2z">
                                        </path>
                                    </svg></div>
                            </div>
                            <div>
                                <div class="vditor-tooltipped vditor-tooltipped__n" aria-label="任务列表 <ctrl-j>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32">
                                        <path
                                            d="M27.094 19.485v6.12c0 3.059-2.483 5.542-5.542 5.542h-16.010c-3.059 0-5.542-2.483-5.542-5.542v-16.010c0-3.059 2.483-5.542 5.542-5.542h16.010c0.769 0 1.54 0.154 2.251 0.481 0.174 0.077 0.308 0.25 0.346 0.443 0.039 0.211-0.019 0.404-0.174 0.558l-0.943 0.943c-0.115 0.115-0.289 0.193-0.443 0.193-0.058 0-0.115-0.019-0.174-0.039-0.289-0.077-0.578-0.115-0.866-0.115h-16.010c-1.693 0-3.079 1.386-3.079 3.079v16.010c0 1.693 1.386 3.079 3.079 3.079h16.010c1.693 0 3.079-1.386 3.079-3.079v-4.888c0-0.154 0.058-0.308 0.174-0.424l1.232-1.232c0.135-0.135 0.289-0.193 0.443-0.193 0.077 0 0.154 0.019 0.231 0.058 0.231 0.096 0.385 0.308 0.385 0.558zM31.54 10.076l-15.664 15.664c-0.615 0.615-1.578 0.615-2.194 0l-8.275-8.275c-0.615-0.615-0.615-1.578 0-2.194l2.116-2.116c0.615-0.615 1.578-0.615 2.194 0l5.060 5.060 12.451-12.451c0.615-0.615 1.578-0.615 2.194 0l2.116 2.116c0.615 0.615 0.615 1.578 0 2.194z">
                                        </path>
                                    </svg></div>
                            </div>
                            <div>
                                <div class="vditor-tooltipped vditor-tooltipped__n" aria-label="代码块 <ctrl-u>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32">
                                        <path
                                            d="M21.053 21.895l2.526 2.526 8.421-8.421-8.421-8.421-2.526 2.526 5.895 5.895z">
                                        </path>
                                        <path
                                            d="M10.947 10.105l-2.526-2.526-8.421 8.421 8.421 8.421 2.526-2.526-5.895-5.895z">
                                        </path>
                                        <path d="M17.613 6.487l1.828 0.499-5.052 18.527-1.828-0.499 5.052-18.527z">
                                        </path>
                                    </svg> </div>
                            </div>
                            <div>
                                <div class="vditor-tooltipped vditor-tooltipped__n" aria-label="行内代码 <ctrl-g>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32">
                                        <path
                                            d="M18.133 23.467l3.2 3.2 10.667-10.667-10.667-10.667-3.2 3.2 7.467 7.467z">
                                        </path>
                                        <path
                                            d="M13.867 8.533l-3.2-3.2-10.667 10.667 10.667 10.667 3.2-3.2-7.467-7.467z">
                                        </path>
                                    </svg> </div>
                            </div>
                            <div>
                                <div class="vditor-tooltipped vditor-tooltipped__n" aria-label="撤销 <ctrl-z>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32">
                                        <path
                                            d="M12.417 9.75q8.667 1.25 13.375 6.625t6.208 12.958q-6.417-9.083-19.583-9.083v7.25l-12.417-12.417 12.417-12.417v7.083z">
                                        </path>
                                    </svg> </div>
                            </div>
                            <div>
                                <div class="vditor-tooltipped vditor-tooltipped__n" aria-label="重做 <ctrl-y>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32">
                                        <path
                                            d="M19.583 9.75q-8.667 1.25-13.375 6.625t-6.208 12.958q6.417-9.083 19.583-9.083v7.25l12.417-12.417-12.417-12.417v7.083z">
                                        </path>
                                    </svg></div>
                            </div>
                            <div>
                                <div class="vditor-tooltipped vditor-tooltipped__n" aria-label="链接 <ctrl-k>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32">
                                        <path
                                            d="M29.187 2.933l-0.12-0.121c-2.813-2.812-7.415-2.812-10.228 0l-6.516 6.517c-2.812 2.812-2.812 7.415 0 10.227l0.12 0.12c0.234 0.234 0.482 0.446 0.739 0.641l2.386-2.386c-0.278-0.164-0.542-0.361-0.78-0.599l-0.121-0.121c-1.527-1.527-1.527-4.012 0-5.539l6.517-6.516c1.527-1.527 4.012-1.527 5.539 0l0.121 0.12c1.527 1.527 1.527 4.012 0 5.539l-2.948 2.948c0.512 1.264 0.754 2.611 0.733 3.955l4.559-4.559c2.812-2.812 2.812-7.415-0-10.227zM19.557 12.323c-0.234-0.234-0.482-0.446-0.739-0.641l-2.386 2.385c0.278 0.164 0.542 0.361 0.78 0.599l0.121 0.121c1.527 1.527 1.527 4.012 0 5.539l-6.517 6.517c-1.527 1.527-4.012 1.527-5.539 0l-0.121-0.121c-1.527-1.527-1.527-4.012 0-5.539l2.948-2.948c-0.512-1.264-0.754-2.611-0.733-3.955l-4.559 4.559c-2.812 2.812-2.812 7.415 0 10.228l0.12 0.12c2.813 2.812 7.415 2.812 10.228 0l6.516-6.517c2.812-2.812 2.812-7.415 0-10.228l-0.12-0.12z">
                                        </path>
                                    </svg></div>
                            </div>
                            <div>
                                <div class="vditor-tooltipped vditor-tooltipped__n" aria-label="表格 <ctrl-m>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32">
                                        <path
                                            d="M9.846 26.462v-3.692c0-0.346-0.269-0.615-0.615-0.615h-6.154c-0.346 0-0.615 0.269-0.615 0.615v3.692c0 0.346 0.269 0.615 0.615 0.615h6.154c0.346 0 0.615-0.269 0.615-0.615zM9.846 19.077v-3.692c0-0.346-0.269-0.615-0.615-0.615h-6.154c-0.346 0-0.615 0.269-0.615 0.615v3.692c0 0.346 0.269 0.615 0.615 0.615h6.154c0.346 0 0.615-0.269 0.615-0.615zM19.692 26.462v-3.692c0-0.346-0.269-0.615-0.615-0.615h-6.154c-0.346 0-0.615 0.269-0.615 0.615v3.692c0 0.346 0.269 0.615 0.615 0.615h6.154c0.346 0 0.615-0.269 0.615-0.615zM9.846 11.692v-3.692c0-0.346-0.269-0.615-0.615-0.615h-6.154c-0.346 0-0.615 0.269-0.615 0.615v3.692c0 0.346 0.269 0.615 0.615 0.615h6.154c0.346 0 0.615-0.269 0.615-0.615zM19.692 19.077v-3.692c0-0.346-0.269-0.615-0.615-0.615h-6.154c-0.346 0-0.615 0.269-0.615 0.615v3.692c0 0.346 0.269 0.615 0.615 0.615h6.154c0.346 0 0.615-0.269 0.615-0.615zM29.538 26.462v-3.692c0-0.346-0.269-0.615-0.615-0.615h-6.154c-0.346 0-0.615 0.269-0.615 0.615v3.692c0 0.346 0.269 0.615 0.615 0.615h6.154c0.346 0 0.615-0.269 0.615-0.615zM19.692 11.692v-3.692c0-0.346-0.269-0.615-0.615-0.615h-6.154c-0.346 0-0.615 0.269-0.615 0.615v3.692c0 0.346 0.269 0.615 0.615 0.615h6.154c0.346 0 0.615-0.269 0.615-0.615zM29.538 19.077v-3.692c0-0.346-0.269-0.615-0.615-0.615h-6.154c-0.346 0-0.615 0.269-0.615 0.615v3.692c0 0.346 0.269 0.615 0.615 0.615h6.154c0.346 0 0.615-0.269 0.615-0.615zM29.538 11.692v-3.692c0-0.346-0.269-0.615-0.615-0.615h-6.154c-0.346 0-0.615 0.269-0.615 0.615v3.692c0 0.346 0.269 0.615 0.615 0.615h6.154c0.346 0 0.615-0.269 0.615-0.615zM32 5.538v20.923c0 1.692-1.385 3.077-3.077 3.077h-25.846c-1.692 0-3.077-1.385-3.077-3.077v-20.923c0-1.692 1.385-3.077 3.077-3.077h25.846c1.692 0 3.077 1.385 3.077 3.077z">
                                        </path>
                                    </svg> </div>
                            </div>
                            <div>
                                <div class="vditor-tooltipped vditor-tooltipped__n" aria-label="开始录音/结束录音"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32">
                                        <path
                                            d="M4.571 16c0 6.312 5.117 11.429 11.429 11.429s11.429-5.117 11.429-11.429v0c0-6.312-5.117-11.429-11.429-11.429s-11.429 5.117-11.429 11.429v0z">
                                        </path>
                                        <path
                                            d="M16 30.857c-8.229 0-14.933-6.705-14.933-14.933s6.705-14.933 14.933-14.933 15.010 6.705 15.010 15.010c0 8.152-6.705 14.857-15.010 14.857zM16 0c-8.838 0-16 7.162-16 16s7.162 16 16 16 16-7.162 16-16-7.162-16-16-16z">
                                        </path>
                                    </svg> </div>
                            </div>
                            <div>
                                <div class="vditor-tooltipped vditor-tooltipped__nw vditor-menu--current"
                                    aria-label="编辑 &amp; 预览 <ctrl-p>"><svg version="1.1"
                                        xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32">
                                        <path
                                            d="M11.429 6.095h-9.905c-0.842 0-1.524 0.682-1.524 1.524v1.524c0 0.841 0.682 1.524 1.524 1.524h9.905c0.841 0 1.524-0.682 1.524-1.524v-1.524c0-0.842-0.682-1.524-1.524-1.524zM11.429 13.714h-9.905c-0.842 0-1.524 0.682-1.524 1.524v1.524c0 0.841 0.682 1.524 1.524 1.524h9.905c0.841 0 1.524-0.682 1.524-1.524v-1.524c0-0.841-0.682-1.524-1.524-1.524zM11.429 21.333h-9.905c-0.842 0-1.524 0.682-1.524 1.524v1.524c0 0.841 0.682 1.524 1.524 1.524h9.905c0.841 0 1.524-0.682 1.524-1.524v-1.524c0-0.841-0.682-1.524-1.524-1.524zM30.476 6.095h-12.952c-0.841 0-1.524 0.682-1.524 1.524v16.762c0 0.841 0.682 1.524 1.524 1.524h12.952c0.841 0 1.524-0.682 1.524-1.524v-16.762c0-0.841-0.682-1.524-1.524-1.524z">
                                        </path>
                                    </svg> </div>
                            </div>
                            <div>
                                <div class="vditor-tooltipped vditor-tooltipped__nw" aria-label="预览 <ctrl-⇧-p>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32">
                                        <path
                                            d="M0 16c3.037-5.864 9.058-9.802 16-9.802s12.963 3.938 15.953 9.703l0.047 0.1c-3.037 5.864-9.058 9.802-16 9.802s-12.963-3.938-15.953-9.703l-0.047-0.1zM16 22.531c3.607 0 6.531-2.924 6.531-6.531s-2.924-6.531-6.531-6.531v0c-3.607 0-6.531 2.924-6.531 6.531s2.924 6.531 6.531 6.531v0zM16 19.265c-1.804 0-3.265-1.461-3.265-3.265s1.461-3.265 3.265-3.265v0c1.804 0 3.265 1.461 3.265 3.265s-1.461 3.265-3.265 3.265v0z">
                                        </path>
                                    </svg> </div>
                            </div>
                            <div>
                                <div class="vditor-tooltipped vditor-tooltipped__nw" aria-label="全屏 <ctrl-'>">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="32px"
                                        height="32px">
                                        <path d="M32 0v13l-5-5-6 6-3-3 6-6-5-5zM14 21l-6 6 5 5h-13v-13l5 5 6-6z">
                                        </path>
                                    </svg></div>
                            </div>
                            <div>
                                <div class="vditor-tooltipped vditor-tooltipped__nw" aria-label="关于"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32">
                                        <path
                                            d="M23.273 27.636v2.909c0 0.795-0.659 1.455-1.455 1.455h-11.636c-0.795 0-1.455-0.659-1.455-1.455v-2.909c0-0.795 0.659-1.455 1.455-1.455h1.455v-8.727h-1.455c-0.795 0-1.455-0.659-1.455-1.455v-2.909c0-0.795 0.659-1.455 1.455-1.455h8.727c0.795 0 1.455 0.659 1.455 1.455v13.091h1.455c0.795 0 1.455 0.659 1.455 1.455zM20.364 1.455v4.364c0 0.795-0.659 1.455-1.455 1.455h-5.818c-0.795 0-1.455-0.659-1.455-1.455v-4.364c0-0.795 0.659-1.455 1.455-1.455h5.818c0.795 0 1.455 0.659 1.455 1.455z">
                                        </path>
                                    </svg> </div>
                            </div>
                            <div>
                                <div class="vditor-tooltipped vditor-tooltipped__nw" aria-label="帮助"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32">
                                        <path
                                            d="M19.652 25v6c0 0.55-0.45 1-1 1h-6c-0.55 0-1-0.45-1-1v-6c0-0.55 0.45-1 1-1h6c0.55 0 1 0.45 1 1zM27.552 10c0 4.75-3.225 6.575-5.6 7.9-1.475 0.85-2.4 2.575-2.4 3.3v0c0 0.55-0.425 1.2-1 1.2h-6c-0.55 0-0.9-0.85-0.9-1.4v-1.125c0-3.025 3-5.625 5.2-6.625 1.925-0.875 2.725-1.7 2.725-3.3 0-1.4-1.825-2.65-3.85-2.65-1.125 0-2.15 0.35-2.7 0.725-0.6 0.425-1.2 1.025-2.675 2.875-0.2 0.25-0.5 0.4-0.775 0.4-0.225 0-0.425-0.075-0.625-0.2l-4.1-3.125c-0.425-0.325-0.525-0.875-0.25-1.325 2.7-4.475 6.5-6.65 11.6-6.65 5.35 0 11.35 4.275 11.35 10z">
                                        </path>
                                    </svg> </div>
                            </div>
                            <div class="vditor-menu__br"></div>
                        </div>
                        <div class="vditor-content">
                            <div class="vditor-textarea" placeholder="" name="vditor" contenteditable="true">
                            </div>
                            <div class="vditor-preview vditor-preview--both">
                                <div class="vditor-reset" style="max-width: 768px;">
                                </div>
                            </div>
                            <div class="vditor-counter">0/200</div>
                            <div class="vditor-upload"></div>
                            <div class="vditor-tip"></div>
                            <ul class="vditor-hint" style="display: none;"></ul>
                        </div>
                    </div>
                </div>

                <!-- 发布按钮 -->
                <div class="button-line">
                    <span id="error-info"></span>
                    <button type="button" id="publish-btn" onclick="check_comment()">发布</button>
                </div>

                <!-- 总评论数量 -->
                <div class="total-count">
                    共 <span id="comment-count">3</span> 条评论
                </div>

                <!-- 引用评论 -->
                <!--  
                <div class="comment-item">
                    用户头像
                    <div class="user-img-box">
                        <img src="img/user.jpeg" id="user-img" alt="">
                    </div>

                    <div class="comment-box">
                         用户发布时的相关信息 
                        <div class="user-info">
                            <span class="user-name">用户名称</span>
                            <span class="publish-time">发表评论时的时间</span>
                        </div>

                         引用评论盒子 
                        <div class="reply-box">
                            <div class="user-info">
                                <span class="reply-user-name">引用 对应用户名称</span>
                                <span class="publish-time">原评论发表时间</span>
                            </div>
                            <div class="comment-content c-666" style="padding-bottom: 5px; padding-left: 10px">
                                <p>原评论正文</p>
                            </div>
                        </div>

                         回复评论正文 
                        <div class="comment-content c-666">
                            <p>回复评论正文</p>
                        </div>

                         该条评论的点赞与回复数 
                        <div class="icon-line">
                            <a href="javascript:void(0)" class="comment-icon"
                                style="background-image: url('https://zhaoyangkun.gitee.io/blog-static/img/comment.svg');"
                                onclick="show_reply(this)"></a>
                             点赞数量 
                            <span class="reply_count c-666">0</span>
                            <a href="javascript:void(0)" class="liked-icon"
                                style="background-image: url('https://zhaoyangkun.gitee.io/blog-static/img/liked.svg');"
                                onclick="like_comment(30)"></a>
                             回复数量 
                            <span class="liked_count c-666">0</span>
                        </div>

                        <div class="reply-holder" style="display: none;">
                            <input class="reply-btn" type="button" onclick="reply_comment(this,30,22,41)" value="回复">
                        </div>
                    </div>
                </div>
                -->
                
                
                <!-- 单个评论 -->
                <!--  
                <div class="comment-item">
                    <div class="user-img-box">
                        <img src="img/user.jpeg" id="user-img" alt="">
                    </div>
                    <div class="comment-box">
                        <div class="user-info">
                            <span class="user-name">admin</span>
                            <span class="publish-time">2019-08-27 00:02:11</span>
                        </div>

                        <div class="comment-content c-666">
                            <p>虽然没什么人访问，但我初心还在。</p>
                        </div>
                        <div class="icon-line">
                            <a href="javascript:void(0)" class="comment-icon"
                                style="background-image: url('https://zhaoyangkun.gitee.io/blog-static/img/comment.svg');"
                                onclick="show_reply(this)"></a>
                            <span class="reply_count c-666">0</span>
                            <a href="javascript:void(0)" class="liked-icon"
                                style="background-image: url('https://zhaoyangkun.gitee.io/blog-static/img/liked.svg');"
                                onclick="like_comment(29)"></a>
                            <span class="liked_count c-666">0</span>
                        </div>
                        <div class="reply-holder" style="display: none;">
                            <input class="reply-btn" type="button" onclick="reply_comment(this,29,22,41)" value="回复">
                        </div>
                    </div>
                </div>-->
            </div>
        </div>
    </section>
    <!--尾部-->
</body>

<footer class="footer"></footer>

<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript" src="js/pace.min.js"></script>
<script type="text/javascript" src="js/vditor.min.js"></script>
<script type="text/javascript" src="js/article-detail.js"></script>
<script type="text/javascript" src="js/sweetalert.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML"></script>
<script type="text/x-mathjax-config">
    MathJax.Hub.Config({
        showProcessingMessages: false, //关闭js加载过程信息
        messageStyle: "none", //不显示信息
        extensions: ["tex2jax.js"],
        jax: ["input/TeX", "output/HTML-CSS"],
        tex2jax: {
            inlineMath:  [ ["$", "$"] ], //行内公式选择$
            displayMath: [ ["$$","$$"] ], //段内公式选择$$
            skipTags: ['script', 'noscript', 'style', 'textarea', 'pre','code','a'], //避开某些标签
            ignoreClass:"comment-content" //避开含该Class的标签
        },
        "HTML-CSS": {
            availableFonts: ["STIX","TeX"], //可选字体
            showMathMenu: false //关闭右击菜单显示
        }
    });
    MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
</script>

<script type="text/javascript" defer>
    //图片懒加载
    const lazyImage = new LazyImage('.lazy-image');
    $(".vditor-reset").html("");
</script>

</html>