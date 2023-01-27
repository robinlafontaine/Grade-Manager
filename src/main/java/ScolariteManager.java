import java.util.ArrayList;
import java.util.Arrays;
import java.util.Hashtable;
import java.util.List;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ScolariteManager")
public class ScolariteManager extends HttpServlet{
    
    List<String> specialites = Arrays.asList("ICY", "ME", "AVM", "GII");
    List<String> modules = Arrays.asList("Maths", "Programmation", "Langues", "Sport");
    ArrayList<Bean.Etudiant> etudiants = new ArrayList<Bean.Etudiant>();

    public ScolariteManager() {
        super();
    }

    protected void authentification(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        
        String user = "admin";
        String pwd= "password";
 
        if (user.equals(req.getParameter("usr")) && pwd.equals(req.getParameter("pwd")) ) {
            req.getSession().setAttribute("user", user);
            res.sendRedirect("Acceuil.html");
        } else
            res.getWriter().println("login ou mot de passe invalide");
    }

    protected void notesSaisie(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String nom = req.getParameter("nom_n");
        String prenom = req.getParameter("prenom_n");
        String module = req.getParameter("module_n");
        float note = Float.parseFloat(req.getParameter("note_n"));
        for(Bean.Etudiant e : etudiants) {

            if(e.getNom().equals(nom) && e.getPrenom().equals(prenom)) {
                e.addNote(module, note);
                res.sendRedirect("Acceuil.html");
            } 
        }
        res.getWriter().println("Etudiant introuvable");
    }

    protected void inscription(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String nom = req.getParameter("nom_i");
        String prenom = req.getParameter("prenom_i");
        String dnaissance = req.getParameter("dnaissance");
        String specialite = req.getParameter("specialite");
        etudiants.add(new Bean.Etudiant(nom, prenom, dnaissance, specialite));
        res.sendRedirect("Acceuil.html");
    }

    protected void affichageSpe(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        String choix = req.getParameter("specialite");
        ArrayList<Bean.Etudiant> listeEtudiantsSpe = new ArrayList<Bean.Etudiant>();
        if (specialites.contains(choix)) {
            for(Bean.Etudiant e:etudiants) {
                if(e.getSpecialite().equals(choix)) {
                    listeEtudiantsSpe.add(e);
                }
            }
        }
        req.getSession().setAttribute("listeEtudiantsSpe", listeEtudiantsSpe);
        res.sendRedirect("AffichageSpe.jsp");     
    }
    
    protected void affichageMod(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        String choix = req.getParameter("module");
        ArrayList<Bean.Etudiant> listeEtudiantsModule = new ArrayList<Bean.Etudiant>();
        if (modules.contains(choix)) {
            for(Bean.Etudiant e:etudiants) {
                if(e.getNote().containsKey(choix)) {
                        listeEtudiantsModule.add(e);
                    }
                }
            }
        req.getSession().setAttribute("listeEtudiantsMod", listeEtudiantsModule);
        res.sendRedirect("AffichageMod.jsp");
    }
    

  
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        
    	req.getSession().setAttribute("listeSpecialites", specialites);
        req.getSession().setAttribute("listeModules", modules);

        switch (req.getHeader("referer").replace("?", "")) {
            
            case "http://localhost:8080/TP3_LAFONTAINE_ONEGLIA_OZER/Authentification.html":
                //Authentification
                authentification(req, res);
			    break;
		
            case "http://localhost:8080/TP3_LAFONTAINE_ONEGLIA_OZER/Inscription.jsp":
                //Inscription Etudiant
            	if (req.getSession().getAttribute("user").equals("admin"))            	
            		inscription(req, res);
            	else
            		res.sendRedirect("Authentification.html");
            	break;

            case "http://localhost:8080/TP3_LAFONTAINE_ONEGLIA_OZER/SaisieNote.jsp":
                //Saisie des Notes
            	if (req.getSession().getAttribute("user").equals("admin"))
            		notesSaisie(req, res);
            	else
            		res.sendRedirect("Authentification.html");
                break;
            
            case "http://localhost:8080/TP3_LAFONTAINE_ONEGLIA_OZER/DemandeSpe.jsp":
                //Affichage des Notes
            	if (req.getSession().getAttribute("user").equals("admin"))
            		affichageSpe(req,res);
            	else
            		res.sendRedirect("Authentification.html");
                break;
            
            case "http://localhost:8080/TP3_LAFONTAINE_ONEGLIA_OZER/DemandeMod.jsp":
                //Affichage des Notes
            	if (req.getSession().getAttribute("user").equals("admin"))
            		affichageMod(req,res);
            	else
            		res.sendRedirect("Authentification.html");
                break;

        }
        
        // doGet(req, res);
    }
}