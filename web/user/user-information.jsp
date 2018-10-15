<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018-7-23
  Time: 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title></title>
</head>
<body>

<form id="form100" name="frm" action="${pageContext.request.contextPath }/changeUserInformation" method="post"  items="${user1}" enctype="multipart/form-data">
    <input type="hidden" value="<c:out value='${user1.userId}'/>" name="userId" />
    <p><label for="realname"><em>*</em>姓名：</label>
        <input type="text" name="realname"   id="realname" value="<c:out value='${user1.realname}'/>" disabled="disabled" autocomplete="off" size="43" />
    </p>
    <p><label for="username"><em>*</em>账号：</label>
        <input type="text" name="username"   id="username" value="<c:out value='${user1.username}'/>" disabled="disabled" autocomplete="off" size="43" />
    </p>

    <p><label for="email"><em>*</em>邮箱：</label>
        <input type="text" name="email"  id="email" value="<c:out value='${user1.email}' />"  autocomplete="off" size="43" / >
    </p>
    <p><label for="sex"><em>*</em>性别：</label>
        <c:if test="${empty user1.sex }">
            <input type="radio" checked="checked" name="sex" value="男" ><font style="font-size:14px; font-family: tahoma,arial,宋体">&nbsp;&nbsp;男</font>&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="sex" value="女" ><font style="font-size:14px; font-family: tahoma,arial,宋体">&nbsp;&nbsp;女</font>
        </c:if>

        <c:if test="${user1.sex == '男' }">
            <input type="radio" checked="checked" name="sex" value="男" ><font style="font-size:14px; font-family: tahoma,arial,宋体">&nbsp;&nbsp;男</font>&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="sex" value="女" ><font style="font-size:14px; font-family: tahoma,arial,宋体">&nbsp;&nbsp;女</font>
        </c:if>

        <c:if test="${user1.sex == '女' }">
            <input type="radio"  name="sex" value="男" ><font style="font-size:14px; font-family: tahoma,arial,宋体">&nbsp;&nbsp;男</font>&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" checked="checked" name="sex" value="女" ><font style="font-size:14px; font-family: tahoma,arial,宋体">&nbsp;&nbsp;女</font>
        </c:if>
    </p>
    <p><label for="nickname"><em>*</em>昵称：</label>
        <input type="text" name="nickname"  value="${user1.nickname }" autocomplete="off" size="43" />
    </p>
    <p><label for="userPhone"><em>*</em>电话号码：</label>
    <input type="text" name="userPhone" value="${user1.userPhone }" id="userPhone" autocomplete="off" size="43" />
</p>
    <p>
        <label><p><label for="userPhone"><em>*</em>原始头像头像：</label>

  <img src="http://localhost:8080/img/${user1.userimg}" width="50px" height="50px" alt="">
    <div id="dd" style="width:50px; height:50px;"></div>
    <input id="load" type="file" class="form-control" name="file" onchange="upload(this.files)" />
    </p>
    <p>${msg}</p>

    <input type="button"   value="修改" onclick="check()"/>
    <a href="${pageContext.request.contextPath }/exit">重新登录</a>
</form>
</body>
<script src="../js/jquery.min.js"></script>
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

<script >
    function check(){
    var load= document.getElementById("load").value;
    if(load!=0)
    {
        document.frm.action=('${pageContext.request.contextPath }/changeUserInformation');
       document.frm.submit();
    }
    if(load==0) {

        document.frm.action=('${pageContext.request.contextPath }/changeUserInformation2');
        document.frm.submit();
    }
    }
</script>
</html>
