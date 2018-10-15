<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="loading">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta name="viewport" content="width=device-width, initial-scale=0.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<link rel="stylesheet" type="text/css" href="phonehtml/css/style.css" />
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<link rel="apple-touch-icon-precomposed" href="http://www.17sucai.com/static/images/favicon.ico">
<script>
<c:if test="${!empty user1}">
var logined = 1
</c:if>
<c:if test="${empty user1}">
var logined = 0
</c:if>
</script>
<title>详情</title>
</head>

<body items="${resources2}">

		<div id="menu">
		<div class="search_wrap">
			<form action="" method="get">
				<input type="text" name="search" class="search_input" placeholder="关键字查找" />
				<i class="reset_input"><i></i></i>
			</form>
		</div>
		<ul>
			<li class="nav_index"><a href="index.jsp"><i></i><span>首页</span><b></b><div class="clear"></div></a></li>
			<li class="nav_site"><a href="index.jsp"><i></i><span>设计师</span><b></b><div class="clear"></div></a></li>
			<li class="nav_help"><a href="index.jsp"><i></i><span>帮帮忙</span><b></b><div class="clear"></div></a></li>
			<li class="nav_about"><a href="index.jsp"><i></i><span>关于我们</span><b></b><div class="clear"></div></a></li>
		</ul>
	</div>
		<div id="user">
					<div class="account">
				<div class="login_b_t">
					<div class="pd10">
						<div class="fl">还没有账号<a id="reg_now" href="" onclick="return false;">立即注册</a></div><div class="fr"><a href="#">忘记密码?</a></div><div class="clear"></div>
					</div>
				</div>
			</div>
			<div class="pd10" >
				<form method="post" action="">
					<div class="login_b_i">
						<div class="login_input">
							<div class="login_user"><input type="text" name="email" placeholder="邮箱/帐号" /><i></i></div>
							<div class="login_password"><input type="password" name="password" placeholder="密码" /><i></i></div>
						</div>
					</div>
					<a class="login_submit">登录</a>
				</form>
				<div class="login_quick">
					<p>用第三方帐号直接登录</p>
					<a href="http://www.17sucai.com/oauth/weibo/login" id="weibo_app"><span><i></i>微博帐号登录</span></a>
					<a href="http://www.17sucai.com/oauth/qq/login" id="qq_connect"><span><i></i>QQ&nbsp;&nbsp;帐号登录</span></a>
				</div>
			</div>
			</div>

	<div id="header" class="head">
		<div class="wrap">
			<i class="menu_back"><a href="javascript:history.back(-1)"></a></i>
			<div class="title">
				<span class="title_d"><p>${resources2.rename}<p></span>
				<div class="clear"></div>
			</div>
			<i class="menu_share"></i>
		</div>
	</div>
	
	<div id="container">
		<div id="content">
						<div style="height:1px"></div>
						
			<div id="works">
				<div class="pd5">
				
					<div class="list_info_i" style="margin-top:5px;">

						<dl class="works_view">
							<dt></dt>
<c:if test="${empty resources2.retime }">
	暂无信息
</c:if>
	<c:if test="${!empty resources2.retime }">
							${resources2.retime}
	</c:if>
							<div class="clear"></div>
						</dl>
						<div class="clear"></div>
					</div>

										
					<div class="clear"></div>

					<div class="article_ct">
						<p> <img src="http://ntzj126.cn/reimages/<c:out value='${resources2.reimg}'/>" /></p>
						
						</div>
					<div class="clear"></div>

				</div>

				<div class="pd5">
					<p style="margin-left:10px;font-size: 1.3em "> 详细介绍:</p>
					<p style="margin-left:10px;font-size:0.9em ">
						<c:if test="${empty resources2.resynopsis }">
							暂无信息
						</c:if>
						<c:if test="${!empty resources2.resynopsis }">
						${resources2.resynopsis}
						</c:if>
					</p>
					<div class="clear"></div>
				</div>
			</div>
						<div id="more_about">
				<h4>相关文章</h4>
				<div class="more_about">
					<table width="100%" border="0" cellspacing="5">
						<tr>
							<c:set var="flag" value="0"/>
							<c:forEach var="resourceList" items="${resourceList}">
								<c:if test="${resourceList.typeofnameid == resources2.typeofnameid and flag<5 }">
									<c:set var="flag" value="${flag+1}"/>
							<td><a target="_blank" href="${pageContext.request.contextPath }/findAllResourcesPh?reid=${resourceList.reid}"><img src="http://ntzj126.cn/reimages/${resourceList.reimg}" style="height: 75px;width:60px"/></a></td>

								</c:if>

							</c:forEach>
							<c:if test="${flag==0}">
								暂无分类
							</c:if>
						</tr>
					</table>
				</div>
			</div>

									<div id="comment">
										<c:set value="0" var="count" scope="application" />
<c:forEach var="commentList" items="${commentList}">
	<c:set value="${applicationScope.count+1}" var="count" scope="application" />
</c:forEach>
				<div class="comment_other">
					<h4>全部评论:${count} 条</h4>
					<c:if test="${count==0}">
						暂无评论
					</c:if>
				</div>


                                            <c:forEach var="commentList" items="${commentList}">


												<ul>
										<li postdata="17470" usdata="20035">
						<div class="pd5">
							<a class="avt fl" target="_blank" href="#"> <img src="http://ntzj126.cn/img/<c:out value='${commentList.userimg}'/> "/></a>
							<div class="comment_content">
								<h5>
									<div class="fl"><a class="comment_name" href="#">${commentList.username}</a><span>${commentList.commenttime}</span></div>
									<div class="fr"><a  onclick="showtab()">[回复]</a></div> <%--reply_this--%>
									<div class="clear"></div>
								</h5>
								<div class="comment_p">
								<div class="comment_pct">${commentList.comment}</div>
																</div>
							</div>
							<div class="clear"></div>
							<div class="comment_reply"></div>
						</div>
					</li>

									</ul>
                                            </c:forEach>
				<div class="pd5">
									</div>
			</div>
		</div>

	</div>
	
	
	
	<div id="us_panel_menu">
		<div class="us_panel_msk"></div>
		<div class="us_panel_menu_t">
			<table width="100%" cellspacing="0">
				<tr>
					<td valign="top" class="us_panel_menu_index">
						<a href="/typeListPh"><i></i><span>首页</span></a>
					</td>
					<td valign="top" class="us_panel_menu_designer">
						<a href="/tofindResourcesByUseridPh?userid=${user1.userId}"><i></i><span>个人</span></a>
					</td>
					<td valign="top" class="us_panel_menu_help">
						<a href="/tofind"><i></i><span>帮帮忙</span></a>
					</td>
					<td valign="top" class="us_panel_menu_about">
						<a href="/tome"><i></i><span>关于</span></a>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div id="us_panel2">
		<table width="100%" height="100%" cellspacing="0" border="0">
			<tr>
				<td class="us_panel_like"><i></i><span>详情<em></em></span></td>
				<td class="us_panel_menu"><div class="arrow_top"></div><i></i><div class="us_panel_menu_left"></div><div class="us_panel_menu_right"></div></td>
				<td class="us_panel_post"><i></i><span>评论(<em>${count}</em>)</span></td>
			</tr>
		</table>
	</div>

	<div id="add_newpost">
		<form method="post" name="frm" >
		<div class="newpost_w">
			<input type="hidden" value="<c:out value='${user1.userId}'/>" name="userId">
			<div class="pd10">
				<div class="newpost_w_t">
					<textarea name="comment" id="commenttext"></textarea>
				</div>
			</div>
		</div>
		<div class="add_newpost">
			<table width="100%" height="100%" cellspacing="5">
				<tr>
					<td class="add_newpost_cancel">取消</td>
					<td class="add_newpost_post" onclick="submitpost('${pageContext.request.contextPath}/addCommentPh?reid=${resources2.reid}')">评论</td>
				</tr>
			</table>
		</div>
		</form>
	</div>


	<div id="add_favorite">
		<div class="hd">
			<div class="wrap">
				<div class="fl">
					<span>${resources2.rename}的信息</span>
				</div>
				<div class="fr"></div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="ct">
			<div class="wrap">

				<div class="created_cate">
					<div class="created_cate_add"  onclick="openW('${resources2.netdisk}')">前往</div>
					<div class="created_cate_ipt">
						百度网盘：${resources2.netdisk}
						<intput type="text"  />
					</div>
					<div class="clear"></div>
				</div>

				<div class="created_cate">
					<div class="created_cate_add" onClick="copyUrl2()">复制</div>
					<div class="created_cate_ipt">
						网盘密码：<span id="biao2">${resources2.netdiskpwd }</span>
						<intput type="text"  />
					</div>
					<div class="clear"></div>
				</div>
				<div class="created_cate">

					<div class="created_cate_add"  onClick="copyUrl1()">复制</div>
					<div class="created_cate_ipt">
						迅雷：<span id="biao1">${resources2.thunder}</span>
						<intput type="text" />
					</div>
				</div>
				<div class="created_cate">


				</div>
				<ul id="add_favorites_choose">
									</ul>
			</div>
		</div>
	</div>
	

	<div id="share">
		<div class="share_msk"></div>
		<div class="share">
			<table width="100%" cellspacing="10" border="0">
				<tr>
					<td class="sina"><a onclick="showtab()"></a></td>
					<td class="guangbo"><a onclick="showtab()"></a></td>
					<td class="facebook"><a onclick="showtab()"></a></td>
					<td class="twitter"><a onclick="showtab()"></a></td>
				</tr>
			</table>
			<div class="pd10">
				<div class="cancel_share"><a  onclick="return false;">取消分享</a></div>
			</div>
		</div>
	</div>
		<div id="reg_index">
			<div class="reg_bar">
				<div class="wrap">
					<span class="fl"><i></i><a href="${pageContext.request.contextPath }/login/register.jsp">注册帐号</a></span>
					<i class="reg_bar_close fr"></i>
					<div class="clear"></div>
				</div>
			</div>
			<div class="wrap reg_ct">
				<form method="post" >
					<div class="login_b_i">
						<div class="login_input">
							<div class="login_user"><input type="text" id="username" name="username" placeholder="用户名" /></div>
							<div class="login_password"><input type="password" id="password" name="password" placeholder="密码" /></div>
						</div>
					</div>
					<input type="submit" class="login_submit" onclick="logining()" value="登录" />

				</form>
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
		<script>
			function showtab() {
				alert("暂不支持");
            }
		</script>
</body>
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

<script >
	function submitpost(url) {
		 var comment=document.getElementById("commenttext").value;
		console.log(comment);
		if (comment==null){
		    alert("你还没有评论");
		}
		else {
            document.frm.action=url;
            document.frm.submit();
		}
    }
</script>
<script language="javascript">
	function openW(url) {
        if (confirm("复制网盘密码了吗？")) {
           window.open(url);
        }

    }
    function copyUrl1()
    {
        var Url2=document.getElementById("biao1").innerText;
        var oInput = document.createElement('input');
        oInput.value = Url2;
        document.body.appendChild(oInput);
        oInput.select(); // 选择对象
        document.execCommand("Copy"); // 执行浏览器复制命令
        oInput.className = 'oInput';
        oInput.style.display='none';
        alert('复制成功');
    }
    function copyUrl2()
    {
        var Url2=document.getElementById("biao2").innerText;
        var oInput = document.createElement('input');
        oInput.value = Url2;
        document.body.appendChild(oInput);
        oInput.select(); // 选择对象
        document.execCommand("Copy"); // 执行浏览器复制命令
        oInput.className = 'oInput';
        oInput.style.display='none';
        alert('复制成功');
    }
</script>
</html>
