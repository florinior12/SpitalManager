<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="theme.css" type="text/css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src ="http://code.jquery.com/jquery-latest.min.js" ></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <script>
        $( function() {
            $( "#dataInput" ).datepicker({ dateFormat: 'yy-mm-dd' });
          } );
        function getData(){
            $.getJSON("PacientiController",function(responseJson){
                   $('#selectIdPacient').empty();
                   $.each(responseJson, function(index, value) {
                        $('#load').hide();
                        
                        $('#selectIdPacient').append('<a href=# class="dropdown-item" value=' + value.id + '>' + value.id + " " + value.nume +  " " + value.prenume +  '</a>');
                   });
                });
                
            $.getJSON("MediciController",function(responseJson){
                   $('#selectIdMedic').empty();
                   $.each(responseJson, function(index, value) {
                        $('#load').hide();
                        
                        $('#selectIdMedic').append('<a href=# class="dropdown-item" value=' + value.id + '>' + value.id + " " + value.nume +  " " + value.prenume +  '</a>');
                   });
                });
                
            $.getJSON("ConsultatieController",function(responseJson){
                   $("#selectIdConsultatie").empty();
                   $("#consultatiiTable").find('tbody').empty();
                   $.each(responseJson, function(index, value) {
                        $('#load').hide();
                        $("#consultatiiTable").find('tbody')
                                .append($('<tr>')
                                    .append($('<td>')
                                        .attr('id', 'idTabel')
                                        .text(value.id)
                                        )
                                    .append($('<td>')
                                        .attr('id', 'medicTabel')
                                        .text(value.medic)
                                        )
                                    .append($('<td>')
                                        .attr('id', 'pacientTabel')
                                        .text(value.pacient)
                                        )
                                    .append($('<td>')
                                        .attr('id', 'data')
                                        .text(value.data)
                                        )
                                    .append($('<td>')
                                        .attr('id', 'diagnostic')
                                        .text(value.diagnostic)
                                        )
                                    .append($('<td>')
                                        .attr('id', 'tratament')
                                        .text(value.tratament)
                                        )
                                    .append($('<td>')
                                        
                                        .append($('<a>')
                                            .append($('<i>')
                                                .attr('class', 'fa fa-fw fa-times'))
                                            .attr('class', 'btn btn-outline-primary')
                                     
                                        )
                                        
                                    )   
                                );
                        $('#selectIdConsultatie').append('<a href=# class="dropdown-item" value=' + value.id + '>' + value.id + " " + value.medic +  " " + value.data +  '</a>');
                   });
                });
        }
            $(document).ready(function() {
                
                
                getData();
                $('#adaugaConsultatie').on("click", function () {
                        
                        $.post("ConsultatieController",
                        {
                            action: "add",
                            medicToAdd: $("#selectedMedic").text(),
                            pacientToAdd:  $("#selectedPacient").text(),
                            dataToAdd: $("#dataInput").val(),
                            tratamentToAdd: $("#tratamentInput").val(),
                            diagnosticToAdd: $("#diagnosticInput").val()
                        },
                            getData());
                            $("#dataInput").val("");
                            $("#tratamentInput").val("");
                            $("#diagnosticInput").val("");
                });
                $("#consultatiiTable").on('click', '.btn-outline-primary', function () {
                    var $id = $(this).closest("tr")   // Finds the closest row <tr> 
                       .find("#idTabel")     // Gets a descendent with class="nr"
                       .text() ;
                    $.post("ConsultatieController",
                        {
                            action: "delete",
                            id: $id
                        },
                            getData());
                });
                
                $('#modificaConsultatie').on("click", function () {
                        console.log($("#selectedConsultatie").html());
                        $.post("ConsultatieController",
                        {
                            action: "update",
                            idToUpdate: $("#selectedConsultatie").html(),
                            medicToAdd: $("#selectedMedic").text(),
                            pacientToAdd:  $("#selectedPacient").text(),
                            dataToAdd: $("#dataInput").val(),
                            tratamentToAdd: $("#tratamentInput").val(),
                            diagnosticToAdd: $("#diagnosticInput").val()
                        },
                            getData());
                            $("#dataInput").val("");
                            $("#tratamentInput").val("");
                            $("#diagnosticInput").val("");
                    
                });
                $('#selectIdMedic').on("click", ".dropdown-item", function () {
                        $("#selectedMedic").html($(this).text());
                });
                $('#selectIdPacient').on("click", ".dropdown-item", function () {
                        $("#selectedPacient").html($(this).text());
                });
                $('#selectIdConsultatie').on("click", ".dropdown-item", function () {
                        $("#selectedConsultatie").html($(this).text());
                });
            });
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
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
              <a class="nav-link" href="medici.jsp"><i class="fa fa-fw fa-user-md"></i>&nbsp;Medici</a>
            </li>
            <li class="nav-item">
              <a href="consultatii.jsp" class="active nav-link"><i class="fa fa-fw fa-calendar"></i>&nbsp;Consultatii</a>
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
          <h1 class="">Consultatii</h1>
          
        <div id="somediv"></div>
          
        </div>
      </div>
    </div>
  </div>
   <div class="py-3"><div class="container"><div class="row"><div class="col-md-12"><table class="table" id="consultatiiTable">
    <thead>
      <tr>
        <th>#</th>
        <th>Medic</th>
        <th>Pacient</th>
        <th>Data</th>
        <th>Diagnostic</th>
        <th>Tratament</th>
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
            <div class="btn-group">
                <button id="selectedMedic" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Selecteaza Medic</button>
                <div id = "selectIdMedic" class="dropdown-menu">
                </div>
            </div>
            <div class="btn-group">
                <button id="selectedPacient" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Selecteaza Pacient</button>
                <div id = "selectIdPacient" class="dropdown-menu">
               
                </div>
            </div>
            <div class="form-group"> <label>Data</label>
              <input id="dataInput" type="text"  class="form-control" placeholder="Data"> </div>
            <div class="form-group"> <label>Diagnostic</label>
              <input id="diagnosticInput" type="text"  class="form-control" placeholder="Diagnostic"> </div>
            <div class="form-group"><label class="form-control-label">Tratament</label>
              <input id="tratamentInput" type="text"  class="form-control" placeholder="Tratament">
            </div>
            <br>
            
            <button type="submit" id="adaugaConsultatie" class="btn btn-primary">Adauga</button>
            <button type="submit" id="modificaConsultatie" class="btn btn-primary">Modifica</button>
            <div class="btn-group">
                <button id="selectedConsultatie" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Selecteaza Consultatie</button>
                <div id = "selectIdConsultatie" class="dropdown-menu">
               
                </div>
            </div>
        </div>
         
      </div>
    </div>
  </div>
      
    
  
  
</body></html>