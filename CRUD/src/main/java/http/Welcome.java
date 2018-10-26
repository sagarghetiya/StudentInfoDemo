package http;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import dao.Student;
import dao.StudentDao;

@Path("/student")
public class Welcome {
	@POST
	@Path("/add")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public Response addStudent(Student std) {
		StudentDao studentDao = new StudentDao();
		if(studentDao.createStudent(std) == 0) {
			return Response.status(200).entity("Successfully added user " + std.getName()).build();
		}else {
			return Response.status(201).entity("Successfully added user " + std.getName()).build();
		}
	}
}
