<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2018/8/3
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Multiverse by HTML5 UP</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <!--[if lte IE 8]><script src="../assets/js/ie/html5shiv.js"></script><![endif]-->
    <link rel="stylesheet" href="../assets/css/mainseacher.css" />
    <!--[if lte IE 9]><link rel="stylesheet" href="../assets/css/ie9.css" /><![endif]-->
    <!--[if lte IE 8]><link rel="stylesheet" href="../assets/css/ie8.css" /><![endif]-->
</head>
<body>

<!-- Wrapper -->
<div id="wrapper">
    <header id="header">
        <h1><a href="${pageContext.request.contextPath }/index.jsp">
            </a></h1>
        <nav>
            <ul>
                <li><a href="${pageContext.request.contextPath }/user/user-search.jsp" class="icon fa-info-circle">BLACK</a></li>
            </ul>
        </nav>
    </header>
    <!-- Main -->
    <div id="main">
<c:forEach var="resources" items="${resources}">
        <article class="thumb">
            <a href="http://ntzj126.cn/reimages/${resources.reimg}" class="image"><img src="http://localhost:8080/reimages/${resources.reimg}" alt="${resources.rename}" /></a>
            <h2>${resources.rename}</h2>
            <p><a href="${pageContext.request.contextPath }/findAllResources?reid=${resources.reid}" target="_blank" >查看详情</a></p>
        </article>
</c:forEach>
    </div>



</div>

<!-- Scripts -->
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/jquery.poptrox.min.js"></script>
<script src="../assets/js/skel.min.js"></script>
<script src="../assets/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="../assets/js/mainseacher.js"></script>

</body>
</html>
