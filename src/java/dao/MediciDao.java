package dao;

import java.util.List;
import pojo.Medici;

public interface MediciDao {
    public void adaugaMedic (Medici medic);
    public List<Medici> afiseazaMedici();
    public void modificaMedic (int idmedic, String nume, String prenume, String sectie);
    public void stergeMedic (Medici medic);
}
