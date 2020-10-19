function getRootPath() {
    var pathname = window.location.pathname.substring(1);
    var end = pathname.indexOf('/');
    pathname = pathname.substring(0, end);
    return pathname;
}

// 导航栏
$('nav').children('div').children('ul').children('li').mouseenter(function () {
    $('nav').children('div').children('ul').children('li').removeClass('nav_choose');
    $(this).addClass('nav_choose');
});
$('nav').mouseleave(function () {
    $('nav').children('div').children('ul').children('li').removeClass('nav_choose');
    $('#gkk').addClass('nav_choose');
});

// 导航栏下拉菜单
$('nav .nav_down').mouseenter(function () {
    $('#nav_down').stop().slideDown();
    $(this).children('img').attr('src', '/' + getRootPath() + '/img/nav_down2.png');
});
$('nav .nav_down').mouseleave(function () {
    $('#nav_down').stop().slideUp();
    $(this).children('img').attr('src', '/' + getRootPath() + '/img/nav_down.png');
});

$(window).scroll(function () {
    if ($(this).scrollTop() > 300) {
        $('#top').fadeIn();
        $('body').css('paddingTop', '90px');
        $('nav').css({
            'position': 'fixed',
            'top': '0',
            'left': '0',
            'border-bottom': '1px solid #e6e6e6'
        });
    } else {
        $('body').css('paddingTop', '0');
        $('nav').css({
            'position': 'initial',
            'top': '0',
            'left': '0',
            'border-bottom': 'none'
        });
    }
});
// 登录注册显示和消失弹出框
$('#reg_open').click(function () {
    $('#reg').removeClass('hidden');
});
$('#login_open').click(function () {
    $('#login').removeClass('hidden');
});
$('#reg_close').click(function () {
    $('#reg').addClass('hidden');
});
$('#login_close').click(function () {
    $('#login').addClass('hidden');
});


// 报名
$("#iform .button").click(function (ev) {
    ev.preventDefault();

    var input1 = $('.form-control:eq(0)').val();
    var input2 = $('.form-control:eq(1)').val();
    var input3 = $('.form-control:eq(2)').val();
    var reg2 = /^1[3578]\d{9}$/;
    var reg3 = /^[1-9]\d{4,10}$/;

    if (input1 == "") {
        alert("姓名不能为空");
    } else if (!reg2.test(input2)) {
        alert("手机格式不符！！请重新填写！");
    } else if (!reg3.test(input3)) {
        alert("QQ格式不符！！请重新填写！");
    } else {
        $("#iform").submit();
    }

});


// 获取url路径中的参数
function GetUrlParam(paraName) {
    var url = document.location.toString();
    var arrObj = url.split("?");

    if (arrObj.length > 1) {
        var arrPara = arrObj[1].split("&");
        var arr;
        for (var i = 0; i < arrPara.length; i++) {
            arr = arrPara[i].split("=");

            if (arr != null && arr[0] == paraName) {
                return arr[1];
            }
        }
        return "";
    } else {
        return "";
    }
}


//==========================Java02班升级JS===============================

$("#regEmail").blur(function () {

    //不为空再校验
    var emailVal = $("#regEmail").val();
    // alert(emailVal);
    // js 判断不相等  不能使用   !""==xxxx
    if (null != emailVal && "" != emailVal) {
        var params = {"email": emailVal};
        // alert(params);
        $.post('/' + getRootPath() + "/user/validateEmail", params, function (data) {
            if (data == "success") {
                regIsCommitEmail = true;
                $("#emailMsg").text("该邮箱可用").css("color", "green");
            } else {
                regIsCommitEmail = false;
                $("#emailMsg").text("该邮箱已注册，请直接登录").css("color", "red");
            }
        });
    }

});

$("#regPswAgain").blur(function () {
    var pass01 = $("#regPsw").val();
    var pass02 = $("#regPswAgain").val();
    if (null == pass01 || "" == pass01 || null == pass02 || "" == pass02) {
        $("#passMsg").text("密码不能为空").css("color", "red");
        regIsCommitPsw = false;
    } else {
        if (pass01 != pass02) {
            regIsCommitPsw = false;
            $("#passMsg").text("两次密码输入不一致，请重新输入").css("color", "red");
        } else {
            regIsCommitPsw = true;
            $("#passMsg").text("");
        }
    }

});

$("#loginout").click(function () {

    $.get('/' + getRootPath() + "/user/loginOut", null, function () {
        $("#regBlock").css("display", "block");
        $("#userBlock").css("display", "none");
    });

});

var regIsCommitEmail = false;
var regIsCommitPsw = false;
var verifyCode;

function commitRegForm() {

    var code = $("input[name='yzm']").val();
    // alert(code);
    // alert(regIsCommitEmail+","+regIsCommitPsw);
    if (regIsCommitEmail && regIsCommitPsw && verifyCode.validate(code)) {
        //用js提交表单
        // $("#regForm").commit();

        $.ajax({

            url: '/' + getRootPath() + "/user/insertUser",
            data: $("#regForm").serialize(),
            type: "POST",
            success: function (data) {
                if (data == 'success') {
                    //注册框消失
                    $("#reg").addClass("hidden");

                    $("#account").text($("#regEmail").val());
                    //将注册的user信息展示
                    $("#regBlock").css("display", "none");
                    $("#userBlock").css("display", "block");

                }
            },
            error: function () {
                alert("联系管理员");
            }

        });

        return false;

    } else {
        return false;
    }

}

verifyCode = new GVerify("v_container");

function commitLogin() {
    // alert("login");
    var email = $("#loginEmail").val();
    var password = $("#loginPassword").val();
    if (null != email && email != "" && null != password && password != "") {
        var params = $("#loginForm").serialize();
        // alert(params);
        // post要小写
        $.post('/' + getRootPath() + "/user/loginUser", params, function (data) {
            // alert(data);
            if (data == 'success') {

                //登录框消失
                $("#login").addClass("hidden");

                $("#account").text($("#loginEmail").val());
                //将注册的user信息展示
                $("#regBlock").css("display", "none");
                $("#userBlock").css("display", "block");

                $("#isLogin").val(1);
            }
        });

        return false;
    }

    return false;
}

