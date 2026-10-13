<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setBundle basename="messages"/>

<%@ include file="../partials/header.jsp" %>


<h1>
    <c:choose>
        <c:when test="${user != null}">
            <fmt:message key="users.edit"/>
        </c:when>

        <c:otherwise>
            <fmt:message key="users.new"/>
        </c:otherwise>
    </c:choose>
</h1>


<!-- Mensaje de error enviado desde el Servlet -->
<c:if test="${not empty error}">
    <p style="color:red;">
        <c:out value="${error}"/>
    </p>
</c:if>


<form action="${pageContext.request.contextPath}/users"
      method="post">


    <!-- ID oculto para editar -->
    <input type="hidden"
           name="id"
           value="${user != null ? user.id : ''}">


    <!-- Username -->
    <p>
        <label for="username">
            <fmt:message key="users.username"/>
        </label>

        <input type="text"
               id="username"
               name="username"
               maxlength="40"
               required
               value="${user != null ? user.username : ''}">
    </p>


    <!-- Password -->
    <p>
        <label for="passwordHash">
            <fmt:message key="users.password"/>
        </label>

        <input type="text"
               id="passwordHash"
               name="passwordHash"
               maxlength="500"
               required
               value="${user != null ? user.passwordHash : ''}">
    </p>


    <!-- Fecha cambio contraseña -->
    <p>
        <label for="lastPasswordChange">
            <fmt:message key="users.lastChange"/>
        </label>

        <input type="datetime-local"
               id="lastPasswordChange"
               name="lastPasswordChange"
               required
               value="${user != null && user.lastPasswordChange != null ? user.lastPasswordChange : ''}">
    </p>


    <!-- Intentos fallidos -->
    <p>
        <label for="failedLoginAttempts">
            <fmt:message key="users.attempts"/>
        </label>

        <input type="number"
               id="failedLoginAttempts"
               name="failedLoginAttempts"
               min="0"
               required
               value="${user != null ? user.failedLoginAttempts : 0}">
    </p>


    <!-- Active -->
    <p>
        <input type="checkbox"
               id="active"
               name="active"
               value="true"
               <c:if test="${user != null and user.active}">
                   checked="checked"
               </c:if>>

        <label for="active">
            <fmt:message key="users.active"/>
        </label>
    </p>


    <!-- Account Non Locked -->
    <p>
        <input type="checkbox"
               id="accountNonLocked"
               name="accountNonLocked"
               value="true"
               <c:if test="${user != null and user.accountNonLocked}">
                   checked="checked"
               </c:if>>

        <label for="accountNonLocked">
            <fmt:message key="users.unlocked"/>
        </label>
    </p>


    <!-- Email Verified -->
    <p>
        <input type="checkbox"
               id="emailVerified"
               name="emailVerified"
               value="true"
               <c:if test="${user != null and user.emailVerified}">
                   checked="checked"
               </c:if>>

        <label for="emailVerified">
            <fmt:message key="users.verified"/>
        </label>
    </p>


    <!-- Must Change Password -->
    <p>
        <input type="checkbox"
               id="mustChangePassword"
               name="mustChangePassword"
               value="true"
               <c:if test="${user != null and user.mustChangePassword}">
                   checked="checked"
               </c:if>>

        <label for="mustChangePassword">
            <fmt:message key="users.mustChange"/>
        </label>
    </p>


    <button type="submit">
        <fmt:message key="users.save"/>
    </button>


    <a href="${pageContext.request.contextPath}/users">
        <fmt:message key="users.cancel"/>
    </a>


</form>


<%@ include file="../partials/footer.jsp" %>