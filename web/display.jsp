<%-- 
    Document   : display
    Created on : Dec 26, 2017, 8:23:23 PM
    Author     : Tuhsar Pahuja
--%>
<%@page import ="java.sql.*" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Selecting specific data from a DB</title>
    </head>
    <body>
        <h1>Selecting specific data from a DB</h1>
        <%!
          public class Actor{
                String URL = "jdbc:mysql://localhost:3306/sakila";
                String USERNAME = "root";
                String PASSWORD = "Tushar123%";
                
                Connection connection = null;
                PreparedStatement selectActors = null;
                ResultSet resultSet = null;

                Actor(){
                    
                    try{
                        
                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                        selectActors = connection.prepareCall(
                            "SELECT a.first_name, a.last_name, c.title" 
                            + "FROM actor a, film_actor b, film c"
                            + "WHERE a.first_name =?" 
                            + "AND a.last_name = ?" 
                            + "AND a.actor_id = b.actor_id"
                            + "AND b.film_id = c.film_id");
                            

                    } catch(SQLException e){
                        
                        e.printStackTrace();

                       }
                

                }

                public ResultSet getActors(String first, String last){
                
                    try{
                        selectActors.setString(1, first);
                        selectActors.setString(2, last);
                        resultSet = selectActors.executeQuery();

                    } catch(SQLException e){

                        e.printStackTrace();
                      }
                       
                      return resultSet;

                }
            }
        
        
        %>
        <%
            String firstName = new String();
            String lastName = new String();
            
            if(request.getParameter("first") != null){
            
            firstName = request.getParameter("first");
            
            }
            
            if(request.getParameter("last") != null){
            
            lastName = request.getParameter("last");
            
            }
            Actor actor = new Actor();
            ResultSet actors = actor.getActors(firstName, lastName);
        %>
        <table border="1">
            
            <tbody>
                <tr>
                    <td>First Name</td>
                    <td>Last Name</td>
                    <td>Title</td>
                </tr>
                <% while (actors.next()) { %>
                <tr>
                    <td><%= actors.getString("first_name")%></td>
                    <td><%= actors.getString("last_name")%></td>
                    <td><%= actors.getString("title")%></td>
                </tr>
                <% } %>
            </tbody>
        </table>


    </body>
</html>
