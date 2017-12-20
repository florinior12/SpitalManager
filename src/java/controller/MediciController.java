/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import pojo.*;
import implementation.*;
import java.io.*;
import java.util.logging.*;


/**
 *
 * @author vali
 */
public class MediciController extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Thread.sleep(100);
        } catch (InterruptedException ex) {
            Logger.getLogger(PacientiController.class.getName()).log(Level.SEVERE, null, ex);
        }
        MediciDaoImpl medicDaoImpl = new MediciDaoImpl();
        JsonArray jsonArray = new JsonArray();
        JsonObject jsonObj;
        ArrayList<Medici> listaMedici = new ArrayList<Medici>();
        listaMedici = (ArrayList) medicDaoImpl.afiseazaMedici();
        for (Medici m : listaMedici){
            jsonObj = new JsonObject();
            jsonObj.addProperty("nume", m.getNume());
            jsonObj.addProperty("prenume", m.getPrenume());
            jsonObj.addProperty("id", m.getIdMedic());
            jsonObj.addProperty("sectie", m.getSectie());
            
            jsonArray.add(jsonObj);
            
        }
        String json = new Gson().toJson(jsonArray);
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        out.println(json);

        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MediciDaoImpl medicDaoImpl = new MediciDaoImpl();
        if (request.getParameter("action").equals("add")){
            Medici medicToAdd = new Medici(request.getParameter("numeToAdd"),
                        request.getParameter("prenumeToAdd"),
                        request.getParameter("sectieToAdd"));
            
            medicDaoImpl.adaugaMedici(medicToAdd);
            response.getWriter().println("Adaugat!");
        } else if (request.getParameter("action").equals("delete")) {
            Medici medicToDelete = new Medici();
            medicToDelete.setIdMedic(Integer.parseInt(request.getParameter("id")));
            medicDaoImpl.stergeMedic(medicToDelete);
        } else if (request.getParameter("action").equals("update")) {
            medicDaoImpl.modificaMedici(Integer.parseInt(request.getParameter("idToUpdate")),
                        request.getParameter("numeToAdd"),
                        request.getParameter("prenumeToAdd"),
                        request.getParameter("sectieToAdd"));
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
