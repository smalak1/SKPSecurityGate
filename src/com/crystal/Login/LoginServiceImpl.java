package com.crystal.Login;

import java.net.URLDecoder;
import java.sql.Connection;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUploadException;

import com.crystal.basecontroller.BaseController;

import com.crystal.customizedpos.Configuration.ConfigurationDaoImpl;
import com.crystal.customizedpos.Configuration.ConfigurationServiceImpl;
import com.crystal.framework.Frameworkpackage.CommonFunctions;
import com.crystal.framework.Frameworkpackage.CustomResultObject;


public class LoginServiceImpl extends CommonFunctions {

	public LoginServiceImpl() {

	}
	


	public CustomResultObject validateLogin(HttpServletRequest request, Connection con) {
		CustomResultObject rs = new CustomResultObject();
		HashMap<String, Object> outputMap = new HashMap<>();
		String returnString = "";

		try {
			String Username = request.getParameter("txtusername");
			String Password = request.getParameter("txtpassword");
			LoginDaoImpl lObjLoginDao = new LoginDaoImpl();
			HashMap<String, String> loginDetails = lObjLoginDao.validateLoginUSingJDBC(Username, Password, con);
			if (loginDetails != null && !loginDetails.isEmpty() ) {
				Long user_id = Long.valueOf(loginDetails.get("user_id").toString());				
				
				List<String> roleIds = lObjLoginDao.getRoleIds(user_id, con);
				request.getSession().setAttribute("username", Username);
				request.getSession().setAttribute("userdetails", loginDetails);
				request.getSession().setAttribute("listOfRoles", roles);
				
				request.getSession().setAttribute("elements", getElementsNewLogic(roleIds,CommonFunctions.elements,CommonFunctions.roles));
				request.getSession().setAttribute("actions", getActionsForthisUserDecoupled(user_id, con,CommonFunctions.roles));

				copyImagesFromDBToBufferFolder(request.getServletContext(), con);
				returnString = "Succesfully Logged In";
			} else {
				returnString = "Invaid Username or password";
			}
		} catch (Exception e) {
			writeErrorToDB(e);
			rs.setHasError(true);
		}
		rs.setAjaxData(returnString);
		return rs;
	}

	public CustomResultObject Logout(HttpServletRequest request, Connection con) {
		CustomResultObject rs = new CustomResultObject();
		HashMap<String, Object> outputMap = new HashMap<>();
		try {
			request.getSession().invalidate();
			request.getSession().setAttribute("username", null);
			rs.setAjaxData("Logged Out Succesfully");
		} catch (Exception e) {
			writeErrorToDB(e);
			rs.setHasError(true);
		}
		rs.setReturnObject(outputMap);
		return rs;
	}

	public CustomResultObject showHomePage(HttpServletRequest request, Connection con) {
		CustomResultObject rs = new CustomResultObject();
		HashMap<String, Object> outputMap = new HashMap<String, Object>();
		try {
			
			
			Long app_id=Long.valueOf(((HashMap<String, String>) request.getSession().getAttribute("userdetails")).get("app_id"));
			outputMap.put("app_id", app_id);
			if (request.getSession().getAttribute("username") != null) {
				String fromDate = request.getParameter("fromDate");
				String toDate = request.getParameter("toDate");

				if (fromDate == null || fromDate.equals("") || toDate == null || toDate.equals("")) {
					fromDate = getDateFromDB(con);
					toDate = fromDate;
				}

				outputMap.put("fromDate", fromDate);
				outputMap.put("toDate", toDate);
				

				outputMap.put("type", "P");
				outputMap.put("firmId", "-1");
				outputMap.put("app_id", app_id);
				
				outputMap.put("txtfromdate", fromDate);
				outputMap.put("txttodate", toDate);
				outputMap.put("bankId", "-1");
				
				
				

				
			
				
				

				outputMap.put("todaysDate", getDateFromDB(con));
				rs.setViewName("../index.jsp");
			} else {
				rs.setViewName("login.jsp");
			}
		} catch (Exception e) {
			writeErrorToDB(e);
			rs.setHasError(true);
		}

		rs.setReturnObject(outputMap);
		return rs;
	}

	private HashMap<String, Object> calculateTotal(List<LinkedHashMap<String, Object>> paymentData,
			String[] columnNames) {
		HashMap<String, Object> calculatedDetails = new HashMap<>();
		for (HashMap<String, Object> hm : paymentData) {
			for (String s : columnNames) {
				if (calculatedDetails.get(s) == null) {
					calculatedDetails.put(s, hm.get(s));
				} else {
					double Existingvalue = Double.parseDouble(calculatedDetails.get(s).toString());
					
					String m=hm.get(s)==null?"0":hm.get(s).toString();
					double newValue = Double.parseDouble(m);
					newValue += Existingvalue;
					calculatedDetails.put(s, newValue);
				}
			}
		}
		return calculatedDetails;
	}

	public CustomResultObject showChangePassword(HttpServletRequest request, Connection con) {
		CustomResultObject rs = new CustomResultObject();
		HashMap<String, Object> outputMap = new HashMap<>();
		try {

			rs.setViewName("changePassword.jsp");
			rs.setReturnObject(outputMap);

		} catch (Exception e) {
			writeErrorToDB(e);
			rs.setHasError(true);
		}
		return rs;
	}

	public CustomResultObject changePassword(HttpServletRequest request, Connection con) throws FileUploadException {
		CustomResultObject rs = new CustomResultObject();
		HashMap<String, Object> outputMap = new HashMap<>();
		try {

			String oldPassword = URLDecoder.decode(request.getParameter("oldPassword"), "UTF-8");
			String newPassword = URLDecoder.decode(request.getParameter("newPassword"), "UTF-8");

			String username = request.getSession().getAttribute("username").toString();
			LoginDaoImpl loginDao = new LoginDaoImpl();
			HashMap<String, String> loginDetails = loginDao.validateLoginUSingJDBC(username, oldPassword, con);
			String message = "";
			if (loginDetails != null) {
				loginDao.changePassword(username, newPassword, con);
				message = "Password Changed Succesfully ";
			} else {
				message = "Invalid Old Password";
			}

			rs.setReturnObject(outputMap);
			rs.setAjaxData(message);

		} catch (Exception e) {
			writeErrorToDB(e);
			rs.setHasError(true);
		}
		return rs;
	}
	
	

}
