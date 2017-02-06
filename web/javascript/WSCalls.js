
var webServiceURL = 'http://localhost:8080/Dashboard/WSDashboard';
var endpoint = "'http://WS/'";
var usuario;
var password;
var soapMessagegetnumempleados = '<S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"><SOAP-ENV:Header/><S:Body><ns2:getNumEmpleados xmlns:ns2=' + endpoint + '/></S:Body></S:Envelope>';
var chartSalario = null;
var chartDepart = null;
var d001 = "Marketing";
var d002 = "Finance";
var d003 = "Human Resources";
var d004 = "Production";
var d005 = "Development";
var d006 = "Quality Management";
var d007 = "Sales";
var d008 = "Research";
var d009 = "Customer Service";
var totalEmpleados;

function buscaEmpleado(){
    var empl= document.getElementById('empl_no').value;
    var soapMessage =
            '<?xml version="1.0" encoding="UTF-8"?><S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"> \
    <SOAP-ENV:Header/> \
    <S:Body> \
        <ns2:getEmpleado xmlns:ns2=' + endpoint + '> \
            <indice>' + empl + '</indice> \
        </ns2:getEmpleado> \
    </S:Body> \
    </S:Envelope>';
    var employString = "";
    $.ajax({
        url: webServiceURL,
        type: "POST",
        dataType: "text",
        async: false,
        data: soapMessage,
        contentType: "text/xml; charset=\"utf-8\"",
        success: function OnSuccess(data, status) {
            var firstname = data.toString() + "";
            var ini = firstname.search("first_name") + 18;
            var fin = firstname.search("/first_name") - 5;
            firstname = firstname.substring(ini, fin).trim();
            
            var lastname = data.toString() + "";
            ini = lastname.search("last_name") + 17;
            fin = lastname.search("/last_name") - 5;
            lastname = lastname.substring(ini, fin).trim();
            employString = lastname+", "+firstname;
            
            var gender = data.toString() + "";
            ini = gender.search("gender") + 14;
            fin = gender.search("/gender") - 5;
            gender = gender.substring(ini, fin).trim();
            
            var birth_date = data.toString() + "";
            ini = birth_date.search("birth_date") + 18;
            fin = birth_date.search("/birth_date") - 5;
            birth_date = birth_date.substring(ini, fin).trim();
            
            var hire_date = data.toString() + "";
            ini = hire_date.search("hire_date") + 17;
            fin = hire_date.search("/hire_date") - 5;
            hire_date = hire_date.substring(ini, fin).trim();
            
            
            $('#divEmployeeA').html("Empleado");
            $('#divEmployee1').html("#"+empl);
            $('#divEmployeeB').html("Nombre completo");
            $('#divEmployee2').html(employString);
            $('#divEmployeeC').html("Nacido el");
            $('#divEmployee3').html(birth_date);
            $('#divEmployeeD').html("Sexo");
            if(gender==="M"){
                $('#divEmployee4').html("Hombre");
                $('#imagetd').html(
                    '<img src="../video/img/male.png" style= "width:280px;height:304px;" >'
                );
            }else if(gender==="F"){
                $('#divEmployee4').html("Mujer");
                $('#imagetd').html(
                    '<img src="../video/img/female.png" style= "width:280px;height:304px;" >'
                );
            }
            $('#divEmployeeE').html("Fecha de alta");
            $('#divEmployee5').html(hire_date);
        },
        error: function OnError(error) {
            alert("error");
        }
    });
    return employString;
}

function actualizaDepartamentos(tipo){
    var data = getDepartamentos();
    var porcentajes = [];
    for (var j = 0; j < data.length; j++) {
        var perc = (data[j] / totalEmpleados) * 100;
        porcentajes.push(perc);
    }
    var options;
    var series;
    if (tipo === '0') { // polar area
        options = {
        chart: {
            polar: []
        },
        title: {
            text: 'Empleados en cada Departamento',
            x: -20 //center
        },
        subtitle: {
            text: 'Source: employees_db',
            x: -20
        },
        xAxis: {
            categories: [d001, d002, d003, d004, d005, d006, d007, d008, d009]
        },
        yAxis: {
            title: {
                text: '%'
            },
            plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
        },
        tooltip: {
            valueSuffix: '$'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: []
    };
        options.chart.polar = true;
        series = {
            type: 'area',
            name: [],
            data: []
        };
    } else { // Barras
        options = {
        chart: {
            type: 'column'
        },
        title: {
            text: 'Empleados en cada Departamento',
            x: -20 //center
        },
        subtitle: {
            text: 'Source: employees_db',
            x: -20
        },
        xAxis: {
            categories: [d001, d002, d003, d004, d005, d006, d007, d008, d009]
        },
        yAxis: {
            title: {
                text: '%'
            },
            plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
        },
        tooltip: {
            valueSuffix: '$'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: []
    };
        series = {
            name: [],
            data: []
        };
    }
    series.name.push("Total: " + totalEmpleados);
    var i;
    for (i = 0; i < porcentajes.length; i++) {
        series.data.push(parseInt(porcentajes[i]));
    }
    options.series.push(series);
    $(function(){	
        chartDepart = $("#containerArea").highcharts(options);
    });
}

function getDepartamentos() {
    var data = [];
    var i;
    for (i = 0; i < 9; i++) {
        var depart = "d00"+(i+1);
        var soapMessage =
                '<?xml version="1.0" encoding="UTF-8"?><S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"> \
    <SOAP-ENV:Header/> \
    <S:Body> \
        <ns2:getCountDepartamento xmlns:ns2=' + endpoint + '> \
            <depart>' + depart + '</depart> \
        </ns2:getCountDepartamento> \
    </S:Body> \
    </S:Envelope>';
        var employString = "";
        $.ajax({
            url: webServiceURL,
            type: "POST",
            dataType: "text",
            async: false,
            data: soapMessage,
            contentType: "text/xml; charset=\"utf-8\"",
            success: function OnSuccess(data, status) {
                var auxstr = data.toString() + "";
                var ini = auxstr.search("cantempleados") + 21;
                var fin = auxstr.search("/cantempleados") - 5;
                auxstr = auxstr.substring(ini, fin);
                employString = auxstr;
            },
            error: function OnError(error) {
                alert(error);
            }
        });
        data.push(employString);
    }
    return data;
}

function actualizaChart() {
    var empleado = document.getElementById('empl_no1').value;
    var text = getSalaryEmployee(empleado);
    var nombreEmpl = getNombreEmployee(empleado);
    //if(text.length()<20) return null;
    var onesalary = "";
    var categories = [];
    var name = empleado;
    var data = [];
    var i = 0;
    while (i-19 !== -2) {
        var ini = text.indexOf("&lt;one_salary&gt;", i) + 18;
        var fin = text.indexOf("&lt;/one_salary&gt;", i) - 1;
        onesalary = text.substring(ini, fin);
        if(fin === -2) break;
        var salary = onesalary.substring(
                (onesalary.indexOf("&lt;salary&gt;") + 14),
                (onesalary.indexOf("&lt;/salary&gt;") - 1)
                );
        salary = salary.trim();
        var fromdate = onesalary.substring(
                (onesalary.indexOf("&lt;from_date&gt;") + 17),
                (onesalary.indexOf("&lt;/from_date&gt;") - 1)
                );
        fromdate = fromdate.trim();
        var todate = onesalary.substring(
                (onesalary.indexOf("&lt;to_date&gt;") + 15),
                (onesalary.indexOf("&lt;/to_date&gt;") - 1)
                );
        todate = todate.trim();
        // ADDDDDD
        //categories+="'"+fromdate.substring(0,4)+" to "+todate.substring(0,4)+"'";
        categories.push(fromdate.substring(0,4));
        data.push(salary);
        i = fin+19;
    }
    
    dibujaGrafica(categories, name, data, nombreEmpl);
    
}

function dibujaGrafica(categories, name, dataS, nombreEmpl){
    var nombreempleado = 'Evolución del salario de '+nombreEmpl;
    var options = {
        title: {
                text: 'Evolución del salario',
                x: -20 //center
            },
            subtitle: {
                text: 'Source: employees_db',
                x: -20
            },
            xAxis:{
                categories: []
            },
            yAxis: {
                title: {
                    text: 'Sueldo Anual ($)'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                valueSuffix: '$'
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                borderWidth: 0
            },
            series: []
        };
    options.title.text = nombreempleado;
    var series = {
        name: [],
        data: []
    };
    series.name.push(""+nombreEmpl+"");
    var i;
    for(i=0; i < dataS.length; i++){
        series.data.push(parseInt(dataS[i]));
    }
    if(chartSalario!==null){
        var aux = $("#containerArea").highcharts();
        aux.addSeries(series);
        aux.redraw();
    }
    var j;
    for(j=0; j < categories.length; j++){
        options.xAxis.categories.push("'"+categories[j]+"'");
    }
    options.series.push(series);
    $(function(){	
        chartSalario = $("#containerArea").highcharts(options);
    });
}

function putEmpleados() {
    totalEmpleados = getNumEmpleadosWS();
    jQuery("#num_empleados").append('La Base de Datos contiene <b>'
            + totalEmpleados +
            '</b> empleados');
}

function getNumEmpleadosWS()
{
    var numEmpleados = 0;
    $.ajax({
        url: webServiceURL,
        type: "POST",
        dataType: "text",
        async: false,
        data: soapMessagegetnumempleados,
        contentType: "text/xml; charset=\"utf-8\"",
        success: function succ(data, status) {
            var auxstr = data.toString() + "";
            var ini = auxstr.search("cantempleados") + 24;
            var fin = auxstr.search("/cantempleados") - 5;
            auxstr = auxstr.substring(ini, fin);
            numEmpleados = auxstr;
        },
        error: function OnError(error) {
            alert(error);
        }
    });
    return numEmpleados;
}

function logIn(usr, pass, guest)
{
    if (guest === true) {
        $('#insert_form').html(
                '<form action=\"url\" name=\"form\" method=\"post\" style=\"display:none;\"> \
        <input type=\"text\" name=\"user\" value=\"' + "Invitado" + '\" /></form> \
        <input type=\"text\" name=\"pass\" value=\"' + "0000" + '\" /></form> \
        <input type=\"text\" name=\"lvl\" value=\"' + "1" + '\" /></form>');
        document.forms['insert_form'].submit();
        return false;
    }
    usuario = usr;
    password = pass;
    var soapMessageLogIn =
            '<?xml version="1.0" encoding="UTF-8"?><S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"> \
     <SOAP-ENV:Header/> \
     <S:Body> \
        <ns2:login xmlns:ns2=' + endpoint + '> \
            <nombre>' + usr + '</nombre> \
            <clave>' + pass + '</clave> \
        </ns2:login> \
     </S:Body>\
     </S:Envelope>';
    $.ajax({
        url: webServiceURL,
        type: "POST",
        dataType: "text",
        data: soapMessageLogIn,
        contentType: "text/xml; charset=\"utf-8\"",
        success: function OnLogSuccess(data, status) {
            var auxstr = data.toString() + "";
            var ini = auxstr.search("<return>") + 8;
            var fin = auxstr.search("</return>");
            auxstr = auxstr.substring(ini, fin);
            if (auxstr < 0) {
                alert("El usuario o la contraseña son incorrectos");
            } else {
                $('#insert_form').html(
                        '<form action=\"url\" name=\"form\" method=\"post\" style=\"display:none;\"> \
                        <input type=\"text\" name=\"user\" value=\"' + usuario + '\" /></form> \
                        <input type=\"text\" name=\"pass\" value=\"' + password + '\" /></form> \
                        <input type=\"text\" name=\"lvl\" value=\"' + auxstr + '\" /></form>');
                document.forms['insert_form'].submit();
            }
        },
        error: function OnLogError() {
            alert('La datos no son validos');
        }
    });
    return false;
}

function getSalaryEmployee(employee)
{
    var soapMessage =
            '<?xml version="1.0" encoding="UTF-8"?><S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"> \
    <SOAP-ENV:Header/> \
    <S:Body> \
        <ns2:getSalaryEmploy xmlns:ns2=' + endpoint + '> \
            <number>' + employee + '</number> \
        </ns2:getSalaryEmploy> \
    </S:Body> \
    </S:Envelope>';
    var employString = "";
    $.ajax({
        url: webServiceURL,
        type: "POST",
        dataType: "text",
        async: false,
        data: soapMessage,
        contentType: "text/xml; charset=\"utf-8\"",
        success: function OnSuccess(data, status) {
            var auxstr = data.toString() + "";
            var ini = auxstr.search("salary_employ") + 21;
            var fin = auxstr.search("/salary_employ") - 5;
            auxstr = auxstr.substring(ini, fin);
            employString = auxstr;
        },
        error: function OnError(error) {
            alert(error);
        }
    });
    return employString;
}

function getNombreEmployee(employee){
    
    var soapMessage =
            '<?xml version="1.0" encoding="UTF-8"?><S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"> \
    <SOAP-ENV:Header/> \
    <S:Body> \
        <ns2:getEmpleado xmlns:ns2=' + endpoint + '> \
            <indice>' + employee + '</indice> \
        </ns2:getEmpleado> \
    </S:Body> \
    </S:Envelope>';
    var employString = "";
    $.ajax({
        url: webServiceURL,
        type: "POST",
        dataType: "text",
        async: false,
        data: soapMessage,
        contentType: "text/xml; charset=\"utf-8\"",
        success: function OnSuccess(data, status) {
            var firstname = data.toString() + "";
            var ini = firstname.search("first_name") + 18;
            var fin = firstname.search("/first_name") - 5;
            firstname = firstname.substring(ini, fin).trim();
            
            var lastname = data.toString() + "";
            ini = lastname.search("last_name") + 17;
            fin = lastname.search("/last_name") - 5;
            lastname = lastname.substring(ini, fin).trim();
            employString = lastname+", "+firstname;
            
        },
        error: function OnError(error) {
            alert(error);
        }
    });
    return employString;
}

function getEmplIWS()
{
    $.ajax({
        url: webServiceURL,
        type: "POST",
        dataType: "text",
        data: soapMessagegetempleadoi,
        contentType: "text/xml; charset=\"utf-8\"",
        success: OnSuccess,
        error: OnError
    });
    return false;
}

function OnSuccess(data, status)
{
    var auxstr = data.toString() + "";
    var ini = auxstr.search("<return>") + 8;
    var fin = auxstr.search("</return>");
    auxstr = auxstr.substring(ini, fin);
    alert(auxstr);

}
function OnError(request, status, error)
{
    alert('error');
}

function onBlur(el) {
    if (el.value === '') {
        el.value = el.defaultValue;
    }
}
function onFocus(el) {
    if (el.value === el.defaultValue) {
        el.value = '';
    }
}