/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package implementation;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Pacienti;

/**
 *
 * @author vali
 */
public class PacientiDaoImpl {

    public void adaugaPacienti(Pacienti pacient) {
        Session session = HibernateUtil.getSession();
        Transaction transaction = session.beginTransaction();
        session.save(pacient);
        transaction.commit();
        session.close();
    }

    public List<Pacienti> afiseazaPacienti() {
        List<Pacienti> listaPacienti = new ArrayList();
        Session session = HibernateUtil.getSession();
        org.hibernate.Query query = session.createQuery("From Pacienti");
        listaPacienti = query.list();
        return listaPacienti;
    }

    public void modificaPacienti(int idpacient, String nume, String prenume, String telefon, String adresa, String varsta) {
        Session session = HibernateUtil.getSession();
        Transaction transaction = session.beginTransaction();
        Pacienti detaliipacienti = (Pacienti) session.load(Pacienti.class, idpacient);
        if(!nume.equals(""))
            detaliipacienti.setNume(nume);
        if(!prenume.equals(""))
            detaliipacienti.setPrenume(prenume);
        if(!adresa.equals(""))
            detaliipacienti.setAdresa(adresa);
        if(!telefon.equals(""))
            detaliipacienti.setTelefon(telefon);
        if(!varsta.equals("")) {
            try {
                detaliipacienti.setVarsta(Integer.parseInt(varsta));
            } catch (Exception e) {
                
            }
        }
        
        session.update(detaliipacienti);
        transaction.commit();
        session.close();
    }

    public void stergePacient(Pacienti pacient) {
        Session session = HibernateUtil.getSession();
        Transaction transaction = session.beginTransaction();
        session.delete(pacient);
        transaction.commit();
        session.close();
    }
}
