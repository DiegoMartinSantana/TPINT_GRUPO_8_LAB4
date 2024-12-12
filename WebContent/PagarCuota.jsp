<%@ page import="Dominio.Cuota" %> 
<%@ page import="Dominio.Cuenta" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pagar Prestamos</title>
<style>
<%@include file="../Styles/StyleCliente.css" %>

</style>


</head>
<% 
   
   
    ArrayList<Cuota> Cuotas = session.getAttribute("Cuotas") != null 
    ? (ArrayList<Cuota>) session.getAttribute("Cuotas")
    : null;
    
    ArrayList<Cuenta> Cuentas = session.getAttribute("cuentasDesplegable") != null 
    	    ? (ArrayList<Cuenta>) session.getAttribute("cuentasDesplegable")
    	    : null;

 
    %>
<body>

	<% 
    int idCuota = Integer.parseInt(request.getParameter("idCuota"));
	Cuota cuotaSeleccionada = new Cuota();
	if (Cuotas != null) {
        for (Cuota cuota : Cuotas) {
            if (cuota.getId() == idCuota) { 
                cuotaSeleccionada = cuota; 
                break; 
            }
        }
    }
   
%>


<form action="PagarCuota" method="post">
 <input type="hidden" id="id" name="idCuota" value="<%=idCuota%>"> 
	<label for="id_cuenta_origen" class="form-label">Cuenta a debitar:</label>
	
                            <select name="id_cuenta_pago" class="form-select">
                                <% for (Cuenta cuenta : Cuentas) { 
                                    String tipoCuenta = "";
                                    if (cuenta.getTipo() == 1) {
                                        tipoCuenta = "Caja de Ahorro";
                                    } else if (cuenta.getTipo() == 2) {
                                        tipoCuenta = "Cuenta Corriente";
                                    }
                                %>
                                    <option value="<%= cuenta.getIdCuenta() %>">
                                        <%= tipoCuenta %> - CBU: <%= cuenta.getCbu() %> - Saldo: $<%= String.format("%,.2f",cuenta.getSaldo())%>
                                    </option>
                                <% } %>
                            </select>
                            
    <div class="list-group-item d-flex align-items-center justify-content-between">
        <div>
            <i class="bi bi-credit-card"></i> <strong><%= cuotaSeleccionada.getNumeroCuota() %></strong>:
            $<%= String.format("%,.2f",cuotaSeleccionada.getImporte()) %>
            <p>
                Vencimiento: <%= cuotaSeleccionada.getVencimento() %>
            </p>
        </div>
    </div>
    <input type="submit" class="btn btn-primary w-100" name="btnPagarCuota" value="btnPagarCuota">
    </form>
<% String mensaje = "Pago realizado con exito"; %>
            <% if (request.getAttribute("pagoRealizado")!= null) { %>
                <div class="alert alert-success"><%= mensaje %></div>
            <% } %>
             <% String mensajeError ="Saldo insuficiente"; %>
            <% if (request.getAttribute("saldoInsuficiente")!= null) { %>
                <div class="alert alert-danger"><%= mensajeError %></div>
            <% } %>
            


</body>
</html>