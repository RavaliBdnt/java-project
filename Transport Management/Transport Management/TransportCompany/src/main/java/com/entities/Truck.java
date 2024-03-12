package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Truck {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column(nullable = false)
	private String name;
	@Column(nullable = false)
	private String color;
	@Column(nullable = false, unique = true)
	private String truckNumber;
	@Column(nullable = false)
	private String companyName;
	@Column(nullable = false)
	private String branchName;
	@Column(nullable = false)
	private String purchaseDate;
	@Column(nullable = false)
	private String installedBy;
	@Column(nullable = false)
	private String image;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getTruckNumber() {
		return truckNumber;
	}

	public void setTruckNumber(String truckNumber) {
		this.truckNumber = truckNumber;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public String getInstalledBy() {
		return installedBy;
	}

	public void setInstalledBy(String installedBy) {
		this.installedBy = installedBy;
	}

	public Truck(String name, String color, String truckNumber, String companyName, String branchName,
			String purchaseDate, String installedBy, String image) {
		super();
		this.name = name;
		this.color = color;
		this.truckNumber = truckNumber;
		this.companyName = companyName;
		this.branchName = branchName;
		this.purchaseDate = purchaseDate;
		this.installedBy = installedBy;
		this.image = image;
	}

	public Truck() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Truck [id=" + id + ", name=" + name + ", color=" + color + ", truckNumber=" + truckNumber
				+ ", companyName=" + companyName + ", branchName=" + branchName + ", purchaseDate=" + purchaseDate
				+ ", installedBy=" + installedBy + ", image=" + image + "]";
	}

	

}
