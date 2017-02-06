<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String userVar = request.getParameter( "user" );
            String passVar = request.getParameter( "pass" );
            String lvlVar = request.getParameter( "lvl" );
            if(userVar!=null && passVar!=null && lvlVar!=null){
                session.setAttribute("user",userVar);
                session.setAttribute("pass",passVar);
                session.setAttribute("lvl",lvlVar);
            }
            // Si es una página de la intranet y no permiso redirecciona al inicio
            String s = request.getRequestURI();
            if (s.contains("/private/")) {
                String user = (String) session.getAttribute("user");
                String pass = (String) session.getAttribute("pass");
                String lvl = (String) session.getAttribute("lvl");
                if ((user == null) || (pass == null)) {
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", request.getContextPath() + "/index.jsp");
                } else {
                    if ((!(lvl.equals("3"))) && (s.contains("/private/gestion.jsp"))) {
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", request.getContextPath() + "/private/home.jsp");
                    }
                }
            }
        %>
    </body>
</html>
