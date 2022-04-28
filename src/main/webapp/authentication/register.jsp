<%--
  Created by IntelliJ IDEA.
  User: cleme
  Date: 21/04/2022
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <jsp:include page="/allStyle.jsp"/>
        <title>Title</title>
    </head>
    <body>
        <jsp:include page="/part/navbar.jsp"/>
        <div class="container">
            <h2 class="my-orange-color">Bienvenue sur l'application Picom, n'hésitez plus et inscrivez vous !</h2>
            <p>
                Lorem ipsum trekt jfjkfr potloie kitre fruits zikerto Lorem ipsum trekt, jfjkfr potloie kitre fruits zikerto
                Lorem ipsum trekt jfjkfr potloie kitre fruits zikerto.
            </p>

            <form action="<c:url value="/register"/>" method="post" class="pb-4 needs-validation" novalidate>
                <div class="row py-2">
                    <div class="col-md">
                        <div class="form-floating">
                            <label for="floatingInputFirstname">Votre prénom</label>
                            <input type="text" class="form-control" id="floatingInputFirstname" placeholder="Jean"
                                   name="firstName" required value="<c:out value="${firstName}"/>">
                            <div class="invalid-feedback">
                                Saisissez votre prénom.
                            </div>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="floatingInputLastname" placeholder="Dupond"
                                   name="lastName" required value="<c:out value="${lastName}"/>">
                            <label for="floatingInputLastname">Votre Nom</label>
                        </div>
                    </div>
                </div>
                <div class="row py-2">
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="email" class="form-control" id="floatingInputEmail" name="email" required
                                   placeholder="nom@example.com" value="<c:out value="${email}"/>">
                            <label for="floatingInputEmail">Votre Email</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="tel" class="form-control" id="floatingInputTel" name="phoneNumber" required
                                   placeholder="0695482535" value="<c:out value="${phoneNumber}"/>">
                            <label for="floatingInputTel">Votre Numéro de téléphone</label>
                        </div>
                    </div>
                </div>
                <div class="row py-2">
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="password" class="form-control" id="floatingInputPassword" name="password"
                                   required placeholder="Admin123" value="<c:out value="${password}"/>">
                            <label for="floatingInputPassword">Votre mot de passe</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="password" class="form-control" id="floatingInputConfirmPassword" name="confirmPassword"
                                   required placeholder="Admin123" value="<c:out value="${confirmPassword}"/>">
                            <label for="floatingInputConfirmPassword">Confirmer votre mot de passe</label>
                        </div>
                    </div>
                </div>
                <div class="row py-2">
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="floatingInputCompany" name="companyName"
                                   required placeholder="PiCom" value="<c:out value="${companyName}"/>">
                            <label for="floatingInputCompany">Nom de votre Entreprise</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="floatingInputNumSiret" name="numSiret" required
                                   placeholder="25495423568425" value="<c:out value="${numSiret}"/>">
                            <label for="floatingInputNumSiret">Son numéro SIRET</label>
                        </div>
                    </div>
                </div>

                <div class="row py-2">
                    <div class="col">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="floatingInputAddress" name="address" required
                                   placeholder="10 rue de la pub 64000 Clermont" value="<c:out value="${address}"/>">
                            <label for="floatingInputAddress">Votre Addresse</label>
                        </div>
                    </div>
                </div>

                <button type="submit" class="btn my-orange-bg text-white">Je m'inscris</button>
            </form>
        </div>
        <jsp:include page="/part/footer.jsp"/>
        <jsp:include page="/part/displayAlertMessage.jsp"/>

        <jsp:include page="/allScript.jsp"/>
    </body>
</html>
