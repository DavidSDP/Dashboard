<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Personales</title>
        <link rel="stylesheet" href="../css/style.css"/>
        <link rel="stylesheet" type="text/css" href="../plugin/css/style.css">
        <script src="../javascript/jquery-1.6.1.min.js" type="text/javascript"></script>
        <script src="../plugin/jquery-jplayer/jquery.jplayer.js" type="text/javascript"></script>
        <script src="../plugin/ttw-music-player-min.js" type="text/javascript"></script>
        <script src="../javascript/myplaylist.js" type="text/javascript"></script>
        <script src="../javascript/WSCalls.js" type="text/javascript"></script>
        <script>
            $(function(){
               putEmpleados();
            });
        </script>
        
        </head>
    <body>
        <%@include  file ="cabecera.jsp" %>
        <script src="../js-charts/highcharts.js"></script>
        <script src="../js-charts/highcharts-3d.js"></script>
        <script src="../js-charts/modules/exporting.js"></script>
        <script src="../js-charts/highcharts-more.js"></script>
        <script src="../js-charts/modules/data.js"></script>
        <nav id="leftMenu">
            <div class="user">
                <table border="0">
                    <tbody>
                        <tr>
                            <td>
                                <img src="../images/Icon-user.png" width="50" height="50" alt="Icon-user"/>
                            </td>
                            <td id="welcomUser">
                                <p id="welcom">Welcome</p>
                                <p id="username"><% out.print(session.getAttribute("user")); %></p>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </div>
            <ul id="opcionList">
                <li class="opcion">
                    <div class="barra"></div>
                    <div class="menu" id="linkhome">
                         <a  class="menu" href="home.jsp">Home</a>
                    </div>     
                </li>
                
                <li class="opcion">
                    <div class="barra"></div>
                    <div class="menu">
                        <a  class="menu" href="statistics.jsp">Empleados y salarios</a>
                    </div> 
                </li>
                
                <li class="opcion">
                    <div class="barra"></div>
                    <div class="menu">
                        <a  class="menu" href="departamentos.jsp">Departamentos</a>
                    </div> 
                </li>
                
                <li class="opcion">
                    <div class="barra"></div>
                    <div class="menu" id="hold">
                        <a  class="menu" id="holdLi" href="datospersonales.jsp">Datos Personales</a>
                    </div> 
                </li>
                <li>
                    <div class="barra"></div>
                    <div class="menu_1">
                        <div class="menu_1" id="num_empleados"></div>
                    </div>
                </li>
            </ul>
            <div id="bottomOr"></div>
            
        </nav>
        <div id="main">
            <div id="menuTop">
                <h1 id="titledash">Datos Personales</h1>
                    <script type="text/javascript">
                     $(document).ready(function(){
                        var description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id tortor nisi. Aenean sodales diam ac lacus elementum scelerisque. Suspendisse a dui vitae lacus faucibus venenatis vel id nisl. Proin orci ante, ultricies nec interdum at, iaculis venenatis nulla. ';

                        $( "#menuTop").ttwMusicPlayer(myPlaylist, {
                            autoPlay:false, 
                            description:description,
                            jPlayer:{
                                swfPath:'../plugin/jquery-jplayer' //You need to override the default swf path any time the directory structure changes
                            }
                        });
                    });
                    </script>
                    
            </div>
            
            <div id="content2">
                    <table border="0" class="emplCell1">
                        <tbody>
                            <tr class="loginCell">
                                <td id="logInTitle">Introduce número de empleado</td>
                            </tr>
                            <tr class="loginCell">
                                <td>
                                    <input type="text" name="userBox" id="empl_no" value="10001" onblur="onBlur(this)" onfocus="onFocus(this)" />
                                </td>
                            </tr>
                            <tr class="loginCell">
                                <td>
                                    <input type="submit" value="Busca empleado" name="buscaEmpleado" id="buscaEmpleado" onclick="buscaEmpleado()"/>
                                </td>
                            </tr>
                            
                        </tbody>
                    </table>
                    <table border="0" class="loginCell">
                        <tbody>
                            <tr>
                                <td>
                                    <table border="0" class="loginCell">
                                        <tbody>
                                            <tr class="loginCell">
                                                <td id="datoEmployeeA">
                                                    <div id="divEmployeeA"></div>
                                                </td>
                                                <td id="datoEmployee1">
                                                    <div id="divEmployee1"></div>
                                                </td>
                                            </tr>
                                            <tr class="loginCell">
                                                <td id="datoEmployeeB">
                                                    <div id="divEmployeeB"></div>
                                                </td>
                                                <td id="datoEmployee2">
                                                    <div id="divEmployee2"></div>
                                                </td>
                                            </tr>
                                            <tr class="loginCell">
                                                <td id="datoEmployeeC">
                                                    <div id="divEmployeeC"></div>
                                                </td>
                                                <td id="datoEmployee3">
                                                    <div id="divEmployee3"></div>
                                                </td>
                                            </tr>
                                            <tr class="loginCell">
                                                <td id="datoEmployeeD">
                                                    <div id="divEmployeeD"></div>
                                                </td>
                                                <td id="datoEmployee4">
                                                    <div id="divEmployee4"></div>
                                                </td>
                                            </tr>
                                            <tr class="loginCell">
                                                <td id="datoEmployeeE">
                                                    <div id="divEmployeeE"></div>
                                                </td>
                                                <td id="datoEmployee5">
                                                    <div id="divEmployee5"></div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                                <td id="imagetd">
                                </td>
                            </tr>
                        </tbody>
                    </table>
            </div>
            
        </div>
            
    </body>
</html>
