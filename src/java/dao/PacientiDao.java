package dao;

import java.util.List;
import pojo.Pacienti;

public interface PacientiDao {
    public void adaugaPacient (Pacienti pacient);
    public List<Pacienti> afiseazaPacienti();
    public void modificaPacient (int idpacient, String nume, String prenume, String adresa);
    public void stergePacient (Pacienti pacient);
}
