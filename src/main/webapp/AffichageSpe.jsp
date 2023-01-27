<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.util.ArrayList,Bean.Etudiant" errorPage="error.html"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
  <head>
  <title>Affichage Specialité</title>
  <link rel="stylesheet" href="stylesheet.css">
  </head>
  <form action="ScolariteManager" method="post" required>
  	<% ArrayList<Bean.Etudiant> etudiants = (ArrayList<Bean.Etudiant>) session.getAttribute("listeEtudiantsSpe"); %>
	<% String spec = (etudiants.get(0)).getSpecialite(); %>	
  <body>
  <div class="formulaire">
	    <h2>Etudiants en <%=spec%></h2>
		<table class="styled-table">
		    <thead>
			    <tr>
			        <th>Nom</th>
			        <th>Prénom</th>
			        <th>Date de Naissance</th>
			    </tr>
		    </thead>
		    <tbody>
			    <% for (Bean.Etudiant etudiant : etudiants) { %>
			        <tr>
			            <td><%= etudiant.getNom() %></td>
			            <td><%= etudiant.getPrenom() %></td>
			            <td><%= etudiant.getDnaissance() %></td>
			        </tr>
			    <% } %>
		    </tbody>
		</table>
		</form>
	</div>
  </body>
</html>