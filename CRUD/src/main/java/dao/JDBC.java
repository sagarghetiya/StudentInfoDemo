package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class JDBC {
	public int createStudent(Student student) {
		try {
			String myDriver = "com.mysql.jdbc.Driver";
			String myUrl = "jdbc:mysql://localhost:3306/StuInfo";
			Class.forName(myDriver);
			Connection conn = DriverManager.getConnection(myUrl, "root", "test");
			Statement stmt = conn.createStatement();
			String sql = "INSERT INTO STUDENT "+"VALUES ("+student.getRollNumber()+", '"+student.getName()+"', "+student.getPhysicsMarks()+", "+student.getChemistryMarks()+", "+student.getDob()+")";
			stmt.executeQuery(sql);
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
		
		}
	}
}
