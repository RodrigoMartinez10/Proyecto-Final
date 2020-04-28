function moverElemento(id_elemento){
  var label = document.getElementById(id_elemento);
  container = label.parentElement.className;
  switch (container) {
    case "lista1":
    var lista = document.getElementById("ls1");
    lista.appendChild(label);
    break;
    case "ls1":
    var lista = document.getElementById("lista1");
    lista.appendChild(label);
      break;
    case "lista2":
    var lista = document.getElementById("ls2");
    lista.appendChild(label);
      break;
    case "ls2":
    var lista = document.getElementById("lista2");
    lista.appendChild(label);
      break;
    case "lista3":
    var lista = document.getElementById("ls3");
    lista.appendChild(label);
      break;
      case "ls3":
      var lista = document.getElementById("lista3");
      lista.appendChild(label);
        break;
    default:
  }
}

function procesarPlatos(){
  var platosDisponibles = document.getElementsByName("plato");
  var seleccionados = [];
  for (var i = 0; i < platosDisponibles.length; i++) {
    if ((platosDisponibles[i].parentElement.className == "ls1") || (platosDisponibles[i].parentElement.className == "ls2") || (platosDisponibles[i].parentElement.className == "ls3")) {
      seleccionados.push(platosDisponibles[i].innerHTML);
    }
  }
  var hiddenArray = document.getElementById("PlatosSeleccionados");
  hiddenArray.value = seleccionados.join(",");

  var form = document.getElementById("SubmitPlatos");
  form.submit;
}
