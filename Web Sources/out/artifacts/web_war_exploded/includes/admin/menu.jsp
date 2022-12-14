<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="webroot" value="${pageContext.request.contextPath}"/>
<c:choose>
    <%-- 系统管理员菜单 --%>
    <c:when test="${ '系统管理员' eq sessionScope.adminuser.usergroup }">
        <div id="menu">
            <a href="${webroot}/admin/state.jsp">系统状态</a>
            <a href="${webroot}/sadmin/stageadd.do">阶段定义</a>
            <a href="${webroot}/sadmin/manage.do">管理员维护</a>
            <a href="${webroot}/sadmin/db.jsp">数据库管理</a>
            <a href="${webroot}/admin/reginfomanage.do">查看报名信息</a>
            <a href="${webroot}/admin/record.do">我的登录历史</a>
            <a href="${webroot}/admin/pass.jsp">修改密码</a>
            <a href="${webroot}/admin/logout.do">退出系统</a>
        </div>
    </c:when>
    <%-- 招生管理员菜单 --%>
    <c:when test="${ '招生管理员' eq sessionScope.adminuser.usergroup }">
        <div id="menu">
            <a href="${webroot}/admin/state.jsp">系统状态</a>
            <a href="${webroot}/zadmin/stageset.do">阶段设置</a>
            <a href="${webroot}/zadmin/release.do">招考信息设置</a>
            <a href="${webroot}/admin/reginfomanage.do">查看报名信息</a>
            <a href="${webroot}/zadmin/confirm.do">现场确认</a>
            <a href="${webroot}/zadmin/stumanage.jsp">学生密码清零</a>
            <a href="${webroot}/admin/record.do">我的登录历史</a>
            <a href="${webroot}/admin/pass.jsp">修改密码</a>
            <a href="${webroot}/admin/logout.do">退出系统</a>
        </div>
    </c:when>
    <%-- 教务管理员菜单 --%>
    <c:when test="${ '教务管理员' eq sessionScope.adminuser.usergroup }">
        <div id="menu">
            <a href="${webroot}/admin/state.jsp">系统状态</a>
            <a href="${webroot}/admin/reginfomanage.do">查看报名信息</a>
            <a href="${webroot}/jadmin/cardnum.do">准考证号分配</a>
            <a href="${webroot}/jadmin/room.do">考场分配</a>
            <a href="${webroot}/jadmin/gradeinput.do">录入成绩</a>
            <a href="${webroot}/admin/record.do">我的登录历史</a>
            <a href="${webroot}/admin/pass.jsp">修改密码</a>
            <a href="${webroot}/admin/logout.do">退出系统</a>
        </div>
    </c:when>
    <%-- 非管理员用户 --%>
    <c:otherwise>
        <c:redirect url="${webroot}/admin/logout.do"></c:redirect>
    </c:otherwise>
</c:choose>