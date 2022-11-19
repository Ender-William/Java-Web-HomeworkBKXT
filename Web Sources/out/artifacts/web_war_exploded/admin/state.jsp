<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<c:set var="title" value="系统状态" />
<title>${title}</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/basic.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/basic.js"></script>
</head>
<body>

	<%@ include file="../includes/header.jsp"%>
	
	<div id="content">
			
		<div id="left">
			<h1>管理员菜单</h1>
			<%@ include file="../includes/admin/menu.jsp"%>
		</div>

		<div id="right">
			<h1>${title}</h1>
			<%@ include file="../includes/admin/hmenu.jsp"%>

			<div class="operation">当前系统状态信息↓：</div>
			<form id="form_site_modify" action="${webroot}/admin/site/modify" method="post">
  <table class="ft">
    <tr>
      <td class="label"></td>
      <td><span id="mess" class="mess">${requestScope.mess}</span></td> <!-- 这里用于显示提示消息 -->
    </tr>
    <tr>
      <td class="label">公司名称：</td>
      <td><input  class="long" type="text" name="company" value="${site.company}"/></td>
    </tr>
    <tr>
      <td class="label">站点名称：</td>
      <td><input class="long" type="text" name="name"  value="${site.name}"/></td>
    </tr>
    <tr>
      <td class="label">地址：</td>
      <td><input class="long" type="text" name="location" value="${site.location}"/></td>
    </tr>
    <tr>
      <td class="label">邮编：</td>
      <td><input class="long" type="text" name="zipcode" value="${site.zipcode}"/></td>
    </tr>
    <tr>
      <td class="label">联系电话：</td>
      <td><input class="long" type="text" name="contact" value="${site.contact}" /></td>
    </tr>
    <tr>
      <td class="label">版权信息：</td>
      <td><input class="long" type="text" name="copy" value="${site.copy}"/></td>
    </tr>
    <tr>
      <td class="label"> </td>
      <td><button type="submit" class="btn-long">确认更新</button></td>
    </tr>
  </table>
</form>
		</div>
		
		<div class="clearf"></div>
		
	</div>

	<%@ include file="../includes/footer.jsp"%>
	
</body>
</html>