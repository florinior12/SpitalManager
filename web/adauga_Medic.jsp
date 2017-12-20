<%-- 
    Document   : adauga_Medic
    Created on : Nov 22, 2016, 6:19:27 PM
    Author     : vali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Medici</title>
    </head>
    <body>

        <div id="add">
            <h1> Adauga medic </h1>
            <form action="MediciController" method="GET">
                <table>
                    <tr>
                        <td> Nume Medic: </td>
                        <td><input type="text" name="nume"></td>
                    </tr>
                    <tr>
                        <td> Prenume Medic: </td>
                        <td><input type="text" name="prenume"></td>
                    </tr>
                    <tr>
                        <td> Sectie Medic: </td>
                        <td><input type="text" name="sectie"></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="adaugaMedic" value="Adauga"></td>

                    </tr>
                </table>
            </form>
        </div>

        <form action="MediciController" method="POST">
            <input type="submit" name="afiseazaMedici" value="Afiseaza"> &nbsp; &nbsp;<br>
        </form>
        <br>
        <a href="index.html"><b>Home</b></a>
    </body>
</html>
