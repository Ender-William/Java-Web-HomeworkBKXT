<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Document</title>

    <link rel="stylesheet" href="${webroot}/assets/css/basic.css"/>


</head>
<body>

<!-- 页面头部分 -->
<%@ include file="../includes/head.jsp" %>


<div id="content">
    <div id="left">
        <h2 class="title">考生登录</h2>
        <div id="side-nav">
            <ul>
                <li><a href="${pageContext.request.contextPath}/admin/manage.jsp">管理员登录</a></li>
                <li class="on"><a href="${pageContext.request.contextPath}/stu/manage.jsp">考生登录</a></li>
            </ul>
        </div>
    </div>


    <div id="right">
        <h2 class="title">考生登录</h2>
        <h3 class="operation">&gt; 考生登录 ↓</h3>


        <!-- 管理员登录页面的详细设计部分 -->
        <form id="form_adminuser_login" action="${pageContext.request.contextPath}/adminuser/login" method="post">
            <table class="ft">

                <tr>
                    <td class="label"></td>
                    <td><span id="mess" class="mess">${requestScope.mess}</span></td> <!-- 这里用于显示提示消息 -->
                </tr>
                <tr>
                    <td class="label">用户名：</td>
                    <td><input class="long" type="text" name="username"/></td>
                </tr>
                <tr>
                    <td class="label">密码：</td>
                    <td><input class="long" type="password" name="password"/></td>
                </tr>
                <tr>
                    <td class="label">验证码：</td>
                    <td>
                        <span><input style="vertical-align:middle;" type="text" name="code"/></span>
                        <span><img style="vertical-align:middle;cursor:pointer;"
                                   src="${pageContext.request.contextPath}/includes/code.jsp" id="imagecode"
                                   title="点击可更换" onclick="this.src='${webroot}/includes/code.jsp?tm='+ Math.random();"/></span>
                    </td>
                </tr>

                <tr>
                    <td class="label"></td>
                    <td>
                        <button type="submit" class="btn-long">登录</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

<script>

    // 使用js进行用户输入的前端校验
    let fm = document.forms[0]; // 获取表单
    let mess = document.getElementById("mess");

    fm.onsubmit = function () { // 表单提交事件程序
        if (!/^\w{5,20}$/.test(fm.username.value)) {
            mess.innerHTML = "* 用户名错误！";
            fm.username.value = ""; // 清空
            fm.username.focus(); // 将焦点移动到表单字段
            return false;
        }
        if (!/^\w{6,20}$/.test(fm.password.value)) {
            mess.innerHTML = "* 密码错误！";
            fm.password.value = '';// 清空
            fm.password.focus();// 将焦点移动到表单字段
            return false;
        }
        if (!/^\d{4}$/.test(fm.code.value)) {
            mess.innerHTML = "* 验证码错误！";
            fm.code.value = '';// 清空
            fm.code.focus();// 将焦点移动到表单字段
            return false;
        }
    }

</script>


<!-- 页面底部分 -->
<%@ include file="../includes/foot.jsp" %>

</body>
</html>