/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.Pacienti;
import pojo.Medici;
import pojo.Consultatii;
import implementation.ConsultatieDaoImpl;
import implementation.HibernateUtil;
import implementation.PacientiDaoImpl;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.Session;

/**
 *
 * @author vali
 */
public class ConsultatieController extends HttpServlet {

    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Thread.sleep(300);
        } catch (InterruptedException ex) {
            Logger.getLogger(PacientiController.class.getName()).log(Level.SEVERE, null, ex);
        }
        ConsultatieDaoImpl impl = new ConsultatieDaoImpl();
        JsonArray jsonArray = new JsonArray();
        JsonObject jsonObj;
        ArrayList<Consultatii> listConsultatii = (ArrayList) impl.afiseazaConsultatie();
        
        for (Consultatii c : listConsultatii){
            jsonObj = new JsonObject();
            jsonObj.addProperty("id", c.getIdConsultatie());
            jsonObj.addProperty("medic", c.getMedici().getNume() + " " + c.getMedici().getPrenume());
            jsonObj.addProperty("pacient", c.getPacienti().getNume() + " " + c.getPacienti().getPrenume());
            jsonObj.addProperty("data", c.getData().toString());
            jsonObj.addProperty("diagnostic", c.getDiagnostic());
            jsonObj.addProperty("tratament",c.getTratament());
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
        ConsultatieDaoImpl impl = new ConsultatieDaoImpl();
        if (request.getParameter("action").equals("add")){
            DateFormat parseFormat = new SimpleDateFormat("yyyy-MM-dd");
            try {
            Consultatii consultatie = new Consultatii(
                (Medici) HibernateUtil.getSession().load(Medici.class, Integer.parseInt(request.getParameter("medicToAdd").split(" ")[0])),
                (Pacienti) HibernateUtil.getSession().load(Pacienti.class, Integer.parseInt(request.getParameter("pacientToAdd").split(" ")[0])),
                parseFormat.parse(request.getParameter("dataToAdd")),
                request.getParameter("diagnosticToAdd"),
                request.getParameter("tratamentToAdd")
                );
                impl.adaugaConsultatie(consultatie);
                response.getWriter().println("Adaugat!");
            } catch (ParseException e) {
                response.getWriter().println("Eroare la adaugare!");
                e.printStackTrace();
            }
            
            
            
        } else if (request.getParameter("action").equals("delete")) {
            Consultatii consToDel = new Consultatii();
            consToDel.setIdConsultatie(Integer.parseInt(request.getParameter("id")));
            impl.stergeConsultatie(consToDel);
        } else if (request.getParameter("action").equals("update")) {
            DateFormat parseFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = null;
            Medici medicToUpdate = null;
            Pacienti pacientToUpdate = null;
            try {
                medicToUpdate = (Medici) HibernateUtil.getSession().load(Medici.class, Integer.parseInt(request.getParameter("medicToAdd").split(" ")[0]));
            } catch(NumberFormatException e) {
                System.out.println("Bad format!");
            }
            try {
                pacientToUpdate = (Pacienti) HibernateUtil.getSession().load(Pacienti.class, Integer.parseInt(request.getParameter("pacientToAdd").split(" ")[0]));
            } catch(NumberFormatException e) {
                System.out.println("Bad format!");
            }
            if (!request.getParameter("dataToAdd").equals(""))
                try {
                    date = parseFormat.parse(request.getParameter("dataToAdd"));
                } catch (ParseException e) {
                    
                    e.printStackTrace();
                }
            
            impl.modificaConsultatie(Integer.parseInt(request.getParameter("idToUpdate").split(" ")[0]),
                        medicToUpdate,
                        pacientToUpdate,
                        date,
                        request.getParameter("diagnosticToAdd"),
                        request.getParameter("tratamentToAdd")
                );
            
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
