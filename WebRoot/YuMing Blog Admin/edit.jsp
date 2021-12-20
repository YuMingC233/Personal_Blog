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
  <title>YuMing | 添加博客</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="./plugins/fontawesome-free/css/all.min.css">

  <link rel="stylesheet" href="./plugins/editor.md/css/editormd.min.css">

  <link rel="stylesheet" href="./plugins/selectize/css/selectize.default.css">

  <!-- Select2 -->
  <link rel="stylesheet" href="./plugins/select2/css/select2.min.css">
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="./plugins/icheck-bootstrap/icheck-bootstrap.min.css">

  <!-- SweetAlert2 -->
  <link rel="stylesheet" href="./plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">

  <!-- Theme style -->
  <link rel="stylesheet" href="./css/adminlte.min.css">
</head>


<body class="hold-transition layout-top-nav">
<!-- Site wrapper -->
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand-md navbar-light navbar-white">
    <div class="container-fluid pl-5 pr-5">
      <a href="dashboard.jsp" class="navbar-brand">
        <img src="./upload/avatar.jpg" class="brand-image img-circle elevation-3">
        <span class="brand-text font-weight-light">YuMing Blog</span>
      </a>

      <button class="navbar-toggler order-1" type="button" data-toggle="collapse" data-target="#navbarCollapse"
              aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse order-3" id="navbarCollapse">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
          <li class="nav-item">
            <a href="dashboard.jsp" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              仪表盘
            </a>
          </li>
          <li class="nav-item">
            <a href="blog-mgr.jsp" class="nav-link">
              <i class="fa fa-list-alt nav-icon"></i>
              博客管理
            </a>
          </li>
          <li class="nav-item">
            <a href="tag-mgr.jsp" class="nav-link">
              <i class="fa fa-tags nav-icon"></i>
              标签管理
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- /.navbar -->

  <div class="container-fluid pl-5 pr-5 mt-3">
    <form id="blogForm" action="javascript:void(0)" method="post" enctype="multipart/form-data">
      <!-- /.card-body -->
      <div class="card card-teal card-outline">
        <div class="card-header">
          <h3 class="card-title">博客信息</h3>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col-md-7">
              <div class="form-group">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <label for="title" class="input-group-text">标题</label>
                  </div>
                  <!-- /btn-group -->
                  <input type="text" class="form-control" id="title" name="title" placeholder="博文标题(必填, 30字内)"
                         maxlength="30" autocomplete="off">
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <div class="input-group" style="align-items: center;">
                  <div class="input-group-prepend">
                    <label for="title" class="input-group-text" >侧边图片</label>
                  </div>
                  <!-- /btn-group -->
                  <input type="file" class="form-control" id="sideImage" name="sideImage" accept="image/png, image/jpeg, image/gif, image/jpg">
                	&nbsp;(必选 16M大小以内,修改时可为空,即不修改图片)
                </div>
              </div>
            </div>
            <div class="col-md-7">
              <div class="form-group">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <label for="title" class="input-group-text">作者</label>
                  </div>
                  <!-- /btn-group -->
                  <input type="text" class="form-control" id="Writter" name="Writter" placeholder="博客内容作者(必填, 10字内，默认为Connor)"
                    maxlength="10" value="Connor">
                </div>
              </div>
            </div>

            <div class="col-md-5">
              <!-- radio -->
              <div class="form-group clearfix">
                <div class="icheck-default d-inline-block">
                  <input type="radio" id="original" name="creationType" value="原创" checked="checked">
                  <label for="original">原创</label>
                </div>
                <div class="icheck-default d-inline-block ml-3">
                  <input type="radio" id="reprinted" name="creationType" value="转载">
                  <label for="reprinted">转载</label>
                </div>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="tagId">标签</label>
                <select id="tagId" name="tagId" class="select2" multiple="multiple" data-placeholder="选择标签...."
                        style="width: 100%;">
                  <!-- 在这里，value代表ID -->
                </select>
              </div>
              <!-- /.form-group -->
            </div>
            <!-- /.col -->
          </div>

          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label for="description">博客描述</label>
                <textarea class="form-control" rows="5" id="description" name="description"
                          placeholder="博客描述（选填, 200字内）"
                          maxlength="200" style="resize:none"></textarea>
              </div>
            </div>
          </div>

          <!-- EditorMD 控件html -->
          <div class="row">
            <!-- /.card-body -->
            <div id="editormd" class="form-group mb-3">
              <textarea name="content"></textarea>
            </div>
          </div>

          <div class="row" style="justify-content:flex-end">
            <div class="col-md-10">
              <button id="publishBtn" type="submit" class="btn btn-sm btn-success float-right">
                <i class="fa fa-edit"></i>
                发布博文
              </button>
              <!-- <button id="saveBtn" type="submit" class="btn btn-sm btn-dark float-right mr-1">
                <i class="fa fa-save"></i>
                保存
              </button> -->
              <button type="button" class="btn btn-sm btn-info float-right mr-1" data-toggle="modal"
                      data-target="#addTagModal">
                <i class="fas fa fa-plus"></i>
               新增标签
              </button>
            </div>
          </div>
        </div>
        <!-- /.row -->
      </div>

      <input type="hidden" id="isPublish" name="isPublish">
      <input type="hidden" id="ID" name="IDs">
    </form>
  </div>
</div>
<!-- ./wrapper -->

<div class="modal fade" id="addTagModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">新增标签</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <input type="text" id="tagInput" name="tag" value="">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
        <button id="addTagBtn" type="button" class="btn btn-success">新增</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

<div class="modal fade" id="addComplete">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">信息</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p class="m-0">已经将该标签添加到数据库中……</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

<div class="modal fade" id="updComplete">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">信息</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p class="m-0">已成功更新该博文！</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

<div class="modal fade" id="updFailed">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">信息</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p class="m-0">未能成功更新该博文……</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
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

<!-- SweetAlert2 -->
<script src="./plugins/sweetalert2/sweetalert2.min.js"></script>
<script src="./plugins/editor.md/js/editormd.min.js"></script>

<!-- Select2 -->
<script src="./plugins/select2/js/select2.full.min.js"></script>
<script src="./plugins/selectize/js/standalone/selectize.min.js"></script>

<script src="./js/addBlogPageInit.js"></script>
<script src="./js/edit.js"></script>
<script src="./js/taginput.init.js"></script>

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