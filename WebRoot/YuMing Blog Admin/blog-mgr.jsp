<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
  <title>YuMingBlog | 博客管理</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- DataTables -->
  <link rel="stylesheet" href="./plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="./plugins/datatables-responsive/css/responsive.bootstrap4.min.css">

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
        <a href="../index.jsp" class="brand-link">
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
              <a href="blog-mgr.jsp" class="nav-link active">
                <i class="fa fa-list-alt nav-icon" aria-hidden="true"></i>
                <p>博客管理</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="tag-mgr.jsp" class="nav-link">
                <i class="fa fa-tags nav-icon" aria-hidden="true"></i>
                <p>标签管理</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="comment-mgr.jsp" class="nav-link">
                <i class="fa fa-comments nav-icon" aria-hidden="true"></i>
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
          <div class="row">
            <div class="col-12">
              <div class="card card-teal card-outline">
                <div class="card-header">
                  <h3 class="card-title">博客列表</h3>
                </div>
                <div class="card-body">

                </div>
                <hr class="m-0">
                <!-- /.card-header -->
                <div class="card-body table-responsive">
                  <table id="testTable" class="table table-bordered table-hover text-nowrap">
                    <thead>
                      <tr>
                        <th><input type="checkbox" value="' + data + '" name="id" /></th>
                        <th>标题</th>
                        <th>相关标签</th>
                        <th>浏览量</th>
                        <th>评论量</th>
                        <th>发布时间</th>
                        <th>最后一次更新时间</th>
                        <th>操作</th>
                      </tr>
                    </thead>
                  </table>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
            </div>
            <!-- /.col -->
          </div>

        </div>
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

  <!-- 删除博文相关bootstrap弹窗 start -->
  <div class="modal fade" id="deleteBlogModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">删除Blog</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p class="m-0">你确定要删除该条Blog吗？</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
          <button id="deleteTagBtn" type="button" class="btn btn-danger">删除</button>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>

  <div class="modal fade" id="deleteManyBlogModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">删除Blog</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p class="m-0">你确定要删除选中的多个Blog吗？</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
          <button id="deleteTagBtn" type="button" class="btn btn-danger">删除</button>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>

  <div class="modal fade" id="delComplete">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">信息</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p class="m-0">已经将该博文从数据库中删除……</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>

  <div class="modal fade" id="delFailed">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">警告</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p class="m-0">出现问题,未能成功将该博文从数据库中删除……</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
  <!-- 删除博文相关bootstrap弹窗 over -->

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

  <!-- DataTables -->
  <script src="./plugins/datatables/jquery.dataTables.min.js"></script>
  <script src="./plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
  <script src="./plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
  <script src="./plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>

  <!-- AdminLTE App -->
  <script src="./js/adminlte.min.js"></script>
  <script src="./js/initBlogJsonList.js"></script>

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
