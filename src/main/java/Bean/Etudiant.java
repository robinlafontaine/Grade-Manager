package Bean;

import java.util.HashMap;

public class Etudiant {
    
    private String nom;
    private String prenom;
    private String dnaissance;
    private String specialite;
    private HashMap<String, Float> notes = new HashMap<String, Float>();

    public Etudiant(String nom, String prenom, String dnaissance, String specialite) {
        this.nom = nom;
        this.prenom = prenom;
        this.dnaissance = dnaissance;
        this.specialite = specialite;
    }

    public String getNom() {return nom;}
    public void setNom(String nom) {this.nom = nom;}
    public String getPrenom() {return prenom;}
    public void setPrenom(String prenom) {this.prenom = prenom;}
    public String getDnaissance() {return dnaissance;}
    public void setDnaissance(String dnaissance) {this.dnaissance = dnaissance;}
    public String getSpecialite() {return specialite;}
    public void setSpecialite(String specialite) {this.specialite = specialite;}
    public void addNote(String module, float note) {this.notes.put(module, note);}
    public HashMap<String, Float> getNote() {return notes;}
}
