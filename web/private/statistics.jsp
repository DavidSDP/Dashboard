
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados y salarios</title>
        <link rel="stylesheet" href="../css/style.css"/>
        <link rel="stylesheet" type="text/css" href="../plugin/css/style.css">
        <script src="../javascript/jquery-1.6.1.min.js" type="text/javascript"></script>
        <script src="../plugin/jquery-jplayer/jquery.jplayer.js" type="text/javascript"></script>
        <script src="../plugin/ttw-music-player-min.js" type="text/javascript"></script>
        <script src="../javascript/myplaylist.js" type="text/javascript"></script>
        <script src="../javascript/WSCalls.js" type="text/javascript"></script>
        
            <%// DataChart chartArea = DBActions.getSalaryEmploy(); %>
            <script type="text/javascript">
                $(function () {
                    putEmpleados();
                });
            
            
            </script>
    </head>
    <body>
        <%@include file ="cabecera.jsp" %>
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
                    <div class="menu" id="hold">
                        <a  class="menu" id="holdLi" href="statistics.jsp">Empleados y salarios</a>
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
                    <div class="menu">
                        <a  class="menu" href="datospersonales.jsp">Datos Personales</a>
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
                <h1 id="titledash">Empleados y salarios</h1>
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
            <div id="content1">

                    <table border="0" class="emplCell1">
                        <tbody>
                            <tr class="loginCell">
                                <td id="logInTitle">Inserte empleado</td>
                            </tr>
                            <tr class="loginCell">
                                <td>
                                    <input type="text" name="empl_no" id="empl_no1" value="10001" onblur="onBlur(this)" onfocus="onFocus(this)" />
                                </td>
                            </tr>
                            <tr class="loginCell">
                                <td>
                                    <input type="submit" value="Añadir" name="emplButton" id="emplButton" onclick="actualizaChart()" />
                                </td>
                            </tr>
                        </tbody>
                    </table>

            </div>
            <div id="content2">
                <table border="0" id="tableChart">
                    <tbody>
                        <tr>
                            <td class="celltable">
                                <div id="containerArea"></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
        </div>
            
    </body>
</html>
