<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/bkxt/assets/css/basic.css"/>
</head>
<body>

<!-- 页面头部分 -->
<%@ include file="../includes/head.jsp" %>
<div id="content">
    <div id="left">
        <h2 class="title">报考</h2>
        <div id="side-nav">
            <ul>
                <li><a href="${webroot}/stu/notice.do">报考须知</a></li>
                <li><a href="${webroot}/stu/entry.do">我的报名信息</a></li>
                <li><a href="${webroot}/stu/grade.do">成绩与录取查询</a></li>
                <li class="on"><a href="${webroot}/stu/pass.jsp">修改密码</a></li>
                <li><a href="${webroot}/stu/logout.do">退出系统</a></li>
            </ul>
        </div>
    </div>

    <div id="right">
        <h2 class="title">站点管理</h2>
        <%@ include file="./includes/topnav.jsp" %>
        <div class="fgx"></div>

        <h3 class="operation">&gt; 修改个人密码 ↓</h3>
        <div class="ft">
            <form method="post" action="${webroot}/stu/pass.do">
                <table>
                    <tr>
                        <td class="label">旧密码：</td>
                        <td colspan="2"><input type="password" name="oldpass" id="oldpass"
                                               value="${ requestScope.oldpass }"/></td>
                        <td class="hint">*</td>
                    </tr>
                    <tr>
                        <td class="label">新密码：</td>
                        <td colspan="2"><input type="password" name="newpass" id="newpass"
                                               value="${ requestScope.newpass }"/></td>
                        <td class="hint"> * 密码为英文字母、下划线或数字组合，长度为6-20位</td>
                    </tr>
                    <tr>
                        <td class="label">确认新密码：</td>
                        <td colspan="2"><input type="password" name="confirmpass" id="confirmpass"
                                               value="${ requestScope.confirmpass }"/></td>
                        <td class="hint"> * 两次输入的新密码要一致</td>
                    </tr>
                    <tr>
                        <td class="label">验证码：</td>
                        <td><input style="width: 65px;" type="text" name="code" id="code"
                                   value="${ requestScope.code }"/></td>
                        <td><img src="${webroot}/includes/code.jsp" id="imagecode" title="点击可更换"
                                 onclick="this.src+='?tm='+ Math.random();"/></td>
                        <td class="hint"> * 看不清？点击验证码图片可更换</td>
                    </tr>
                    <tr>
                        <td class="label"></td>
                        <td colspan="4">
                            <input type="submit" value="确认修改" class="button" id="submit"/>
                            <input type="reset" value="重 置" class="button" id="reset"/>
                        </td>

                    </tr>
                </table>
            </form>
        </div>
    </div>
    <div class="clearf"></div>
</div>

<!-- 页面底部分 -->
<%@ include file="../includes/foot.jsp" %>

</body>
</html>