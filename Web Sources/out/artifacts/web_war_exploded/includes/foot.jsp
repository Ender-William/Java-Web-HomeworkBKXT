<%--
  Created by IntelliJ IDEA.
  User: william
  Date: 2022/11/16
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>

<div id="foot">
    <p>
        ${applicationScope.site.copy}
        <span> | </span>
        邮编：${site.zipcode}
        <span> | </span>
        地址：${site.location}
    </p>
</div>