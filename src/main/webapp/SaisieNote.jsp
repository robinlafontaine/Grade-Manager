<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.util.List" errorPage="error.html"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<html>
  <head>
  <title>Saisie Notes</title>
  <link rel="stylesheet" href="stylesheet.css">
  </head>
    <body>
        
        <div class="formulaire">
        <h1>Saisie des Notes</h1><br></br>
        <form action="ScolariteManager" method="post">       
        
        <% List<String> mods = (List<String>) session.getAttribute("listeModules"); %>
        
        <p>
            <h3>Nom</h3>
            <input class="form" type="text" name="nom_n" required>
        </p>
        <p>
            <h3>Prénom</h3>
            <input class="form" type="text" name="prenom_n" required>
        </p>
		<p>
            <h3>Module</h3>
			<select class="form" name="module_n" required>
			    <% for (String m : mods) { %>
			        <option value="<%=m%>"> <%=m%> </option>
			    <% } %>
			</select>
		</p>
        <p>
            <h3>Note</h3>
            <input class="form" type="number" name="note_n" min="0" step="0.01" max="20" required>        
        </p>
        <p>
            <button class="button" type="submit" >Saisir</button>
        </p>
        </form>
        </div>
    </body>
</html>