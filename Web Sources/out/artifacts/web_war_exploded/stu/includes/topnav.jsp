<%@ page language="java" pageEncoding="UTF-8" %>

<div id="top-nav">
    <span>欢迎您：${sessionScope.adminuser.nickname}</span> |
    <a href="${webroot}/admin/password.jsp">修改密码</a> |
    <a href="${webroot}/admin/logout">退出系统</a>
</div>
<div class="fgx"></div>