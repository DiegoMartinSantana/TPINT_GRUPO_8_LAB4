<%@ page import="Dominio.Dto.PrestamoDto" %>
<%@ page import="java.util.ArrayList" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<title>Autorizaciones</title>
<style>

     
<%@include file="../Styles/StyleCliente.css" %>
<%@include file="../Styles/StyleTablas.css" %>

</style>
</head>
<body>
    <div class="row">
        <!-- Navegación -->
        <div class="col-2"> 
            <%@ include file="NavegacionComponente.jsp" %>
        </div>
        <!-- Contenido Principal -->
        <div class="col-9 section">
            <h2 class="text-center mb-4">Préstamos</h2>
            <div class="mb-3">
            
                <a class="btn btn-primary " href="AutorizacionPrestamo.jsp?show=<%=1%>">Autorizados</a>
                 <a class="btn btn-secondary" href="AutorizacionPrestamo.jsp?show=<%=2%>" >Denegados</a>
                 <a class="btn btn-warning"  href="AutorizacionPrestamo.jsp?show=<%=3%>">Pendientes</a>
             
            </div>

            <% 
            String showParam = request.getParameter("show");
            int show = (showParam != null) ? Integer.parseInt(showParam) : 0;
            ArrayList<PrestamoDto> prestamos = (ArrayList<PrestamoDto>) session.getAttribute("prestamos");
            
            ArrayList<PrestamoDto> prestamosFiltrados = new ArrayList<>();
           
            if(show==1){
    
            for (PrestamoDto prestamo : prestamos) {
            	if(prestamo.estado==1){
              	prestamosFiltrados.add(prestamo);
            	}
            	}
            }
            if(show==2){
                
                for (PrestamoDto prestamo : prestamos) {
                	if(prestamo.estado==2){
                  	prestamosFiltrados.add(prestamo);
                	}
                	}
                }  
            if(show==3){
                    
              for (PrestamoDto prestamo : prestamos) {
               if(prestamo.estado==3){
                prestamosFiltrados.add(prestamo);
                  }
                }
              }
          
            
                if (prestamos == null || prestamos.isEmpty()) { 
            %>
                <p class="text-center text-danger">No hay préstamos disponibles.</p>
            <% 
                } else { 
            %>
               <%if(prestamosFiltrados.size()!=0){ %>
            <div class="table">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Datos</th>
                            <th>Cbu</th>
                            <th>Plazo</th>
                            <th>Monto Cuota</th>
                            <th>Importe Solicitado</th>
                            <th>Interés (%)</th>
                            <th>Importe a Pagar</th>
                            <th>Fecha del Préstamo</th>
                            <th>Estado</th>
                              <%if(show==3){ %>
                            <th>Acción</th>
                            <%} %>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (PrestamoDto prestamo : prestamosFiltrados) { %>
                        <tr>
                            <td>
                                <%= prestamo.nombre %><br>
                                <%= prestamo.cuil %>
                            </td>
                            <td><%= prestamo.cbu %></td>
                            <td><%= prestamo.plazoCuotas %></td>
                            <td><%= prestamo.montoCuota %></td>
                            <td><%= prestamo.importeSolicitado %></td>
                            <td><%= prestamo.interes %></td>
                            <td><%= prestamo.importePagar %></td>
                            <td><%= prestamo.fechaPrestamo %></td>
                            <td>
                                <% 
                                    switch (prestamo.estado) {
                                        case 1: out.print("Autorizado"); break;
                                        case 2: out.print("Denegado"); break;
                                        case 3: out.print("Pendiente"); break;
                                        default: out.print("Desconocido");
                                    }
                                %>
                            </td>
                             <%if(show==3){ %>
                            <td>
                           
                              
                                <form action="PrestamosServlet?value=<%=1%>&idPrestamo=<%=prestamo.idPrestamo%>" method="POST">
                                
                                <button class="btn btn-success" type="submit" name="btnAceptar">Aceptar</button>
                                </form>
                                <form action="PrestamosServlet?value=<%=2%>&idPrestamo=<%=prestamo.idPrestamo%>"  method="POST">
                                <button class="btn btn-danger" type="submit" name="btnRechazar">Rechazar</button>
                                </form>
                                
                            </td>
                            <%} %>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <%}else{ %>
            <%if(show==1){ %>
             <p style="font-size: 22px;margin-top:15px">No se registran prestamos Autorizados </p>
              <% } %>
               <%if(show==2){ %>
            <p style="font-size: 22px;margin-top:15px">No se registran prestamos Denegados</p>
            <% } %>
             <%if(show==3){ %>
           <p style="font-size: 22px;margin-top:15px"> No se registran prestamos Pendientes</p>
            <% } %>
            <% }} %>
        </div>
    </div>
</body>

</html>