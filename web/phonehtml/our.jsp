<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2018/8/31
  Time: 11:01
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
    <script>
        var giveColor = document.getElementsByName('wrap');
        var color = ['rgba(230,230,250,0.8)', 'rgba(240,255,255,0.8)', 'rgba(255,228,225,0.8)', 'rgba(245,245,245,0.8)', 'rgba(255,250,205,0.8)', 'rgba(225,255,255,0.8)'];
        function randomColorOn(giveColor,color){//参数1为获取的元素组，参数二为获取的颜色组
            var arr2 = [];
            for(var i = color.length; i > 0; i--) {
                const num = Math.floor(Math.random() * color.length); //获取随机数
                arr2.push(color[num]); //把随机数添加到数组中
                color.splice(num, 1); //删除原有数组的颜色
            }

            for(var j = 0; j < giveColor.length; j++) {
                giveColor[j].style.backgroundColor = arr2[j];
            }
        }
        randomColorOn(giveColor,color);
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
        <li class="nav_index "><a href="/typeListPh"><i></i><span>首页</span><b></b><div class="clear"></div></a></li>
        <li class="nav_site"><a href="/tofindResourcesByUseridPh?userid=${user1.userId}" ><i></i><span>我的资源</span><b></b><div class="clear"></div></a></li>
        <li class="nav_help"><a href="/tofind"><i></i><span>分享资源</span><b></b><div class="clear"></div></a></li>
        <li class="nav_about menu_cur"><a href="/tome"><i></i><span>平台公告</span><b></b><div class="clear"></div></a></li>
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
                        <div class="sort_b"><a href="#" onclick="return false;"><div class="sort_b_inner"><i class="cate_default"></i><span>全部公告</span><div class="clear"></div></div></a></div>
                    </div>
                </td>
            </tr>
        </table>
    </div>

    <div id="content">
        <!--显示框-->
        <div id="list">
            <ul>
                <c:forEach var="informList" items="${informList}">
                    <li>
                        <div class="wrap" name="wrap">
                            <a class="alist" href="${pageContext.request.contextPath }/findAllInformPh?infid=${informList.infid}">

<center>
    <h4 style="font-size:1.3em;color: rgba(21,21,21,0.55); ">
        <c:if test="${informList.infstates ==0 }">
            重要告知
        <c:if test="${informList.infposition ==1 }">
            <span style="color: red;font-size: 0.5em">置顶</span>
        </c:if>
        <c:if test="${informList.infposition ==2 }">
            <span style="color: rgba(210,203,0,0.67);font-size: 0.5em">最新</span>
        </c:if>
            <c:if test="${informList.infposition ==0 }">
                <span style="color: red;font-size: 0.5em">置顶</span>
                <span style="color: rgba(210,203,0,0.67);font-size: 0.5em">最新</span>
            </c:if>
        </c:if>
        <c:if test="${informList.infstates !=0 }">
            管理员告知
            <c:if test="${informList.infposition ==1 }">
                <span style="color: red;font-size: 0.5em">置顶</span>
            </c:if>
            <c:if test="${informList.infposition ==2 }">
                <span style="color: rgba(210,203,0,0.67);font-size: 0.5em">最新</span>
            </c:if>
            <c:if test="${informList.infposition ==0 }">
                <span style="color: red;font-size: 0.5em">置顶</span>
                <span style="color:rgba(210,203,0,0.67);font-size: 0.5em">最新</span>
            </c:if>
        </c:if>
    </h4>

                                    <div  style="font-size:2.5em;margin-top: 12px;color: rgba(0,0,0,0.5)">
                                            ${informList.inftitle}
                                    </div>

    <h5 style="margin-left:220px;margin-top: 10px ">

        <span id="typename" >${informList.inftime}</span>

    </h5>
</center>

                                <div class="clear"></div>
                            </a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
            <div class="list_loading"><i></i><span>没有公告了</span></div>
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
                    <li  style="font-weight:700;"  onclick="seacherinfA()"><i style="background:none;width:0;margin-right:0;" class="s"></i><span>全部公告</span><i class="e"></i></li>
                    <li  style="font-weight:700;" onclick="seacherInfP()"><i style="background:none;width:0;margin-right:0;" class="s"></i><span>最近公告</span><i class="e"></i></li>
                    <li  style="font-weight:700;" onclick="seacherInfS( )"><i style="background:none;width:0;margin-right:0;" class="s"></i><span>重要公告</span><i class="e"></i></li>
                </ul>
                <div class="clear"></div>
            </div>
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
    function seacherinfA() {
        var str="";
        $.ajax({
            type:"post",

            url:"${pageContext.request.contextPath}/seacherinfA",
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
                    for (var i=0;i < data.length;i++) {
                        str += '<li>' +
                            '<div class="wrap" name="wrap">' +
                            '<a class="alist" href="/findAllInformPh?infid=' + data[i].infid + '">' +

                            '<center>' +
                            ' <h4 style="font-size:1.3em;color: rgba(21,21,21,0.55); ">'
                        if (data[i].infstates == 0){
                            str +='重要告知'

                        if (data[i].infposition == 1) {
                            str += ' <span style="color: red;font-size: 0.5em">置顶</span>'
                        }
                        if (data[i].infposition == 2) {
                            str += ' <span style="color: rgba(210,203,0,0.67);font-size: 0.5em">最新</span>'
                        }
                        if (data[i].infposition == 0) {
                            str += ' <span style="color: red;font-size: 0.5em">置顶</span>' +
                             ' <span style="color: rgba(210,203,0,0.67);font-size: 0.5em">最新</span>'
                        }

                    }
                        if (data[i].infstates!= 0){
                            str += '管理员告知'

                            if (data[i].infposition == 1) {
                                str +=   ' <span style="color: red;font-size: 0.5em">置顶</span>'
                            }
                            if (data[i].infposition == 2) {
                                str +=  ' <span style="color: rgba(210,203,0,0.67);font-size: 0.5em">最新</span>'
                            }
                            if (data[i].infposition == 0) {
                                str += ' <span style="color: red;font-size: 0.5em">置顶</span>' +
                                ' <span style="color: rgba(210,203,0,0.67);font-size: 0.5em">最新</span>'
                            }

                        }
                        str +='</h4>'+

                            '<div  style="font-size:2.5em;margin-top: 12px;color: rgba(0,0,0,0.5)">'+
                            data[i].inftitle
                            +'</div>'+

                            '<h5 style="margin-left:220px;margin-top: 10px ">'+

                           '<span id="typename" >' +data[i].inftime+'</span>'+

                            '</h5>'+
                            '</center>'+

                            '<div class="clear"></div>'+
                            '</a>'+
                           '</div>'+
                            '  </li>'


                    }

                    $('#list ul').html(str);
                }
            }

        });

    }
</script>
<script >
    function seacherInfP() {
        var str="";
        $.ajax({
            type:"post",

            url:"${pageContext.request.contextPath}/seacherInfP",
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
                    for (var i=0;i < data.length;i++) {
                        str += '<li>' +
                            '<div class="wrap" name="wrap">' +
                            '<a class="alist" href="/findAllInformPh?infid=' + data[i].infid + '">' +

                            '<center>' +
                            ' <h4 style="font-size:1.3em;color: rgba(21,21,21,0.55); ">'
                        if (data[i].infstates == 0){
                            str +='重要告知'

                            if (data[i].infposition == 1) {
                                str += ' <span style="color: red;font-size: 0.5em">置顶</span>'
                            }
                            if (data[i].infposition == 2) {
                                str += ' <span style="color: rgba(210,203,0,0.67);font-size: 0.5em">最新</span>'
                            }
                            if (data[i].infposition == 0) {
                                str += ' <span style="color: red;font-size: 0.5em">置顶</span>' +
                                    ' <span style="color: rgba(210,203,0,0.67);font-size: 0.5em">最新</span>'
                            }

                        }
                        if (data[i].infstates!= 0){
                            str += '管理员告知'

                            if (data[i].infposition == 1) {
                                str +=   ' <span style="color: red;font-size: 0.5em">置顶</span>'
                            }
                            if (data[i].infposition == 2) {
                                str +=  ' <span style="color: rgba(210,203,0,0.67);font-size: 0.5em">最新</span>'
                            }
                            if (data[i].infposition == 0) {
                                str += ' <span style="color: red;font-size: 0.5em">置顶</span>' +
                                    ' <span style="color: rgba(210,203,0,0.67);font-size: 0.5em">最新</span>'
                            }

                        }
                        str +='</h4>'+

                            '<div  style="font-size:2.5em;margin-top: 12px;color: rgba(0,0,0,0.5)">'+
                            data[i].inftitle
                            +'</div>'+

                            '<h5 style="margin-left:220px;margin-top: 10px ">'+

                            '<span id="typename" >' +data[i].inftime+'</span>'+

                            '</h5>'+
                            '</center>'+

                            '<div class="clear"></div>'+
                            '</a>'+
                            '</div>'+
                            '  </li>'


                    }

                    $('#list ul').html(str);
                }
            }

        });

    }
</script>
<script >
    function seacherInfS() {
        var str="";
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/seacherInfS",
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
                    for (var i=0;i < data.length;i++) {
                        str += '<li>' +
                            '<div class="wrap" name="wrap">' +
                            '<a class="alist" href="/findAllInformPh?infid=' + data[i].infid + '">' +

                            '<center>' +
                            ' <h4 style="font-size:1.3em;color: rgba(21,21,21,0.55); ">'
                        if (data[i].infstates == 0){
                            str +='重要告知'

                            if (data[i].infposition == 1) {
                                str += ' <span style="color: red;font-size: 0.5em">置顶</span>'
                            }
                            if (data[i].infposition == 2) {
                                str += ' <span style="color: rgba(210,203,0,0.67);font-size: 0.5em">最新</span>'
                            }
                            if (data[i].infposition == 0) {
                                str += ' <span style="color: red;font-size: 0.5em">置顶</span>' +
                                    ' <span style="color: rgba(210,203,0,0.67);font-size: 0.5em">最新</span>'
                            }

                        }
                        if (data[i].infstates!= 0){
                            str += '管理员告知'

                            if (data[i].infposition == 1) {
                                str +=   ' <span style="color: red;font-size: 0.5em">置顶</span>'
                            }
                            if (data[i].infposition == 2) {
                                str +=  ' <span style="color: rgba(210,203,0,0.67);font-size: 0.5em">最新</span>'
                            }
                            if (data[i].infposition == 0) {
                                str += ' <span style="color: red;font-size: 0.5em">置顶</span>' +
                                    ' <span style="color: rgba(210,203,0,0.67);font-size: 0.5em">最新</span>'
                            }

                        }
                        str +='</h4>'+

                            '<div  style="font-size:2.5em;margin-top: 12px;color: rgba(0,0,0,0.5)">'+
                            data[i].inftitle
                            +'</div>'+

                            '<h5 style="margin-left:220px;margin-top: 10px ">'+

                            '<span id="typename" >' +data[i].inftime+'</span>'+

                            '</h5>'+
                            '</center>'+

                            '<div class="clear"></div>'+
                            '</a>'+
                            '</div>'+
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
