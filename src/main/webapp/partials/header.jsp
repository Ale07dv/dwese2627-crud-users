<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- Guardamos el idioma seleccionado en sesión -->
<c:if test="${not empty param.lang}">
    <c:set var="language" value="${param.lang}" scope="session"/>
</c:if>


<!-- Idioma por defecto -->
<c:if test="${empty sessionScope.language}">
    <c:set var="language" value="es" scope="session"/>
</c:if>


<!-- Aplicamos el idioma -->
<c:choose>

    <c:when test="${sessionScope.language == 'en'}">
        <fmt:setLocale value="en"/>
    </c:when>

    <c:otherwise>
        <fmt:setLocale value="es"/>
    </c:otherwise>

</c:choose>


<fmt:setBundle basename="messages"/>


<!DOCTYPE html>
<html lang="${sessionScope.language}">

<head>

    <meta charset="UTF-8">

    <title>
        CRUD Users
    </title>

</head>


<body>


<nav>

    <ul>

        <li>
            <a href="${pageContext.request.contextPath}/index.jsp">
                Inicio
            </a>
        </li>


        <li>
            <a href="${pageContext.request.contextPath}/users">
                Usuarios
            </a>
        </li>

    </ul>


    <!-- Selector de idioma -->

    <form method="get"
          action="${pageContext.request.contextPath}/users">


        <select name="lang"
                onchange="this.form.submit()">


            <option value="es"
                <c:if test="${sessionScope.language == 'es'}">
                    selected
                </c:if>>
                Español
            </option>


            <option value="en"
                <c:if test="${sessionScope.language == 'en'}">
                    selected
                </c:if>>
                English
            </option>
        </select>
    </form>
</nav>