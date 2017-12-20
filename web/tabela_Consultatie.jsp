<%-- 
    Document   : tabela_Consultatie
    Created on : Nov 22, 2016, 6:20:29 PM
    Author     : vali
--%>

<%@page import="implementation.MediciDaoImpl"%>
<%@page import="implementation.PacientiDaoImpl"%>
<%@page import="pojo.Medici"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Pacienti"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultatie</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#stergeConsultatie").hide();
                $("#modificaConsultatie").hide();

                $("#update").click(function () {
                    $("#modificaConsultatie").show();
                    $("#stergeConsultatie").hide();
                });
                $("#delete").click(function () {
                    $("#stergeConsultatie").show();
                    $("#modificaConsultatie").hide();
                });
            });
        </script>

    </head>
    <body>
        <%
            PacientiDaoImpl pacientDaoImpl = new PacientiDaoImpl();
            MediciDaoImpl medicDaoImpl = new MediciDaoImpl();
            List<Pacienti> listaPacienti = new ArrayList();
            listaPacienti = pacientDaoImpl.afiseazaPacienti();
            List<Medici> listaMedici = new ArrayList();
            listaMedici = medicDaoImpl.afiseazaMedici();
            request.setAttribute("listaPacienti", listaPacienti);
            request.setAttribute("listaMedici", listaMedici);
        %>
        <h1 align="center"> Tabela Consultatie:</h1> 
        <table border="1" align="center">
            <tr>
                <td><b>IdConsultatie:</b></td>
                <td><b>IdPacient:</b></td>
                <td><b>Nume pacient:</b></td>
                <td><b>Prenume pacient:</b></td>
                <td><b>Telefon:</b></td>
                <td><b>IdMedic:</b></td>
                <td><b>Nume medic:</b></td>
                <td><b>Prenume medic:</b></td>
                <td><b>Sectie:</b></td>
                <td><b>DataConsultatie:</b></td>
                <td><b>Diagnostic:</b></td>
                <td><b>Tratament</b></td>
            </tr>
            <c:forEach var="consultatie" items="${listaConsultatie}">
                <tr>
                    <td>${consultatie.idConsultatie}</td>
                    <td>${consultatie.pacienti.idPacient}</td>
                    <td>${consultatie.pacienti.nume}</td>
                    <td>${consultatie.pacienti.prenume}</td>
                    <td>${consultatie.pacienti.telefon}</td>
                    <td>${consultatie.medici.idMedic}</td>
                    <td>${consultatie.medici.nume}</td>
                    <td>${consultatie.medici.prenume}</td>
                    <td>${consultatie.medici.sectie}</td>
                    <td>${consultatie.data}</td>
                    <td>${consultatie.diagnostic}</td>
                    <td>${consultatie.tratament}</td>
                </tr>
            </c:forEach>
        </table>
        <form action="ConsultatieController" method="POST">
            <p align="center">
                Modifica: <input type="checkbox" id="update"> Sterge: <input type="checkbox" id="delete" onclick="document.getElementById('idpacient').disabled = this.checked;
                        document.getElementById('idmedic').disabled = this.checked;
                        document.getElementById('dataConsultatie').disabled = this.checked;
                        document.getElementById('diagnostic').disabled = this.checked;
                        document.getElementById('medicament').disabled = this.checked;"><br><br>
                idconsultatie:
                <select name="idconsultatie">
                    <c:forEach items="${listaConsultatie}" var="consultatie">
                        <option value="${consultatie.idConsultatie}">${consultatie.idConsultatie}</option>
                    </c:forEach>
                </select>
                <br><br>
                idpacient:
                <select name="idpacient">
                    <c:forEach items="${listaPacienti}" var="pacienti">
                        <option value="${pacienti.idPacient}">${pacienti.idPacient}, ${pacienti.nume}, ${pacienti.prenume}</option>
                    </c:forEach>
                </select>
                <br><br>
                idmedic:
                <select name="idmedic">
                    <c:forEach items="${listaMedici}" var="medici">
                        <option value="${medici.idMedic}">${medici.idMedic}, ${medici.nume}, ${medici.prenume}</option>
                    </c:forEach>
                </select>
                <br><br>
                Modifica data consultatiei: <input id="nume" type="text" name="dataConsultatie"><br><br>
                Modifica diagnosticul: <input id="prenume" type="text" name="diagnostic"> <br><br>
                Modifica medicametul: <input id="sectie" type="text" name="medicament"> <br><br>
                <button type="submit" id="modificaConsultatie" name="modificaConsultatie"> Modifica</button> <br> <br>
                <button type="submit" id="stergeConsultatie" name="stergeConsultatie"> Sterge </button>
            </p>
        </form>
        <br>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
        </p>
    </body>
</html>
