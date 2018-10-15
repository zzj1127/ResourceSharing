<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018-7-26
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/re-detail.css" />
    <link  rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" type="text/css" href="css/sinaFaceAndEffec.css" />
    <link rel="stylesheet" href="css/github.min.css" />
    <link href="css/jpage.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/styles.css" />
    <link href="img/common/favicon.png" rel="shortcut icon" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <script src="js/vendor/jquery-1.10.0.min.js"></script>

</head>

<body>
<div class="show">
<section items="${resources1}">
      <h1>${resources1.rename}</h1>
    <article class="left-center-right">
        <div class="left1">

        </div>
        <div class="center">
            <div class="wrapper" id="wrapper" items="${resources1}">

    <div class="left">
        <img src="http://ntzj126.cn/reimages/<c:out value='${resources1.reimg}'/>" class="deimg"/>
    </div>
    <div class="right">
        <ul class="deul">
            <li class="deli">
                <div class="lidiv">
                    <p><span>名称：</span><span>${resources1.rename}</span></p>
                </div></li>
            <li class="deli">
                <div class="lidiv" items="${user2}" >
                    <p><span>发布者：</span><span>${user2.username}</span></p>
                </div>
            </li>
            <li class="deli">
                <div class="lidiv">
                    <p><span>电影时间：</span><span>${resources1.retime}</span></p>
                </div>
            </li>
            <li class="deli">
                <div class="lidiv">
                    <p><span>迅雷：</span>
                        <span cols="20" id="biao1">${resources1.thunder}</span>
                        <input type="button" onClick="copyUrl1()" value="复制" />
                    </p>
                </div>
            </li>
            <li class="deli">
                <div class="lidiv">
                    <p><span>百度网盘：</span><span><a href="${resources1.netdisk}">${resources1.netdisk}</a></span>
                        <span>密码：</span><span cols="20" id="biao2">${resources1.netdiskpwd}</span>
                        <input type="button" onClick="copyUrl2()" value="复制" />
                    </p>
                </div>
            </li>
            <li class="deli">
                <div class="lidiv">

                    <p><span>分类：</span>
<c:forEach var="typeList" items="${typeList}">
    <c:if test="${typeList.typeid== resources1.typeid }">
                        <span> ${typeList.typename}  </span>
    </c:if>
</c:forEach>
<c:forEach var="typeOfNames" items="${typeOfNames}">
     <c:if test="${typeOfNames.typeofnameid== resources1.typeofnameid}">
                        <span>  ${typeOfNames.typeofname}  </span></p>
     </c:if>
                    </c:forEach>
                </div>
            <li class="deli">
                <div class="lidiv1">
                    <p><span>介绍：</span><span>${resources1.resynopsis}</span></p>
                </div>
            </li>
        </ul>
    </div>
</div>
            <div id="content" style="width: 55em; height: auto;margin-left:5em;margin-top:40px">
                <div class="wrap">
<c:if test="${!empty user1}">
                    <div class="comment">
                        <div class="head-face">
                            <img src="http://ntzj126.cn/img/<c:out value='${user1.getUserimg()}'/>"/>
                            <p>${user1.username}</p>
                        </div>
                        <div class="content">
                            <form method="post" action="${pageContext.request.contextPath}/addComment?reid=${resources1.reid}">
                            <div class="cont-box">
                                <input type="hidden" value="<c:out value='${user1.userId}'/>" name="userId">

                                <textarea class="text" name="comment" placeholder="请输入..."></textarea>
                            </div>
                            <div class="tools-box">

                                <div class="submit-btn"><input type="submit" value="提交评论" /></div>
                            </div>
                            </form>
                        </div>
                    </div>
</c:if>
<c:if test="${empty user1}">
    <div class="comment"><a href="/login/login.jsp">登录之后可以评论。。。</a></div>
</c:if>

    </div>
<div id="main-content" class="box">
<br />
<div class="center">
<div id="page-content" class="box">
<!-- jPage DEMO -->
<div id="jpage" class="jpage box">

<!-- pagination panel -->
<div class="box jpage-panel" data-type="panel"></div>

<div class="list box text-shadow" data-type="content">

<c:forEach var="commentList" items="${commentList}">
    <!-- item 1 -->
    <div class="list-item box" style="padding-top: 8px;">
    <!-- img -->
    <div class="img ">
    <img src="http://ntzj126.cn/img/<c:out value='${commentList.userimg}'/> " style="height: 60px;"/>
    </div>

    <!-- data -->
    <div class="block ">
    <p class="date"><c:out value='${commentList.commenttime}'/></p>
    <p class="title"><c:out value='${commentList.username}'/></p>
    <p class="desc"><c:out value='${commentList.comment}'/>
    </p>
   
    </div>
    </div>
</c:forEach>
    </div>
    </div>
    <!-- end of jPage DEMO -->
    </div>
    </div>
    </div>

    </div>
            <div></div>
        </div>
        <div class="right1"></div>

    </article>

</section>

</div>
</body>
<script src="js/jquery.min.js"></script>
<script src="js/jpage.min.js"></script>


<script>
    $('document').ready(function(){
        $('#jpage').jpage({
            effect: 'random' //'', 'crossfade', 'bricks', 'slideLeft', 'slideRight', 'random'
        });
    });
</script>
<script language="javascript">
    function copyUrl1()
    {
        var Url2=document.getElementById("biao1").innerText;
        var oInput = document.createElement('input');
        oInput.value = Url2;
        document.body.appendChild(oInput);
        oInput.select(); // 选择对象
        document.execCommand("Copy"); // 执行浏览器复制命令
        oInput.className = 'oInput';
        oInput.style.display='none';
        alert('复制成功');
    }
    function copyUrl2()
    {
        var Url2=document.getElementById("biao2").innerText;
        var oInput = document.createElement('input');
        oInput.value = Url2;
        document.body.appendChild(oInput);
        oInput.select(); // 选择对象
        document.execCommand("Copy"); // 执行浏览器复制命令
        oInput.className = 'oInput';
        oInput.style.display='none';
        alert('复制成功');
    }
</script>
</html>
