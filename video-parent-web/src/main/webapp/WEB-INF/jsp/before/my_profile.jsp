<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
    <meta name="description"
          content="Y先生教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,Y先生教育,学习成就梦想！">
    <meta name="author" content="">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
    <link rel="icon" href="${pageContext.request.contextPath}/favicon.png" type="image/png">
    <title>在线公开课-Y先生教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
</head>

<body>
<header>
    <div class="container top_bar clearfix">
        <img src="${pageContext.request.contextPath}/img/logo.png" alt="小禅院">
        <div id="tele">
            <span>0375-208-9092</span>
            <span>0375-208-9051</span>
        </div>
    </div>
    <menu>
        <div class="container clearfix">
            <ul class="clearfix f_left">
                <li><a href="${pageContext.request.contextPath}">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/course/course/1">课程</a></li>
                <li><a href="#">关于我们</a></li>
                <li class="menu_active"><a href="${pageContext.request.contextPath}/user/showMyProfile">个人中心</a></li>
            </ul>
            <div id="search_group">
                <input type="text" placeholder="搜索课程">
                <span id="search"></span>
            </div>
            <div id="user_bar">
                <a href="user/showMyProfile">
                    <c:if test="${empty user.imgUrl}">
                        <img id="avatar" src="${pageContext.request.contextPath}/img/avatar_lg.png" alt="">
                    </c:if>

                    <c:if test="${not empty user.imgUrl}">
                        <img id="avatar" src="http://localhost:8081/video/${user.imgUrl}" alt="">
                    </c:if>

                </a>
                <a href="${pageContext.request.contextPath}/user/loginOut2" id="lay_out">退出</a>
            </div>
        </div>
    </menu>
</header>
<main>
    <div class="container">
        <h2>我的资料</h2>
        <div id="profile_tab">
            <ul class="profile_tab_header f_left clearfix">
                <li><a href="${pageContext.request.contextPath}/user/changeProfile">更改资料</a></li>
                <li class="profile_tab_line">|</li>
                <li><a href="${pageContext.request.contextPath}/user/changeAvatar">更改头像</a></li>
                <li class="profile_tab_line">|</li>
                <li><a href="${pageContext.request.contextPath}/user/passwordSafe">密码安全</a></li>
            </ul>
            <div class="proflle_tab_body">

                <div class="proflle_tab_workplace clearfix">
                    <div class="profile_avatar_area">
                        <c:if test="${empty user.imgUrl}">
                            <img id="avatar" src="${pageContext.request.contextPath}/img/avatar_lg.png" alt="">
                        </c:if>

                        <c:if test="${not empty user.imgUrl}">
                            <img id="avatar" width="180px" heigth="180px" src="http://localhost:8081/video/${user.imgUrl}" alt="">
                        </c:if>
                        <p>
                            <c:if test="${not empty user.nickName}">
                                <span>${user.nickName}</span>
                            </c:if>
                            <c:if test="${empty user.nickName}">
                                <span>${user.email}</span>
                            </c:if>
                            欢迎回来！</p>
                    </div>
                    <ul class="profile_ifo_area">
                        <li><span class="dd">昵&#x3000;称：</span>${user.nickName}</li>
                        <li><span class="dd">性&#x3000;别：</span>
                            <c:if test="${user.sex=='woman'}">
                                女
                            </c:if>
                            <c:if test="${user.sex=='man'}">
                                男
                            </c:if>
                        </li>
                        <li><span class="dd">生&#x3000;日：</span>
                            <time data="1990-06-06">${user.birthday}</time>
                        </li>
                        <li><span class="dd">邮&#x3000;箱：</span>${user.email}</li>
                        <li><span class="dd">所在地：</span>${user.address}</li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
</main>
<footer>
    <div class="container">
        <ul>
            <li><img src="${pageContext.request.contextPath}/img/footer_logo.png" alt="" id="foot_logo"></li>
            <li>版权所有：Y先生教育&#x3000;&#x3000;&#x3000;&copy;&nbsp;www.chengjian100.com</li>
            <li><img src="${pageContext.request.contextPath}/img/微信公众号.png" alt="" id="wxgzh"></li>
        </ul>
    </div>
</footer>
</body>
</html>