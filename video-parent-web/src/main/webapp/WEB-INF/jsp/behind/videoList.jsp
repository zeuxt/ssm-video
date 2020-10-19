<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="p" uri="http://yanzhenwei.com/common/" %>
<!-- 分页插件 -->
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
    <title>视频列表管理</title>

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
    <script src="${pageContext.request.contextPath}/js/confirm.js"></script>
    <style type="text/css">
        th {
            text-align: center;
        }
    </style>
    <script type="text/javascript">
        function showAddPage() {
            location.href = "${pageContext.request.contextPath}/video/addVideo";
        }

        $(function () {
            $("#btn").click(function () {
                if (deleteNum > 0) {

                    Confirm.show('溫馨提示', '您確定要刪除这' + deleteNum + '条记录嗎？', {
                        'Delete': {
                            'primary': true,
                            'callback': function () {
                                //不是ajax，模拟提交
                                $("#form2").submit();
                                //如果是一个正常表单的提交，按钮必须是type=submit,并且必须在form表单里面
                            }
                        }
                    });

                } else {
                    alert("您暂未选择任何数据，请选择您要删除的数据！");
                }

            });

        });

        function delVideoById(obj, id, name) {

            Confirm.show('溫馨提示', '您確定要刪除' + name + '嗎？', {
                'Delete': {
                    'primary': true,
                    'callback': function () {
                        //此处需要调用ajax
                        var params = {
                            "id": id
                        };
                        $.post("${pageContext.request.contextPath}/video/videoDel", params, function (data) {
                            if (data == 'success') {
                                Confirm.show('处理结果', '恭喜您删除成功');
                                //请用js删除掉那条记录
                                $(obj).parent().parent().remove();
                            } else {
                                Confirm.show('处理结果', '操作失败');
                            }
                        });

                    }
                }
            });

            //阻止事件默认行为   a  href  onclick
            //先执行onclick  后跳转
            return false;
        }

        var deleteNum = 0;

        function selectAll(obj) {
            //dom  jquery
            var value = obj.checked;
            //alert(value);
            var arr = document.getElementsByName("ids");
            for (var i = 0; i < arr.length; i++) {
                arr[i].checked = value;
            }
            if (value) {
                deleteNum = arr.length;
            } else {
                deleteNum = 0;
            }

            $("#delNum").text(deleteNum);

        }

        function selectOne(obj) {
            if (obj.checked) {
                deleteNum += 1;
            } else {
                deleteNum -= 1;
            }

            if (deleteNum == 0) {
                document.getElementById("checkAllId").checked = false;
            }

            var arr = document.getElementsByName("ids");
            if (deleteNum == arr.length) {
                document.getElementById("checkAllId").checked = true;
            }

            $("#delNum").text(deleteNum);
        }

        //解决选择下拉框内容到输入框内容的问题
        function showName(obj, id, type) {
            var name = $(obj).text();

            if (type == 1) {
                $("#speakerName").html(name + "<span class='caret'></span>");
                $("#speakerId").val(id);
            } else {
                $("#courseName").html(name + "<span class='caret'></span>");
                $("#courseId").val(id);
            }

        }
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
        <h2>视频管理</h2>
    </div>
</div>


<div class="container">

    <div class="row">
        <div class="col-md-2">
            <button onclick="showAddPage()" type="button"
                    class="btn btn-info dropdown-toggle" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">添加
            </button>

            <button id="btn" class="btn btn-primary" type="button">
                批量删除 <span class="badge" id="delNum">0</span>
            </button>
        </div>
        <div class="col-md-4"></div>
        <div class="col-md-6">
            <!-- 查询相关组件 -->
            <form class="navbar-form navbar-right" action="${pageContext.request.contextPath}/video/list" method="post">
                <input type="text" name="title" class="form-control" placeholder="标题" value="${queryVo.title}">
                <div class="btn-group">
                    <button type="button" id="speakerName"
                            class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                        <c:forEach items="${speakerList}" var="speaker">
                            <c:if test="${speaker.id == queryVo.speakerId}">
                                ${speaker.speakerName}
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty queryVo.speakerId}">
                            --请选择老师--
                        </c:if>
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li value=''><a href="#" onclick="showName(this,'',1)">--请选择老师--</a>
                        </li>
                        <c:forEach items="${speakerList}" var="speaker">
                            <li value='${speaker.id}'><a href="#"
                                                         onclick="showName(this,'${speaker.id}',1)">${speaker.speakerName}</a>
                            </li>
                        </c:forEach>
                    </ul>
                    <input type="hidden" name="speakerId" id="speakerId" value="${queryVo.speakerId}"/>
                </div>
                <div class="btn-group">
                    <button type="button" id="courseName"
                            class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                        <c:forEach items="${courseList}" var="course">
                            <c:if test="${course.id == queryVo.courseId}">
                                ${course.courseTitle}
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty queryVo.courseId}">
                            --请选择课程--
                        </c:if>
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li value=""><a href="#" onclick="showName(this,'',2)">--请选择课程--</a>
                        </li>
                        <c:forEach items="${courseList}" var="course">
                            <li value="${course.id}"><a href="#"
                                                        onclick="showName(this,${course.id},2)">${course.courseTitle}</a>
                            </li>
                        </c:forEach>
                    </ul>
                    <input type="hidden" name="courseId" id="courseId" value="${queryVo.courseId}"/>
                </div>
                <button type="submit" class="btn btn-info dropdown-toggle">查询</button>
            </form>

        </div>

    </div>
</div>

<div class="container" style="margin-top: 20px;">
    <!--
        http://localhost/video/video/list
        相对路径就是将最后一个/后面的东西替换掉
        http://localhost/video/video/delBatchVideos
    -->
    <form id="form2" action="${pageContext.request.contextPath}/video/delBatchVideos" method="post">
        <table class="table table-bordered table-hover"
               style="text-align: center;table-layout:fixed">
            <thead>
            <tr class="active">
                <th style="width:3%"><input type="checkbox" onclick="selectAll(this)"
                                            id="checkAllId"/></th>
                <th style="width:5%">序号</th>
                <th style="width:15%">名称</th>
                <th style="width:42%;">介绍</th>
                <th>讲师</th>
                <th>时长</th>
                <th style="width:7%">播放次数</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${page.rows}" var="video" varStatus="status">
                <tr>
                    <td><input type="checkbox" name="ids" value="${video.id}"
                               onclick="selectOne(this)"/></td>
                    <td>${status.count}</td>
                    <td>${video.title}</td>
                    <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${video.detail}</td>
                    <td>${video.speaker.speakerName}</td>
                    <td>${video.time}</td>
                    <td>${video.playNum}</td>
                    <td><a href="${pageContext.request.contextPath}/video/edit?id=${video.id}"><span
                            class="glyphicon glyphicon glyphicon-edit" aria-hidden="true"></span></a></td>
                    <!-- js中如果使用el表达式，请用单引号包括，避免造成一些语法问题 -->
                    <td><a
                            onclick="return delVideoById(this,'${video.id}','${video.title}')"><span
                            class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></td>
                </tr>

            </c:forEach>


            </tbody>
        </table>


    </form>
</div>
<div class="container">
    <div class="navbar-right" style="padding-right: 17px">
        <p:page url="${pageContext.request.contextPath}/video/list"></p:page>
    </div>
</div>


</body>
</html>