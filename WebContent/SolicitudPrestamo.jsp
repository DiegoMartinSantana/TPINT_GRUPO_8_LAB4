<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="Dominio.Cuenta" %> 
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Pedido de Pr�stamo</title>
    <style>
      
<%@include file="../Styles/StyleSolicitarPrestamo.css" %>
	 .field {
            margin-bottom: 1.5rem;
            display: flex;
            flex-direction: column;
            align-items: start;
            font-size: 1.2rem;
        }
        .field label {
            margin-bottom: 0.5rem;
            font-weight: bold;
            color: #333;
        }
        #importe_pagar {
         font-size:1.25rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        #importe_pagar:hover {
          scale(1.1);
            
        }
        </style>


<script>

function calcularMontoAPagar() {
	var montoSolicitado = parseFloat(document.getElementById("monto").value);
	var interes = parseFloat(document.getElementById("interes").value);

	if (isNaN(montoSolicitado) || isNaN(interes)) {
		return;
	}

	
	var montoTotal = montoSolicitado * (1 + interes / 100);

	
	document.getElementById("importe_pagar").value = montoTotal.toFixed(2);
}
 
function actualizarInteres(){
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
	     
	  }
</script>



</head>
<body>

  <%@include file="NavegacionComponenteUsuario.jsp" %>

<div class="container" style="margin-top:50px">
   
    <div class="section">
        <h2>Solicitud de Pr�stamo</h2>
        <%  
        	float interes = 2;
            List<Cuenta> cuentas = (List<Cuenta>)request.getSession().getAttribute("Cuentas");
            if (cuentas != null && !cuentas.isEmpty()) {
        %>
        
      
        <form action="servletSolicitarPrestamo" method="post">
            
      
            <div class="field">
                <label for="monto">Monto del Pr�stamo:</label> 
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
       		 <label for="interes">Inter�s (%):</label>
      		  <input type="text" id="interes" name="interes" value="2" readonly >
   		 </div>
               
            
            <div class="field">
                <label for="fecha">Fecha del Pr�stamo:</label>
                <input type="date" id="fechaCreacion" name="fechaCreacion" 
                       value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" 
                       readonly>
            </div>

          <div class="field">
        <label for="monto_a_pagar">Monto Total a Pagar:</label> 
        <input type="text" id="importe_pagar" name="importe_pagar" value="1020000" readonly>
    </div>
			
            <div class="field">
                <label for="cuenta">Seleccionar Cuenta de Dep�sito:</label>
                <select id="cuenta" name="cuenta" required>
                    <% for (Cuenta cuenta : cuentas) { %>
                        <option value="<%= cuenta.getIdCuenta() %>">
                            <%= "Cuenta " + cuenta.getIdCuenta() + " - CBU: " + cuenta.getCbu() %>
                        </option>
                    <% } %>
                </select>
            </div>

            <button type="submit" class="btn btn-primary" style="padding:12.5px">  Solicitar Pr�stamo</button>
        </form>
        
        <% } else { %>
            <p>No tienes cuentas disponibles para solicitar el pr�stamo.</p>
        <% } %>
    </div>

    <div class="form-footer">
        
    </div>
</div>

</body>
</html>

