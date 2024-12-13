<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
<%@ page import="Dominio.Cliente" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<title>Alta de Cuenta</title>
<style>

<%@include file="../Styles/StyleFormulario.css" %>

</style>
</head>
<body>

 <% 
 int  creada = 3 ;
 if(request.getSession().getAttribute("LimiteCuentas")!=null){ 
	boolean resp =(boolean)request.getSession().getAttribute("LimiteCuentas");
	 
 	if(resp){
 		creada=2;
 	}else{
 		creada=1;
 	}
 	
 } 
 
 %>
<div class="row">
    <div class="col-2">
        <%@include file="NavegacionComponente.jsp" %>
    </div>
    <div class="section col-8" style="margin-top:120px">
        <h2>Alta de Cuenta</h2>
        <form action="AltaCuentaServlet" method="POST">
            <div class="form-group">
                <label for="cliente">Seleccionar Cliente:</label>
                <select id="clientes" name="clientes" required>
                    <option value="">Seleccione un Cliente</option>
                   
                    <% 
                        List<Cliente> clientes = (List<Cliente>)request.getAttribute("clientes"); 
                        if (clientes != null) {
                            for (Cliente cliente : clientes) {
                    %>
                    <option value="<%= cliente.getId() %>">
                        <%= cliente.getDni() + " - " + cliente.getNombre() + " " + cliente.getApellido() %>
                    </option>
                    <% 
                            }
                        } 
                    %>
                </select>
            </div>

            <div class="form-group">
                <label for="tipoCuenta">Seleccionar Tipo de Cuenta:</label>
                <select id="tipoCuenta" name="tipoCuenta" required>
                    <option value="1">Cuenta Corriente</option>
                    <option value="2">Cuenta de Ahorro</option>
                </select>
            </div>

            <div class="form-group">
                <label for="fechaCreacion">Fecha de Creacion:</label>
                <input type="date" id="fechaCreacion" name="fechaCreacion" 
                       value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" 
                       readonly>
            </div>

            <div class="form-group" style="margin-top:40px;padding:0">
          
               <strong>Se le asignara un Cbu al registrar,</strong> 
               <strong>con un Monto inicial de $10,000.</strong>

            </div>

           <input type="submit" style="width:100%;" value="Aceptar">
          
           
        </form>

         <%	if(request.getAttribute("CuentaCreada")!=null){ %>

          <div class="alert alert-success alert-dismissible fade show position-relative" role="alert" style="margin-top:20px">
                    <strong>Cuenta creada</strong>  Cuenta creada con exito.
                    <button type="button" class="btn-close position-absolute top-0 end-0 m-0" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>       
        
       	 <%}%>
           <%	if(creada==2){ %>

          <div class="alert alert-danger alert-dismissible fade show position-relative" role="alert" style="margin-top:20px">
                    <strong>Error al Crear la Cuenta</strong> Maximo de 3 Cuentas por cliente.
                    <button type="button" class="btn-close position-absolute top-0 end-0 m-0" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>       
        
       	 <%}else if(creada==1) { %>
        	 <div class="alert alert-success alert-dismissible fade show position-relative" role="alert">
             <strong>Cuenta Creada </strong> Se ha creado correctamente la cuenta.
             <button type="button" class="btn-close position-absolute top-0 end-0 m-0" data-bs-dismiss="alert" aria-label="Close"></button>
     	    </div>       
        	
     		  <% } %>
       
</div>
</div>


</body>
</html>