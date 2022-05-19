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
        <h2 class="text-center">Détail Annonce</h2>
        <div class="row mt-2">
            <div class="col-5">
                <img src="<c:url value='/assets/image/ad/${ad.image}'/>" alt="detailImage">
            </div>
            <div class="col-7">
                <div>
                    <span class="text-bold">Titre : </span>
                    ${ad.title}
                </div>
                <div>
                    <span class="text-bold">Crée le : </span>
                    ${ad.createdAt}
                </div>
                <div>
                    <span class="text-bold">Début de diffusion : </span>
                    ${ad.startDate}
                </div>
                <div>
                    <span class="text-bold">Fin de diffusion : </span>
                    ${ad.endDate}
                </div>

            </div>
        </div>
        <h4> Mes Zones de Diffusion</h4>
        <div class="row">
            <c:forEach items="${ad.areaList}" var="area">
                <div class="col-6">
                    <div> zone concerné : ${area.name}</div>
                    <div>
                        Horraire concerné :
                        <ul>
                        <c:forEach items="${area.timeIntervalList}" var="timeInterval">
                            <li>${timeInterval.timeSlot} h</li>
                        </c:forEach>
                        </ul>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
<jsp:include page="/part/footer.jsp"/>
<jsp:include page="/part/displayAlertMessage.jsp"/>
<jsp:include page="/allScript.jsp"/>
</body>
</html>
