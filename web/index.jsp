<%-- 
    Document   : index
    Created on : 2019-03-11, 22:36:03
    Author     : Patryk
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="head.jsp" />
<body>
    <%!
            String wasPageVisited(Cookie [] cookies){
                String cookieVisit="cookieVisit", response="";
                boolean isCookie=false;
                int i=0;
                if(cookies!=null){
                for(i=0;i<cookies.length;i++){
                    Cookie c = cookies[i];
                    if(c.getName().equals(cookieVisit)){
                        response="Witaj po raz kolejny";            
                        isCookie=true;
                        break;
                    }                 
                }
                }
                if(!isCookie){
                    response="Witaj po raz pierwszy";
                }
                return response;
        }
        %>
        
        <% Cookie [] cookies = request.getCookies(); %>
        <%= wasPageVisited(cookies) %>
        <% 
            String cookieVisit="cookieVisit";
            Cookie cookie = new Cookie(cookieVisit, "1");
            response.addCookie(cookie);
            
        %>
        <br>
        <jsp:include page="body.jsp" />
</body>


<!DOCTYPE html>
<html>
    
    
</html>
