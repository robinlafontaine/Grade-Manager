<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.util.List" errorPage="error.html"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <title>Notes</title>
    <link rel="stylesheet" href="stylesheet.css">
    </head>
    <body>
    <div class="formulaire">
        <h1>Affichage Notes</h1><br></br>
        <form action="ScolariteManager" method="post" required>
        <% List<String> mods = (List<String>) session.getAttribute("listeModules"); %>
        
     	<p>
            <h3>Module</h3>
			<select class="form" name="module" required>
			    <% for (String m : mods) { %>
			        <option value="<%=m%>"> <%=m%> </option>
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