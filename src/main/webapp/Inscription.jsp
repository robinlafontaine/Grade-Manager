<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.util.List" errorPage="error.html"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <title>Inscription</title>
    <link rel="stylesheet" href="stylesheet.css">
    </head>
    <body>
        <div class="formulaire">
        <h1>Inscription</h1><br></br>
        <form action="ScolariteManager" method="post">
        <% List<String> spe = (List<String>) session.getAttribute("listeSpecialites"); %>
        <p>
            <h3>Nom</h3>
            <input class="form" type="text" name="nom_i" required>
        </p>
        <p>
            <h3>Prénom</h3>
            <input class="form" type="text" name="prenom_i" required>
        </p>
        <p>
            <h3>Date de Naissance</h3>
            <input class="form" type="date" name="dnaissance" required>
        </p>
        <p>
            <h3>Specialité</h3>
            <select class="form" name="specialite" required>
			    <% for (String s : spe) { %>
			        <option value="<%=s%>"> <%=s%> </option>
			    <% } %>
			</select>
        </p>
        <p>
            <button class="button" type="submit" >Inscrire</button>
        </p>
        </form>
        </div>
    </body>
</html>