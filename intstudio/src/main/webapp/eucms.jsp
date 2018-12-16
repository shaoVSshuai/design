<%@page import="com.hzyc.intstudio.entity.Comments"%>
<%@page import="java.util.List"%>
<%@page import="com.hzyc.intstudio.entity.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0024)# -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>INT Studio - www.integer.work</title>
  <meta name="renderer" content="webkit">
  
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=0,minimal-ui">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="generator" content="eyoucms" data-variable="http://www.eyoucms.com">
  <link href="#favicon.ico" rel="shortcut icon" type="image/x-icon">
  <link rel="stylesheet" type="text/css" href="./eucms_files/basic.css">
  <link rel="stylesheet" type="text/css" href="./eucms_files/common.css">
  <style>
body {
  background-position: center;
  background-repeat: no-repeat;
background-color:;
font-family:;
}
.myhh{

	padding: 5px 15px;
    border: 1px solid;
    color: #1baadb;
    color: #1baadb!important;
    display: block;
    width: 110px;
    text-align: center;
    -webkit-transition: all .6s cubic-bezier(.165, .84, .44, 1) 0ms;
    transition: all .6s cubic-bezier(.165, .84, .44, 1) 0ms;
}
.myhh:hover{
	custor:pointer;
	background-color: #1baadb;
	color:#fff!important;
	border:1px solid  #1baadb;
}
.my-logo {
	position: relative;
	width: auto;
    height: 80px;
    line-height: 66px;
    overflow: hidden;
    font-size: 30px;
    font-weight: 600;
    color: #365089;
    font-family: "";
    text-align: center;
}
@media(max-width:768px) {
	.my-logo{
		padding-left:15px;
	}
	.carousel-inner>.carousel-item>a>img {
		height: 230px;
	}
	#h-style {
		height: 620px!important;
	}
	#pinglun{
		width:93%!important;
		margin:10px 10px;
	}
}
.my-logo .host {
	position: absolute;
    top: 24px;
    font-size: 12px;
    left: 15px;
}
#header {
	position: fixed;
	top: 0;
	z-index: 999;
	width: 100%;
}
#pinglun{
	display: inline-block;
	width:80%;
	height:32px;
	margin-left:20px;
	border:1px solid #1baadb;
}
#wrapper{
display:none;
	width:100%;
	height:100%;
	background-color: rgb(0,0,0,0.8) ;
	position:fixed;
	top:0;
	left:0;
	z-index:9999;
}
</style>
  <!--[if lte IE 9]>
    <script src="/template/pc/skin/js/lteie9.js"></script>
    <![endif]-->
  
              <link rel="canonical" href="#">
              <script src="./eucms_files/c.js"></script><link rel="stylesheet" href="./eucms_files/layer.css" id="layuicss-layer"></head><body><script onload="window[&#39;cambrian_sync_loader_success1544595324823813&#39;]()" onerror="window[&#39;cambrian_sync_loader_fail_1544595324823813&#39;]()" src="./eucms_files/main.8b2bc869.js"></script>
              <script type="application/ld+json">
                  {
                      "@context": "https://ziyuan.baidu.com/contexts/cambrian.jsonld",
                      "@id": "#",
                      "appid": "",
                      "title": "INT工作室",
                      "images": [
                          "#public/upload/system/2018/05/24/logo_left.png"
                      ],
                      "pubDate": "2018-12-12T14:15:25"
                  }
              </script>
              
  <!--[if lte IE 8]>
    <div class="text-xs-center m-b-0 bg-blue-grey-100 alert">
    <button type="button" class="close" aria-label="Close" data-dismiss="alert">
        <span aria-hidden="true">×</span>
    </button>
    你正在使用一个 <strong>过时</strong> 的浏览器。请 <a href=https://browsehappy.com/ target=_blank>升级您的浏览器</a>，以提高您的体验。</div>
<![endif]-->
    
  <script>
/*   $(document).ready(function(){
	    $('#exampleCarouselDefault').jqFancyTransitions({ 
	        effect: 'zipper', // wave, zipper, curtain
	        width: 850, // width of panel
	        height: 600, // height of panel
	        strips: 15, // number of strips
	        delay: 3000, // delay between images in ms
	        stripDelay: 20, // delay beetwen strips in ms
	        titleOpacity: 0.8, // opacity of title
	        titleSpeed: 2000, // speed of title appereance in ms
	        position: 'curtain', // top, bottom, alternate, curtain
	        direction: 'fountainAlternate', // left, right, alternate, random, fountain, fountainAlternate
	        navigation: true, // prev and next navigation buttons
	        links: false // show images as links
	    });
	})
 */	</script>
<script>

	function pinglun(){
		
		
		var isLogin = document.getElementById("isLogin").value;
		var btn = document.getElementById("pinglunbutton");
		var content = document.getElementById("pinglun").value;
		
		if(isLogin == '1'){
			
		}else{
			//请先登录
			alert("请先登录");
			window.location.href = "loginorregist.jsp";
		}
		if(btn.innerHTML.trim() == '评论'){
			//弹出评论页面
			document.getElementById("pinglun").style.display = "inline-block";

			btn.innerHTML = "提交";
			return ;
		}

		var username = document.getElementById("username").value;
		if(btn.innerText == '提交'){
			
			if(content.trim() == ''){
				alert('请输入评论!');
				return ;
			}
			
			var d = new Date();
			var vYear = d.getFullYear();
			var vMon = d.getMonth() + 1
			var vDay = d.getDate();
			var h = d.getHours(); 
			var m = d.getMinutes(); 
			var se = d.getSeconds(); 
			var s=vYear+"-"+(vMon<10 ? "0" + vMon : vMon)+"-"+(vDay<10 ? "0"+ vDay : vDay)+" "+(h<10 ? "0"+ h : h)+":"+(m<10 ? "0" + m : m)+":"+(se<10 ? "0" +se : se);
	
			//ajax去增加评论
			var xhr = new XMLHttpRequest();
		    xhr.open("POST", "/saveComments", true);
		    // 添加http头，发送信息至服务器时内容编码类型
		    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");  
		    xhr.onreadystatechange = function() {
		      if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 304)) {
		        var str =  xhr.responseText;
		        var obj = eval('(' + str + ')'); 
			     if(obj.flag == '1'){
			    	 
			    	 alert("评论成功...");
			    	 var newLi = '<li class="list-group-item news-li clearfix" style=""> '+
			            '<span style="display:block;width:100%;margin-bottom:10px;">' + s + ' </span>'+
			            '<span> 用户 '+username+' : </span>'+
			            
			             '<a href="#xinwendongtai/38.html" title="" target="_self"> '+
			             	content+
			              '</a> '+
			              '</li>';
						//ajax录入评论
						$(newLi).insertAfter($("#pingluntop"));
						document.getElementById("pinglun").value = '';
						return ;
			     }else{
			    	 alert("评论失败...");
			    	 
			     }
			     
			    
		      }
		    };
		    xhr.send("content="+content.trim());
		}
		
	}
	
	
	
	function joinus(){
		
		alert("无论您是上班族或是学生，只要您会制作网站,小程序或安卓app都可以加入我们工作群,无需缴纳任何费用,经过审核后我们将会分配任务给您");
		var a = document.getElementById("joinus");
		var w = document.getElementById("wrapper");
		w.style.display = "block";
		a.style.position = "fixed";
		a.style.top = "50%";
		a.style.left = "50%";
		var width = 300;
		var height = 400;
		a.style.width = width +"px";
		a.style.height = height + "px";
		a.style.marginLeft = "-" + parseInt(width) / 2 +"px";
		a.style.marginTop = "-" + parseInt(height) / 2 +"px";
		a.style.zIndex = "999";
	}
	
	function close1(){
		//关闭
		var w = document.getElementById("wrapper");
		w.style.display = "none";
	}

	function judgeLogOut() {
		if (window.confirm("确定注销吗？")) {
			return true;
		} else {
			return false;
		}
	}
</script>
  </head>
  <body>
  <div id="wrapper">
  	   <div class="met-index-news"  id="joinus">
  	   			<div style="position:absolute;top:10px;right:15px;font-weight:600;font-size:18px;cursor:pointer;" onclick="close1()" >X</div>
    
			<img src="images/joinus.jpg" style="width:100%;height:100%">
      </div>
  
  </div>
<!--header-s--> 
  <header class="met-head" e-page="header" id="header"> 
   <nav class="navbar navbar-default box-shadow-none met-nav"> 
    <div class="container"> 
     <div class="row" style=""> 
      <h1 hidden="">INT工作室</h1> 
      <div class="navbar-header pull-xs-left"> 
        <div class="vertical-align-middle my-logo"> 
           INT  Studio
     
        <span class="host">www.integer.work</span>
        </div >
      </div>
      <button type="button" class="navbar-toggler hamburger hamburger-close collapsed p-x-5 met-nav-toggler" data-target="#met-nav-collapse" data-toggle="collapse">
        <span class="sr-only"></span>
        <span class="hamburger-bar"></span>
      </button> 
      <div class="collapse navbar-collapse navbar-collapse-toolbar pull-md-right p-0" id="met-nav-collapse"> 
       <ul class="nav navbar-nav navlist"> 
       <%
			Users users =  (Users)request.getSession().getAttribute("users");
		%>
        <li class="nav-item"> 
        <%
        	if (users != null ) {
        %>		
        <a href="/logOut" title="用户名" class="nav-link active" onclick="return judgeLogOut()"><%=users.getUsername()%>/注销</a>
        <input type="hidden" value="<%=users.getUsername() %>" id="username"/>
        <input type="hidden" value="1" id="isLogin"/>
        <%
        	} else {
        %>
         <input type="hidden" value="0" id="isLogin"/>
       
        <a href="loginorregist.jsp" title="登录/注册" class="nav-link active">登录/注册</a>
        <%		
        	}
        %>
         </li> 

                <li class="nav-item dropdown m-l-10"> <a href="#about_list_met_11_3" title="关于我们" class="nav-link dropdown-toggle " data-toggle="" data-hover="dropdown" aria-haspopup="true" aria-expanded="false"> 关于我们 </a> 
                 <!--  <div class="dropdown-menu dropdown-menu-right dropdown-menu-bullet"> 
                    <div class="dropdown-item dropdown-submenu"> 
           <a href="#gongsijianjie/" class="dropdown-item ">工作室简介</a> 
                     </div> 
                    <div class="dropdown-item dropdown-submenu"> 
           <a href="#gsry/" class="dropdown-item ">公司荣誉</a> 
                     </div> 
                    <div class="dropdown-item dropdown-submenu"> 
           <a href="#yuyuemianshi/" class="dropdown-item ">预约面试</a> 
                     </div> 
                   </div> -->
                 </li> 
               
                <li class="nav-item dropdown m-l-10"> <a href="#cp" title="产品展示" class="nav-link dropdown-toggle " data-toggle="" data-hover="dropdown" aria-haspopup="true" aria-expanded="false"> 产品展示</a> 
                 </li> 
                  <li class="nav-item dropdown m-l-10"> <a href="/applicationCheck" title="联系我们" class="nav-link dropdown-toggle " data-toggle="" data-hover="dropdown" aria-haspopup="true" aria-expanded="false"> 联系我们</a> 
                 </li> 
                 <li class="nav-item dropdown m-l-10"> <a href="#" onclick="joinus()" title="加入我们" class="nav-link dropdown-toggle " data-toggle="" data-hover="dropdown" aria-haspopup="true" aria-expanded="false"> 加入我们</a> 
                 </li> 
              
                <li class="nav-item"> <a href="gg.jsp" target="_blank" title="后台入口" class="nav-link "><span style="color:red">后台入口</span></a> </li> 
       </ul> 
      </div> 
     </div> 
    </div> 
   </nav> 
  </header>  
<!--header-e--> 
<!--main-s-->
<div style="height:80px;width:100%;"></div>
  <div class="met-banner carousel slide" id="exampleCarouselDefault" data-ride="carousel" m-id="banner" m-type="banner" e-page="index"> 
   <ol class="carousel-indicators carousel-indicators-fall"> 
            <li data-slide-to="0" data-target="#exampleCarouselDefault" class="active"></li>
            <li data-slide-to="1" data-target="#exampleCarouselDefault" class=""></li>
         </ol> 
   <div class="carousel-inner" role="listbox"> 
        <div class="carousel-item eyou-edit active" e-id="2" e-type="adv">
      <a href="#" title="INT工作室" target="_self"><img class="w-full" src="./eucms_files/9f1b15b03aef06830f07a2591f5c7708.jpg" srcset="./eucms_files/9f1b15b03aef06830f07a2591f5c7708.jpg" sizes="(max-width: 767px) 767px" pch="0" adh="0" iph="0"></a>
    </div>
        <div class="carousel-item eyou-edit " e-id="1" e-type="adv">
      <a href="#" title="共展蓝图" target="_self"><img class="w-full" src="./eucms_files/7fd4167b47cbe5eefb4249ae669c6f10.jpg" srcset="./eucms_files/7fd4167b47cbe5eefb4249ae669c6f10.jpg" sizes="(max-width: 767px) 767px" pch="0" adh="0" iph="0"></a>
    </div>
        <a class="left carousel-control" href="#exampleCarouselDefault" role="button" data-slide="prev"> <span class="icon" aria-hidden="true">&lt;</span> <span class="sr-only">Previous</span> </a>
    <a class="right carousel-control" href="#exampleCarouselDefault" role="button" data-slide="next"> <span class="icon" aria-hidden="true">&gt;</span> <span class="sr-only">Next</span> </a>
   </div> 
  </div>
    <main class="met-index-body" e-page="index">
    	 
    
    
    
           <section id="cp" class="service_list_met_11_3 text-xs-center">
        <div class="container">
        <div class="title-box clearfix">
            <div class="head">
            <h2 class="title newpro"> 产品展示</h2>
            <p class="desc newpro"></p>
          </div>
            
          </div>
        <ul class="list m-0 clearfix ulstyle">
                      <li class="item col-xs-12 col-md-6 col-lg-4 col-xxl-4 newpro">
            <div class="content" style="height:430px"> <a href="http://61.139.150.161:6180/rams_v3" title="中国联通网运调度平台" target="_self"> 
              <img data-original="/images/中国联通.png" alt="中国联通网运调度平台" src="/images/中国联通.png" class="" style="display: inline;">
              <h4>中国联通网运调度平台</h4>
              <p>工作室研发人员曾参与中国联通网上调度平台开发(工单核减,IP地址申请流程等)，使用技术：Spring+Struts+Hibernate Activiti工作流引擎 oracle WebService技术</p>
              </a> </div>
          </li>
                      <li class="item col-xs-12 col-md-6 col-lg-4 col-xxl-4 newpro">
            <div class="content" style="height:430px"> <a href="http://jf.10086.cn/" title="中国移动积分商城" target="_self"> 
            <img data-original="/images/中国移动logo.png" alt="中国移动积分商城" src="/images/中国移动logo.png" class="" style="display: inline;">
              <h4> 中国移动积分商城</h4>
              <p>工作室研发人员曾参与中国移动积分商城系统(积分抽取,用户数据采集,用户行为数据分析),使用Spring Boot ,Redis ,Mysql ,Socket技术 </p>
              </a> </div>
          </li>
                      <li class="item col-xs-12 col-md-6 col-lg-4 col-xxl-4 newpro">
            <div class="content" style="height:430px"> <a href="http://www.cchzyc.com" title="合众易成企业网站" target="_self"> 
            <img data-original="/images/菊花.png" alt="合众易成企业网站" src="/images/菊花.png" class="" style="display: inline;">
              <h4>合众易成企业网站</h4>
              <p>长春合众易成技术咨询公司主营IT咨询服务与IT培训，工作室曾为其制作门户网站(网站首页,试听报名)与企业后台管理(学员信息，公司招聘，兼职招聘，课程首页管理等功能)</p>
              </a> </div>
          </li>
                </ul>
        <a href="#chanpinzhanshi/" title=" 产品展示" target="_self" class="btn-more">查看更多 </a> </div>
      </section>
       
       
       
       <section class="about_list_met_11_3" id="about_list_met_11_3">
      <div class="background">
        <div style="height: 505px;" class="eyou-edit" e-id="206" e-type="upload" id="h-style">
                   <img style="display: inline;" src="./eucms_files/bf4ba9853f4435e3e1aa2b43f1da1ba8.jpg" class="">
                </div>
      </div>
      <div class="container">
        <div class="about-us col-md-12">
          <div class="head">
            <h2 class="title newpro"> 工作室简介</h2>
            <p class="desc newpro"></p>
          </div>
          <div class="content">
            <div class="left col-md-5 col-sm-5">
              <div class="img eyou-edit" e-id="208" e-type="upload">
                                   <img style="display: inline;" src="./eucms_files/studio_bg.jpg" class="">
                              </div>
            </div>
            <div class="right">
              <div class="text" style="visibility: inherit; opacity: 1;">
                <p class="desc newpro">
               <span>
                	 INT工作室,承接各种网站,小程序等项目,并提供全程技术支持:
                	 	  包括服务器购买，域名购买，域名解析，程序部署（毕业设计并提供简单讲解)
                	 工作室团队中开发人员 参与开发过 中国联通网运调度平台,中国移动仓库进销存管理系统,餐饮收银系统
 
                	
                </span>
                <a href="javascript:joinus()" title="加入我们" class="btn-more" target="_self">加入我们 </a>
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    
    
    <div class="met-index-news">
        <div class="container">
        <div class="col-xs-12 eyou-edit" e-id="203" e-type="arclist">
            <ul class="list-group">
                         <li id="pingluntop" class="list-group-item active clearfix">
                <h4 class="pull-xs-left m-y-0">客户评价</h4>
                 <input type="text" placeholder="请输入您的评论,300字以内" value="" style="display:none" id="pinglun" />
                <a href="javascript:pinglun()" id="pinglunbutton" class="pull-xs-right btn-more myhh" >           评论
                </a> </li>
                
                		
                	<%
                		List<Comments> cList = (List<Comments>)request.getAttribute("cList");
                		if(cList != null && cList.size() > 0 ){
                		for(Comments com : cList){
                	%>
                	
                	
                		  <li class="list-group-item news-li clearfix" style=""> 
                        <span style="display:block;width:100%;margin-bottom:10px;">2018-05-29 10:30:21 </span>
                        <span> 用户 <%=com.getUsername() %> : </span>
                        
                         <a href="#xinwendongtai/38.html" title="" target="_self"> 
                         	<%=com.getContent() %>
                          </a> 
                          </li>
                          <%
                          	if(com.getReplay().equals("0")){
                          		//已经回复了
                          	
                          %>
                          <li class="list-group-item news-li clearfix" style="padding-left:30px;">
                          	<span>INT Studio 回复 :</span>
                          	<a href="#xinwendongtai/38.html" title="" target="_self"> 
								<%=com.getReplycomments() %>
                          </a>
                          </li>
                		<%
                          	}
                		%>
                	<%
                		}
                		}
                	%>
                      </ul>
          </div>
         
      </div>
      </div>
      
      
      
      
       
      
    
  </main>
<!--main-e--> 
<!--footer-s--> 
  <footer class="met-foot-info p-y-20 border-top1" e-page="footer"> 
   <div class="langcss text-xs-center p-b-20"> 
    <div class="container"> 
     <div class="row mob-masonry"> 
      <div class="col-lg-2 col-md-3 col-xs-6 list masonry-item foot-nav eyou-edit" e-id="301" e-type="channel" id="testtest"> 
              <h4 class="font-size-16 m-t-0"> <a href="#guanyuwomen/" target="_self" title="关于我们">关于我们</a> </h4>
               <ul class="ulstyle m-b-0"> 
                <li> <a href="#gongsijianjie/" target="_self" title="团队简介">团队简介</a> </li> 
                <li> <a href="#gsry/" target="_self" title="团队合影">团队合影</a> </li> 
                <li> <a href="#yuyuemianshi/" target="_self" title="加入我们">加入我们</a> </li> 
               </ul> 
            </div> 
      <div class="col-lg-2 col-md-3 col-xs-6 list masonry-item foot-nav eyou-edit" e-id="302" e-type="channel"> 
               <h4 class="font-size-16 m-t-0"> <a href="#xinwendongtai/" target="_self" title="广告预留">广告预留</a> </h4>
               <ul class="ulstyle m-b-0"> 
                <li> <a href="#meitibaodao/" target="_self" title="位置一">位置一</a> </li> 
                <li> <a href="#xingyezixun/" target="_self" title="位置二">位置二</a> </li> 
                <li> <a href="#qiyexinwen/" target="_self" title="位置三">位置三</a> </li> 
               </ul> 
            </div> 
      <div class="col-lg-2 col-md-3 col-xs-6 list masonry-item foot-nav eyou-edit" e-id="303" e-type="channel"> 
              <h4 class="font-size-16 m-t-0"> <a href="#chanpinzhanshi/" title="产品展示">产品展示</a> </h4> 
               <ul class="ulstyle m-b-0"> 
                <li> <a href="#shouji/" title="联通项目">联通项目</a> </li> 
                <li> <a href="#diannao/" title="仓库项目">仓库项目</a> </li> 
                <li> <a href="#tongyongpeijian/" title="其他项目">其他项目</a> </li> 
               </ul> 
            </div> 
      
      		<div class="col-lg-3 col-md-12 col-xs-12 info masonry-item font-size-20" m-id="met_contact" m-type="nocontent"> 
       <p class="font-size-26"><a href="javascript:void(0);" title="" class="eyou-edit" e-id="304" e-type="text">
                   联系电话
                </a></p> 
       <p class="eyou-edit" e-id="web_attr_2" e-type="text">
        13067512562   
         </p> 
               <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=541194741&amp;site=qq&amp;menu=yes" rel="nofollow" target="_blank" class="p-r-5"> <i class="fa fa-qq"></i> </a> 
                <a class="p-r-5" id="met-weixin" data-plugin="webuiPopover" data-trigger="hover" data-animation="pop" data-placement="top" data-width="auto" data-height="auto" data-padding="0" data-content="<div class='text-xs-center'><img src='../eucms_files/kefu.jpg' alt='INT工作室' width='150' height='150' id='met-weixin-img'></div>" data-target="webuiPopover0"> <i class="fa fa-weixin light-green-700"></i> </a> 
           
             </div>
      
      
     </div> 
    </div> 
   </div> 
   <div class="copy p-y-10 border-top1"> 
    <div class="container text-xs-center"> 
    
    </div>
    <div class="container text-xs-center"> 
     <p class="eyou-edit" e-id="web_copyright" e-type="text">
         Copyright © 2018 INT Studio 版权所有     </p>
     <p>
        <a href="http://www.miibeian.gov.cn/" rel="nofollow">京ICP备xxxxxxxx号</a>     </p>
    </div> 
   </div>  
     </footer>
  <input type="hidden" name="met_lazyloadbg" value="/template/pc/skin/images/loading.gif"> 
  <script src="./eucms_files/jquery.min.js"></script>
  <script src="./eucms_files/tether.min.js"></script>
  <script src="./eucms_files/bootstrap.min.js"></script>
  <script src="./eucms_files/breakpoints.min.js"></script>
  <script src="./eucms_files/webui-popover.js" type="text/javascript"></script>
  <script src="./eucms_files/common.js" type="text/javascript"></script>
  <script src="./eucms_files/jquery-s2t.js" type="text/javascript"></script>
  
<script src="/js/my.js"></script>
  <!-- 应用插件标签 start -->
     <!-- 应用插件标签 end --> 
<!--footer-e--> 
<script type="text/javascript" src="./eucms_files/Swiper.js"></script>
<script type="text/javascript" src="./eucms_files/layer.js"></script>
<script type="text/javascript">

get_qrcode();
  /**
   * 小程序码
   */
 /*  function get_qrcode()
  {
    layer.open({
      type: 1
      ,title: '扫码添加客服咨询'
      ,id: 'Lay_layer_debug'
      // ,time: 5000
      ,area: ['130px', '150px']
      ,content: "<div style='text-align:center;'><img src='/eucms_files/kefu.jpg' width='110' height='110'/></div>"
      ,shade: false
      ,offset: 'rb'
      ,resize: false
      ,success: function(layero, index){
        // layer.style(index, {
        //   marginLeft: -220
        // });
      }
    });
  } */
</script><div class="layui-layer-move"></div>

</body></html>