package Dominio;

import java.math.BigDecimal;
import java.util.List;

public class Informe {

	private int cantidadPrestamos;
	private BigDecimal totalPrestado;
	private String clienteLider;
	private double tasaCumplimiento;
	private List<Cliente> clientesVIP;
	
	public Informe() {}
	
	public Informe(int cantidadPrestamos, BigDecimal totalPrestado, String clienteLider, double tasaCumplimiento) {
	    this.cantidadPrestamos = cantidadPrestamos;
	    this.totalPrestado = totalPrestado;
		this.clienteLider = clienteLider;
		this.tasaCumplimiento = tasaCumplimiento;
	}

	public int getCantidadPrestamos() {
		return cantidadPrestamos;
	}

	public void setCantidadPrestamos(int cantidadPrestamos) {
		this.cantidadPrestamos = cantidadPrestamos;
	}

	public BigDecimal getTotalPrestado() {
		return totalPrestado;
	}

	public void setTotalPrestado(BigDecimal totalPrestado) {
		this.totalPrestado = totalPrestado;
	}

	public String getClienteLider() {
		return clienteLider;
	}

	public void setClienteLider(String clienteLider) {
		this.clienteLider = clienteLider;
	}

	public double getTasaCumplimiento() {
		return tasaCumplimiento;
	}

	public void setTasaCumplimiento(double tasaCumplimiento) {
		this.tasaCumplimiento = tasaCumplimiento;
	}

	public List<Cliente> getClientesVIP() {
		return clientesVIP;
	}

	public void setClientesVIP(List<Cliente> clientesVIP) {
		this.clientesVIP = clientesVIP;
	}

	
	
}
		