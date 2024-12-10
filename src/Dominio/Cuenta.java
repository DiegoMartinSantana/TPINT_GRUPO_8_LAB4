package Dominio;

import java.time.LocalDate;

public class Cuenta {
	private int idCuenta;
    private int idCliente;
    private int tipo;
    private LocalDate creacion;
    private String cbu;
    private float saldo;
    private Cliente cliente;
    private boolean activa;
    
   
    
    public Cuenta() {}

    public Cuenta(int idCuenta, int idCliente, int tipo, LocalDate creacion, String cbu, float saldo, boolean activa) {
        this.idCuenta = idCuenta;
        this.idCliente = idCliente;
        this.tipo = tipo;
        this.creacion = creacion;
        this.cbu = cbu;
        this.saldo = saldo;
        this.activa = activa;
       
    }

    public int getIdCuenta() {
        return idCuenta;
    }

    public void setIdCuenta(int idCuenta) {
        this.idCuenta = idCuenta;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public LocalDate getCreacion() {
        return creacion;
    }

    public void setCreacion(LocalDate creacion) {
        this.creacion = creacion;
    }

    public String getCbu() {
        return cbu;
    }

    public void setCbu(String cbu) {
        this.cbu = cbu;
    }

    public float getSaldo() {
        return saldo;
    }

    public void setSaldo(float saldo) {
        this.saldo = saldo;
    }

    public boolean isActiva() {
        return activa;
    }

    public void setActiva(boolean activa) {
        this.activa = activa;
    }
    
    public Cliente getCliente() {
    	return cliente;
    }

    public void setCliente(Cliente cliente) {
    	this.cliente = cliente;
    }
    
}


