package Bean;

public class Note {

    private String nom;
    private String prenom;
    private String module;
    private float note;

    public Note(String nom, String prenom, String module, float note) {
        this.nom = nom;
        this.prenom = prenom;
        this.module = module;
        this.note = note;
    }

    public String getNom() {return nom;}
    public void setNom(String nom) {this.nom = nom;}
    public String getPrenom() {return prenom;}
    public void setPrenom(String prenom) {this.prenom = prenom;}
    public String getModule() {return module;}
    public void setModule(String module) {this.module = module;}
    public float getNote() {return note;}
    public void setNote(float note) {this.note = note;}
}
