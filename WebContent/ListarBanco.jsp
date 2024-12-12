<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Dominio.Cliente" %> 
<!DOCTYPE html>
<html>



<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css" />

<title>Clientes</title>
<style>

<%@include file="../Styles/StyleTablas.css" %>
</style>

</head>
<body>



<div class="row">
       <div class="col-2"> 
       <%@include file="NavegacionComponente.jsp" %>
       	</div>
 <div class="col-9" style="margin-top:50px">
    <div class="container-fluid">
        <div class="row justify-content-center mb-4">
            <div class="col-12 text-center">
                <h2 style="font-size: 36px; font-weight: bold; color: #333;"> Clientes Registrados</h2>
                
            </div>
        </div>
        <div class="row">
            <div class="col-12">
            
                <div >
                <%if(request.getParameter("Eliminado")!=null){ %>
                <div class="alert alert-success alert-dismissible fade show " role="alert">
  <strong>Cliente Eliminado</strong> Se ha eliminado exitosamente el Cliente.
  <button type="button" class="btn-close m-0" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
                
                <%} %>
                  <%if(request.getParameter("TieneCuentas")!=null){ %>
                <div class="alert alert-danger alert-dismissible fade show " role="alert">
  	<strong>Error al Eliminar.</strong> El cliente tiene cuentas asociadas.
  	<button type="button" class="btn-close m-0" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
                
                <%} %>
                
                <%if(request.getAttribute("modificado")!=null){ %>
                <div class="alert alert-success alert-dismissible fade show " role="alert">
  <strong>Cliente modificado</strong> Cliente modificado correctamente.
  <button type="button" class="btn-close m-0" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
                
                <%} %>
               
               
                    <table  id="clientesTable" class="table table-hover align-middle" style="border-radius: 16px; overflow: hidden; background: #fff; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                        <thead style="background: #007bff; color: #fff; text-align: center;">
                            <tr>
                            <th>Usuario</th>
                                <th>DNI</th>
                                <th>CUIL</th>
                               
                                <th>Nombre</th>
                                 <th>Sexo</th>
                                <th>Email</th>
                                <th>Teléfono</th>
                                <th>Dirección</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                    
                            List<Cliente> clientes = (List<Cliente>)request.getAttribute("clientes");
                            if(clientes != null && !clientes.isEmpty()) {
                                for(Cliente cliente : clientes) {
                            %>
                            <tr style="border-bottom: 1px solid #e0e0e0;">
                            <td style="text-align: center;"><%= cliente.getNombreUsuario() %></td>
                                <td style="text-align: center;"><%= cliente.getDni() %></td>
                                <td style="text-align: center;"><%= cliente.getCuil() %></td>
                                
                                <td style="text-align: center;"><%= cliente.getNombre() %> <%= cliente.getApellido() %></td>
                                <% if(cliente.getSexo() == 1) { %>
                                    <td style="text-align: center;">Masculino</td>
                                <% } else if(cliente.getSexo() == 2) { %>
                                    <td style="text-align: center;">Femenino</td>
                                <% } else { %>
                                    <td style="text-align: center;">Otro</td>
                                <% } %>
                                <td style="text-align: center;"><%= cliente.getEmail() %></td>
                                <td style="text-align: center;"><%= cliente.getTelefono() %></td>
                                <td>
                                    <div style="font-size: 14px; text-align: center; ;">
                                        <%= cliente.getNacionalidad() %>, 
                                        <%= cliente.getProvincia().getNombre() %>, 
                                        <%= cliente.getLocalidad() %>, 
                                        <%= cliente.getDomicilio() %>
                                    </div>
                                </td>
                                <td style="text-align: center;">
                                    <a href="ClienteServlet?IdClienteEditar=<%= cliente.getId() %>" class="btn btn-primary btn-sm me-2">
                                        <i class="bi bi-pencil-fill"></i> Editar
                                    </a>
                                    <a href="ClienteServlet?IdClienteEliminar=<%= cliente.getId() %>" class="btn btn-danger btn-sm">
                                        <i class="bi bi-trash-fill"></i> Eliminar
                                    </a>
                                </td>
                            </tr>
                            <% 
                                }
                            }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

    </div>
<script>
$(document).ready(function() {
    $('#clientesTable tbody .datatable-ignore').remove();

    $('#clientesTable').DataTable({
        language: {
        	url: 'https://cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json'
        }
    });
});
    </script>

</body>
</html>