<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">

    <!--表示使用IE最新的渲染模式进行解析-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--
    	兼容一些移动设备，会根据屏幕的大小缩放
    	width=device-width  表示宽度是设备的宽度（很多手机的宽度都是980px）
    	initial-scale=1  初始化缩放级别   1-5
    	minimum-scale=1  maximum-scale=5
    	user-scalable=no  禁止缩放
    -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>添加或修改视频</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

    <!-- 如果IE版本小于9，加载以下js,解决低版本兼容问题 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


    <!--
    	引入网络的jquery  ,如果想换成自己的，导入即可
    	网站优化：建议将你网站的css\js等代码，放置在互联网公共平台上维护，比如：七牛
    -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>

    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style type="text/css">
        th {
            text-align: center;
        }
    </style>
    <script type="text/javascript">

        function showName(obj, id, type) {

            if (type == 1) {
                //想获取下拉列表选中的值
                var chooseName = $(obj).text();
                // 将获取的值显示在输入框内
                $("#speakerName").val(chooseName);
                //想给隐藏的文本赋值
                $("#speakerId").val(id);
            } else {
                var chooseName = $(obj).text();
                // 将获取的值显示在输入框内
                $("#courseName").val(chooseName);
                //想给隐藏的文本赋值
                $("#courseId").val(id);
            }

        }


        //页面加载完毕之后就执行以下代码片段
        $(function () {
            var speakerId = '${video.speakerId}';
            $("#selectSpeaker li").each(function () {

                if ($(this).val() == speakerId) {
                    $("#speakerName").val($(this).text());
                }
            });

            var courseId = '${video.courseId}';
            $("#selectCourse li").each(function () {

                if ($(this).val() == courseId) {
                    $("#courseName").val($(this).text());
                }
            });


        });

    </script>

</head>
<body>


<nav class="navbar-inverse">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">

            <a class="navbar-brand" href="${pageContext.request.contextPath}/video/list">视频管理系统</a>
        </div>

        <div class="collapse navbar-collapse"
             id="bs-example-navbar-collapse-9">
            <ul class="nav navbar-nav">
                <li class="active"><a href="${pageContext.request.contextPath}/video/list">视频管理</a></li>
                <li><a href="${pageContext.request.contextPath}/speaker/showSpeakerList">主讲人管理</a></li>
                <li><a href="${pageContext.request.contextPath}/showCourseList">课程管理</a></li>


            </ul>
            <p class="navbar-text navbar-right">
                <span>${sessionScope.userName}</span> <i class="glyphicon glyphicon-log-in"
                                                         aria-hidden="true"></i>&nbsp;&nbsp;<a
                    href="${pageContext.request.contextPath}/admin/exit"
                    class="navbar-link">退出</a>
            </p>
        </div>
        <!-- /.navbar-collapse -->


    </div>
    <!-- /.container-fluid -->
</nav>

<div class="jumbotron" style="padding-top: 15px;padding-bottom: 15px;">
    <div class="container">

        <%-- <c:if test="empty ${video.id}"> --%>
        <c:if test="${empty speaker.id}">
            <h2>添加主讲人信息</h2>
        </c:if>

        <c:if test="${not empty speaker.id}">
            <h2>修改主讲人信息</h2>
        </c:if>

    </div>
</div>


<div class="container" style="margin-top: 20px;">

    <form class="form-horizontal" action="${pageContext.request.contextPath}/speaker/saveOrUpdate" method="post">


        <c:if test="${not empty speaker.id}">
            <input type="hidden" name="id" value="${speaker.id}">
        </c:if>

        <div class="form-group">
            <label class="col-sm-2 control-label">名称</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="speakerName" value="${speaker.speakerName}" placeholder="主讲人名称">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">职位</label>
            <div class="col-sm-10">
                <input type="text" name="speakerJob" class="form-control" value="${speaker.speakerJob}" placeholder="主讲人职位">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">简介</label>
            <div class="col-sm-10">
                <textarea class="form-control" name="speakerDesc" rows="3">${speaker.speakerDesc}</textarea>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">保存</button>
            </div>
        </div>
    </form>

</div>


</body>
</html>
</body>
</html>
