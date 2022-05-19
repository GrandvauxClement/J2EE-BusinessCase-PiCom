(() => {
    'use strict';

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    const forms = document.querySelectorAll('.needs-validation');

    // Loop over them and prevent submission
    Array.prototype.slice.call(forms).forEach((form) => {
        form.addEventListener('submit', (event) => {
            let formIsInvalid = false;

            if (!form.checkValidity()){
                formIsInvalid = true;
            }
            if (formIsInvalid){
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }, false);
    });
})();
const switchValidInvalidClass = (input, isValid, message = null) => {

   if (message != null){
        input.nextElementSibling.nextElementSibling.innerHTML = message;
   }
    if (isValid){
        if (input.classList.contains("is-invalid")){
            input.classList.replace("is-invalid", "is-valid")
        }else if (!input.classList.contains("valid")){
            input.classList.add("valid");
        }
    } else {
        if (input.classList.contains("is-valid")){
            input.classList.replace("is-valid", "is-invalid")
        } else if (!input.classList.contains("is-invalid")){
            input.classList.add("is-invalid");
        }
    }
}

const allInput = document.querySelectorAll("#registerForm input");
Array.prototype.slice.call(allInput).forEach((input) => {
    input.oninput = (e) => {
        if (e.target.name === "firstName" || e.target.name === "lastName" || e.target.name === "companyName"){

            if (e.target.value.length > 1){
                switchValidInvalidClass(e.target, true);
            } else {
                switchValidInvalidClass(e.target, false);
            }
        } else if (e.target.name === "email"){

            const regex = /([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9_-]+)/gi;
            if (e.target.value.match(regex)){
                switchValidInvalidClass(e.target, true);
            } else {
                switchValidInvalidClass(e.target, false);
            }
        } else if (e.target.name === "phoneNumber"){

            const regexPhone = /(?:[-+()/ ]*\d){10,13}/gm;
            if (e.target.value.match(regexPhone)){
                switchValidInvalidClass(e.target, true);
            }else {
                switchValidInvalidClass(e.target, false);
            }
        } else if (e.target.name === "password" || e.target.name === "confirmPassword"){

            const password = document.querySelector('#registerForm [name="password"]');
            const confirmPassword = document.querySelector('#registerForm [name="confirmPassword"]');
                if (password.value.length < 6){
                    console.log("Je passe là")
                    switchValidInvalidClass(password, false, "Le mot de passe doit contenir 6 caractère au minimum");
                } else if (password.value === confirmPassword.value){
                    switchValidInvalidClass(password, true);
                    switchValidInvalidClass(confirmPassword, true);
                }else {
                    switchValidInvalidClass(password, false, "");
                    switchValidInvalidClass(confirmPassword, false);
                }


        } else if (e.target.name === "numSiret"){
            const regexIsNumeric =  /^-?\d+$/;
            if (e.target.value.length === 14 && e.target.value.match(regexIsNumeric)){
                switchValidInvalidClass(e.target, true);
            } else {
                if (e.target.value.length === 0){
                    switchValidInvalidClass(e.target, false, "Saisissez le numéro SIRET de votre entreprise");
                } else {
                    switchValidInvalidClass(e.target, false, "Votre numéro SIRET doit contenir 14 chiffres");
                }

            }
        }
    }
})

const adressInput = document.querySelector("#registerForm #floatingInputAddress");
adressInput.onkeydown = (e) => {
    const query = e.target.value;

    fetch(
        // TODO Add user location in search query to optimize result
        `https://api-adresse.data.gouv.fr/search/?q=${query}&limit=7`
    )
        .then((resp) => {

            if (resp.status === 200) {

                resp.json().then((json) => {
                    let ul = document.createElement('div');
                    /*ul.classList.add("list-group");
                    ul.classList.add("list-group-light");*/
                    ul.classList.value = "list-group list-group-light";
                    json.features.map((data, index) => {
                     //   ul.innerText = `<li>${data.properties.label}</li>`
                        let elements = document.createElement('div');
                        elements.classList.value = "list-group-item list-group-item-action px-3 border-0 ripple";
                        elements.innerText = `${data.properties.label}`;
                        elements.onclick = (e) => {
                            adressInput.value = e.target.textContent;
                            console.log("click sur address", e.target.textContent);
                            document.querySelector("#displayListAdress").innerHTML = "";
                        }
                        ul.append(elements);
                    })
                    document.querySelector("#displayListAdress").innerHTML = "";
                    document.querySelector("#displayListAdress").append(ul);
                })
            }
        }).catch((err) => {
            //res.status(err.statusCode).json(err);
            console.log("Erreur ",err);
    });
}