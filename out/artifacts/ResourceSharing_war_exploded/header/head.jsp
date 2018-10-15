<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018-7-18
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>
    <link rel="stylesheet" href="../css/zd-1.0.css">
    <link rel="stylesheet" href="../css/mean.css">
    <style>

    </style>

    <script type="text/javascript">
        function load_home() {
            document.getElementById("viewDiv").innerHTML = '<object type="text/html" data="new.html" width="100%" height="100%"></object>';
        }
    </script>

</head>
<body>
<nav>
    <!-- logo -->
    <div class="nav-logo">
        <c:if test="${!empty user1}">
             <img id="link" src="http://ntzj126.cn/img/<c:out value='${user1.getUserimg()}'/>" alt="<c:out value='${user1.username}'/>" title="<c:out value='${user1.username}'/>" >

        </c:if>
        <c:if test="${empty user1}">
            <li  style="float:left"><a href="${pageContext.request.contextPath }/login/login.jsp"  >未登录</a></li>
        </c:if>
    </div>

    <!-- 控制menu -->
    <div class="nav-menu">
        <span></span>
        <span></span>
        <span></span>
    </div>

    <!-- 菜单 -->
    <ul class="nav-list">
        <li>
            <a href="index.jsp" class="active" target="_parent">首页<div class="carect"></div></a>
            <ul class="menu">
               <c:if test="${!empty  user1}">
                <li><a href="${pageContext.request.contextPath }/user/user-search.jsp" >站内搜索</a></li>
                <li><a href="${pageContext.request.contextPath }/selectuser?userId=${user1.userId}" >个人资料</a></li>
                <li><a href="${pageContext.request.contextPath }/addresource">提供资源</a></li>
                <li ><a href="${pageContext.request.contextPath }/exit">注销</a></li>
               </c:if>
               <c:if test="${empty user1}">
                   <li ><a href="${pageContext.request.contextPath }/login/login.jsp">请先登录</a></li>
               </c:if>
            </ul>
        </li>
<c:forEach var="typeList" items="${typeList}">
    <c:set value="0" var="flag"></c:set>
        <li id="teleplay"><a href="index.jsp" ><c:out value='${typeList.typename}' /></a>

            <ul class="menu">
                <c:forEach var="typeOfNames" items="${typeOfNames}">

                <c:if test="${typeOfNames.typeid== typeList.typeid and flag<3}">

                <c:set var="flag" value="${flag+1}"/>
                <li><a href="${pageContext.request.contextPath }/selectTonById?typeofnameid=${typeOfNames.typeofnameid}" target="rename"><c:out value='${typeOfNames.typeofname}' /></a></li>
                </c:if>
                </c:forEach>
                <li><a href="${pageContext.request.contextPath }/selectTypeId?typeid=${typeList.typeid} " target="_blank">+更多</a></li>
            </ul>

        </li>
</c:forEach>

</nav>
<div id="thediv" class="usermenu">
    <ul>
        <li><a href="${pageContext.request.contextPath }/selectuser?userId=${user1.userId}" >个人资料</a></li>

        <li ><a href="${pageContext.request.contextPath }/exit">注销</a></li>
    </ul>
</div>
<iframe width="100%" height="93%" src="/resourceList" frameborder="0"scrolling="YES" name="rename"></iframe>
</body>
<script src="../js/jquery.min.js"></script>

<script>

    $(document).click(function(){
        $('.nav-list').removeClass('open')
    })
    $('.nav-menu,.nav-list').click(function(e){e.stopPropagation()})
    $('nav').find('.nav-menu').click(function(e){
        $('.nav-list').toggleClass('open')
    })
</script>
</html>

