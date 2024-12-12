v<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="Dominio.Cuenta" %> 
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Pedido de Préstamo</title>
    <style>
      <style>
<%@include file="../Styles/StyleSolicitarPrestamo.css" %>

</style>
      
    </style>

<script>

    function formatNumber(value) {
        return new Intl.NumberFormat('es-ES', { 
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        }).format(value);
    }

    function calcularMontoAPagar() {
        const montoSolicitado = parseFloat(document.getElementById("monto").value);
        const interes = parseFloat(document.getElementById("interes").value);

        if (isNaN(montoSolicitado) || isNaN(interes)) {
            return;
        }

        const montoTotal = montoSolicitado * (1 + interes / 100);

        document.getElementById("importe_pagar").value = formatNumber(montoTotal);
    }

    function actualizarInteres() {
        const interesMap = {
            3: 2,
            6: 5,
            12: 7
        };

        const cuotasSelect = document.getElementById('cuotas');
        const interesInput = document.getElementById('interes');

        const selectedCuotas = parseInt(cuotasSelect.value);
        const nuevoInteres = interesMap[selectedCuotas] || 0;
        interesInput.value = nuevoInteres;

        calcularMontoAPagar();
    }

    document.addEventListener("DOMContentLoaded", () => {
        const inputElement = document.getElementById('importe_pagar');
        const rawValue = parseFloat(inputElement.value); 
        inputElement.value = formatNumber(rawValue);
    });
</script>



</head>
<body>

  <%@include file="NavegacionComponenteUsuario.jsp" %>

<div class="container" style="margin-top:50px">
   
    <div class="section">
        <h2>Solicitud de Préstamo</h2>
        <%  
        	float interes = 2;
            List<Cuenta> cuentas = (List<Cuenta>)request.getSession().getAttribute("Cuentas");
            if (cuentas != null && !cuentas.isEmpty()) {
        %>
        
      
        <form action="servletSolicitarPrestamo" method="post">
            
      
            <div class="field">
                <label for="monto">Monto del Préstamo:</label> 
                <select id="monto" name="monto" required onchange="actualizarInteres() ; calcularMontoAPagar()">
                    <option value="1000000">1.000.000,00</option>
                    <option value="5000000">5.000.000,00</option>
                    <option value="10000000">10.000.000,00</option>
                    <option value="15000000">15.000.000,00</option>
                </select>
            </div>

           
            <div class="field">
                <label for="cuotas">Cantidad de Cuotas:</label>
                <select id="cuotas" name="cuotas" required onchange="actualizarInteres();calcularMontoAPagar()">
                    <option value="3">3 cuotas</option>
                    <option value="6">6 cuotas</option>
                    <option value="12">12 cuotas</option>
                </select>
            </div>
            
            
            <div class="field">
       		 <label for="interes">Interés (%):</label>
      		  <input type="text" id="interes" name="interes" value="2" readonly >
   		 </div>
               
            
            <div class="field">
                <label for="fecha">Fecha del Préstamo:</label>
                <input type="date" id="fechaCreacion" name="fechaCreacion" 
                       value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" 
                       readonly>
            </div>

           
			<div class="field">
				<label for="monto_a_pagar">Monto Total a Pagar:</label> 
				<input type="text" id="importe_pagar" name="importe_pagar" value="1020000"readonly>
			</div>


			
            <div class="field">
                <label for="cuenta">Seleccionar Cuenta de Depósito:</label>
                <select id="cuenta" name="cuenta" required>
                    <% for (Cuenta cuenta : cuentas) { %>
                        <option value="<%= cuenta.getIdCuenta() %>">
                            <%= "Cuenta " + cuenta.getIdCuenta() + " - CBU: " + cuenta.getCbu() %>
                        </option>
                    <% } %>
                </select>
            </div>

            <button type="submit">Solicitar Préstamo</button>
        </form>
        
        <% } else { %>
            <p>No tienes cuentas disponibles para solicitar el préstamo.</p>
        <% } %>
    </div>

    <div class="form-footer">
        
    </div>
</div>

</body>
</html>

