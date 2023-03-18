package com.crystal.webservice;



import java.io.IOException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import com.crystal.basecontroller.BaseController;
import com.crystal.Frameworkpackage.CommonFunctions;
import com.crystal.Frameworkpackage.ControllerServiceImpl;
import com.crystal.Frameworkpackage.FrmActionService;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;




@Path("/json/metallica")
public class JsonService  extends CommonFunctions
{
	
	
	
	@Context private HttpServletRequest request;
	
	
	
	@GET
	@Path("/get")
	@Produces(MediaType.APPLICATION_JSON)
	public Product getTrackInJSON() {

		request.getSession().setAttribute("username","shoaeb");
		Product track = new Product();
		track.setId(1);
		track.setUsername("Metallica");

		return track;

	}
	
	
	
	CommonFunctions cf=new CommonFunctions();
	ControllerServiceImpl serv=new ControllerServiceImpl();
	
	@GET
	@Path("/BaseWebServicesController")
	@Produces("text/plain")
	public Response serveGet(@QueryParam("actionName")String actionName) throws Exception 
	{					
		return serveWebServiceRequest(actionName);
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/BaseWebServicesController")
	@Produces("text/plain")
	public Response servePost(MyJaxBean input) throws JsonGenerationException, JsonMappingException, IOException, ClassNotFoundException, SQLException 
	{		
		
		System.out.println("param1 = " + input.param1);
	    System.out.println("param2 = " + input.param2);
		return null;
		//return serveWebServiceRequest(actionName);
	}
	
	
	public Response serveWebServiceRequest(String actionName) throws Exception
	{
		System.out.println("Incoming request at "+new Date());
		

		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> hm=new HashMap<>();
		
		Connection con =cf.getConnectionJDBC();
		
		
		HashMap<String, FrmActionService> actions= BaseController.actions;

		
		
				
		if(actionName!=null)
		{
			//classandmethodInfo=getClassNameAndMethodNameUsingJDBC(actionName,con);
			FrmActionService frmAction= (FrmActionService)actions.get(actionName);

			try 
			{		
				Class<?>[] paramString = new Class[2];
				paramString[0] = HttpServletRequest.class;
				paramString[1] = Connection.class;
				
				Class<?> cls = Class.forName(frmAction.getClassName());
				Object obj = cls.newInstance();
				
				Method method = cls.getDeclaredMethod(frmAction.getActionName(),paramString);		
				hm=(HashMap<String, Object>) method.invoke(obj, request,con);
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else
		{
			String s="actionName was not found";					
		}
		String jsonInString = mapper.writeValueAsString(hm);
		/*return Response.ok(jsonInString).header("Access-Control-Allow-Origin", "*").build();*/
		
		//serv.makeAuditTrailEntry(request,cf.getDateTime(con),jsonInString);
		HashMap<String, Object> mapFromRequest=lobjControllerService.getMapfromRequest(request,cf.getDateTime(con),"",con);
		serv.makeAuditTrailEntry(mapFromRequest,cf.getDateTime(con),"");
		
		//will need to fix this issue
		
		
		
		return Response.ok(jsonInString)
	               .header("Access-Control-Allow-Origin", "*")
			      .header("Access-Control-Allow-Methods", "POST, GET, PUT, UPDATE, OPTIONS")
			      .header("Access-Control-Allow-Headers", "*").build();		 
		 
	}
	
	ControllerServiceImpl lobjControllerService=new ControllerServiceImpl();
	

	@POST
	@Path("/post")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response createTrackInJSON1(Product track) {
		
		
		

		String result = "Track saved : " + track;
		return Response.status(201).entity(result).build();

	}
	
	@XmlRootElement
	public class MyJaxBean {
	    @XmlElement public String param1;
	    @XmlElement public String param2;
	}
	
	
}
