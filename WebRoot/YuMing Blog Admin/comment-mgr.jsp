<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

<head>
  <base href="<%=basePath + "YuMing Blog Admin/"%>">
    
  <!-- Title Icon -->
  <link rel="shortcut icon" href="../img/Only.ico" type="image/x-icon">

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>YuMing | 评论管理</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Theme style -->
  <link rel="stylesheet" href="./css/adminlte.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="./plugins/fontawesome-free/css/all.min.css">

</head>

<body class="hold-transition sidebar-mini layout-fixed">
  <div class="wrapper">
    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-light navbar-white">
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
          <a class="nav-link" href="../index.jsp">
            <i class="fa fa-paper-plane"></i>
            <span>博客前台首页</span>
          </a>
        </li>
      </ul>
    </nav>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar elevation-4 sidebar-light-warning">
      <!-- Brand Logo -->
      <h1>
        <a href="../index.jsp" class="brand-link navbar-light">
          <img src="./upload/avatar.jpg" class="brand-image img-circle elevation-3">
          <span class="brand-text font-weight-light">YuMing Blog</span>
        </a>
      </h1>

      <!-- Sidebar -->
      <div class="sidebar">
        <!-- Sidebar Menu -->
        <nav class="mt-2">
          <ul class="nav nav-pills nav-sidebar flex-column nav-flat" data-widget="treeview" role="menu"
            data-accordion="false">
            <!-- Add icons to the links using the .nav-icon class
                with font-awesome or any other icon font library -->
            <li class="nav-header">仪表盘</li>
            <li class="nav-item">
              <a href="dashboard.jsp" class="nav-link">
                <i class="nav-icon fas fa-tachometer-alt"></i>
                <p>仪表盘</p>
              </a>
            </li>
            <li class="nav-header">博客编辑</li>
            <li class="nav-item">
              <a href="edit.jsp" class="nav-link">
                <i class="nav-icon fas fa-edit"></i>
                <p>发布博客</p>
              </a>
            </li>
            <li class="nav-header">管理模块</li>
            <li class="nav-item">
              <a href="blog-mgr.jsp" class="nav-link">
                <i class="fa fa-list-alt nav-icon"></i>
                <p>博客管理</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="tag-mgr.jsp" class="nav-link">
                <i class="fa fa-tags nav-icon"></i>
                <p>标签管理</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="comment-mgr.jsp" class="nav-link active">
                <i class="fa fa-comments nav-icon"></i>
                <p>评论管理</p>
              </a>
            </li>
            <li class="nav-header">系统管理</li>
            <!-- <li class="nav-item">
              <a href="configuration.html"
                class="nav-link">
                <i class="fa fa-wrench nav-icon"></i>
                <p>系统配置</p>
              </a>
            </li> -->
            <li class="nav-item">
              <a href="../index.jsp" class="nav-link">
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
          <!-- /.col -->
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">评论列表</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap table-bordered">
                  <thead>
                  <tr>
                    <th width="5%"></th>
                    <th>评论人</th>
                    <th>评论人QQ账号</th>
                    <th>评论正文</th>
                    <th>评论时间</th>
                    <th>前台地址</th>
                    <th>喜欢数</th>
                    <th>被评论数量</th>
                    <th class="text-center" width="15%">操作</th>
                  </tr>
                  </thead>
                  <tbody>
                  <!-- <tr>
                    <td class="text-center">1</td>
                    <td>xiaoming</td>
                    <td>123@163.com</td>
                    <td>123</td>
                    <td>2020.6.24</td>
                    <td><a target="_blank" href="detail.jsp">博客标题</a></td>
                    <td>1</td>
                    <td>2</td>
                    <td class="text-center">
                      <button class="btn btn-xs btn-success" data-toggle="modal" data-target="#replyCommentModal">
                        <i class="fa fa-edit"></i>
                        回复
                      </button>
                      <button class="btn btn-xs btn-danger ml-2" data-toggle="modal" data-target="#deleteCommentModal">
                        <i class="fa fa-trash"></i>
                        删除
                      </button>
                    </td>
                  </tr> -->
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                <ul class="pagination pagination-sm m-0 float-right">
                  <li class="page-item"><a class="page-link" href="#"><i class="fa fa-angle-left"></i></a></li>
                  <li class="page-item active"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#"><i class="fa fa-angle-right"></i></a></li>
                </ul>
              </div>
            </div>
            <!-- /.card -->
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
        <a href="">湘ICP备 ? 号</a>
      </p>
    </footer>
  </div>
  <!-- ./wrapper -->

  <div class="modal fade" id="replyCommentModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">回复</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <input class="form-control" type="text">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
          <button id="updateCategoryBtn" type="button" class="btn btn-success">确认</button>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>

  <div class="modal fade" id="deleteCommentModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">删除评论</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p class="m-0">你确定要删除吗？</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
          <button id="deleteCategoryBtn" type="button" class="btn btn-danger">删除</button>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>

  <!-- Bootstrap modalBox 没有登陆提示框 -->
  <div class="modal fade" id="NotLoginInfo">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">未登录</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p class="m-0">您没有登录，将会自动跳转到登录页面！</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>

  <!-- jQuery -->
  <script src="./plugins/jquery/jquery.min.js"></script>
  <!-- Bootstrap 4 -->
  <script src="./plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- AdminLTE App -->
  <script src="./js/adminlte.min.js"></script>
  
<%-- 当获取到的getSession中的内容为null时，判断为没有登录，反之亦然 --%>
<c:if test="${sessionScope.account == null}">
	<script>
		$('#NotLoginInfo').modal("show"); 
		$('#NotLoginInfo').on('hidden.bs.modal', function () {
			location.href = "../loginAdmin.jsp";		
		});
	</script>
</c:if>
</body>

</html>
