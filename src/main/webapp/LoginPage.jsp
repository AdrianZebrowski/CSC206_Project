<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>User Login</title>
		<style>
			body {
  				background-color: blue;
			}
			
			table {
  				font-family: consolas, sans-serif;
  				border-collapse: collapse;
 				width: 100%;
			}

			td, th {
				 border: 1px solid #dddddd;
				 text-align: left;
				 padding: 8px;
			} 

			.button {
  				background-color: darkblue;
			  	border: none;
				color: white;
				padding: 3px 10px;
				text-align: center;
				text-decoration: none;
				display: inline-block;
				font-size: 24px;
				font-family: consolas;
				margin: 4px 2px;
				cursor: pointer;
			}

			h2{
				color: white;
  				font-family: consolas;
  				font-size: 24px;
			}
			
			footer, header {
  				color: white;
  				font-family: consolas;
  				text-align: center;
  				font-size: 24px;
			}
			
			p, a, h1{
				color: white;
  				font-family: consolas;
  				font-size: 24px;
			}
		</style>
	
	</head>
	<body>	
		<h2>You are logged in as <%= request.getAttribute("employeeEmail")%>!<br></h2>
		<p><b><u>Folders</u></b></p>		
		<%@ page import="java.io.File" %>
		<%@ page import="org.apache.commons.fileupload.*,org.apache.commons.fileupload.disk.*,org.apache.commons.fileupload.servlet.*" %>
		<% 
		if (Boolean.TRUE == request.getAttribute("stocksFolderRead")) 
		{ 
		%>
		<p>Stocks:</p>
		<ul>
		<%
		// Display stocks folder
			String foldersPath = "E:\\Users\\Benihime\\Documents\\Programming\\CSC206\\Group Lab\\CSC206_Project\\group project\\src\\main\\webapp\\WEB-INF\\employeeFolders\\stocksFolder";
			File folder = new File(foldersPath);
			String [] fileNames = folder.list();
			File [] folderItems = folder.listFiles();
			if (folderItems != null)
			{
				for (int i = 0; i < folderItems.length; i++)
				{
					if (!folderItems[i].isDirectory())
					{
						String filePath = foldersPath + "/" + fileNames[i];
						%>
						<li><a HREF = "<%= filePath %>"><%= fileNames[i] %></a></li>
						<%
					}
				}
			}
		%>
		</ul>
		<% 
		}
		%>
		
		<%
		if (Boolean.TRUE == request.getAttribute("stocksFolderWrite"))
		{
		%>

		<form method="POST" enctype="multipart/form-data" action="uploadStocks.jsp">
		  File to upload: <br><br> <input type="file" name="upfile"><br/>
		  <br/>
		  <input type="submit" value="Upload" >
		</form>
		
		<%
		}
		%>
		
		
		<% 
		if (Boolean.TRUE == request.getAttribute("bondsFolderRead")) 
		{ 
		%>
		<p>Bonds:</p>
		<ul>
		<%
		// Display bonds folder
			String foldersPath = "E:\\Users\\Benihime\\Documents\\Programming\\CSC206\\Group Lab\\CSC206_Project\\group project\\src\\main\\webapp\\WEB-INF\\employeeFolders\\bondsFolder";
			File folder = new File(foldersPath);
			String [] fileNames = folder.list();
			File [] folderItems = folder.listFiles();
			if (folderItems != null)
			{
				for (int i = 0; i < folderItems.length; i++)
				{
					if (!folderItems[i].isDirectory())
					{
						String filePath = foldersPath + "/" + fileNames[i];
						%>
						<li><a HREF = "<%= filePath %>"><%= fileNames[i] %></a></li>
						<%
					}
				}
			}
		%>
		</ul>
	<% 
		}
		%>

		
		<%
		if (Boolean.TRUE == request.getAttribute("bondsFolderWrite"))
		{
		%>

		<form method="POST" enctype="multipart/form-data" action="uploadBonds.jsp">
		  File to upload: <br><br> <input type="file" name="upfile"><br/>
		  <br/>
		  <input type="submit" value="Upload">
		</form>
		
		<%
		}
		%>
		
		<% 
		if (Boolean.TRUE == request.getAttribute("moneyFolderRead")) 
		{ 
		%>
		<p>Money:</p>
		<ul>
		<%
		// Display money folder
			String foldersPath = "E:\\Users\\Benihime\\Documents\\Programming\\CSC206\\Group Lab\\CSC206_Project\\group project\\src\\main\\webapp\\WEB-INF\\employeeFolders\\moneyFolder";
			File folder = new File(foldersPath);
			String [] fileNames = folder.list();
			File [] folderItems = folder.listFiles();
			if (folderItems != null)
			{
				for (int i = 0; i < folderItems.length; i++)
				{
					if (!folderItems[i].isDirectory())
					{
						String filePath = foldersPath + "/" + fileNames[i];
						%>
						<li><a HREF = "<%= filePath %>"><%= fileNames[i] %></a></li>
						<%
					}
				}
			}
		%>
		</ul>
		<% 
		}
		%>
		
		<%
		if (Boolean.TRUE == request.getAttribute("moneyFolderWrite"))
		{
		%>

		<form method="POST" enctype="multipart/form-data" action="uploadMoney.jsp">
		  File to upload: <br><br> <input type="file" name="upfile"><br/>
		  <br/>
		  <input type="submit" value="Upload">
		</form>
		
		<%
		}
		%>
		
		
		<h3>
		</h3>
	</body>
</html>