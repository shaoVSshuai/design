<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- Head -->
<head>

	<title>登录表单</title>
	<!-- Meta-Tags -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- //Meta-Tags -->

	<!-- Style --> <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
	 <script src="/eucms_files/jquery.min.js"></script>
	<script src="/js/bootstrapValidator.js"></script>
    <link href="/css/bootstrapValidator.css" rel="stylesheet" />
	<script>
	
	 function valid(){
		 var username = document.getElementById("username").value;
	 }
	 
	 function register(){
		 var a = document.getElementById("username1").value;
		 var b =  document.getElementById("pwd1").value;
		 var c = 			 document.getElementById("tel1").value;
		 var d = 					 document.getElementById("wx1").value;
		 if(a.trim() == '' || b.trim() == '' || c.trim()=='' || d.trim()== ''){
			 alert("请输入完整信息");
			 return false;
		 }
		 
	 }
	</script>
</head>
<!-- //Head -->

<!-- Body -->
<body>

	<h1>联系我们	</h1>

	<div class="container w3layouts agileits" style="width:31%!important">
	<div class="copyrights"></div>
		<div class="register w3layouts agileits">
			<h2>完善信息</h2>
			<form action="/application" method="post" onsubmit="return register()">
				<input style="width:174%!important" type="text" name="username" id="username1" placeholder="用户名" required="" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5a-zA-Z0-9\w]/g,'')" >
				<input style="width:174%!important" type="text" name="tel" id="tel1" placeholder="手机号码" required="" onkeyup="this.value = this.value.replace(/[^0-9-]+/,'')">
				<input style="width:174%!important" type="text" name="wechat" id="wx1" placeholder="微信号" required="">
				<input style="width:174%!important" type="text" name="wechat" id="wx1" placeholder="需求名称" required="">
				<select style="margin-bottom:20px;width:185%!important;padding-left:5px; height: 40px;color:#fff;font-size:15px;background-color:#000;;border:1px solid #fff" >
					
					<option value="">需求类型</option>
					<option>网站</option>
					<option>小程序</option>
					<option>其他</option>
				</select>
				<input style="width:174%!important" type="text" name="wechat" id="wx1" placeholder="请简单的描述您的需求" required="">
			 
			<div class="send-button w3layouts agileits">
				 
					<input type="submit" value="提交">
					我们将会联系您的微信 
				 
			</div>
			</form>
			<div class="clear"></div>
		</div>

		<div class="clear"></div>

	</div>

	<div class="footer w3layouts agileits">
		<p>Copyright &copy; More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
	</div>

</body>
<!-- //Body -->

</html>