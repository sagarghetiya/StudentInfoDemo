package http;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import dao.Student;
import dao.StudentDao;

@Path("/student")
public class Welcome {
	@POST
	@Path("/add/{query}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String addStudent(@FormParam("name") String name,
							 @FormParam("physics") int physicsMarks,
							 @FormParam("maths") int mathMarks,
							 @FormParam("chemistry") int chemistryMarks,
							 @FormParam("dob") String dob,
							 @FormParam("roll") int rollNo) {
		Student student = new Student();
		student.setChemistryMarks(chemistryMarks);
		student.setName(name);
		student.setRollNumber(rollNo);
		student.setMathMarks(mathMarks);
		student.setPhysicsMarks(physicsMarks);
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date tempDate = null;
		try {
			tempDate = sdf1.parse(dob);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		student.setDob(tempDate);
		StudentDao studentDao = new StudentDao();
		if(studentDao.createStudent(student) == 0) {
			return "Error occurred while adding student";
		}else {
			return "Student added succesfully";
		}
	}
}
