
var end = ' is selected*';
var total = 0.0;

var comidaAnt = -0.0;
var bebidaAnt = -0.0;
var complementoAnt = -0.0;

function getTotalPrincipal()
{
    var options = document.querySelector('#list-ppal').options;
    var array = Array.from(options);
    console.log(array);

    array.forEach(function(element){
        if(element.selected===true)
        {
            principalPrecio.forEach(function(item){
                if(item.principal===element.text)
                {
                    console.log(item.precio);
                    total = total + comidaAnt + item.precio;
                    comidaAnt = -item.precio;
                    console.log('total: ' + total);
                    updateTotal();
                }
            });
        }
    });
}

function getTotalComplemento()
{
    var options = document.querySelector('#list-acomp').options;
    var array = Array.from(options);
    console.log(array);

    array.forEach(function(element){
        if(element.selected===true)
        {
            complementoPrecio.forEach(function(item){
                if(item.complemento===element.text)
                {
                    console.log(item.precio);
                    total = total + complementoAnt + item.precio;
                    complementoAnt = -item.precio;
                    console.log('total: ' + total);
                    updateTotal();
                }
            });
        }
    });
}

function getTotalBebida()
{
    var options = document.querySelector('#list-bebida').options;
    var array = Array.from(options);
    console.log(array);

    array.forEach(function(element){
        if(element.selected===true)
        {
            bebidaPrecio.forEach(function(item){
                if(item.bebida===element.text)
                {
                    console.log(item.precio);
                    total = total + bebidaAnt + item.precio;
                    bebidaAnt = -item.precio;
                    console.log('total: ' + total);
                    updateTotal();
                }
            });
        }
    });
}

function updateTotal()
{
    document.querySelector('#showTotal').innerHTML = "$" + total;
}

function submitTotal()
{
    var hiddenTotal = document.getElementById("sendTotal");
    hiddenTotal.value = total;
    var form = document.getElementById("cuentaTotal");
    form.submit;
}