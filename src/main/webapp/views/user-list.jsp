<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setBundle basename="messages"/>

<%@ include file="../partials/header.jsp" %>

<h1>
    <fmt:message key="users.title"/>
</h1>

<a href="${pageContext.request.contextPath}/users?action=new">
    <fmt:message key="users.add"/>
</a>

<br><br>

<table border="1">
    <thead>
        <tr>
            <th>ID</th>
            <th><fmt:message key="users.username"/></th>
            <th><fmt:message key="users.active"/></th>
            <th><fmt:message key="users.unlocked"/></th>
            <th><fmt:message key="users.attempts"/></th>
            <th><fmt:message key="users.verified"/></th>
            <th><fmt:message key="users.actions"/></th>
        </tr>
    </thead>

    <tbody>

        <c:forEach var="user" items="${users}">
            <tr>

                <td>
                    <c:out value="${user.id}" />
                </td>

                <td>
                    <c:out value="${user.username}" />
                </td>

                <td>
                    <c:out value="${user.active}" />
                </td>

                <td>
                    <c:out value="${user.accountNonLocked}" />
                </td>

                <td>
                    <c:out value="${user.failedLoginAttempts}" />
                </td>

                <td>
                    <c:out value="${user.emailVerified}" />
                </td>

                <td>

                    <a href="${pageContext.request.contextPath}/users?action=edit&id=${user.id}">
                        <fmt:message key="users.editButton"/>
                    </a>

                    <br>

                    <a href="${pageContext.request.contextPath}/users?action=delete&id=${user.id}"
                       onclick="return confirm('<fmt:message key="users.confirmDelete"/>');">
                        <fmt:message key="users.deleteButton"/>
                    </a>

                </td>

            </tr>
        </c:forEach>

    </tbody>

</table>

<%@ include file="../partials/footer.jsp" %>