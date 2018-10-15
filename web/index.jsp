<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018-7-18
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
  <head>
    <title>$Title$</title>

  </head>

  <body>

 <script>
   if(document.cookie.indexOf("a=hello")==-1){
          window.location.href = "index/index.jsp";
          var t=new Date(new Date().getTime()+1000*60*60*24*30);
          document.cookie="a=hello; expires="+t.toGMTString();
      }else{
          if(/Android|webOS|iPhone|iPod|iPad|BlackBerry/i.test(navigator.userAgent)) {
              window.location.href = "/typeListPh";
          } else {
              window.location.href = "/typeList";
          }
      }

  </script>
  <%--<c:import url="/resourceList" charEncoding="UTF-8"/><br/>--%>
  </body>

</html>
