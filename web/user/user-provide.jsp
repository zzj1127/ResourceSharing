<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2018/8/1
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html >
<head>
    <meta charset="UTF-8">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title></title>
    <link href="../css/form.css" type="text/css" rel="stylesheet"/>
    <style>
        *{padding:0;margin:0}
        html{overflow:hidden}
        canvas{
            position: absolute;
            z-index: -1;
        }
        .fcsub{
            z-index: 0;
        }
    </style>
</head>
<body>
<canvas id="canvas" style="background:#111"></canvas>
<div class="fcsub">
    <div class="fcform">
        <form name="frm" method="post"  enctype="multipart/form-data">

            <div class="sub">
                <span><input type="text" id="rename" name="rename" placeholder="资源名字"></span>
            </div>
            <div class="sub">
                <span><input type="text" id="thunder" name="thunder" placeholder="迅雷链接"></span>
            </div>
            <div class="sub" style="float: left;">
                <span><input type="text" id="netdisk" name="netdisk" placeholder="百度网盘" style="display: block;width:300px;float: left;"></span>
                <span><input type="text" id="netdiskpwd" name="netdiskpwd" placeholder="密码" style="display: block;width:200px;margin-left:20px;float: left;" ></span>
            </div>
            <div class="sub">
                <span><input type="text" id="retime" name="retime" placeholder="资源日期"></span>
            </div>
            <input type="hidden" id="userid" name="userid" value="${user1.userId}"/>

            <div class="sub">
                <div class="budget">
                    <select name="typeid" id="typeid"  onchange="changeselect1(this.value);" class=" form-control select-duiqi">
                        <option value="">―请选择―</option>
                        <c:forEach var="typeList" items="${typeList}">
                            <option value="${typeList.typeid}"> ${typeList.typename}</option>
                        </c:forEach>
                    </select>
                    &nbsp;
                    <select name="typeofnameid" id="typeofnameid"  style="width: 200px;" >

                    </select>
                </div>
            </div>

            <div class="sub">
                <span><input type="text" id="resynopsis" name="resynopsis" placeholder="资源介绍"></span>
            </div>
            <div class="sub">
                <span><input type="file" id="reimg" name="file" /></span>
            </div>
            <div class="sub">
                <input type="button" value="添加资源" style="width: 80px; cursor: hand;" onclick="btnAdd('${pageContext.request.contextPath}/toAddResourceOfUser')">
                <input type="button" value="取消" style="width: 80px; cursor: hand;"  onclick="window.open('index.jsp')">
            </div>
        </form>
    </div>

</div>
<script type="text/javascript">

    window.onload = function(){
        //获取画布对象
        var canvas = document.getElementById("canvas");
        //获取画布的上下文
        var context =canvas.getContext("2d");
        //获取浏览器屏幕的宽度和高度
        var W = window.innerWidth;
        var H = window.innerHeight;
        //设置canvas的宽度和高度
        canvas.width = W;
        canvas.height = H;
        //每个文字的字体大小
        var fontSize = 16;
        //计算列
        var colunms = Math.floor(W /fontSize);
        //记录每列文字的y轴坐标
        var drops = [];
        //给每一个文字初始化一个起始点的位置
        for(var i=0;i<colunms;i++){
            drops.push(0);
        }

        //运动的文字
        var str ="javascript html5 canvas";
        //4:fillText(str,x,y);原理就是去更改y的坐标位置
        //绘画的函数
        function draw(){
            context.fillStyle = "rgba(0,0,0,0.05)";
            context.fillRect(0,0,W,H);
            //给字体设置样式
            context.font = "700 "+fontSize+"px  微软雅黑";
            //给字体添加颜色
            context.fillStyle ="#00cc33";//可以rgb,hsl, 标准色，十六进制颜色
            //写入画布中
            for(var i=0;i<colunms;i++){
                var index = Math.floor(Math.random() * str.length);
                var x = i*fontSize;
                var y = drops[i] *fontSize;
                context.fillText(str[index],x,y);
                //如果要改变时间，肯定就是改变每次他的起点
                if(y >= canvas.height && Math.random() > 0.99){
                    drops[i] = 0;
                }
                drops[i]++;
            }
        };

        function randColor(){
            var r = Math.floor(Math.random() * 256);
            var g = Math.floor(Math.random() * 256);
            var b = Math.floor(Math.random() * 256);
            return "rgb("+r+","+g+","+b+")";
        }

        draw();
        setInterval(draw,30);
    };

</script>
<script>
    var subcat = new Array();
    <c:set value="0" var="i" />
    <c:forEach var="typeOfNames" items="${typeOfNames}">
    subcat[${i}]=new Array("${typeOfNames.typeid}","${typeOfNames.typeofname}","${typeOfNames.typeofnameid}")
    <c:set value="${i+1}" var="i" />
    </c:forEach>
    function changeselect1(locationid)
    {
        console.log(document.all.typeofnameid.length)
        document.all.typeofnameid.length = 0; //初始化下拉列表 清空下拉数据

        for (i=0; i<subcat.length; i++)
        {

            if (subcat[i][0] == locationid) //[0] [1] 第一列 第二列
            {

                document.all.typeofnameid.options[document.all.typeofnameid.length] = new Option(subcat[i][1], subcat[i][2]);
                // document.all.typeofnameid.options[document.all.typeofnameid.valueOf()] = new Option(subcat[i][0], subcat[i][2]);

            } //建立option
        }
    }

</script>
<script>
function btnAdd(url) {

    var rename=document.getElementById("rename").value;
    var thunder=document.getElementById("thunder").value;
    var userid=document.getElementById("userid").value;
    var netdisk=document.getElementById("netdisk").value;
    var typeid=document.getElementById("typeid").value;
    var typeofnameid=document.getElementById("typeofnameid").value;
    var retime=document.getElementById("retime").value;
    var resynopsis=document.getElementById("resynopsis").value;
    var reimg=document.getElementById("reimg").value;
    console.log("rename:"+rename);
    console.log("thunder:"+thunder);
    console.log("userid:"+userid);
    console.log("netdisk:"+netdisk);
    console.log("typeid:"+typeid);
    console.log( "typeofnameid:"+typeofnameid);
    console.log("retime:"+retime);
    console.log("resynopsis:"+resynopsis);
    console.log("reimg:"+reimg);
    console.log("end");
if (userid.length==0){
    alert("请先登录")
    return
}
    if (rename.length==0)
    {
        alert("请输入电影名称")
        document.getElementsByName("name").focus();
        return;
    }
    if ((thunder.length==0)&&(netdisk.length==0))
    {
        alert("请提供给我们资源链接")
        document.getElementsByName("thunder").focus();
        return;
    }
    if((typeid.length==0)&&(typeofnameid.length==0))
    {
        alert("请提供给我们分类，以便更好的查找")
        document.getElementsByName("typeid").focus();
        return;
    }
    if((retime.length==0)&&(resynopsis.length==0)){
        alert("请给出详细信息")
        document.getElementsByName("retime").focus();
        return;
    }
    if(reimg.length===0){
        alert("请提供图片")
        document.getElementsByName("reimg").focus();
        return;
    }

    else{
        document.frm.action=url;
        document.frm.submit();
    }
}
</script>
</body>
</html>
