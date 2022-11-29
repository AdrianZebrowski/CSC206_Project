<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Login</title>
		<style>
			table {
				position: absolute;
  				left: 50%;
  				top: 50%;
  				transform: translate(-50%, -50%);
			}
			body, a {
  				background-color: blue;
  				color: white;
  				font-family: consolas;
  				text-align: center;
  				font-size: 24px;
			}
		</style>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.regex.Matcher" %>
<%@ page import="java.util.regex.Pattern" %>
<% 
String employeeEmail = request.getParameter("employeeEmail");
String employeePassword = request.getParameter("employeePassword");
int stocksFolderAccess;
int bondsFolderAccess;
int moneyFolderAccess;

//Get session creation time.
Date createTime = new Date(session.getCreationTime());
session.setAttribute("employeeEmail", employeeEmail);
session.setMaxInactiveInterval(3600);  //1 hour session

Class.forName("com.mysql.cj.jdbc.Driver");  
try{
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employeeaccess", "root", "password");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from folders where employeeEmail='" + employeeEmail + "' and employeePassword='" + employeePassword + "';");
	if(rs.next()){  //make sure the user was found
		System.out.println("employeeEmail = " + employeeEmail);
	
		stocksFolderAccess = rs.getInt("stocksFolderAccess");
		bondsFolderAccess = rs.getInt("bondsFolderAccess");
		moneyFolderAccess = rs.getInt("moneyFolderAccess");
		
		// System.out.println("Stocks folder access: " + stocksFolderAccess);
		// System.out.println("Bonds folder access: " + bondsFolderAccess);
		// System.out.println("Money folder access: " + moneyFolderAccess);
		
		boolean stocksFolderRead = false;
		boolean stocksFolderWrite = false;
		boolean bondsFolderRead = false;
		boolean bondsFolderWrite = false;
		boolean moneyFolderRead = false;
		boolean moneyFolderWrite = false;
		
		if (stocksFolderAccess == 1)
			stocksFolderRead = true;
		
		if (stocksFolderAccess == 2)
		{
			stocksFolderRead = true;
			stocksFolderWrite = true;
		}
		
		if (bondsFolderAccess == 1)
			bondsFolderRead = true;
		
		if (bondsFolderAccess == 2)
		{
			bondsFolderRead = true;
			bondsFolderWrite = true;
		}
		
		if (moneyFolderAccess == 1)
			moneyFolderRead = true;
		
		if (moneyFolderAccess == 2)
		{
			moneyFolderRead = true;
			moneyFolderWrite = true;
		}

		rs.close(); 
		stmt.close();
		conn.close();	
		
		//There are two ways we can update the browser to the login page: 1. forward or 2. sendRedirect.
		request.setAttribute("employeeEmail", employeeEmail);
		request.setAttribute("stocksFolderRead", stocksFolderRead);
		request.setAttribute("stocksFolderWrite", stocksFolderWrite);
		request.setAttribute("bondsFolderRead", bondsFolderRead);
		request.setAttribute("bondsFolderWrite", bondsFolderWrite);
		request.setAttribute("moneyFolderRead", moneyFolderRead);
		request.setAttribute("moneyFolderWrite", moneyFolderWrite);

		RequestDispatcher dispatcher = request.getRequestDispatcher("LoginPage.jsp");
		dispatcher.forward(request, response);
		
	}
	else{
		rs.close();
		stmt.close();
		conn.close();
		out.println("Invalid email or password, try again!");
	}
}
catch(SQLException sqlE){
	out.println(sqlE.getMessage()); //This is for logging purposes only to allow for us to see how a hacker might find information from the website server.
	//We would use a logger here instead and write these caught exceptions to a log gile for sys admin review.
	System.out.println(sqlE.getMessage()); //This console output will be written to a log file specified in the server settings here in eclipse:
	//Double click on server under Servers, Open Launch Configuration, Common Tab, Check the output file box and specify a name for the output file/log. 
	//It will be found at cataline_home/logs/<file_name>.
}
%>
	<table>
		<tr><th><a href = "index.html">User Homepage</a></th></tr>
	</table>
</body>
</html>