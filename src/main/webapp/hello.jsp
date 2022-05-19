
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Homepage</title>
    <jsp:include page="/allStyle.jsp"/>
</head>
<body>
<jsp:include page="/part/navbar.jsp"/>
<div class="container">
<h1><%= "Picom" %></h1>


</div>
<jsp:include page="/part/footer.jsp"/>
<jsp:include page="/part/displayAlertMessage.jsp"/>

</body>
</html>
