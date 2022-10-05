package com.crystal.basecontroller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.crystal.framework.Frameworkpackage.DeploymentHelper;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.SftpException;

public class AutoDeployer {
	
	
	static String hostname="13.232.115.213";
	static String username="ubuntu";
	static String password="";
	
	static int port=22;
	
	
	static String warNameOnServer="AccountingApp";

	public static void main(String[] args) throws JSchException, SftpException, IOException, URISyntaxException 
	{


		
		InputStream in = AutoDeployer.class.getResourceAsStream("toDeploy.txt");
	    
	    URL resource = AutoDeployer.class.getResource("Sanakey.pem");
	    File F=Paths.get(resource.toURI()).toFile();

		DeploymentHelper dh=new DeploymentHelper();
		List<String> lstOfFilesToDeploy=dh.getListOfFiles(in);
		List<File> lstOfFilesToDeployActual=new ArrayList<>();
		for(String filePath:lstOfFilesToDeploy)
		{			
			filePath=filePath.replaceAll(".java", ".class");
			filePath=filePath.replaceAll("\\\\src\\\\", "\\\\build\\\\classes\\\\");			
			lstOfFilesToDeployActual.add(new File(filePath));
		}
		
		dh.setupJsch(lstOfFilesToDeployActual, F.getAbsolutePath(), username, hostname, port,warNameOnServer);
		
	
	
	}

	
	
	
	

}
