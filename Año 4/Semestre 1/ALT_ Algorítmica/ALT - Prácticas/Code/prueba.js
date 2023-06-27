// recuperar un elemento por su id con JQuery
var elemento = $("#elemento");
// del elemento, obtener el primer hijo
var hijo = elemento.children().first();
// del elemento, obtener el primer hijo y obtener su texto
var texto = hijo.text();
// al hijo, poner evento de clic
hijo.click(function () {
    alert(texto);
});
// al hijo, poner evento clic JavaScript
hijo.onclick = function () {
    alert(texto);
};
// hacer desaparecer hijo si contiene etiqueta hidden
hijo.click(function () {
    if (hijo.is(":hidden")) {
        hijo.show();
    }
    else {
        hijo.hide();
    }
});