<%--
  Created by IntelliJ IDEA.
  User: cleme
  Date: 21/04/2022
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container ">
        <a class="navbar-brand" href="#">
            <img src="<c:url value="/assets/image/logo/logoPiCom.png"/>" class="img-fluid" style="height: 70px">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse d-flex justify-content-end" id="navbarNavAltMarkup">
           <%-- <div class="navbar-nav">
                <a class="nav-link" href="#">Nouvelle Annonce</a>
                <a class="nav-link" href="#">Mes annonces</a>
                <a class="nav-link" href="#">Compte</a>
                <a class="nav-link" href="">Déconnexion</a>
            </div>--%>
               <div class="navbar-nav">
                   <a class="nav-link d-flex flex-column align-items-center" href="<c:url value="/register"/>">
                       <i class="bi bi-box-arrow-in-right"></i>
                       Connectez-vous !
                   </a>
                   <a class="nav-link d-flex flex-column align-items-center" href="<c:url value="/register"/>">
                       <i class="bi bi-person-plus-fill"></i>
                       Inscrivez-vous !
                   </a>
               </div>
        </div>
    </div>
</nav>
<header>
    <div class="container">
        <div class="row justify-content-center align-items-center h-100">
            <div class="col-md-5">
                <div class="d-flex flex-column align-items-center boxPromotion">
                    <h1 class="text-white fw-bold mt-1 text-center">Découvrez l'offre de renouvellement</h1>
                    <button class="btn my-blueGreen-bg text-white mt-3 mb-1">Découvrir</button>
                </div>

            </div>
        </div>
    </div>

</header>
