<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="Dominio.Cuenta" %> 
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Pedido de Préstamo</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        
        .container {
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .section {
            margin-bottom: 20px;
        }

        h2 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }

        .field {
            margin-bottom: 20px;
        }

        label {
            font-size: 14px;
            color: #555;
            display: block;
            margin-bottom: 8px;
        }

        input, select, button {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        input[type="date"] {
            width: auto;
            display: inline-block;
        }

        button {
            background-color: #5cb85c;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #4cae4c;
        }

        .form-footer {
            text-align: center;
            margin-top: 20px;
        }

        .form-footer p {
            color: #888;
        }
        
       .field input[type="date"],
       .field input[type="text"] {
        width: 100%; 
        padding: 12px; 
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 14px;
        box-sizing: border-box; 
    }
input[readonly] {
    background-color: #f0f0f0; 
    color: #333;
    border: 1px solid #ddd;
    cursor: not-allowed; 
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
		         12: 7,
		         24: 10
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
                    <option value="1000000">1.000.000</option>
                    <option value="5000000">5.000.000</option>
                    <option value="10000000">10.000.000</option>
                    <option value="15000000">15.000.000</option>
                </select>
            </div>

           
            <div class="field">
                <label for="cuotas">Cantidad de Cuotas:</label>
                <select id="cuotas" name="cuotas" required onchange="actualizarInteres();calcularMontoAPagar()">
                    <option value="3">3 cuotas</option>
                    <option value="6">6 cuotas</option>
                    <option value="12">12 cuotas</option>
                    <option value="24">24 cuotas</option>
                </select>
            </div>
            
            
            <div class="field">
       		 <label for="interes">Interés (%):</label>
      		  <input type="text" id="interes" name="interes" value="2" readonly >
   		 </div>
                <!--  
                <select id="interes" name="interes" required onchange="calcularMontoAPagar()">
                    <option value="2">2%</option>
                    <option value="5">5%</option>
                    <option value="7">7%</option>
                    <option value="10">10%</option>
                </select>
                -->

            
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

