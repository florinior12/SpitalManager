<%-- 
    Document   : tabela_Pacienti
    Created on : Nov 22, 2016, 6:20:29 PM
    Author     : vali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pacienti</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#stergePacient").hide();
                $("#modificaPacient").hide();

                $("#update").click(function () {
                    $("#modificaPacient").show();
                    $("#stergePacient").hide();
                });
                $("#delete").click(function () {
                    $("#stergePacient").show();
                    $("#modificaPacient").hide();
                });
            });
        </script>

    </head>
    <body>
        <h1 align="center"> Tabela Pacienti:</h1> 
        <table border="1" align="center">
            <tr>
                <td><b>IdPacient:</b></td>
                <td><b>Nume:</b></td>
                <td><b>Prenume:</b></td>
                <td><b>Telefon:</b></td>
                <td><b>Adresa:</b></td>
                <td><b>Varsta:</b></td>
            </tr>
            <c:forEach var="pacienti" items="${listaPacienti}">
                <tr>
                    <td>${pacienti.idPacient}</td>
                    <td>${pacienti.nume}</td>
                    <td>${pacienti.prenume}</td>
                    <td>${pacienti.telefon}</td>
                    <td>${pacienti.adresa}</td>
                    <td>${pacienti.varsta}</td>
                </tr>
            </c:forEach>
        </table>
        <form action="PacientiController" method="POST">
            <p align="center">
                Modifica: <input type="checkbox" id="update"> Sterge: <input type="checkbox" id="delete" onclick="
                        document.getElementById('nume').disabled = this.checked;
                        document.getElementById('prenume').disabled = this.checked;
                        document.getElementById('telefon').disabled = this.checked;
                        document.getElementById('adresa').disabled = this.checked;
                        document.getElementById('varsta').disabled = this.checked;"><br><br>
                <select name="idPacient">
                    <c:forEach items="${listaPacienti}" var="pacienti">
                        <option value="${pacienti.idPacient}">ID: ${pacienti.idPacient}</option>
                    </c:forEach>
                </select>
                <br><br>
                Modifica Nume: <input id="nume" type="text" name="nume"><br><br>
                Modifica Prenume: <input id="prenume" type="text" name="prenume"> <br><br>
                Modifica Telefon: <input id="telefon" type="text" name="telefon"> <br><br>
                Modifica Adresa: <input id="adresa" type="text" name="adresa"> <br><br>
                Modifica Varsta: <input id="varsta" type="text" name="varsta"> <br><br>
                <button type="submit" id="modificaPacient" name="modificaPacient"> Modifica</button> <br> <br>
                <button type="submit" id="stergePacient" name="stergePacient"> Sterge </button>
            </p>
        </form>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
        </p>
    </body>
</html>
