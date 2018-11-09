package http;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.sun.jersey.multipart.FormDataParam;

import dao.Student;
import dao.StudentDao;

@Path("/student")
public class Welcome {
	@POST
	@Path("/add")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response addStudent(Student std) {
		StudentDao studentDao = new StudentDao();
		if(studentDao.createStudent(std) == 1) {
			return Response.status(200).entity("success").build();
		}else {
			return Response.status(500).entity("failure").build();
		}
	}

	@POST
	@Path("/search")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response searchStudent(String rollNo) {
		StudentDao studentDao = new StudentDao();
		Student student = studentDao.getStudent(Integer.parseInt(rollNo));
		if(student != null){
			return Response.status(200).entity(student).build();
		}else {
			return Response.serverError().build();
		}
	}
	
	@POST
	@Path("/upload")
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	public Response uploadImage(
			@FormDataParam("pic")InputStream in,
			@FormDataParam("pic_url")String path) throws IOException {
		OutputStream outputStream = null;
		try {
			outputStream = new FileOutputStream(new File(path));
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
			return Response.status(500).entity("failure").build();
		}
		int read = 0;
		byte[] bytes = new byte[1024];

		try {
			while ((read = in.read(bytes)) != -1) {
				try {
					outputStream.write(bytes, 0, read);
				} catch (IOException e) {
					e.printStackTrace();
					return Response.status(500).entity("failure").build();
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
			return Response.status(500).entity("failure").build();
		}finally {
			outputStream.close();
		}
		return Response.status(200).entity("success").build();
	}
}
