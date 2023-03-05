<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dam2.add.p22.model.Usuario"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dam2.add.p22.model.Provincia"%>
    <%@page import="java.util.ResourceBundle"%>
    <%@page import="java.util.Locale"%>
        <% 
        Locale locale;
        if(session.getAttribute("idioma") == null){
          locale = request.getLocale();
        } else {
          locale = new Locale((String)session.getAttribute("idioma"));
        }
        ResourceBundle rb = ResourceBundle.getBundle("idioma", locale);
        %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<title><%=rb.getString("editarCampos")%></title>
</head>
<body>

	<div class="container">
	
		<%@ include file="cabecera.jsp"%>   
		
		<%Usuario user = (Usuario) request.getSession().getAttribute("usuarioEditar");%>
		
		     
		     <div class="row mx-auto">
			     <form class="row mx-auto justify-content-center align-items-center" action="<%=request.getContextPath()%>/" method="post">
				     <div class="col-xl-6 justify-content-center align-items-center">
			             <label class="form-label"><%=rb.getString("nombre")%></label>
			             <input class="form-control" type="text" required name="nombreEdit" placeholder="<%=rb.getString("nombre")%>" value="<%=user.getNombre()%>"><br>
			         </div>
			         <div class="col-xl-6 justify-content-center align-items-center">
                         <label class="form-label"><%=rb.getString("apellidos")%></label>
                         <input class="form-control" type="text" required name="apellidoEdit" placeholder="<%=rb.getString("apellidos")%>" value="<%=user.getApellidos()%>"><br>
                     </div>
			          <div class="col-xl-6 justify-content-center align-items-center">
                         <label class="form-label"><%=rb.getString("email")%></label>
                         <input class="form-control" type="email" required name="emailEdit" placeholder="<%=rb.getString("email")%>" value="<%=user.getEmail()%>"><br>
                     </div>
			         <% String error = (String) request.getSession().getAttribute("error");
			         if (error != null){
			        	 %><p><%=rb.getString("existeEmail")%></p><% 
			         }%>
			         <div class="col-xl-6 justify-content-center align-items-center">
                         <label class="form-label"><%=rb.getString("telefono")%></label>
                         <input class="form-control" type="text" required name="telefonoEdit" placeholder="<%=rb.getString("telefono")%>" value="<%=user.getTelefono()%>"><br>
                     </div>
                     <div class="col-md-6">
                      <label class="form-label"><%=rb.getString("provincia")%></label>
                        <select class="form-control" name="provinciaEdit" >
                           <% ArrayList<Provincia> provincias =  (ArrayList<Provincia>) request.getSession().getAttribute("provincias");
                             int contadorProv = 0;
                           for (int i = 0; i < provincias.size(); i++) { 
                              if(contadorProv == 0){%>
                              <option value="<%=user.getProvincia()%>"><%=user.getProvincia()%></option>
                            <% contadorProv++;  }%>
                              <option value="<%=provincias.get(i).getNm()%>"><%=provincias.get(i).getNm()%></option>
                          <% } %>
                        </select><br>
                      </div>
                      <div class="col-md-6">
                      <label class="form-label"><%=rb.getString("municipio")%></label>
                        <select class="form-control" name="municipioEdit"  >
                           <% ArrayList<Provincia> municipios =  (ArrayList<Provincia>) request.getSession().getAttribute("municipios");
                           int contadorMun = 0;
                         for (int i = 0; i < provincias.size(); i++) { 
                            if(contadorMun == 0){%>
                            <option value="<%=user.getMunicipio()%>"><%=user.getMunicipio()%></option>
                          <% contadorMun++;  }%>
                              <option value="<%=municipios.get(i).getNm()%>"><%=municipios.get(i).getNm()%></option>
                          <% } %>
                        </select><br>
                      </div>
			         <input class="barras" type="number" hidden=true name="id" value="<%=user.getId()%>"><br>
			         <input class="barras" type="number" hidden=true name="editAdmin" value="true"><br>
			         <input class="btn-success" type="submit" name="boton" value="<%=rb.getString("actualizarCampos")%>">
			     </form>
		     </div>
		
		<%@ include file="pie.jsp"%>   
	</div>
</body>
</html>
