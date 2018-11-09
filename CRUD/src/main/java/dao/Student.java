package dao;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@XmlRootElement(name = "Student")
@Table(name = "STUDENT")
public class Student {
	
	@Id
	@XmlElement
	@Column(name = "rollno")
	private int rollNumber;
	
	@XmlElement
	@Column(name = "name")
	private String name;	
	
	@XmlElement
	@Column(name = "physicsmarks")
	private int physicsMarks;
	
	@XmlElement
	@Column(name = "chemistrymarks")
	private int chemistryMarks;
	
	@XmlElement
	@Column(name = "mathmarks")
	private int mathMarks;
	
	@XmlElement
	@Column(name = "dob")
	@Temporal(TemporalType.DATE)
	private Date dob;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getRollNumber() {
		return rollNumber;
	}

	public void setRollNumber(int rollNumber) {
		this.rollNumber = rollNumber;
	}

	public int getPhysicsMarks() {
		return physicsMarks;
	}

	public void setPhysicsMarks(int physicsMarks) {
		this.physicsMarks = physicsMarks;
	}

	public int getChemistryMarks() {
		return chemistryMarks;
	}

	public void setChemistryMarks(int chemistryMarks) {
		this.chemistryMarks = chemistryMarks;
	}

	public int getMathMarks() {
		return mathMarks;
	}

	public void setMathMarks(int mathMarks) {
		this.mathMarks = mathMarks;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}
	
}
