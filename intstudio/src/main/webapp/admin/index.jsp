<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>后台管理页面</title>
<link rel="stylesheet" href="<%=basePath%>layui/css/layui.css" media="all">
<link rel="stylesheet" href="<%=basePath%>css/app.css" media="all">
</head>

<body>
	<div class="layui-layout layui-layout-admin kit-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">后台管理系统</div>
			<div class="layui-logo kit-logo-mobile">K</div>
			<ul class="layui-nav layui-layout-left kit-nav">
				<li class="layui-nav-item"><a href="javascript:;">控制台</a></li>
				<!-- <li class="layui-nav-item"><a href="javascript:;">商品管理</a></li>
				<li class="layui-nav-item"><a href="javascript:;" id="pay"><i
						class="fa fa-gratipay" aria-hidden="true"></i> 捐赠我</a></li>
				<li class="layui-nav-item"><a href="javascript:;">其它系统</a>
					
				</li> -->
			</ul>
			<ul class="layui-nav layui-layout-right kit-nav">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://m.zhengjinfan.cn/images/0.jpg" class="layui-nav-img">
						Admin管理员</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:;">基本资料</a>
						</dd>
						<dd>
							<a href="javascript:;">安全设置</a>
						</dd>
					</dl>
				</li>
				<li class="layui-nav-item"><a href="../login.html"><i
						class="fa fa-sign-out" aria-hidden="true"></i> 注销</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black kit-side">
			<div class="layui-side-scroll">
				<div class="kit-side-fold"  ><i class="fa fa-navicon" style="line-height:34px;" aria-hidden="true"></i></div>
				
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="kitNavbar" kit-navbar>
					<li class="layui-nav-item"><a class="" href="cartype.jsp" target="main"><i
							class="fa fa-plug" aria-hidden="true"></i><span> 车型价格管理 </span> </a>
						
					<li class="layui-nav-item"><a class=""  href="testdrive.jsp" target="main"><i
							class="fa fa-plug" aria-hidden="true"></i><span> 预约试驾列表</span> </a>
						
					</li>
					<li class="layui-nav-item"><a class="" href="yuyuebaoyang.jsp" target="main"><i
							class="fa fa-plug" aria-hidden="true"></i><span> 预约维保列表 </span> </a>
						
					</li>
					<li class="layui-nav-item"><a class="" href="gradegift.jsp" target="main"><i
							class="fa fa-plug" aria-hidden="true"></i><span> 积分礼品管理  </span> </a>
					</li>
					<li class="layui-nav-item"><a class="" href="givegift.jsp" target="main"><i
							class="fa fa-plug" aria-hidden="true"></i><span> 礼品兑换列表  </span> </a>
					</li>
					<li class="layui-nav-item"><a class=""  href="zhihuan.jsp" target="main"><i
							class="fa fa-plug" aria-hidden="true"></i> <span> 二手置换列表 </span>
					</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="deptEmpMan/deptMan/frame.jsp" target="main"> <i
									class="layui-icon">&#xe6c6;</i> <span></span> </a>
							</dd>
							<dd>
								<a href="deptEmpMan/empMan/emp_sel.jsp" target="main"> 
									<i class="layui-icon">&#xe6c6;</i> <span></span> </a>
							</dd>
						</dl>
					</li>
					
					<li class="layui-nav-item"><a class="" href="jifen.jsp"  target="main"><i
							class="fa fa-plug" aria-hidden="true"></i><span>  积分详情列表   </span> </a>
						
					</li>
					
					
				</ul>
			</div>
		</div>
		<div style="position: relative; left: 201px;">
			<!-- 内容主体区域 -->
			<iframe name="main" width="1168px" height="545px" style="border: 0;"></iframe>
		</div>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			2017 &copy; <a href="http://kit.zhengjinfan.cn/">kit.zhengjinfan.cn/</a>
			MIT license

		</div>
	</div>
	<script type="text/javascript">
        var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        document.write(unescape("%3Cspan id='cnzz_stat_icon_1264021086'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s22.cnzz.com/z_stat.php%3Fid%3D1264021086%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));
    </script>
	<script src="<%=basePath%>layui/layui.js"></script>
	<script>
        var message;
        layui.config({
            base: 'build/js/'
        }).use(['app', 'message'], function() {
            var app = layui.app,
                $ = layui.jquery,
                layer = layui.layer;
            //将message设置为全局以便子页面调用
            message = layui.message;
            //主入口
            app.set({
                type: 'iframe'
            }).init();
            $('#pay').on('click', function() {
                layer.open({
                    title: false,
                    type: 1,
                    content: '<img src="/build/images/pay.png" />',
                    area: ['500px', '250px'],
                    shadeClose: true
                });
            });
        });
    </script>
</body>

</html>