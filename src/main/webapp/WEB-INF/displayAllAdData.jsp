<%--
  Created by IntelliJ IDEA.
  User: cleme
  Date: 21/04/2022
  Time: 12:31
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/allStyle.jsp" />
    <title>Mes Annonces</title>
</head>
<body>
    <jsp:include page="/part/navbar.jsp" />
    <div class="container">
        <h1 class="my-orange-color text-center my-2">${title}</h1>
        <div class="row justify-content-between my-2">
            <div class="col d-flex">
                <button class="btn my-orange-bg">Annonces actives (5)</button>
                <button class="btn btn-secondary">Annonces Expirées (0)</button>
            </div>
            <div class="col">
                <div class="form-floating">
                    <select class="form-select" id="floatingSelect" aria-label="Floating label select example">
                        <option value="1">Date de Début croissant</option>
                        <option value="2">Date de Début décroissant</option>
                        <option value="3">Titre de campagne (A->Z)</option>
                        <option value="4">Titre de campagne (Z->A)</option>
                    </select>
                    <label for="floatingSelect">Trié par</label>
                </div>
            </div>
        </div>
        <div class="row">
            <c:forEach items="${adList}" var="ad">
                <div class="card" style="width: 18rem;">
                    <img src="https://www.ecologie.gouv.fr/sites/default/files/styles/standard/public/Stop%20pub%20seul.jpg?itok=yb4cwbtT" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Annonce n° <c:out value="${ad.id}"/></h5>
                        <p class="card-text"><c:out value="${ad.text}"/></p>
                        <a href="#" class="btn btn-primary">Voir le détail</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <jsp:include page="/part/displayAlertMessage.jsp"/>
    <jsp:include page="/allScript.jsp" />
</body>
</html>
