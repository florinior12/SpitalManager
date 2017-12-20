/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.*;
import util.HibernateProxyTypeAdapter;
import implementation.*;
import java.util.*;
import javax.servlet.RequestDispatcher;
import com.google.gson.*;
import com.google.gson.reflect.TypeToken;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author flori
 */
public class PacientiController extends HttpServlet {
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Thread.sleep(100);
        } catch (InterruptedException ex) {
            Logger.getLogger(PacientiController.class.getName()).log(Level.SEVERE, null, ex);
        }
        PacientiDaoImpl pacientDaoImpl = new PacientiDaoImpl();
        JsonArray jsonArray = new JsonArray();
        JsonObject jsonObj;
        ArrayList<Pacienti> listaPacienti = new ArrayList<Pacienti>();
        listaPacienti = (ArrayList) pacientDaoImpl.afiseazaPacienti();
        for (Pacienti p : listaPacienti){
            jsonObj = new JsonObject();
            jsonObj.addProperty("nume", p.getNume());
            jsonObj.addProperty("prenume", p.getPrenume());
            jsonObj.addProperty("id", p.getIdPacient());
            jsonObj.addProperty("adresa", p.getAdresa());
            jsonObj.addProperty("telefon", p.getTelefon());
            jsonObj.addProperty("varsta", p.getVarsta());
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
        PacientiDaoImpl pacientDaoImpl = new PacientiDaoImpl();
        if (request.getParameter("action").equals("add")){
            Pacienti pacientToAdd = new Pacienti(request.getParameter("numeToAdd"),
                        request.getParameter("prenumeToAdd"),
                        request.getParameter("telefonToAdd"),
                        request.getParameter("adresaToAdd"),
                        Integer.parseInt(request.getParameter("varstaToAdd")));
            
            pacientDaoImpl.adaugaPacienti(pacientToAdd);
            response.getWriter().println("Adaugat!");
        } else if (request.getParameter("action").equals("delete")) {
            Pacienti pacientToDelete = new Pacienti();
            pacientToDelete.setIdPacient(Integer.parseInt(request.getParameter("id")));
            pacientDaoImpl.stergePacient(pacientToDelete);
        } else if (request.getParameter("action").equals("update")) {
            pacientDaoImpl.modificaPacienti(Integer.parseInt(request.getParameter("idToUpdate")),
                        request.getParameter("numeToAdd"),
                        request.getParameter("prenumeToAdd"),
                        request.getParameter("telefonToAdd"),
                        request.getParameter("adresaToAdd"),
                        request.getParameter("varstaToAdd"));
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
