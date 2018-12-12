<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/framework.tld" prefix="f" %>

<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8" />
		<title>仓库信息管理系统</title>		
		<meta name="keywords" content="Bootstrap模版,Bootstrap模版下载,Bootstrap教程,Bootstrap中文" />
		<meta name="description" content="JS代码网提供Bootstrap模版,Bootstrap教程,Bootstrap中文翻译等相关Bootstrap插件下载" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!-- basic styles -->
		
		<link href="<f:lrs uri="system/assets/css/bootstrap.min.css"/>" rel="stylesheet" />
		<link rel="stylesheet" href="<f:lrs uri="system/assets/css/font-awesome.min.css"/>" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<link rel="stylesheet" href="<f:lrs uri="system/assets/css/jquery-ui-1.10.3.custom.min.css"/>" />


		<link rel="stylesheet" href="<f:lrs uri="system/assets/css/ace.min.css"/>" />
		<link rel="stylesheet" href="<f:lrs uri="system/assets/css/ace-rtl.min.css"/>" />
		<link rel="stylesheet" href="<f:lrs uri="system/assets/css/ace-skins.min.css"/>" />

		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="<f:lrs uri="system/assets/css/ace-ie.min.css"/>" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		
		<script src="<f:lrs uri="system/assets/js/ace-extra.min.js"/>"></script>

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		
		<!--[if lt IE 9]>
		<script src="<f:lrs uri="system/assets/js/html5shiv.js"/>"></script>
		<script src="<f:lrs uri="system/assets/js/respond.min.js"/>"></script>
		<![endif]-->
		
		<script type="text/javascript">
		function setIframeHeight(iframe) {
			if (iframe) {
				var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
				if (iframeWin.document.body) {
					var heig = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
					iframe.height = heig+100;
				}
			}
		};

		window.onload = function () {
			//setIframeHeight(document.getElementById('content'));
		};
		</script>
		<link rel="bookmark"  type="image/x-icon"  href="logo.ico" media="screen"/>
	    <link rel="shortcut icon" type="image/x-icon" href="logo.ico" media="screen"/>
	</head>

	<body>
		<div class="navbar navbar-default" id="navbar">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand">
						<small>
							<i class="icon-leaf"></i>
							intstudio仓库信息管理系统
						</small>
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->

				<div class="navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="<f:lrs uri="system/assets/avatars/user.jpg"/>" alt="Jason's Photo" />
								<span class="user-info">
									<small>Welcome,</small>
									${sessionScope.user.masterName}
								</span>
								<i class="icon-caret-down"></i>
							</a>

							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="#">
										<i class="icon-user"></i>
										Profile
									</a>
								</li>
								<li class="divider"></li>
								<li>
									<a href="<f:lrs uri="users/logout.do"/>">
										<i class="icon-off"></i>
										Logout
									</a>
								</li>
							</ul>
						</li>
					</ul><!-- /.ace-nav -->
				</div><!-- /.navbar-header -->
			</div><!-- /.container -->
		</div>

		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>

				<div class="sidebar" id="sidebar">
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>
					
					<!-- #sidebar-shortcuts -->

					<ul class="nav nav-list">

						<li  class="active open">
							<a href="#" class="dropdown-toggle">
								<i class="icon-desktop"></i>
								<span class="menu-text"> 仓库管理</span>
								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">
								<li>
									<a href="<%=path %>/system/users/userList.jsp" target="content">
										<i class="icon-double-angle-right"></i>
										用户管理
									</a>
								</li>
								<li>
									<a href="<%=path %>/daily/workerQuery.jsp" target="content">
										<i class="icon-double-angle-right"></i>
										日报添加
									</a>
								</li>
								<li>
									<a href="<%=path %>/daily/classSchedule.jsp" target="content">
										<i class="icon-double-angle-right"></i>
										课程进度查询
									</a>
								</li>
								<li>
									<a href="<%=path %>/daily/statistics.jsp" target="content">
										<i class="icon-double-angle-right"></i>
										日报统计
									</a>
								</li>
							</ul>
						</li>


					</ul><!-- /.nav-list -->

					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>

					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
				</div>

				<div class="main-content">
					<div class="page-content">
						<div class="row">
							<iframe src="<%=path %>/system/users/userList.jsp" name="content" id="content" height="700px"
								style="width: 100%" scrolling="auto" frameborder="0" ></iframe>
						</div>
					</div><!-- /.page-content -->
				</div><!-- /.main-content -->

				<div class="ace-settings-container" id="ace-settings-container">
					<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
						<i class="icon-cog bigger-150"></i>
					</div>

					<div class="ace-settings-box" id="ace-settings-box">

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
							<label class="lbl" for="ace-settings-navbar"> 固定导航</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
							<label class="lbl" for="ace-settings-sidebar"> 固定侧栏</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
							<label class="lbl" for="ace-settings-breadcrumbs"> 国定面包屑</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
							<label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
							<label class="lbl" for="ace-settings-add-container">
								Inside
								<b>.container</b>
							</label>
						</div>
					</div>
				</div><!-- /#ace-settings-container -->
			</div><!-- /.main-container-inner -->

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="icon-double-angle-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->

		<script src="<f:lrs uri="system/assets/js/jquery.min.js"/>"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

		<!--[if !IE]> -->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='<f:lrs uri="system/assets/js/jquery-2.0.3.min.js"/>'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='<f:lrs uri="system/assets/js/jquery-1.10.2.min.js"/>'>"+"<"+"/script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='<f:lrs uri="system/assets/js/jquery.mobile.custom.min.js"/>'>"+"<"+"/script>");
		</script>
		
		<script src="<f:lrs uri="system/assets/js/bootstrap.min.js"/>"></script>
		<script src="<f:lrs uri="system/assets/js/typeahead-bs2.min.js"/>"></script>

		<!-- page specific plugin scripts -->

		<script src="<f:lrs uri="system/assets/js/jquery-ui-1.10.3.custom.min.js"/>"></script>
		<script src="<f:lrs uri="system/assets/js/jquery.ui.touch-punch.min.js"/>"></script>
		<script src="<f:lrs uri="system/assets/js/jquery.slimscroll.min.js"/>"></script>

		<!-- ace scripts -->
		<script src="<f:lrs uri="system/assets/js/ace-elements.min.js"/>"></script>
		<script src="<f:lrs uri="system/assets/js/ace.min.js"/>"></script>

		<!-- inline scripts related to this page -->

		<script type="text/javascript">
			jQuery(function($) {
				$('.accordion').on('hide', function (e) {
					$(e.target).prev().children(0).addClass('collapsed');
				})
				$('.accordion').on('show', function (e) {
					$(e.target).prev().children(0).removeClass('collapsed');
				})
			});
		</script>
	</body>
</html>
