<%--
  Created by IntelliJ IDEA.
  User: yanzhenwei
  Date: 2019/6/28
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>感谢您的浏览！ - Y先生网站</title>
    <style type="text/css">
        body {background: none repeat scroll 0 0 #FFFFFF; margin:0 auto; padding:0; }
        .HSpace_1 {clear: both; font-size: 0; height: 1px; overflow: hidden;}
        /* 导航 */
        #header {width: 100%;}
        #topNav { background-color:#CCCCCC; font-size:14px; font-weight: 700; height:30px; line-height:30px; margin: 0 auto; overflow: hidden;
            text-align:center; width: 100%;}
        .tittop { float: left; height: 30px; margin-left:12%; text-align: center; width:120px;}
        .tittop a:link, .tittop a:visited { color:#990000; font-size: 14px; text-decoration: none;}
        .tittop a:hover {color:#CC0000; text-decoration: underline;}
        #hd_nav { color: #666666; float: left; font-size: 12px; font-weight: normal; height: 30px; line-height: 30px; text-align: left; width: 75%;}
        #hd_nav a:link, #hd_nav a:visited { color: #2b2c2a;  text-decoration: none;}
        #hd_nav a:hover {  color: #CC0000; text-decoration: none;}
        /* end-导航 */
        /* main */
        #main{ margin:100px auto 0; text-align:center; height:400px; width:900px; background-repeat:no-repeat; background-image:url(http://www.xinhuanet.com/404/404bg.jpg); position:relative}
        #main .zjd{ width:450px; margin:0px; text-align:left; position:absolute; left:365px; top:80px;}
        #main .zjd p{ font:bold 20px "宋体"; text-align:left; color:#0072BC; line-height:30px; display:inline;}
        #main .zjd p span{ color:#d73704; padding-right:10px;}
        #main .zjd .tit{ font:normal 14px "宋体"; color:#666666; line-height:28px; text-align:left; margin-top:55px;}
        #main .zjd .tit span{height:24px; list-style:none; font:bold 15px "微软雅黑"; text-align:left; color:#2c2c2c; padding-left:35px}
        #main .zjd .tit span a:link,#main .zjd .tit span a:visited{ text-decoration:none; color:#ffffff;}
        #main .zjd .tit span a:hover{ text-decoration:underline}
        /* end-main */
    </style>
</head>
<body>

<div id="main">
    <div class="zjd">
        <p>对不起，您要访问的页面不存在或已被删除!<br>
            本页面<span id="xy">10</span>秒之后将带您回到Y先生首页。</p>
        <div class="tit">您还可以：<span><a href="${pageContext.request.contextPath}">Y先生视频首页</a></span></div>
    </div>
</div>
<script type="text/javascript">
    var i = 9;
    var intervalid;
    var xy = document.getElementById("xy");
    intervalid = setInterval("fun()", 1000);
    function fun() {
        if (i == 0){
            window.location.href = "${pageContext.request.contextPath}";
            clearInterval(intervalid);
        }
        xy.innerHTML = i;
        i--;
    }

</script>


</body>
</html>
