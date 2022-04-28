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
        <h2 class="my-orange-color text-center my-2">${title}</h2>
        <div class="row justify-content-between my-2">
            <div class="col-12 col-md-5 d-flex justify-content-center mb-2 mb-md-0">
                <button class="btn my-orange-bg text-white">Annonces actives (5)</button>
                <button class="btn btn-secondary ms-2">Annonces Expirées (0)</button>
            </div>
            <div class="col-12 col-md-4">
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
            <div class="col-md-8 col-12">
                <c:forEach items="${adList}" var="ad">
                    <div class="row my-3 ad-list-item">
                        <div class="col-md-5 col-12">
                            <img src="https://www.ecologie.gouv.fr/sites/default/files/styles/standard/public/Stop%20pub%20seul.jpg?itok=yb4cwbtT" class="card-img-top" alt="...">
                        </div>
                        <div class="col-md-7 col-12 d-flex flex-column justify-content-between">
                            <h5 class="text-center"> <c:out value="${ad.title}"/></h5>
                            <div class="d-flex align-items-center my-1">
                                <i class="bi bi-calendar-fill my-orange-color"></i>
                                <div class="ms-2">  ${ad.startDate}</div>
                            </div>
                            <div class="d-flex align-items-center my-1">
                                <i class="bi bi-calendar-x-fill text-danger"></i>
                                <div class="ms-2">  ${ad.startDate}</div>
                            </div>
                            <div class="row justify-content-between">
                                <div class="col-2">
                                    <div class="d-flex align-items-center my-1">
                                        <i class="bi bi-geo-alt-fill my-orange-color"></i>
                                        <div class="ms-2"> 3</div>
                                    </div>

                                </div>
                                <div class="col-3">
                                    <div class="d-flex align-items-center">
                                        <i class="bi bi-pencil-fill me-2 ad-list-action-edit"></i>
                                        <i class="bi bi-pause-fill me-2 ad-list-action-pause"></i>
                                        <i class="bi bi-trash-fill me-2 ad-list-action-delete"></i>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                    <hr/>
                </c:forEach>
            </div>
        </div>


    </div>
    <jsp:include page="/part/footer.jsp" />
    <jsp:include page="/part/displayAlertMessage.jsp"/>
    <jsp:include page="/allScript.jsp" />
</body>
</html>
