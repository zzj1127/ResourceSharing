<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2018/8/31
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
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

<body >
<c:forEach items="${inform1}" var="inform1">
<div id="menu">
    <div class="search_wrap">
        <form action="" method="get">
            <input type="text" name="search" class="search_input" placeholder="关键字查找" />
            <i class="reset_input"><i></i></i>
        </form>
    </div>
    <ul>
        <li class="nav_index"><a href="/typeListPh"><i></i><span>首页</span><b></b><div class="clear"></div></a></li>
        <li class="nav_site"><a href="/tofindResourcesByUseridPh?userid=${user1.userId}"><i></i><span>设计师</span><b></b><div class="clear"></div></a></li>
        <li class="nav_help"><a href="/tofind"><i></i><span>帮帮忙</span><b></b><div class="clear"></div></a></li>
        <li class="nav_about"><a href="/tome"><i></i><span>关于我们</span><b></b><div class="clear"></div></a></li>
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
        <i class="menu_back"><a href="/tome"></a></i>
        <div class="title">
            <span class="title_d"><p>${inform1.inftitle}</p></span>
            <div class="clear"></div>
        </div>
        <i class="menu_share"></i>
    </div>
</div>

<div id="container" >
    <div id="content" >
        <div style="height:1px"></div>

        <div id="works">
            <div class="pd5">

                <div class="list_info_i" style="margin-top:5px;">

                    <dl class="works_view">
                        <dt></dt>
                        <c:if test="${empty inform1.inftime}">
                            暂无信息
                        </c:if>
                        <c:if test="${!empty inform1.inftime}">
                            ${inform1.inftime}
                        </c:if>
                        <div class="clear"></div>
                    </dl>
                    <div class="clear"></div>
                </div>


                <div class="clear"></div>


            </div>

            <div class="pd5" >
                <p style="margin-left:10px;"> <span style="font-size: 1.7em">标题:</span><span style="font-size: 2em"> ${inform1.inftitle}</span></p>
                <p style="margin: 10px; "><span style="font-size: 1.7em">内容: </span><span style="font-size: 1.2em">${inform1.infcontext}</span>

                </p>
                <div class="clear"></div>
            </div>
            <div class="article_ct">
                <p> <img src="http://ntzj126.cn/reimages/${inform1.infimg}" /></p>

            </div>
            <div class="clear"></div>

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
        <c:set var="flag" value="0"/>
    <c:forEach items="${informList}" var="informList">
        <c:set var="flag" value="${flag+1}"/>
    </c:forEach>
        <tr>
            <c:if test="${(inform1.infid==1)||(flag==1)}">
                <td ><span>第一个</span></td>
            </c:if>
            <c:if test="${(inform1.infid!=1)&&(flag!=1)}">
            <td onclick="window.open('/findAllInformPh?infid=${inform1.infid-1}','_self')" ><span >上一篇</span></td>
            </c:if>
            <td class="us_panel_menu"><div class="arrow_top"></div><i></i><div class="us_panel_menu_left"></div><div class="us_panel_menu_right"></div></td>
            <c:if test="${(inform1.infid==flag)||(flag==1)}">
                <td ><span>没有了</span></td>
            </c:if>
            <c:if test="${(inform1.infid!=flag)&&(flag!=1)}">
            <td onclick="window.open('/findAllInformPh?infid=${inform1.infid+1}','_self')"><span>下一篇</span></td>
            </c:if>
        </tr>
    </table>
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
</c:forEach>
<script language="javascript" src="phonehtml/js/zepto.min.js"></script>
<script language="javascript" src="phonehtml/js/fx.js"></script>
<script language="javascript" src="phonehtml/js/script.js"></script>
<script>
    function showtab() {
        alert("暂不支持");
    }
</script>
</body>
</html>

