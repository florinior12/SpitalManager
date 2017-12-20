
package implementation;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Consultatii;
import java.util.Date;
import pojo.Medici;
import pojo.Pacienti;


public class ConsultatieDaoImpl {

    public void adaugaConsultatie(Consultatii consultatie) {
        Session session = HibernateUtil.getSession();
        Transaction transaction = session.beginTransaction();
        session.save(consultatie);
        transaction.commit();
        session.close();
    }

    public List<Consultatii> afiseazaConsultatie() {
        List<Consultatii> listaConsultatie = new ArrayList();
        Session session = HibernateUtil.getSession();
        org.hibernate.Query query = session.createQuery("From Consultatii");
        listaConsultatie = query.list();
        return listaConsultatie;
    }

    public void modificaConsultatie(int idconsultatie, Medici medic, Pacienti pacient, Date dataConsultatie, String diagnostic, String tratament) {
        Session session = HibernateUtil.getSession();
        Transaction transaction = session.beginTransaction();
        Consultatii detaliiconsultatiei;
        detaliiconsultatiei = (Consultatii) session.load(Consultatii.class, idconsultatie);
        
        if (pacient!=null)
            detaliiconsultatiei.setPacienti(pacient);
        if (medic!=null)
            detaliiconsultatiei.setMedici(medic);
        if (dataConsultatie!=null)
            detaliiconsultatiei.setData(dataConsultatie);
        if (!diagnostic.equals(""))
            detaliiconsultatiei.setDiagnostic(diagnostic);
        if (!tratament.equals(""))
            detaliiconsultatiei.setTratament(tratament);
        session.update(detaliiconsultatiei);
        transaction.commit();
        session.close();
    }

    public void stergeConsultatie(Consultatii consultatie) {
        Session session = HibernateUtil.getSession();
        Transaction transaction = session.beginTransaction();
        session.delete(consultatie);
        transaction.commit();
        session.close();
    }
}
