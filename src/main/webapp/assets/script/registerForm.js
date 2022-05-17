(() => {
    'use strict';

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    const forms = document.querySelectorAll('.needs-validation');

    // Loop over them and prevent submission
    Array.prototype.slice.call(forms).forEach((form) => {
        form.addEventListener('submit', (event) => {
            let formIsInvalid = false;
            if (form[4].value !== form[5].value){
                if (form[5].classList.contains("is-valid")){
                    form[5].classList.replace("is-valid", "is-invalid")
                } else if (!form[5].classList.contains("is-invalid")){
                    form[5].classList.add("is-invalid");
                }
                formIsInvalid = true;

            }else {
                if (form[5].classList.contains("is-invalid")){
                    form[5].classList.replace("is-invalid", "is-valid")
                }else if (!form[5].classList.contains("valid")){
                    form[5].classList.add("valid");
                }
            }
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

const adressInput = document.querySelector("#registerForm #floatingInputAddress");
adressInput.onkeydown = (e) => {
    const query = e.target.value;
    let response = {features: []};

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