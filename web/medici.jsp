<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="theme.css" type="text/css">
    <script src ="http://code.jquery.com/jquery-latest.min.js" ></script>
    
    <script>
        function getData(){
            $.getJSON("MediciController",function(responseJson){
                   $("#mediciTable").find('tbody').empty();
                   $('#selectId').empty();
                   $.each(responseJson, function(index, value) {
                        $('#load').hide();
                        $("#mediciTable").find('tbody')
                                .append($('<tr>')
                                    .append($('<td>')
                                        .attr('id', 'idTabel')
                                        .text(value.id)
                                        )
                                    .append($('<td>')
                                        .attr('id', 'numeTabel')
                                        .text(value.nume)
                                        )
                                    .append($('<td>')
                                        .attr('id', 'numeTabel')
                                        .text(value.prenume)
                                        )
                                    .append($('<td>')
                                        .attr('id', 'numeTabel')
                                        .text(value.sectie)
                                        )
                                    .append($('<td>')
                                        
                                        .append($('<a>')
                                            .append($('<i>')
                                                .attr('class', 'fa fa-fw fa-times'))
                                            .attr('class', 'btn btn-outline-primary')
                                     
                                        )
                                        
                                    )   
                                );
                       
                        $('#selectId').append('<option value=' + value.id + '>' + value.id + " " + value.nume +  " " + value.prenume +  '</option>');
                   });
                });
        }
            $(document).ready(function() {
                
                getData();
                $('#adaugaMedic').on("click", function () {
                    
                    $.post("MediciController",
                    {
                        action: "add",
                        numeToAdd: $("#inputNume").val(),
                        prenumeToAdd:  $("#inputPrenume").val(),
                        sectieToAdd: $("#sectie").val()
                    },
                        getData());
                        $("#inputNume").val("");
                        $("#inputPrenume").val("");
                        $("#sectie").val("");
                    
                });
                $("#mediciTable").on('click', '.btn-outline-primary', function () {
                    var $id = $(this).closest("tr")   // Finds the closest row <tr> 
                       .find("#idTabel")     // Gets a descendent with class="nr"
                       .text() ;
                    $.post("MediciController",
                        {
                            action: "delete",
                            id: $id
                        },
                            getData());
                });
                
                $('#modificaMedic').on("click", function () {

                        $.post("MediciController",
                        {
                            action: "update",
                            idToUpdate: $("#selectId").val(),
                            numeToAdd: $("#inputNume").val(),
                            prenumeToAdd:  $("#inputPrenume").val(),
                            sectieToAdd: $("#sectie").val()
                        },
                            getData());
                        $("#inputNume").val("");
                        $("#inputPrenume").val("");
                        $("#sectie").val("");    
                    
                });
            });
        </script>
    </head>
    <body>
        
        
    
  </head><body class="bg-light">
    <nav class="navbar navbar-expand-md bg-primary navbar-dark">
    <div class="container">
      <a class="navbar-brand" href="#">Spital</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar2SupportedContent" aria-controls="navbar2SupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
    
        
      </div>
    </div>
  </nav>
    <div class="py-2">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <ul class="nav nav-tabs">
            <li class="nav-item">
              <a href="pacienti.jsp" class="nav-link"><i class="fa fa-user"></i>&nbsp;Pacienti</a>
            </li>
            <li class="nav-item">
              <a class="active nav-link" href="medici.jsp"><i class="fa fa-fw fa-user-md"></i>&nbsp;Medici</a>
            </li>
            <li class="nav-item">
              <a href="consultatii.jsp" class="nav-link"><i class="fa fa-fw fa-calendar"></i>&nbsp;Consultatii</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
      <div class="py-2">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1 class="">Medici</h1>      
        </div>
      </div>
    </div>
  </div>
   <div class="py-3"><div class="container"><div class="row"><div class="col-md-12"><table class="table" id="mediciTable">
    <thead>
      <tr>
        <th>#</th>
        <th>Nume</th>
        <th>Prenume</th>
        <th>Sectie</th>
        
      </tr>
    </thead>
    <tbody>
        <h5 id="load">Loading data...</h5>
    </tbody>
  </table></div></div></div></div>
     
      <div class="py-3" style="">
    <div class="container">
      <div class="row">
        <div class="col-md-6" style="">
          
            <div class="form-group"> <label>Nume</label>
              <input id="inputNume" type="text"  class="form-control" placeholder="Nume"> </div>
            <div class="form-group"> <label>Prenume</label>
              <input id="inputPrenume" type="text"  class="form-control" placeholder="Prenume"> </div>
            <div class="form-group"><label class="form-control-label">Sectie</label>
              <input id="sectie" type="text"  class="form-control" placeholder="Sectie">
            </div>
            
            <button type="submit" id="adaugaMedic" class="btn btn-primary">Adauga</button>
            <button type="submit" id="modificaMedic" class="btn btn-primary">Modifica</button>
                <select id="selectId">
                    
                </select>
          
        </div>
         
      </div>
    </div>
  </div>
      
    
  
  
</body></html>