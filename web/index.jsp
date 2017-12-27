<%-- 
    Document   : index
    Created on : Dec 26, 2017, 7:58:07 PM
    Author     : Tuhsar Pahuja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Selecting specific data from a DB</title>
    </head>
    <body>
        <h1>Selecting specific data from a DB</h1>
        <form name="myForm" action="display.jsp" method="POST">
        </form>
        <table border="0">
           
            <tbody>
                <tr>
                    <td>First Name: </td>
                    <td><input type="text" name="firstName" value="" size="50"/></td>
                </tr>
                <tr>
                    <td>Last Name: </td>
                    <td><input type="text" name="lastName" value="" size="50"/></td>
                </tr>
            </tbody>
        </table>
        <input type="reset" value="Clear" name="clear" />
        <input type="submit" value="Submit" name="Submit" />

    </body>
</html>
