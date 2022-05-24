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
        <h2 class="my-orange-color text-center my-2">Mes Annonces</h2>
        <div class="row justify-content-between my-2">
            <div class="col-12 col-md-5 d-flex justify-content-center mb-2 mb-md-0">
                <a href="<c:url value="/account/ad/list"/>">
                    <button class="btn my-orange-bg text-white">Annonces actives (${countAdActive})</button>
                </a>
                <a href="<c:url value="/account/ad/list?adActive=false"/>">
                    <button class="btn my-blueGreen-bg ms-2">Annonces Expirées (${countAdInactive})</button>
                </a>
            </div>
            <div class="col-12 col-md-4">
                <div class="form-floating">
                    <select class="form-select" id="selectOrderAd" aria-label="Floating label select example" >
                        <option value="startDateAsc" <c:if test="${order == 'startDateAsc'}">selected</c:if> >
                                Date de Début croissant
                        </option>
                        <option value="startDateDesc" <c:if test="${order == 'startDateDesc'}">selected</c:if> >
                            Date de Début décroissant
                        </option>
                        <option value="titleAsc" <c:if test="${order == 'titleAsc'}">selected</c:if> >
                            Titre de campagne (A->Z)
                        </option>
                        <option value="titleDesc" <c:if test="${order == 'titleDesc'}">selected</c:if>>
                            Titre de campagne (Z->A)
                        </option>
                    </select>
                    <label for="selectOrderAd">Trié par</label>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-8 col-12">
                <c:forEach items="${adList}" var="ad">
                    <div class="row my-3 ad-list-item">
                        <div class="col-md-5 col-12">
                            <img
                                 src="<c:url value='/assets/image/ad/${ad.image}'/>"
                                 class="card-img-top" alt="..."
                                 style="height: 200px"
                            >
                        </div>
                        <div class="col-md-7 col-12 d-flex flex-column justify-content-between">
                            <h5 class="text-center"> <c:out value="${ad.title}"/></h5>
                            <div class="d-flex align-items-center my-1">
                                <i class="fas fa-calendar my-orange-color"></i>
                                <div class="ms-2">  ${ad.startDate}</div>
                            </div>
                            <div class="d-flex align-items-center my-1">
                                <i class="fas fa-calendar-times text-danger"></i>
                                <div class="ms-2">  ${ad.endDate}</div>
                            </div>
                            <div class="row justify-content-between">
                                <div class="col-2">
                                    <div class="d-flex align-items-center my-1">
                                        <i class="fas fa-map-marker-alt my-orange-color"></i>
                                        <div class="ms-2"> ${ad.areaList.size()}</div>
                                    </div>

                                </div>
                                <div class="col-3">
                                    <div class="d-flex align-items-center">
                                        <a class="ad-list-action ad-list-action-pause" href="<c:url value="/account/ad/${ad.id}"/>">
                                            <i class="fas fa-eye me-2"></i>
                                        </a>
                                        <a class="ad-list-action ad-list-action-edit" href="<c:url value="/account/ad/${ad.id}"/>">
                                            <i class="fas fa-pen me-2 "></i>
                                        </a>
                                        <a class="ad-list-action ad-list-action-delete" data-mdb-toggle="modal" data-mdb-target="#deleteAdModal">
                                            <i class="fas fa-trash-alt me-2"></i>
                                        </a>
                                    </div>
                                </div>


                            </div>

                        </div>

                    </div>
                    <hr/>

                    <!-- Modal for delete action -->
                    <div class="modal fade" id="deleteAdModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header bg-danger">
                                    <h5 class="modal-title text-light" id="exampleModalLabel">Attention !!</h5>
                                    <button type="button" class="btn-close" data-mdb-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <p>
                                        Vous vous apprêtez à supprimer l'annonce ${ad.title} <br />
                                        Êtes-vous sur de vouloir la supprimer ?
                                    </p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-dark" data-mdb-dismiss="modal">Annuler</button>
                                    <a href="<c:url value="/account/ad/delete/${ad.id}"/>">
                                        <button type="button" class="btn btn-danger">Supprimer</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>


    </div>
    <jsp:include page="/part/footer.jsp" />
    <jsp:include page="/part/displayAlertMessage.jsp"/>
    <jsp:include page="/allScript.jsp" />
    <script src="<c:url value="/assets/script/accountAdList.js" />"></script>
</body>
</html>
