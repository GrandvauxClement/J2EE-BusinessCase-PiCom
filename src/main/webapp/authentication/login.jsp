<%--
  Created by IntelliJ IDEA.
  User: cleme
  Date: 21/04/2022
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <jsp:include page="/allStyle.jsp"/>
        <title>Login</title>
    </head>
    <body>
        <jsp:include page="/part/navbar.jsp"/>

        <section class="h-100 gradient-form" style="background-color: #eee;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-xl-10">
                        <div class="card rounded-3 text-black">
                            <div class="row g-0">
                                <div class="col-lg-6">
                                    <div class="card-body p-md-5 mx-md-4">

                                        <div class="text-center">
                                            <img src="<c:url value="/assets/image/logo/logoPiCom.png"/>"
                                                 style="width: 185px;" alt="logo">
                                            <h4 class="mt-1 mb-5 pb-1">Nous sommes l'équipe Picom</h4>
                                        </div>

                                        <form action="<c:url value="/login"/>" method="post" class="pb-4 needs-validation" novalidate>
                                            <p>Connectez-vous à votre compte</p>

                                            <div class="form-outline mb-4">
                                                <input type="email" id="form2Example11" class="form-control" name="email"
                                                       placeholder="Email" />
                                                <label class="form-label" for="form2Example11">Email</label>
                                            </div>

                                            <div class="form-outline mb-4">
                                                <input type="password" id="form2Example22" class="form-control" name="password" />
                                                <label class="form-label" for="form2Example22">Password</label>
                                            </div>

                                            <div class="text-center pt-1 mb-5 pb-1">
                                                <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="submit">
                                                    Log in
                                                </button>
                                                <a class="text-muted" href="#!">Mot de passe oublié ?</a>
                                            </div>

                                            <div class="d-flex align-items-center justify-content-center pb-4">
                                                <p class="mb-0 me-2">Vous n'avez pas de compte ?</p>
                                                <a href="<c:url value="/register"/>">
                                                    <button type="button" class="btn btn-outline-danger">Inscrivez-vous</button>
                                                </a>
                                            </div>

                                        </form>

                                    </div>
                                </div>
                                <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
                                    <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                                        <h4 class="mb-4">Nous sommes plus qu'une simple entreprise</h4>
                                        <p class="small mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                            exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="/part/footer.jsp"/>
        <jsp:include page="/part/displayAlertMessage.jsp"/>

        <jsp:include page="/allScript.jsp"/>
    </body>
</html>
