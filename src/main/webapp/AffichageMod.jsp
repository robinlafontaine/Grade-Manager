<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.util.ArrayList,java.util.Map,Bean.Etudiant" errorPage="error.html"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
  <head>
  <title>Affichage Notes</title>
  <link rel="stylesheet" href="stylesheet.css">
  </head>
  	<body>
  	<form action="ScolariteManager" method="post" required>
  	<% ArrayList<Bean.Etudiant> etudiants = (ArrayList<Bean.Etudiant>) session.getAttribute("listeEtudiantsMod"); %>

  <div class="formulaire">
    <h2>Notes</h2><br>
	<table class="styled-table">
	    <thead>
		    <tr>
		        <th>Nom</th>
		        <th>Prénom</th>
		        <th>Module</th>
		        <th>Note</th>
		    </tr>
	    </thead>
	    <tbody>
		    <% for (Bean.Etudiant etudiant : etudiants) { %>
		        <tr>
		            <td><%=etudiant.getNom()%></td>
		            <td><%=etudiant.getPrenom()%></td>
		            <% for (Map.Entry<String, Float> entry : etudiant.getNote().entrySet()) { %>
		                <td><%= entry.getKey() %></td>
		                <td><%= entry.getValue() %></td>
		            <% } %>
		        </tr>
		    <% } %>
	    <tbody>
	</table>
	</div>
	</form>
  </body>
</html>