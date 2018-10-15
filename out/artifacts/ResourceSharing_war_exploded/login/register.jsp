<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018-7-20
  Time: 13:20
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
    <title>注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Template by FreeHTML5.co" />
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
    <%--<！--[if lt IE 9]>-->--%>
    <!--<script src="js/respond.min.js"></script>/-->
    <!--<![endif]-->

</head>
<body class="style-2" >

<div class="container">
    <div class="row">
        <div class="col-md-12 text-center">
            <ul class="menu">
                <%--<li></li>--%>
                <%--<li class="active">成为管理员</li>--%>
                <%--<li></li>--%>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <!-- Start Sign In Form -->
            <form id="form100" action="${pageContext.request.contextPath}/register" name="frm" method="post" class="fh5co-form animate-box" data-animate-effect="fadeInLeft"  enctype="multipart/form-data">
                <h2>注册</h2>
                <div class="form-group">
                    <div class="alert alert-success" role="alert" id="msg">${msg}</div>
                </div>
                <div class="form-group">
                    <label for="nickname" class="sr-only">昵称</label>
                    <input name="nickname" type="text"  id="nickname" class="form-control" placeholder="昵称" autocomplete="off"/>
                </div>
                <div class="form-group">
                    <label for="username" class="sr-only">用户名</label>
                    <input name="username" type="text"   id="username" class="form-control" autocomplete="off"placeholder="用户名"/>
                </div>
                <div class="form-group">
                    <label for="realname" class="sr-only">真实姓名</label>
                    <input name="realname" type="text"   id="realname" class="form-control" autocomplete="off"placeholder="真实姓名"onBlur='javascript:validate();' />
                </div>
                <div class="form-group">
                    <label for="password" class="sr-only">密码</label>
                    <input name="password" type="password"   id="password" class="form-control" placeholder="密码" autocomplete="off"/>
                </div>
                <div class="form-group">
                    <label for="password" class="sr-only">Re-type Password</label>

                    <input name="re" type="password"   class="form-control" id="re" placeholder="验证密码" autocomplete="off"  />
                </div>
                <div class="form-group">

                    <div id="dd" style="width:50px; height:50px;"></div>
                    <input id="load" type="file" class="form-control" name="file" onchange="upload(this.files)" />

                </div>
                <div class="form-group">
                    <p>已经注册? <a href="${pageContext.request.contextPath }/login/login.jsp">登录</a></p>
                </div>
                <div class="form-group">

                    <input type="button" id="btn1"  class="btn btn-primary" value="立即注册" onclick="check('${pageContext.request.contextPath}/register')"/>
                </div>
            </form>
            <!-- END Sign In Form -->
        </div>
    </div>
</div>

    <script>
        function $$(obj) {
            return document.getElementById(obj);
        }
        function upload(f){

            var str = "";
            for(var i=0;i<f.length;i++){
                var reader = new FileReader();
                reader.readAsDataURL(f[i]);
                reader.onload = function(e){
                    str+="<img style='width:100%;height:100%;' src='"+e.target.result+"'/>";
                    $$("dd").innerHTML = str;
                }
            }

        }
    </script>
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
    <script src="../js/check.js"></script>
<script>
    function check(url) {
        var nick=document.getElementById("nickname").value;
        var user=document.getElementById("username").value;
        var real=document.getElementById("realname").value;
        var pwd=document.getElementById("password").value;
        var re=document.getElementById("re").value;
        var load=document.getElementById("load").value;
        var _name, _fileName, personsFile;
        personsFile = document.getElementById("load");
        _name = personsFile.value;
        _fileName = _name.substring(_name.lastIndexOf(".") + 1).toLowerCase();
        console.log(load);
        if (nick.length==0)
        {
            document.getElementById('msg').innerText='请输入昵称';
            document.getElementById("username").focus();

            return;
        }
        if (user.length==0)
        {
            document.getElementById('msg').innerText='请输入昵称';
            document.getElementById("username").focus();

            return;
        }
        if (real.length==0)
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
        if (load==0)
        {
            document.getElementById('msg').innerText='请添加头像';
            document.getElementById("username").focus();
        }
        if(_fileName !== "png" && _fileName !== "jpg")
        {
          alert("上传格式为png或jpg，请重新上传");
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
                        document.getElementById('msg').innerText='当前账号已经被使用了，请重新输入';

                        $("#username").val("");


                    }
                    else {
                        document.getElementById('msg').innerText = '当前账号可以使用';
                    }
                }
            });



        });});

</script>
</body>
</html>
