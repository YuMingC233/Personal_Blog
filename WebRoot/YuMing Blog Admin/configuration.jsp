<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

<head>
  <base href="<%=basePath%>">
    
  <!-- Title Icon -->
  <link rel="shortcut icon" href="img/Only.ico" type="image/x-icon">

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 3 | User Profile</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="./plugins/selectize/css/selectize.default.css">

  <!-- Theme style -->
  <link rel="stylesheet" href="./css/adminlte.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="./plugins/fontawesome-free/css/all.min.css">

</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fa fa-bars"></i></a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" href="../index.html">
          <i class="fa fa-paper-plane"></i>
          <span>博客前台首页</span>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <h1>
      <a href="../index.html" class="brand-link">
        <img src="./upload/avatar.jpg" class="brand-image img-circle elevation-3">
        <span class="brand-text font-weight-light">ZengZK's Blog</span>
      </a>
    </h1>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-header">仪表盘</li>
          <li class="nav-item">
            <a href="dashboard.html" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>仪表盘</p>
            </a>
          </li>
          <li class="nav-header">博客编辑</li>
          <li class="nav-item">
            <a href="edit.html" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>发布博客</p>
            </a>
          </li>
          <li class="nav-header">管理模块</li>
          <li class="nav-item">
            <a href="blog-mgr.html" class="nav-link">
              <i class="fa fa-list-alt nav-icon"></i>
              <p>博客管理</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="tag-mgr.html" class="nav-link">
              <i class="fa fa-tags nav-icon"></i>
              <p>标签管理</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="comment-mgr.html" class="nav-link">
              <i class="fa fa-comments nav-icon"></i>
              <p>评论管理</p>
            </a>
          </li>
          <li class="nav-header">系统管理</li>
          <!-- <li class="nav-item">
            <a href="configuration.html" class="nav-link active">
              <i class="fa fa-wrench nav-icon"></i>
              <p>系统配置</p>
            </a>
          </li> -->
          <li class="nav-item">
            <a href="../index.html" class="nav-link">
              <i class="fa fa-sign-out-alt nav-icon"></i>
              <p>安全退出</p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper mt-3">
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-6">
            <div class="card card-primary card-outline">
              <div class="card-header">
                <h3 class="card-title">个人信息</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form role="form">
                <div class="card-body">
                  <div class="form-group">
                    <label for="username">用户名</label>
                    <input type="text" class="form-control" id="username" value="ZengZK" placeholder="用户名">
                  </div>
                  <div class="form-group">
                    <label for="email">邮箱</label>
                    <input type="email" class="form-control" id="email" value="BuctZengZK@163.com" placeholder="邮箱">
                  </div>
                  <div class="form-group">
                    <label for="avatar">头像</label>
                    <div class="input-group">
                      <input type="file" name="" value="" id="avatar" class="w-100 border">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="resume">个人简介</label>
                    <textarea class="form-control" rows="8" id="resume" name="resume" placeholder="个人简介（200字内）..." maxlength="200" style="resize:none"></textarea>
                  </div>
                  <div class="form-group">
                    <label for="position">位置</label>
                    <input type="text" class="form-control" id="position" value="中国, 沈阳" placeholder="position">
                  </div>
                  <div class="form-group">
                    <label for="job">职业</label>
                    <input type="text" class="form-control" id="job" placeholder="job">
                  </div>
                  <div class="form-group">
                    <label for="skill">技能</label>
                    <input type="text"  id="skill" value="前端,后台" placeholder="skill">
                  </div>
                  <div class="form-group">
                    <label for="hobby">爱好</label>
                    <input type="text" id="hobby" value="编程,学习" placeholder="hobby">
                  </div>
                  <div class="form-group">
                    <label for="github">github</label>
                    <input type="text" class="form-control" id="github" placeholder="github">
                  </div>
                  <div class="form-group">
                    <label for="QQ">QQ</label>
                    <input type="text" class="form-control" id="QQ" placeholder="QQ">
                  </div>
                  <div class="form-group">
                    <label for="WeChat">微信</label>
                    <input type="text" class="form-control" id="WeChat" placeholder="WeChat">
                  </div>
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary float-right">确认修改</button>
                </div>
              </form>
            </div>
          </div>
          <div class="col-md-6">
            <div class="card card-teal card-outline">
              <div class="card-header">
                <h3 class="card-title">站点信息</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form role="form">
                <div class="card-body">
                  <div class="form-group">
                    <label for="websiteName">站点名</label>
                    <input type="text" class="form-control" id="websiteName" value="ZengZK' Blog" placeholder="website name">
                  </div>
                  <div class="form-group">
                    <label for="favicon">站点图标</label>
                    <input type="text" class="form-control" id="favicon"  placeholder="favicon.ico">
                  </div>
                  <div class="form-group">
                    <label for="icp">备案号</label>
                    <input type="text" class="form-control" id="icp"  placeholder="ICP">
                  </div>
                  <div class="form-group">
                    <label for="description">站点描述</label>
                    <input type="text" class="form-control" id="description" placeholder="description">
                  </div>
                  <div class="form-group">
                    <label for="keywords">站点关键词</label>
                    <input type="text" class="form-control" id="keywords" placeholder="keywords">
                  </div>
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary float-right">确认修改</button>
                </div>
              </form>
            </div>
            <div class="card card-danger card-outline">
              <div class="card-header">
                <h3 class="card-title">修改密码</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form role="form">
                <div class="card-body">
                  <div class="form-group">
                    <label for="oldPwd">旧密码</label>
                    <input type="password" class="form-control" id="oldPwd"  placeholder="old password">
                  </div>
                  <div class="form-group">
                    <label for="newPwd">新密码</label>
                    <input type="password" class="form-control" id="newPwd"  placeholder="new password">
                  </div>
                  <div class="form-group">
                    <label for="confirmPwd">新密码</label>
                    <input type="password" class="form-control" id="confirmPwd"  placeholder="confirm password">
                  </div>
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                  <button type="submit" class="btn btn-danger float-right">确认修改</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <p class="text-center mb-1">
      Copyright © 2020 ZengZK Designed by ZengZK Powered by AdminLTE
    </p>
    <p class="text-center">
      <a href="">粤ICP备20040058号</a>
    </p>
  </footer>
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="./plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="./plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="./plugins/selectize/js/standalone/selectize.min.js"></script>
<!-- AdminLTE App -->
<script src="./js/adminlte.min.js"></script>

<script src="./js/configuration.js"></script>
</body>
</html>
