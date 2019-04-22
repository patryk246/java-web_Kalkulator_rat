<%-- 
    Document   : body
    Created on : 2019-03-13, 20:49:24
    Author     : Patryk
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="loan" class="pl.pollub.LoanBean" scope="session" />
<!DOCTYPE html>
<html>
  <body>
        <% 
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date now = new Date(); 
        %>
        Dziś jest <%= dateFormat.format(now)%>,
        
        
        
        
        <h1>Kalkulator rat</h1><br>
        <form>          
            Kwota pożyczki:<input type="number" name="amount"><br>
            Oprocentowanie:<input type="number" name="percentPerYear"><br>
            Liczba rat:<input type="number" name="numberOfInstalment"><br>
            <input type="submit" value="Oblicz">
        </form>
        <br>
        
       <!-- Obliczanie raty w skryptlecie -->
       <%-- <%
            if(request.getParameter("amount")!=null && request.getParameter("percentPerYear")!=null && request.getParameter("numberOfInstalment")!=null)
            {
                double amount = Double.parseDouble(request.getParameter("amount"));
                double percentPerYear = Double.parseDouble(request.getParameter("percentPerYear"))/100;
                double numberOfInstalment = Double.parseDouble(request.getParameter("numberOfInstalment"));
                double valueOfInstalment=0;
                double percentPerMonth=percentPerYear/12;
                valueOfInstalment=(amount*percentPerMonth)/(1-(1/(Math.pow((1+percentPerMonth),numberOfInstalment))));
        %>
        Miesięczna rata do spłaty: <%= String.valueOf(valueOfInstalment) %> <br><br>
        <%
            }
        %>--%>
        
       <!-- Obliczanie raty w komponencie -->
       <%
        if(request.getParameter("amount")!=null && request.getParameter("percentPerYear")!=null && request.getParameter("numberOfInstalment")!=null)
            {
       %>
       <jsp:setProperty name="loan" property="*" />
       Miesięczna rata do spłaty: <%= loan.getInstalment() %> <br><br>
       <%
            }
       %>
        
        
        <%! private int count = 1, countSession = 1; %>               
        <% session = request.getSession(); 
           if(session.getAttribute("countSession")==null){
               session.setAttribute("countSession", "1");
               countSession=1;
           }
           else{
               countSession = Integer.parseInt((String)session.getAttribute("countSession"));
               countSession++;
               session.setAttribute("countSession", String.valueOf(countSession));
           }
        %>
        Strona była odwiedzana <%= countSession %> raz(y) w tej sesji, oraz <%= count++ %> raz(y) od momentu uruchomienia aplikacji<br>
        <%= response.encodeURL( request.getContextPath() + "/subpage.html") %>

    </body>
</html>
