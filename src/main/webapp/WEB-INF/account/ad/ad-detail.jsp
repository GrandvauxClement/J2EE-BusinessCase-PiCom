<%--
  Created by IntelliJ IDEA.
  User: cleme
  Date: 19/05/2022
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/allStyle.jsp"/>
    <title>Détail annonce</title>
</head>
<body>
<jsp:include page="/part/navbar.jsp"/>
    <div class="container">
        <h2 class="text-center my-4 my-orange-color">Annonce : ${ad.title}</h2>
        <div class="row mt-2 align-items-center">
            <div class="col-5">
                <img src="<c:url value='/assets/image/ad/${ad.image}'/>" class="img-fluid" alt="detailImage">
            </div>
            <div class="col-7">
                <div class="d-flex align-items-center">
                    <h4 class="my-blueGreen-color">Crée le : </h4>
                    <h5 class="ms-3">${ad.createdAt}</h5>
                </div>
                <div class="d-flex align-items-center">
                    <h4 class="my-blueGreen-color">Début de diffusion : </h4>
                    <h5 class="ms-3">${ad.startDate}</h5>
                </div>
                <div class="d-flex align-items-center">
                    <h4 class="my-blueGreen-color">Fin de diffusion : </h4>
                    <h5 class="ms-3">${ad.endDate} </h5>
                </div>
                <div class="d-flex align-items-center">
                    <h4 class="my-blueGreen-color">Nombre de jour de diffusion restant : </h4>
                    <h5 class="ms-3">A Definir </h5>
                </div>
                <div class="d-flex align-items-center">
                    <h4 class="my-blueGreen-color">Prix d'un jour de diffusion : </h4>
                    <h5 class="ms-3">${ad.totalPriceOfAdForOneDay} €</h5>
                </div>
                <div class="d-flex align-items-center">
                    <h4 class="my-blueGreen-color">Prix total : </h4>
                    <h5 class="ms-3">${ad.totalPriceForAllDay} € </h5>
                </div>

            </div>
        </div>
        <h4 class="my-blueGreen-color my-3"> Mes Zones de Diffusion : </h4>
        <div class="row">
            <c:forEach items="${ad.areaList}" var="area">
               <%-- <div class="col-6">
                    <div> Zone concerné : ${area.name}</div>
                    <div>
                        <span>Horraire concerné :</span>
                        <ul>
                        <c:forEach items="${area.timeIntervalList}" var="timeInterval">
                            <li>${timeInterval.timeSlot} h</li>
                        </c:forEach>
                        </ul>
                    </div>
                    <div> Prix : ${area.totalPriceOfAllTimeIntervalSelected} € / jour</div>
                </div>--%>
                <div class="card text-white my-orange-bg mb-3 me-4" style="max-width: 18rem;">
                    <div class="card-header"><h4>${area.name}</h4></div>
                    <div class="card-body">
                        <h5 class="card-title">Horaires concernés :</h5>
                        <ul class="list-group my-orange-bg text-light">
                            <c:forEach items="${area.timeIntervalList}" var="timeInterval">
                                <li class="list-group-item my-orange-bg">${timeInterval.timeSlot} h</li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="card-footer">Prix : ${area.totalPriceOfAllTimeIntervalSelected} € / jour</div>
                </div>
            </c:forEach>
        </div>
    </div>
<jsp:include page="/part/footer.jsp"/>
<jsp:include page="/part/displayAlertMessage.jsp"/>
<jsp:include page="/allScript.jsp"/>
</body>
</html>
