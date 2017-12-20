<%-- 
    Document   : adauga_Pacient
    Created on : Nov 22, 2016, 6:19:27 PM
    Author     : vali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pacienti</title>
    </head>
    <body>

        <div id="add">
            <h1> Adauga pacient </h1>
            <form action="PacientiController" method="GET">
                <table>
                    <tr>
                        <td> Nume Pacient: </td>
                        <td><input type="text" name="nume"></td>
                    </tr>
                    <tr>
                        <td> Prenume Pacient: </td>
                        <td><input type="text" name="prenume"></td>
                    </tr>
                    <tr>
                        <td> Adresa Pacient: </td>
                        <td><input type="text" name="adresa"></td>
                    </tr>
                    <tr>
                        <td> Varsta Pacient: </td>
                        <td><input type="text" name="varsta"></td>
                    </tr>
                    <tr>
                        <td> Telefon Pacient: </td>
                        <td><input type="text" name="telefon"></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="adaugaPacient" value="Adauga"></td>

                    </tr>
                </table>
            </form>
        </div>

        <form action="PacientiController" method="POST">
            <input type="submit" name="afiseazaPacienti" value="Afiseaza"> &nbsp; &nbsp;<br>
        </form>
        <br>
        <a href="index.html"><b>Home</b></a>
    </body>
</html>
