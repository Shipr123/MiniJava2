package com.genx.model;

import java.time.LocalDate;

public class Product {

	private Long id;
	private String title;
	private String username;
	private String description;
	private LocalDate targetDate;
	private boolean status;

	protected Product() {

	}

	public Product(long id, String title,  String description, LocalDate targetDate, boolean isDone) {
		super();
		this.id = id;
		this.title = title;
		
		this.description = description;
		this.targetDate = targetDate;
		this.status = isDone;
	}

	public Product(String title, String description, LocalDate targetDate, boolean isDone) {
		super();
		this.title = title;
	
		this.description = description;
		this.targetDate = targetDate;
		this.status = isDone;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	
	

	

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDate getTargetDate() {
		return targetDate;
	}

	public void setTargetDate(LocalDate targetDate) {
		this.targetDate = targetDate;
	}

	public boolean getStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		if (id != other.id)
			return false;
		return true;
	}
}
