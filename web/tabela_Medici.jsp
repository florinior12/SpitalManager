<%-- 
    Document   : tabela_Medici
    Created on : Nov 22, 2016, 6:20:29 PM
    Author     : vali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Medici</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#stergeMedic").hide();
                $("#modificaMedic").hide();

                $("#update").click(function () {
                    $("#modificaMedic").show();
                    $("#stergeMedic").hide();
                });
                $("#delete").click(function () {
                    $("#stergeMedic").show();
                    $("#modificaMedic").hide();
                });
            });
        </script>

    </head>
    <body>
        <h1 align="center"> Tabela Medici:</h1> 
        <table border="1" align="center">
            <tr>
                <td><b>IdMedic:</b></td>
                <td><b>Nume:</b></td>
                <td><b>Prenume:</b></td>
                <td><b>Sectie:</b></td>
            </tr>
            <c:forEach var="medici" items="${listaMedici}">
                <tr>
                    <td>${medici.idMedic}</td>
                    <td>${medici.nume}</td>
                    <td>${medici.prenume}</td>
                    <td>${medici.sectie}</td>

                </tr>
            </c:forEach>
        </table>
        <form action="MediciController" method="POST">
            <p align="center">
                Modifica: <input type="checkbox" id="update"> Sterge: <input type="checkbox" id="delete" onclick="document.getElementById('nume').disabled = this.checked;
                        document.getElementById('prenume').disabled = this.checked;
                        document.getElementById('sectie').disabled = this.checked;"><br><br>
                <select name="idmedic">
                    <c:forEach items="${listaMedici}" var="medici">
                        <option value="${medici.idMedic}">${medici.idMedic}</option>
                    </c:forEach>
                </select>
                <br><br>
                Modifica Nume: <input id="nume" type="text" name="nume"><br><br>
                Modifica Prenume: <input id="prenume" type="text" name="prenume"> <br><br>
                Modifica Sectie: <input id="sectie" type="text" name="sectie"> <br><br>
                <button type="submit" id="modificaMedic" name="modificaMedic"> Modifica</button> <br> <br>
                <button type="submit" id="stergeMedic" name="stergeMedic"> Sterge </button>
            </p>
        </form>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
        </p>
    </body>
</html>
