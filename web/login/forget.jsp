<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2018/8/6
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>修改密码</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">




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
    <link rel="shortcut icon" href="favicon.ico">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/animate.css">
    <link rel="stylesheet" href="../css/style.css">

    <!-- Modernizr JS -->
    <script src="../js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="../js/respond.min.js"></script>
    <![endif]-->

</head>
<body class="style-2">

<div class="container">

    <div class="row">
        <div class="col-md-4">


            <!-- Start Sign In Form -->
            <form action="#"name="frm" class="fh5co-form animate-box" data-animate-effect="fadeInLeft">
                <h2>修改密码</h2>
                <div class="form-group">
                    <div id="msg" class="alert alert-success" role="alert">如果忘记用户名，<a href="${pageContext.request.contextPath }/login/register.jsp">请重新注册</a></div>
                </div>
                <div class="form-group">
                    <label for="username" class="sr-only">用户名</label>
                    <input type="text" name="username" class="form-control" id="username" placeholder="用户名" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="username" class="sr-only">密码</label>
                    <input type="text" name="password" class="form-control" id="password" placeholder="密码" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="username" class="sr-only">重复密码</label>
                    <input type="text" name="re" class="form-control" id="re" placeholder="重复密码" autocomplete="off">
                </div>
                <div class="form-group">
                    <p><a href="${pageContext.request.contextPath }/login/login.jsp">登录</a>| <a href="${pageContext.request.contextPath }/login/register.jsp">注册</a></p>
                </div>
                <div class="form-group">
                    <input type="button" id="btn1"  class="btn btn-primary" value="修改密码" onclick="check('${pageContext.request.contextPath}/reset')"/>
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
<script>
    function check(url) {
        var user=document.getElementById("username").value;
        var pwd=document.getElementById("password").value;
        var re=document.getElementById("re").value;
        if (user.length==0)
        {
            document.getElementById('msg').innerText='请输入昵称';
            document.getElementById("username").focus();

            return;
        }
        if ((pwd.length==0)||(pwd!=re))
        {
            document.getElementById('msg').innerText='请输入密码或者俩次密码不一致';
            document.getElementById("username").focus();

            return;
        }
        else{
            document.frm.action=url;
            document.frm.submit();
        }

    }
</script>
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
                        document.getElementById('msg').innerText='账号存在';
                    }
                    else {
                        document.getElementById('msg').innerText = '当前账号不存在';
                        $("#username").val("");
                    }
                }
            });
        });});
</script>
    </body>
    </html>
