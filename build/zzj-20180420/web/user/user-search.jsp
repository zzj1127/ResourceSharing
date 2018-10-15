<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2018/8/3
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>

    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/styleseach.css">

</head>
<body>

<div id="top-image">
    <div id="content" class="container center-block">
        <div class="jumbotron">
            <div class="container">
                <h1>搜索功能</h1>
                <p><a href="${pageContext.request.contextPath}/index.jsp"> 返回到主页</a></p>
                <form method="post" action="${pageContext.request.contextPath}/toSeacher">
                    <div class="input-group input-group-lg"> <span class="input-group-addon" id="sizing-addon1"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></span>
                        <input type="text" class="form-control" name="seacher" placeholder="输入关键词" aria-describedby="sizing-addon1">
                        <span class="input-group-btn">
          <button class="btn btn-default" type="submit">搜 索</button>
          </span> </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="../js/jquery.min.js"></script>
<script src="../js/ios-parallax.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#top-image').iosParallax({
            movementFactor: 50
        });
    });
</script>
</body>
</html>
