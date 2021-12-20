<%@ page import="com.Entity.Admin"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <title>YuMingAdmin | Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="YuMing Blog Admin/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="YuMing Blog Admin/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="css/GoogleAPI_css.css" rel="stylesheet">
  
  <!-- jQuery -->
  <script src="YuMing Blog Admin/plugins/jquery/jquery.min.js"></script>
  <!-- Bootstrap 4 -->
  <script src="YuMing Blog Admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- AdminLTE App -->
  <script src="YuMing Blog Admin/js/adminlte.min.js"></script>
</head>
<body class="hold-transition login-page">
  <div class="login-box">
    <div class="login-logo">
      <b>博客后端管理系统</b>
    </div>
    <!-- /.login-logo -->
    <div class="card">
      <div class="card-body login-card-body">
        <form action="adminLogin" method="post">
          <div class="input-group mb-3">
            <input type="email" class="form-control" placeholder="Email" name="Email">
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-envelope"></span>
              </div>
            </div>
          </div>
          <div class="input-group mb-3">
            <input type="password" class="form-control" placeholder="Password" name="Password">
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-lock"></span>
              </div>
            </div>
          </div>
          <div class="row">
            <!-- /.col -->
            <button type="submit" class="btn btn-success btn-block">登录</button>
            <!-- /.col -->
          </div>
        </form>

        <div class="social-auth-links text-center mb-3">
          <p>- OR -</p>
          <a href="#" class="btn btn-block btn-primary">
            <i class="fab fa-github mr-2"></i> Sign in using Github
          </a>
        </div>
        <!-- /.social-auth-links -->
      </div>
      <!-- /.login-card-body -->
    </div>
  </div>
  <!-- /.login-box -->

  <!-- Bootstrap modalBox -->
  <div class="modal fade" id="WrongInfo">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">账户或密码错误</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p class="m-0">请重新检查您的账户与密码！</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
</body>

<!-- 当获取到的getSession中的内容为null时，判断为没有登录，反之亦然 -->
<c:choose>
   <c:when test="${sessionScope.account == null}">
	   <c:if test="${requestScope.flag eq '1'}">
	   	${"<script>$('#WrongInfo').modal('show');</script>"}
	   </c:if>
   </c:when>
</c:choose>


</html>