<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2018/8/1
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>

    <style type="text/css">

        .item_content ul{list-style:none;background: blue;}
        .item_content ul li{width:22%;height:275px;float:left;margin:10px; }
        .item_content{width:100%;height:100%;border:1px solid #ccc;float:left;}
        .item_content .item{width:200px;height:260px;line-height:260px;text-align:center;cursor:pointer;}
        .item_content .item img{width:200px;height:260px;border-radius:6px;border:10px solid #ccc;}
        .item{
            box-shadow: 0px 0px 10px whitesmoke;
            border-radius: 5px;
            position: relative;
        }


        body {
            margin: 0;
        }

        .ulbar {
            list-style-type: none;
            margin: 0;
            padding: 0;
            width: 25%;
            background-color: #f1f1f1;
            position: fixed;
            height: 100%;
            overflow: auto;
        }

        .libar a {
            display: block;
            color: #000;
            padding: 8px 16px;
            text-decoration: none;
        }

        .libar a.active {
            background-color: #4CAF50;
            color: white;
        }

        .libar a:hover:not(.active) {
            background-color: #555;
            color: white;
        }
        .tab{
            border: 1px red; width: 100%;height: 20px;background-color: #22b4c3;text-align: center;
        }
        img{
            position: absolute;
            width:200px;height:260px;


        }
        .screen{
            position: absolute;
            width:200px;height:260px;
            background-color:brown;
            opacity: 0.0;

        }
        .enter{
            text-align: center;
            width: 130px;
            height: 40px;
            position: absolute;
            top: 0px; left: 0px;
            right: 0px; bottom: 0px;
            margin: auto;
            line-height: 40px;
            opacity: 0.0;
            transform: all 3s;
            background-color: yellow;
            border-radius: 20px;
        }
        .item:hover .screen{
            opacity: 0.6;
            cursor: pointer;
        }
        .item:hover .enter{
            opacity: 1.0;
        }
    </style>
</head>
<body>
<ul class="ulbar">
    <li class="libar"><a class="active" href="index.jsp" target="">返回主页</a></li>
    <c:forEach var="typeOfNames" items="${typeOfNames}">
          <li class="libar"><a  href="#${typeOfNames.typeofnameid}" >${typeOfNames.typeofname}</a></li>
    </c:forEach>

</ul>

    <c:set value="0" var="flag3"></c:set>
<c:forEach var="typeOfNames" items="${typeOfNames}">
<div class="item_container" id="item_container" style="margin-left:25%;padding:0 16px;height:1000px;">
    <div class="item_content" id="${typeOfNames.typeofnameid}">
        <div class="tab">${typeOfNames.typeofname}</div>
        <ul >

    <c:forEach var="resources" items="${resources}">
        <c:if test="${resources.typeofnameid== typeOfNames.typeofnameid and flag3<11 }">
            <c:set var="flag3" value="${flag3+1}"/>
            <li>
                <div class="item" >
                    <img src="http://ntzj126.cn/reimages/<c:out value='${resources.reimg}'/> " width="200" height="240" >
                    <div class="screen" >
                        <div class="enter" onclick="location.href='${pageContext.request.contextPath }/findAllResources?reid=${resources.reid}'"><c:out value='${resources.rename}'/></div>
                    </div>
                </div>
            </li>
        </c:if>
    </c:forEach>
            <li>
                <div class="item" >
                    <img src="../images/timg.jpg" width="200" height="240" >
                    <div class="screen" >
                        <div class="enter" onclick="location.href='${pageContext.request.contextPath }/selectTonById?typeofnameid=${typeOfNames.typeofnameid}'">查看更多</div>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>
</c:forEach>


</div>
<script src="js/jquery-1.8.3.min.js"></script>
<script>
    $(function() {
        function Pointer(x, y) {
            this.x = x ;
            this.y = y ;
        }
        function Position(left, top) {
            this.left = left ;
            this.top = top ;
        }
        $(".item_container .item").each(function(i) {
            //$(".item_content .item").each(function(i) {
            this.init = function() { // 初始化
                this.box = $(this).parent() ;
                $(this).attr("index", i).css({
                    position : "absolute",
                    left : this.box.offset().left,
                    top : this.box.offset().top
                }).appendTo(".item_container") ;
                this.drag() ;
            },
                this.move = function(callback) {  // 移动
                    $(this).stop(true).animate({
                        left : this.box.offset().left,
                        top : this.box.offset().top
                    }, 500, function() {
                        if(callback) {
                            callback.call(this) ;
                        }
                    }) ;
                },
                this.collisionCheck = function() {
                    var currentItem = this ;
                    var direction = null ;
                    $(this).siblings(".item").each(function() {
                        if(
                            currentItem.pointer.x > this.box.offset().left &&
                            currentItem.pointer.y > this.box.offset().top &&
                            (currentItem.pointer.x < this.box.offset().left + this.box.width()) &&
                            (currentItem.pointer.y < this.box.offset().top + this.box.height())
                        ) {
                            // 返回对象和方向
                            if(currentItem.box.offset().top < this.box.offset().top) {
                                direction = "down" ;
                            } else if(currentItem.box.offset().top > this.box.offset().top) {
                                direction = "up" ;
                            } else {
                                direction = "normal" ;
                            }
                            this.swap(currentItem, direction) ;
                        }
                    }) ;
                },
                this.swap = function(currentItem, direction) { // 交换位置
                    if(this.moveing) return false ;
                    var directions = {
                        normal : function() {
                            var saveBox = this.box ;
                            this.box = currentItem.box ;
                            currentItem.box = saveBox ;
                            this.move() ;
                            $(this).attr("index", this.box.index()) ;
                            $(currentItem).attr("index", currentItem.box.index()) ;
                        },
                        down : function() {
                            // 移到上方
                            var box = this.box ;
                            var node = this ;
                            var startIndex = currentItem.box.index() ;
                            var endIndex = node.box.index(); ;
                            for(var i = endIndex; i > startIndex ; i--) {
                                var prevNode = $(".item_container .item[index="+ (i - 1) +"]")[0] ;
                                node.box = prevNode.box ;
                                $(node).attr("index", node.box.index()) ;
                                node.move() ;
                                node = prevNode ;
                            }
                            currentItem.box = box ;
                            $(currentItem).attr("index", box.index()) ;
                        },
                        up : function() {
                            // 移到上方
                            var box = this.box ;
                            var node = this ;
                            var startIndex = node.box.index() ;
                            var endIndex = currentItem.box.index(); ;
                            for(var i = startIndex; i < endIndex; i++) {
                                var nextNode = $(".item_container .item[index="+ (i + 1) +"]")[0] ;
                                node.box = nextNode.box ;
                                $(node).attr("index", node.box.index()) ;
                                node.move() ;
                                node = nextNode ;
                            }
                            currentItem.box = box ;
                            $(currentItem).attr("index", box.index()) ;
                        }
                    }
                    directions[direction].call(this) ;
                },
                this.drag = function() { // 拖拽
                    var oldPosition = new Position() ;
                    var oldPointer = new Pointer() ;
                    var isDrag = false ;
                    var currentItem = null ;
                    $(this).mousedown(function(e) {
                        e.preventDefault() ;
                        oldPosition.left = $(this).position().left ;
                        oldPosition.top =  $(this).position().top ;
                        oldPointer.x = e.clientX ;
                        oldPointer.y = e.clientY ;
                        isDrag = true ;

                        currentItem = this ;

                    }) ;
                    $(document).mousemove(function(e) {
                        var currentPointer = new Pointer(e.clientX, e.clientY) ;
                        if(!isDrag) return false ;
                        $(currentItem).css({
                            "opacity" : "0.8",
                            "z-index" : 999
                        }) ;
                        var left = currentPointer.x - oldPointer.x + oldPosition.left ;
                        var top = currentPointer.y - oldPointer.y + oldPosition.top ;
                        $(currentItem).css({
                            left : left,
                            top : top
                        }) ;
                        currentItem.pointer = currentPointer ;
                        // 开始交换位置

                        currentItem.collisionCheck() ;


                    }) ;
                    $(document).mouseup(function() {
                        if(!isDrag) return false ;
                        isDrag = false ;
                        currentItem.move(function() {
                            $(this).css({
                                "opacity" : "1",
                                "z-index" : 0
                            }) ;
                        }) ;
                    }) ;
                }
            this.init() ;
        }) ;
    }) ;
</script>


</body>
</html>
