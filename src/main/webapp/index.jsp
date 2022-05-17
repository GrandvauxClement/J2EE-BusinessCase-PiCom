<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP - Hello World</title>
        <jsp:include page="/allStyle.jsp"/>
    </head>
    <body>
        <jsp:include page="/part/navbar.jsp"/>
        <h1><%= "Hello World!" %></h1>
        <br/>
        <a href="hello-servlet">Hello Servlet</a>
        <br/>
        <a href="<c:url value="/compte/mes-annonces" />"> Voir toute les data des annonces</a>


        <jsp:include page="/part/footer.jsp"/>
        <jsp:include page="/part/displayAlertMessage.jsp"/>

        <jsp:include page="/allScript.jsp"/>
    </body>
</html>