<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
    <meta name="description"
          content="Y先生教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,Y先生教育,学习成就梦想！">
    <meta name="author" content="老刘">
    <link rel="icon" href="favicon.png" type="image/png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link href="${pageContext.request.contextPath}/css/video-js.css" rel="stylesheet" type="text/css">
    <title>在线公开课-Y先生教育|java|大数据|HTML5|python|UI|PHP视频教程</title>

    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
        $(function () {
            //div 两个哪个显示呢？
            if (null != "${sessionScope.userAccount}" && "${sessionScope.userAccount}" != "") {
                $("#regBlock").css("display", "none");
                $("#userBlock").css("display", "block");
            } else {
                $("#regBlock").css("display", "block");
                $("#userBlock").css("display", "none");
            }

            //通过ajax更新播放次数
            var params = {"id":"${video.id}", "playNum":"${video.playNum}"};
            $.post("${pageContext.request.contextPath}/video/updatePlayNum", params);
        });
    </script>
</head>

<body class="w100">
<header>
    <div class="container">
        <span>欢迎来到小禅院！</span>


        <div id="regBlock" style="display:none;float:right">
            <a href="javascript:;" id="reg_open"><img src="${pageContext.request.contextPath}/img/we.png">注册</a>
            <a href="javascript:;" id="login_open"><img src="${pageContext.request.contextPath}/img/we.png">登录</a>
        </div>

        <div id="userBlock" style="display:none;float:right">

            <a href="javascript:;" id="loginout2">退出</a>
            <a href="${pageContext.request.contextPath}/user/showMyProfile" id="account">${sessionScope.userAccount}</a>
        </div>

        <a onclick="JavaScript:addFavorite2()"><img src="${pageContext.request.contextPath}/img/sc.png"
                                                    draggable="false">加入收藏</a>
        <a onclick="pyRegisterCvt()" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2580094677&site=qq&menu=yes"><img
                src="${pageContext.request.contextPath}/img/we.png" draggable="false">联系我们</a>
        <a class="color_e4"><img src="${pageContext.request.contextPath}/img/phone.png" draggable="false"> 0375-208-9092&#x3000;&#x3000;0375-208-9051</a>

    </div>
</header>
<nav class="w100">
    <div class="container">
        <img src="${pageContext.request.contextPath}/img/logo.png" alt="Y先生教育的logo" onclick="location.href='index.html'"
             draggable="false">
        <ul class="text_13 f_right">
            <li>
                <a href="http://chengjian100.com/" target="_blank">首页</a>
            </li>
            <li class="nav_down">
                高端课程<img src="${pageContext.request.contextPath}/img/nav_down.png" alt="" draggable="false">
                <ul id="nav_down" class="t_center">
                    <c:forEach items="${subjectList}" var="subject">
                        <li>
                            <a target="_blank"
                               href="${pageContext.request.contextPath}/course/course/${subject.id}">${subject.subjectName}</a>
                        </li>
                    </c:forEach>
                </ul>
            </li>
            <li id="gkk" class="nav_choose">
                <a href="#" target="_blank">在线公开课</a>
            </li>
            <li>
                <a href="http://www.chengjian100.com/zhuanjiashizi/index.html" target="_blank">专家师资</a>
            </li>
            <li><a href="http://www.chengjian100.com/zyxw/ " target="_blank">小禅院新闻</a></li>
        </ul>
    </div>
</nav>
<div id="detail"></div>

<div>
    <!--面包屑导航-->
    <div class="container mian-nav">公开课/${subjectName}</div>

    <div class="intro">
        <div class="container">
            <div class="v-intro">
                <div class="left">
                    <video id="videoPlayer" src="${video.videoUrl}" class="video-js vjs-default-skin" controls
                           width="627" height="280"
                           poster="${video.imageUrl}" data-setup="{}">
                    </video>
                </div>

                <div class="right">
                    <p class="right-title">${video.title}</p>
                    <div class="avatar">
                        <span style="background-image: url(${video.speaker.headImgUrl})"></span>
                        <p><b>讲师：${video.speaker.speakerName}</b><br><i>${video.speaker.speakerDesc}</i></p>
                    </div>
                    <p class="video-intro">
                        <span>本节内容：</span> ${video.detail}
                    </p>
                </div>
            </div>

            <div class="kcjs">
                <p class="title">课程介绍</p>
                <p class="content">${course.courseDesc}</p>
            </div>

        </div>
    </div>
    <!--目录-->
    <div class="catalog">
        <div class="container">
            <p class="title">目录</p>

            <c:forEach items="${course.videoList}" var="video">
                <div class="chapter" onclick="load(${video.id})">
                    <p class="biaoti"><a
                            href="showVideo?videoId=${video.id}&subjectName=${subjectName}">${video.title}</a></p>
                    <p class="lecturer">${video.detail}</p>
                    <p class="lecturer">讲师：${video.speaker.speakerName}</p>
                    <div class="v-info">
                        <span class="count"><img src="${pageContext.request.contextPath}/img/count.png"
                                                 alt="">${video.playNum}</span>
                        <span class="duration"><img src="${pageContext.request.contextPath}/img/player.png"
                                                    alt="">${video.time}</span>
                    </div>
                </div>
            </c:forEach>


        </div>
    </div>

</div>

<!--页脚-->
<footer>
    <ul>
        <li>
            <img src="${pageContext.request.contextPath}/img/footer_logo.png" alt="" draggable="false">
        </li>
        <li class="mt25">
            <h3>校区地址</h3>
            <ul>
                <li>地址<br>河南省平顶山市新华区龙翔大道河南小禅院学院</li>
            </ul>
        </li>
        <li class="mt25">
            <h3>联系我们</h3>
            <ul id="foo_icon">
                <li>河南省平顶山市新华区龙翔大道河南小禅院学院</li>
                <li>e-mail:zy@chengjian100.com</li>
                <li>电话:0375-208-9092 0375-208-9051</li>
                <li class="erwei">
                    <br>
                    <div>
                        <img class="weixin" src="${pageContext.request.contextPath}/img/微信公众号.png" alt=""
                             draggable="false">
                        <img class="weibo" src="${pageContext.request.contextPath}/img/微博公众号.png" alt=""
                             draggable="false">
                    </div>
                </li>
            </ul>
        </li>
    </ul>
    <div class="record">Y先生教育 &copy; 豫ICP备13012610号;河南小禅院学院</div>
</footer>

<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/video.js"></script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
<%-- 
    <script src="${pageContext.request.contextPath}/js/vue.js"></script>
    <script src="${pageContext.request.contextPath}/js/axios.js"></script>
    <script src="${pageContext.request.contextPath}/js/vueSection.js"></script> --%>
<script type="text/javascript">
    $("#loginout2").click(function () {
        location.href = "${pageContext.request.contextPath}/user/loginOut2"

        <%--$.get("${pageContext.request.contextPath}/user/loginOut", null, function () {--%>
        <%--    /* $("#regBlock").css("display","block");--%>
        <%--    $("#userBlock").css("display","none"); */--%>
        <%--    location.href = "index.jsp";--%>
        <%--});--%>

    });
</script>
</body>

</html>
