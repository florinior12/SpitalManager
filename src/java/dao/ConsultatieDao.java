package dao;

import java.util.List;
import pojo.Consultatii;
import java.util.Date;
import pojo.Medici;
import pojo.Pacienti;

public interface ConsultatieDao {
    public void adaugaConsultatie (Consultatii consultatie);
    public List<Consultatii> afiseazaConsultatie();
    public void modificaConsultatie (int idconsultatie, Pacienti pacient, Medici medic, Date dataConsultatie, String diagnostic, String medicament);
    public void stergeConsultatie (Consultatii consultatie);
}
