<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="loading">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta name="viewport" content="width=device-width, initial-scale=0.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<meta name="keywords" content="" />
<meta name="description" content="分享网站">
<meta name="author" content="" />
<link rel="stylesheet" type="text/css" href="phonehtml/css/style.css" />
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<link rel="apple-touch-icon-precomposed" href="images/favicon.ico">
<script>
var logined = 0;
</script>
<title>分享软件</title>
</head>

<body>
<script>
var now_page = 1,
search_value = '';
</script>

		<div id="menu"><!--菜单-->
		<div class="search_wrap">
			<form action="${pageContext.request.contextPath}/toSeacherPh" method="post">
				<input type="text" name="seacher" class="search_input" placeholder="名字查找" />
				<i class="reset_input"><i></i></i>
			</form>
		</div>
		<ul>
			<li class="nav_index menu_cur"><a href="/typeListPh"><i></i><span>首页</span><b></b><div class="clear"></div></a></li>
			<li class="nav_site"><a href="/tofindResourcesByUseridPh?userid=${user1.userId}" ><i></i><span>我的资源</span><b></b><div class="clear"></div></a></li>
			<li class="nav_help"><a href="/tofind"><i></i><span>分享资源</span><b></b><div class="clear"></div></a></li>
			<li class="nav_about"><a href="/tome"><i></i><span>平台公告</span><b></b><div class="clear"></div></a></li>
		</ul>
	</div>
		<div id="user"><!--登录-->
					<div class="account">
				<div class="login_b_t">
					<c:if test="${empty user1}">
					<div class="pd10">
						<div class="fl">还没有账号<a id="reg_now" href="${pageContext.request.contextPath }/login/register.jsp" >立即注册</a></div><div class="fr"><a href="${pageContext.request.contextPath }/login/forget.jsp">忘记密码?</a></div><div class="clear"></div>
					</div>
					</c:if>
					<c:if test="${!empty user1}">
						<div class="pd10">
                           <div class="fr">你的信息</div><div class="clear"></div> <div class="fr"><a   href="/exit">退出登录</a></div>
						</div>
					</c:if>
				</div>
			</div>
					<div class="pd10">
						<c:if test="${empty user1}">
				<form method="post" >
					<div class="login_b_i">
						<div class="login_input">
							<div class="login_user"><input type="text" id="username" name="username" placeholder="用户名" /></div>
							<div class="login_password"><input type="password" id="password" name="password" placeholder="密码" /></div>
						</div>
					</div>
					<input type="submit" class="login_submit" onclick="logining()" value="登录" />
				</form>
						</c:if>
						<c:if test="${!empty user1}">
							<div class="login_b_i">
								<div class="login_input">

									<div class="login_user">昵称：${user1.nickname}</div>

									<div class="login_user">姓名：${user1.realname}</div>
									<div class="login_user">性别：${user1.sex}<c:if test="${empty user1.sex}">未填</c:if></div>
									<div class="login_user">电话: ${user1.userPhone}</div>
									<div class="login_user">邮箱:↓↓↓↓ </div>
									<div class="login_user">${user1.email}</div>
								</div>

							</div><a href="/selectuser?userId=${user1.userId}">修改信息</a>
						</c:if>
			</div>

		</div>
	<div id="header"><!--头部-->
		<div class="wrap">
			<i class="menu_open"></i>
			<div class="logo"></div>
			<c:if test="${empty user1}">
			<i class="search_open"></i>
			</c:if>
			<c:if test="${!empty user1}">
				<i class="search_open"><img  src="http://ntzj126.cn/img/<c:out value='${user1.getUserimg()}'/>" style="width:35px"/>
				</i>
			</c:if>>
		</div>
		<div class="logo_msk"></div>
	</div>
	<div id="container"><!--中间部-->
		<div id="sort">
			<table width="100%" border="0" cellspacing="0">
				<tr>
					<td class="sort_left">
						<div class="sort_cate">
							<div class="sort_b"><a href="#" onclick="return false;"><div class="sort_b_inner"><i class="cate_default"></i><span>全部分类</span><div class="clear"></div></div></a></div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		
		<div id="content">	
			<!--显示框-->
			<div id="list">
				<ul>
					 <c:forEach var="resourceList" items="${resourceList}">
										<li>
						<div class="wrap">
							<a class="alist" href="${pageContext.request.contextPath }/findAllResourcesPh?reid=${resourceList.reid}">
								<div class="list_litpic fl"><img src="http://ntzj126.cn/reimages/<c:out value='${resourceList.reimg}'/>" /></div>
								<div class="list_info">
									<h4>${resourceList.rename}</h4>
									<h5>by

									<span id="typename">${resourceList.retime}</span>
									</h5>



									<div class="list_info_i">
										<dl class="list_info_views">
											<dt></dt>

											<div class="clear"></div>
										</dl>
										<dl class="list_info_comment">
											<dt></dt>

											<div class="clear"></div>
										</dl>
										<dl class="list_info_like">
											<dt></dt>

											<div class="clear"></div>
										</dl>
										<div class="clear"></div>
									</div>
								</div>
								<div class="clear"></div>
							</a>
						</div>
					</li>
					 </c:forEach>
									</ul>
				<div class="list_loading"><i></i><span>努力更新中...请期待</span></div>
			</div>
		
		</div>
		
		<div class="push_msk"></div>
	</div>

	<div id="sort_content">
		<div class="asort">
			<div class="hd">
				<div class="wrap">
					<div class="fl"><span>选择分类</span><div class="clear"></div></div>
					<div class="fr"></div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="ct">
				<div class="wrap">
					<ul class="choose_cate">
						<li  style="font-weight:700;"  onclick="seacherAll()"><i style="background:none;width:0;margin-right:0;" class="s"></i><span>全部</span><i class="e"></i></li>
						<c:forEach var="typeList" items="${typeList}">
							<li style="font-weight:700;" style="background:#f7f7f7;"  onclick="seacherType(${typeList.typeid})"><i style="margin-right:0;background:none;width:0;" class="s"></i><span>${typeList.typename}</span><i class="e"></i></li>
						<c:forEach var="typeOfNames" items="${typeOfNames}">
							<c:if test="${typeOfNames.typeid== typeList.typeid }">
								<li onclick="seacherTon(${typeOfNames.typeofnameid})"><i style="background:none;width:10px;margin-right:0;" class="s"></i><span>${typeOfNames.typeofname}</span><i class="e"></i></li>
							</c:if>
						</c:forEach>
						</c:forEach>
																		</ul>
					<div class="clear"></div>
				</div>
			</div>
		</div>
				
	
	</div>
	
	<div id="newwrap_t" class="newwrap">
		<div class="newwrap_msk"></div>
		<iframe id="newwrap" frameborder="0" width="100%" height="100%"  ></iframe>
	</div>
	<div id="reg_index">
		<div class="reg_bar">
			<div class="wrap">
				<span class="fl"><i></i>注册帐号</span>
				<i class="reg_bar_close fr"></i>
				<div class="clear"></div>
			</div>
		</div>
		
	</div>
	<div class="loading_dark"></div>
	<div id="loading_mask">
		<div class="loading_mask">
			<ul class="anm">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
	</div>
	<script language="javascript" src="phonehtml/js/zepto.min.js"></script>
	<script language="javascript" src="phonehtml/js/fx.js"></script>
	<script language="javascript" src="phonehtml/js/script.js"></script>
	
</body>
<script >
	function seacherTon(id) {
        var str="";
        $.ajax({
            type:"post",

            url:"${pageContext.request.contextPath}/selectTonByIdPh?typeofnameid="+id,
            contentType:"application/json;charset=utf-8",
            dataType:"json",
            async: true,

            success:function(data){

                if(data.length==0){
                    $("#list ul ").html("");
                    $('#list ul').html("暂无数据");
				}
				else{

                    $("#list ul ").html("");
                for (var i=0;i < data.length;i++){
                    str+='<li>'+
                    '<div class="wrap">'+
                        '<a class="alist" href="/findAllResourcesPh?reid='+data[i].reid+'">'+
                        '<div class="list_litpic fl">'+
						'<img src="http://ntzj126.cn/reimages/'+data[i].reimg+'" /></div>'+
                        '<div class="list_info">'+
                        '<h4>'+data[i].rename+'</h4>'+
                        '<h5>by '+data[i].retime+'</h5>'+
                       ' <div class="list_info_i"> <dl class="list_info_views"><dt></dt>'+
					   '<div class="clear"></div>'+
                    '</dl>'+
                    ' <dl class="list_info_comment">'+
                    ' <dt></dt>'+

                    '<div class="clear"></div>'+
                    '  </dl>'+
                    ' <dl class="list_info_like">'+
                    ' <dt></dt>'+

                    '<div class="clear"></div>'+
                    ' </dl>'+
                    ' <div class="clear"></div>'+
                    '</div>'+
                    ' </div>'+
                    ' <div class="clear"></div>'+
                    '  </a>'+
                    ' </div>'+
                    '  </li>'


				}

                    $('#list ul').html(str);
                }
            }

        });

    }
</script>
<script >
    function seacherType(id) {
        var str="";
        $.ajax({
            type:"post",

            url:"${pageContext.request.contextPath}/selectTypeIdPh?typeid="+id,
            contentType:"application/json;charset=utf-8",
            dataType:"json",
            async: true,

            success:function(data){

                if(data.length==0){
                    $("#list ul ").html("");
                    $('#list ul').html("暂无数据");
                }
                else{

                    $("#list ul ").html("");
                    for (var i=0;i < data.length;i++){
                        str+='<li>'+
                            '<div class="wrap">'+
                            '<a class="alist" href="/findAllResourcesPh?reid='+data[i].reid+'">'+
                            '<div class="list_litpic fl">'+
                            '<img src="http://ntzj126.cn/reimages/'+data[i].reimg+'" /></div>'+
                            '<div class="list_info">'+
                            '<h4>'+data[i].rename+'</h4>'+
                            '<h5>by '+data[i].retime+'</h5>'+
                            ' <div class="list_info_i"> <dl class="list_info_views"><dt></dt>'+
                            '<div class="clear"></div>'+
                            '</dl>'+
                            ' <dl class="list_info_comment">'+
                            ' <dt></dt>'+

                            '<div class="clear"></div>'+
                            '  </dl>'+
                            ' <dl class="list_info_like">'+
                            ' <dt></dt>'+

                            '<div class="clear"></div>'+
                            ' </dl>'+
                            ' <div class="clear"></div>'+
                            '</div>'+
                            ' </div>'+
                            ' <div class="clear"></div>'+
                            '  </a>'+
                            ' </div>'+
                            '  </li>'


                    }

                    $('#list ul').html(str);
                }
            }

        });

    }
</script>
<script >
    function seacherAll() {
        var str="";
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/selectAllPh",
            contentType:"application/json;charset=utf-8",
            dataType:"json",
            async: true,

            success:function(data){

                if(data.length==0){

                    $("#list ul ").html("");
                    $('#list ul').html("暂无数据");
                }
                else{

                    $("#list ul ").html("");
                    for (var i=0;i < data.length;i++){
                        str+='<li>'+
                            '<div class="wrap">'+
                            '<a class="alist" href="/findAllResourcesPh?reid='+data[i].reid+'">'+
                            '<div class="list_litpic fl">'+
                            '<img src="http://ntzj126.cn/reimages/'+data[i].reimg+'" /></div>'+
                            '<div class="list_info">'+
                            '<h4>'+data[i].rename+'</h4>'+
                            '<h5>by '+data[i].retime+'</h5>'+
                            ' <div class="list_info_i"> <dl class="list_info_views"><dt></dt>'+
                            '<div class="clear"></div>'+
                            '</dl>'+
                            ' <dl class="list_info_comment">'+
                            ' <dt></dt>'+

                            '<div class="clear"></div>'+
                            '  </dl>'+
                            ' <dl class="list_info_like">'+
                            ' <dt></dt>'+

                            '<div class="clear"></div>'+
                            ' </dl>'+
                            ' <div class="clear"></div>'+
                            '</div>'+
                            ' </div>'+
                            ' <div class="clear"></div>'+
                            '  </a>'+
                            ' </div>'+
                            '  </li>'


                    }

                    $('#list ul').html(str);
                }
            }

        });

    }
</script>
<script >
    function logining() {
        //判断用户名是否存在
        var username = $("#username").val();
        var password = $("#password").val();

        console.log(username);
        console.log(password)
        $.ajax({
            type:"post",

            url:"${pageContext.request.contextPath}/logining?username="+username+"&password="+password,
            contentType:"application/json;charset=utf-8",
            success:function(data){
                //alert(data);  0 不存在  1 存在\
                if(data==1){
                    location.reload(true);
                }
                if (data==2){
                    alert("正在审核")
                }
                if (data==3){
                    alert("审核不通过，请联系管理员")
                }
                if( data==0){
                    alert("密码错误或账户不存在")
                }
            }
        });
    }
</script>

</html>