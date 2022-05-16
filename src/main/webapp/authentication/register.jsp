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

            <form action="<c:url value="/register"/>" method="post" class="pb-4 needs-validation" novalidate id="registerForm">
                <div class="row py-2">
                    <div class="col-md">
                        <div class="form-outline">

                            <input type="text" class="form-control" id="floatingInputFirstname" placeholder="Antoine"
                                   name="firstName" required value="<c:out value="${firstName}"/>">
                            <label for="floatingInputFirstname" class="form-label">Votre prénom</label>
                            <div class="invalid-feedback">
                                Saisissez votre prénom.
                            </div>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-outline">
                            <input type="text" class="form-control" id="floatingInputLastname" placeholder="Dupond"
                                   name="lastName" required value="<c:out value="${lastName}"/>">
                            <label for="floatingInputLastname" class="form-label">Votre Nom</label>
                            <div class="invalid-feedback">
                                Saisissez votre nom.
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row py-2">
                    <div class="col-md">
                        <div class="form-outline">
                            <input type="email" class="form-control" id="floatingInputEmail" name="email" required
                                   placeholder="nom@example.com" value="<c:out value="${email}"/>">
                            <label for="floatingInputEmail" class="form-label">Votre Email</label>
                            <div class="invalid-feedback">
                                Saisissez votre email.
                            </div>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-outline">
                            <input type="tel" class="form-control" id="floatingInputTel" name="phoneNumber" required
                                   placeholder="0695482535" value="<c:out value="${phoneNumber}"/>">
                            <label for="floatingInputTel" class="form-label">Votre Numéro de téléphone</label>
                            <div class="invalid-feedback">
                                Saisissez votre numéro de téléphone.
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row py-2">
                    <div class="col-md">
                        <div class="form-outline">
                            <input type="password" class="form-control" id="floatingInputPassword" name="password"
                                   required value="<c:out value="${password}"/>">
                            <label for="floatingInputPassword" class="form-label">Votre mot de passe</label>
                            <div class="invalid-feedback">
                                Saisissez votre mot de passe.
                            </div>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-outline">
                            <input type="password" class="form-control" id="floatingInputConfirmPassword" name="confirmPassword"
                                   required value="<c:out value="${confirmPassword}"/>">
                            <label for="floatingInputConfirmPassword" class="form-label">Confirmer votre mot de passe</label>
                            <div class="invalid-feedback">
                                La confirmation doit correspondre au mot de passe.
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row py-2">
                    <div class="col-md">
                        <div class="form-outline">
                            <input type="text" class="form-control" id="floatingInputCompany" name="companyName"
                                   required value="<c:out value="${companyName}"/>" placeholder="Picom">
                            <label for="floatingInputCompany" class="form-label">Nom de votre Entreprise</label>
                            <div class="invalid-feedback">
                                Saisissez le nom de votre entreprise.
                            </div>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-outline">
                            <input type="text" class="form-control" id="floatingInputNumSiret" name="numSiret" required
                                   placeholder="25495423568425" value="<c:out value="${numSiret}"/>">
                            <label for="floatingInputNumSiret" class="form-label">Numéro SIRET de votre entreprise</label>
                            <div class="invalid-feedback">
                                Saisissez le numéro SIRET de votre entreprise.
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row py-2">
                    <div class="col">
                        <div class="form-outline">
                            <input type="text" class="form-control" id="floatingInputAddress" name="address" required
                                   value="<c:out value="${address}"/>" placeholder="7 avenue du stade 64000 Clermont">
                            <label for="floatingInputAddress" class="form-label">Votre Adresse</label>
                            <div class="invalid-feedback">
                                Saisissez votre adresse.
                            </div>

                        </div>
                        <div id="displayListAdress">

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
