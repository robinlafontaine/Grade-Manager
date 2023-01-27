<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.util.List" errorPage="error.html"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <title>Specialitées</title>
    <link rel="stylesheet" href="stylesheet.css">
    </head>
    <body>
    <div class="formulaire">
        <h1>Liste des Specialités</h1><br></br>
        <form action="ScolariteManager" method="post" required>
        <% List<String> spe = (List<String>) session.getAttribute("listeSpecialites"); %>
        <p>
            <h3>Specialité</h3>
            <select class="form" name="specialite" required>
			    <% for (String s : spe) { %>
			        <option value="<%=s%>"> <%=s%> </option>
			    <% } %>
			</select>
        </p>
        <p>
            <button class="button" type="submit" >Afficher</button>
        </p>
        </form>
        </div>
    </body>
</html>