<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018-7-25
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
    <link rel="stylesheet" href="../css/box.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
    <link rel="stylesheet" href="../css/re-index.css" />
</head>
<body>
<div class="context" >
    <ul class="coul">
<c:forEach var="typeList" items="${typeList}">
    <c:set value="0" var="flag"></c:set>
    <c:set value="0" var="flag1"></c:set>
        <li class="coli">
            <div class="divlist" >
                <div class="Specific" >
    <c:forEach var="resourceList" items="${resourceList}">
        <c:if test="${resourceList.typeid== typeList.typeid and flag1<4}">
        <c:set var="flag1" value="${flag1+1}"/>
                    <div class="box" >
                        <img src="http://ntzj126.cn/reimages/<c:out value='${resourceList.reimg}'/>" class="boximg" />
                        <div class="screen" >
                            <div class="enter" onclick="location.href='${pageContext.request.contextPath }/findAllResources?reid=${resourceList.reid}'">查看详情</div>
                        </div>
                    </div>
        </c:if>
    </c:forEach>
                    <div class="rough" >
                        <div class="romenu">

                            <ul>
                                <li ><c:out value='${typeList.typename}' /></li>
                                <c:forEach var="typeOfNames" items="${typeOfNames}">
                                    <c:if test="${typeOfNames.typeid== typeList.typeid and flag<8}">
                                        <c:set var="flag" value="${flag+1}"/>
                                        <li><a href="${pageContext.request.contextPath }/selectTonById?typeofnameid=${typeOfNames.typeofnameid}" style="list-style: none" ><c:out value='${typeOfNames.typeofname}' /></a></li>
                                    </c:if>
                                </c:forEach>
                                <li ><a href="${pageContext.request.contextPath }/selectTypeId?typeid=${typeList.typeid}" >+更多</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </li>
</c:forEach>
    </ul>
</div>

</body>
</html>
