<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Dominio.Informe" %>
<%@ page import="Dominio.Cliente" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<title>Informes</title>
<style>
<%@include file="../Styles/StyleCliente.css" %>
</style>
</head>
<body>
   <%// Informe informe = (Informe)request.getAttribute("informePrestamos"); %>

    <div class="row">
        
        <div class="col-md-2">
            <%@include file="NavegacionComponente.jsp" %>
        </div>

        
        <div class="col-md-9" style="margin-top:30px">
        
            <div class="card mb-4">
                <div class="card-header text-white" style=" background-color: #4a4a87">
                    <h4 class="mb-0" >Generar Informes</h4>
                </div>
                <div class="card-body">
                
                
                    <form action="InformesServlet" method="post">
                        <div class="mb-3">
                            <label for="fechaDesde" class="form-label">Fecha desde</label>
                            <input type="date" id="fechaDesde" name="fechaDesde" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="fechaHasta" class="form-label">Fecha hasta</label>
                            <input type="date" id="fechaHasta" name="fechaHasta" class="form-control" required>
                        </div>
                        <!-- <button type="submit" style="background-color: #c2c2d7;width:180px" class="btn ">Generar </button> -->
                        <input type="submit" name="btnGenerar" value="Generar">
                    </form>
                </div>
            </div>

          
         
            <%// if (informe != null) { %>
            <div class="card mb-4">
                <div class="card-header text-white" style="background-color: #4a4a87">
                    <h4 class="mb-0">Prestamos Aprobados</h4>
                </div>
                    <table>
        <thead>
            <tr>
                <th>Cantidad</th>
                <th>Total</th>
                <th>Cliente Lider</th>
            </tr>
        </thead>
        <tbody>
            <% 
            Informe informe = (Informe)request.getAttribute("informePrestamos");
            if(informe != null) { 
            %>
            <tr>
                <td><%= informe.getCantidadPrestamos() %> préstamos</td>
                <td>$<%= informe.getTotalPrestado() %></td>
                <td><%= informe.getClienteLider() %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
            </div>

            <div class="card mb-4">
                <div class="card-header text-white" style="background-color: #5e5e94">
                    <h4 class="mb-0">Tasa de Cumplimiento</h4>
                </div>
                <div class="section">
				    <h2>Tasa de cumplimiento: <%= informe != null ? informe.getTasaCumplimiento() : "" %>%</h2>
				    <h5>*Registro de pagos concretados de préstamos otorgados en el rango seleccionado*</h5>
				</div>
            </div>

            <div class="card">
                <div class="card-header text-white" style="background-color: #7272a1">
                    <h4 class="mb-0">Clientes VIP</h4>
                </div>
                <div class="card-body">
                    <table>
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Total prestado</th>
            </tr>
        </thead>
        <tbody>
            <% 
            if(informe != null && informe.getClientesVIP() != null) {
                for(Cliente cliente : informe.getClientesVIP()) { 
            %>
            <tr>
                <td><%= cliente.getNombre() %> <%= cliente.getApellido() %></td>
                <td>$<%= cliente.getTotalPrestado() %></td>
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



</body>
</html>