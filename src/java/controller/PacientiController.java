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
        }
            
        /*if (request.getParameter("modificaPacient") != null) {
            int id1 = Integer.parseInt(request.getParameter("idPacient"));
            String nume = request.getParameter("nume");
            String prenume = request.getParameter("prenume");
            String telefon = request.getParameter("telefon");
            String adresa = request.getParameter("adresa");
            int varsta = 0;
            if (!request.getParameter("varsta").equals(""))
                varsta = Integer.parseInt(request.getParameter("varsta"));
            pacientDaoImpl.modificaPacienti(id1, nume, prenume, adresa, telefon, varsta );
            
        }
        if (request.getParameter("stergePacient")!=null) {
            int id2 = Integer.parseInt(request.getParameter("idPacient"));
            pacient.setIdPacient(id2);
            pacientDaoImpl.stergePacient(pacient);
            
        }
        List<Pacienti> listaPacienti = new ArrayList();
        listaPacienti = pacientDaoImpl.afiseazaPacienti();
        request.setAttribute("listaPacienti", listaPacienti);
        RequestDispatcher rd = request.getRequestDispatcher("afiseaza_pacienti.jsp");
        rd.forward(request,response);*/
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
