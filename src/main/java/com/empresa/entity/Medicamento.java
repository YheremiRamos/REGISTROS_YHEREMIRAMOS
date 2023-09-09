package com.empresa.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "medicamento")

public class Medicamento {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idMedicamento;
	
	private String nombre;
	private String precio;
	private String stock;
	private String laboratorio;
	
	
}
