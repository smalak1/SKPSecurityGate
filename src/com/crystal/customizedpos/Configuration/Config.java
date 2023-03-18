package com.crystal.customizedpos.Configuration;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.crystal.Login.LoginServiceImpl;
import com.crystal.Frameworkpackage.CommonFunctions;



@WebListener
public class Config implements ServletContextListener {

    public void contextInitialized(ServletContextEvent event) {
    	
    	
    	CommonFunctions cf=new CommonFunctions();
    	cf.initializeApplication(new Class[] {ConfigurationServiceImpl.class,LoginServiceImpl.class});
    	    	

    	
    }

    public void contextDestroyed(ServletContextEvent event) {
        // Do stuff during webapp's shutdown.
    }

}