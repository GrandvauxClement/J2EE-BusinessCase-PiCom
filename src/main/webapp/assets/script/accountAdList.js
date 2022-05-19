const selectOrderAd = document.querySelector("#selectOrderAd");
selectOrderAd.onchange = (e) => {
    console.log("Je suis là !! :)");
    console.log(window.location);
    console.log(e.target.value);
    let paramUrl = "";
    if (window.location.search.includes("adActive")){
        console.log("j'ai trouver param order");
        paramUrl += "adActive=false"
    }
    if (e.target.value !== "startDateAsc"){
        if (paramUrl !== ""){
            paramUrl += "&";
        }
        paramUrl += "order="+e.target.value;
    }
    window.location.href = window.location.origin + window.location.pathname + "?"+paramUrl;
};