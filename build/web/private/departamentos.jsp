<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Departamentos</title>
        <link rel="stylesheet" href="../css/style.css"/>
        <link rel="stylesheet" type="text/css" href="../plugin/css/style.css">
        <script src="../javascript/jquery-1.6.1.min.js" type="text/javascript"></script>
        <script src="../plugin/jquery-jplayer/jquery.jplayer.js" type="text/javascript"></script>
        <script src="../plugin/ttw-music-player-min.js" type="text/javascript"></script>
        <script src="../javascript/myplaylist.js" type="text/javascript"></script>
        <script src="../javascript/WSCalls.js" type="text/javascript"></script>
        <script>
            function clickPolar(){
                actualizaDepartamentos('0');
            }
            function clickBarras(){
                actualizaDepartamentos('1');
            }
            $(function(){
               putEmpleados();
               actualizaDepartamentos('0');
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
                    <div class="menu" id="hold">
                        <a  class="menu" id="holdLi" href="departamentos.jsp">Departamentos</a>
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
                <h1 id="titledash">Departamentos</h1>
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
            
            <div id="contentdepart">
                <table border="0" id="tableChart">
                    <tbody>
                        <tr>
                            <td class="celltable">
                                <div id="containerArea"></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table>
                    <tbody>
                        
                        <tr>
                            <td>  
                                <button type="button" id="chartButton1" onclick="clickPolar()">Polar</button>
                            </td>
                            <td>  
                                <button type="button" id="chartButton2" onclick="clickBarras()">Barras</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
            </div>
            
        </div>
            
    </body>
</html>
