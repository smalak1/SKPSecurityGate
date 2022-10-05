package com.crystal.webservice;

import javax.ws.rs.Path;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Product 
{

		String username;
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		int id;
		
		

		
	
}
