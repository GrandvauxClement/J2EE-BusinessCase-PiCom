<%--
  Created by IntelliJ IDEA.
  User: HB
  Date: 17/05/2022
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <jsp:include page="/allStyle.jsp"/>
    <title>Mon Compte</title>

</head>
<body>
<jsp:include page="/part/navbar.jsp"/>
<div class="container">
    <h1><%= "Mon Compte" %></h1>
    <section style="background-color: #eee;">
        <div class="container py-5">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="#">Accueil</a></li>
                            <li class="breadcrumb-item"><a href="#">Mes annonces</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Mon compte</li>
                        </ol>
                    </nav>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-4">
                    <div class="card mb-4">
                        <div class="card-body text-center">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar"
                                 class="rounded-circle img-fluid" style="width: 150px;">
                            <h5 class="my-3">${userConnected.lastName} ${userConnected.firstName}</h5>

                            <p class="text-muted mb-4">${userConnected.companyName}</p>
                            <div class="d-flex justify-content-center mb-2">

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="card mb-4">
                        <div class="card-body">

<%--formulaire de modif des donnees--%>
                            <form class="d-none" id="modify" action="<c:url value="/account"/>" method="post">
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Nom</p>
                                </div>

                                <div class="col-sm-9">
                                    <input class="text-muted mb-0" type="text" name="lastName" value="${userConnected.lastName}" required>

                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <label class="form-label">Prénom</label>
                                </div>
                                <div class="col-sm-9">
                                    <input class="text-muted mb-0 form-control" type="text" name="firstName" value="${userConnected.firstName}" required>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">E-mail</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">${userConnected.email}</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Téléphone</p>
                                </div>
                                <div class="col-sm-9">
                                    <input class="text-muted mb-0" type="text" name="phoneIndicative" size="5" value="${userConnected.city.country.phoneIndicative}" required>
                                    <input class="text-muted mb-0" type="text" name="phoneNumber" value="${userConnected.phoneNumber}" required>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Raison sociale</p>
                                </div>
                                <div class="col-sm-9">
                                    <input class="text-muted mb-0" type="text" name="companyName" value="${userConnected.companyName}" required>

                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Adresse</p>
                                </div>
                                <div class="col-sm-9">
                                    <input class="text-muted mb-0" type="text" name="roadName" value="${userConnected.roadName}" required>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Code postal</p>
                                </div>
                                <div class="col-sm-9">
                                    <input class="text-muted mb-0" type="text" name="postalCode" value="${userConnected.postalCode}" required>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Ville</p>
                                </div>
                                <div class="col-sm-9">
                                    <input class="text-muted mb-0" type="text" name="cityName" value="${userConnected.city.name}" required>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Pays</p>
                                </div>
                                <div class="col-sm-9">
                                    <input class="text-muted mb-0" type="text" name="countryName" value="${userConnected.city.country.name}" required>
                                </div>
                            </div>
                                <button class="btn my-blueGreen-bg text-white mt-3 mb-1" type="submit">Valider</button>
                            </form>


<%--formulaire de listing des donnees--%>
                            <div class="" id="listing">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Nom</p>
                                    </div>

                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0" type="text" name="lastName">${userConnected.lastName}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="form-label">Prénom</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0" type="text" name="firstName">${userConnected.firstName}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">E-mail</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${userConnected.email}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Téléphone</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0" type="text" name="phoneIndicative" size="5">${userConnected.city.country.phoneIndicative}
                                         ${userConnected.phoneNumber}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Raison sociale</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0" type="text" name="companyName">${userConnected.companyName}</p>

                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Adresse</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0" type="text" name="roadName">${userConnected.roadName}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Code postal</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0" type="text" name="postalCode">${userConnected.postalCode}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Ville</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0" type="text" name="cityName">${userConnected.city.name}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Pays</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0" type="text" name="countryName">${userConnected.city.country.name}</p>
                                    </div>
                                </div>
                                <button onclick="modifyData()" id="modifyUser" class="btn my-blueGreen-bg text-white mt-3 mb-1">Modifier</button>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>

    </section>

</div>
<jsp:include page="/part/footer.jsp"/>
<jsp:include page="/part/displayAlertMessage.jsp"/>
<jsp:include page="/allScript.jsp"/>
<script src="<c:url value="/assets/script/modifyData.js" />"></script>
</body>
</html>