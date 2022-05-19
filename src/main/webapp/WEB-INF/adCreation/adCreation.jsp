<%--
  Created by IntelliJ IDEA.
  User: Antoine
  Date: 21/04/2022
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <jsp:include page="/allStyle.jsp"/>

    <title>Creation d'annonce</title>
</head>

<body>
<jsp:include page="/part/navbar.jsp"/>
<div class="container">
    <form action="<c:url value="/adCreation"/>" method="post" class="pb-4 needs-validation" novalidate id="adCreation" enctype="multipart/form-data">

        <div class="row py-2">
        <div class="col-md">
            <div class="form-outline">
                <input type="text" class="form-control" id="title" placeholder="Antoine"
                       name="title" required value="<c:out value="${title}"/>">
                <label for="title" class="form-label">Nom de la campagne</label>
                <div class="invalid-feedback">
                    Saisissez le nom de la campagne.
                </div>
            </div>
        </div>
        </div>


        <div class="row py-2">
            <div class="col-md">
                <div class="form-outline">
                    <input type="date" class="form-control" id="adStart" placeholder="Antoine"
                           name="startAt" required value="<c:out value="${startAt}"/>">
                    <label for="adStart" class="form-label">Date début</label>
                    <div class="invalid-feedback">
                        Saisissez la date de début de campagne.
                    </div>
                </div>
            </div>

            <div class="col-md">
                <div class="form-outline">
                    <input type="date" class="form-control" id="adEnd" placeholder="Antoine"
                           name="endAt" required value="<c:out value="${endAt}"/>">
                    <label for="adEnd" class="form-label">date fin</label>
                    <div class="invalid-feedback">
                        Saisissez la date de fin de campagne.
                    </div>
                </div>
            </div>
        </div>


        <div id="editor"></div>

        <div class="mb-3">
            <input class="form-control form-control-sm" id="image" type="file" name="image" accept="image/*">
            <div class="invalid-feedback">
                Ajoutez une image
            </div>
        </div>

        <div class="row py-2">
            <div class="col-md">
                <div class="form-outline">
                    <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                        <option selected>Choisir zone(s)</option>
                        <c:forEach items="${areaList}" var = 'area' >
                            <option value="area.id">${area.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>



            <div class="col-md">
                <div class="form-outline">
                    <select class="form-select form-select-lg mb-3" size="3" multiple aria-label=".form-select-lg example">
                        <option selected>Choisir plage(s) horraire</option>
                        <c:forEach items="${timeIntervalList}" var = 'interval' >
                            <option value="interval.id">${interval.timeSlot}</option>
                        </c:forEach>
                    </select>

                </div>
            </div>
            <a id="addResult" class="btn my-orange-bg text-white">Ajouter </a>

            <div id="resultat"></div>
        </div>



        <button type="submit" class="btn my-orange-bg text-white">Création</button>

    </form>
</div>
<jsp:include page="/part/footer.jsp"/>
<jsp:include page="/part/displayAlertMessage.jsp"/>
<jsp:include page="/allScript.jsp"/>


<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>

<script>
    const test = document.querySelector( '#addResult' )
    test.addEventListener("click",function(){
        alert("hello World");
    });
</script>

<script>
    ClassicEditor
        .create( document.querySelector( '#editor' ) )
        .catch( error => {
            console.error( error );
        } );
</script>


<script>
    const stepper = document.querySelector('#stepper2');
    new CDB.Stepper(stepper);
</script>


</body>
</html>
