<%-- 
    Document   : adauga_Consultatie
    Created on : Nov 22, 2016, 6:19:27 PM
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
        <div id="add">
            <h1> Adauga o noua consultatie </h1>
            <form action="ConsultatieController" method="GET">
                <table>
                    <tr>
                        <td> Pacient: </td>
                        <td>
                            <select name="idPacient">
                                <c:forEach items="${listaPacienti}" var="pacienti">
                                    <option value="${pacienti.idPacient}">${pacienti.idPacient}, ${pacienti.nume}, ${pacienti.prenume}, ${pacienti.adresa}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td> Medic: </td>
                        <td>
                            <select name="idMedic">
                                <c:forEach items="${listaMedici}" var="medici">
                                    <option value="${medici.idMedic}">${medici.idMedic}, ${medici.nume}, ${medici.prenume}, ${medici.sectie}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td> Data Consultatie: </td>
                        <td><input type="text" name="dataConsultatie"></td>
                    </tr>
                    <tr>
                        <td> Diagnostic: </td>
                        <td><input type="text" name="diagnostic"></td>
                    </tr>
                    <tr>
                        <td> Tratament: </td>
                        <td><input type="text" name="tratament"></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="adaugaConsultatie" value="Adauga"></td>

                    </tr>
                </table>
            </form>
        </div>

        <form action="ConsultatieController" method="POST">
            <input type="submit" name="afiseazaConsultatie" value="Afiseaza"> &nbsp; &nbsp;<br>
        </form>
        <br>
        <a href="index.html"><b>Home</b></a>
    </body>
</html>
