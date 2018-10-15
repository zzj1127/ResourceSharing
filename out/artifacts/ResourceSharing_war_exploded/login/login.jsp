<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018-7-18
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="" />
    <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />




    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content="" />
    <meta name="twitter:image" content="" />
    <meta name="twitter:url" content="" />
    <meta name="twitter:card" content="" />

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/animate.css">
    <link rel="stylesheet" href="../css/style.css">


    <!-- Modernizr JS -->
    <script src="../js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <!--<script src="../js/respond.min.js"></script>-->
    <!--[endif]-->

</head>
<body class="style-2" >

<div class="container">
    <div class="row">
        <div class="col-md-12 text-center">
            <ul class="menu">

            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">


            <!-- Start Sign In Form -->

                <form id="form100" name="frm" action="${pageContext.request.contextPath}/login" method="post" class="fh5co-form animate-box" data-animate-effect="fadeInLeft">
                    <h2>登录</h2>
                    <div class="form-group">
                        <div class="alert alert-success" role="alert" id="msg">${msg}</div>
                    </div>
                    <div class="form-group">
                        <label for="username" class="sr-only">用户名</label>

                        <input id="username" name="username" type="text" class="form-control" placeholder="用户名" autocomplete="off"  value="${username}"/>
                    </div>
                    <div class="form-group">
                        <label for="password" class="sr-only">密码</label>

                        <input id="password" name="password" type="password" class="form-control"  id="password" autocomplete="off" placeholder="密码" />
                    </div>
                    <div class="form-group">
                        <label for="remember"><input type="checkbox" id="remember"> 记住我</label>
                    </div>
                    <div class="form-group">
                        <p>还没有注册 <a href="${pageContext.request.contextPath }/login/register.jsp">注册</a> | <a href="${pageContext.request.contextPath }/login/forget.jsp">忘记密码</a></p>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="登录" class="btn btn-primary">
                    </div>
                </form>
                <!-- END Sign In Form -->

        </div>
    </div>

</div>

<!-- jQuery -->
<script src="../js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../js/bootstrap.min.js"></script>
<!-- Placeholder -->
<script src="../js/jquery.placeholder.min.js"></script>
<!-- Waypoints -->
<script src="../js/jquery.waypoints.min.js"></script>
<!-- Main JS -->
<script src="../js/main.js"></script>
</body>
<script>

    $(function(){
        $("#username").blur(function(){
            //判断用户名是否存在
            var username = $("#username").val();

            console.log(username);
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/checkUserNameExit?username="+username,
                contentType:"application/json;charset=utf-8",
                success:function(data){
                    //alert(data);  0 不存在  1 存在\
                    if(data==1){
                        document.getElementById('msg').innerText='当前账号可以使用';
                    }
                    if(data==2){
                        document.getElementById('msg').innerText='此账号尚未注册';
                        $("#username").val("");
                    }
                }
            });



        });});

</script>
</html>


