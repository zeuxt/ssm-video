<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
    <meta name="description"
          content="Y先生教育在线/course/course视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,Y先生教育,学习成就梦想！">
    <meta name="author" content="尚忠祥">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forget_password.css">
    <link rel="icon" href="favicon.png" type="image/png">
    <title>在线公开课-Y先生教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
        $(function () {

            $("#yzmBtn").click(function () {

                //ajax
                var email = $("input[name='email']");
                if (null != email.val() && email.val() != "") {
                    //alert("====");
                    var params = {"email": email.val()};
                    email.load("${pageContext.request.contextPath}/user/sendEmail", params, function (data) {
                        if (data == "hasNoUser") {
                            alert("邮箱未注册")
                        } else if (data == "success") {
                            alert("邮件发送成功");
                            //倒计时
                            var time = 60;
                            var timer = setInterval(function () {
                                if (time > 0) {
                                    $("#yzmBtn").attr("disabled", "disabled");
                                    $("#yzmBtn").val(time + "s后重新获取");
                                    time--;
                                    // alert(time--);
                                } else {
                                    clearInterval(timer);
                                    $("#yzmBtn").removeAttr("disabled");
                                    $("#yzmBtn").val("获取验证码");
                                }

                            }, 1000);
                        } else {
                            alert("邮件发送失败");
                        }
                    });
                } else {
                    alert("邮箱不能为空");
                }
            });
        });
    </script>
</head>

<body>
<header>
    <div class="container">
        <img src="${pageContext.request.contextPath}/img/logo.png" alt="小禅院">
    </div>
</header>
<main>
    <div class="container">
        <form class="ma" action="${pageContext.request.contextPath}/user/validateEmailCode">
            <div class="form_header">
                <div class="form_title">
                    <h2>忘记密码</h2>
                    <span>通过注册邮箱和手机号重设密码</span>
                </div>
                <div class="form_back">
                    <a href="${pageContext.request.contextPath}/WEB-INF/jsp/before/index.jsp">返回立即登录</a>
                </div>
            </div>
            <div class="form_body">
                <input type="email" placeholder="请输入登录邮箱" name="email" value="${email}">
                <input type="text" placeholder="请输入验证码" name="code"><input type="button" id="yzmBtn" value="获取验证码"/>
                <input type="submit" value="提交">
            </div>
            <div class="form_footer">
                <div class="FAQ">
                    <span>收不到邮件？查看</span><a href="#">常见问题</a>
                </div>
            </div>
        </form>
    </div>
</main>
</body>

</html>