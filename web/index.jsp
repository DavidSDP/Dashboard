<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employees Dashboard</title>
        <link rel="stylesheet" href="css/style.css"/>
        <script src="js-jquery/jquery-1.11.3.js" type="text/javascript"></script>
        <script src="javascript/WSCalls.js" type="text/javascript"></script>
        <script>
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
        </script>
    </head>
    <body id="loginBody">
        <div id="loginBox">
                <div id="loginOrange"></div>
                <div id="loginBoxMain">
                    <table border="0" class="loginCell">
                        <tbody>
                            <tr class="loginCell">
                                <td id="logInTitle">Iniciar sesión</td>
                            </tr>
                            <tr class="loginCell">
                                <td>
                                    <input type="text" name="userBox" id="userBox" value="Username" onblur="onBlur(this)" onfocus="onFocus(this)" />
                                </td>
                            </tr>
                            <tr class="loginCell">
                                <td>
                                    <input type="password" name="passBox" id="passBox" value="password" onblur="onBlur(this)" onfocus="onFocus(this)" />
                                </td>
                            </tr>
                            <tr class="loginCell">
                                <td>
                                    <input type="submit" value="Iniciar Sesion" name="loginButton" id="loginButton" onclick="logIn(document.getElementById('userBox').value,document.getElementById('passBox').value, false); return false;"/>
                                </td>
                            </tr>
                            <tr class="loginCell">
                                <td>
                                    <input type="submit" value="Entrar como invitado" name="guestButton" id="guestButton" onclick="logIn('','',true);return false;"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <form method="post" action='private/home.jsp' id="insert_form"></form>
            </div>
    </body>
</html>