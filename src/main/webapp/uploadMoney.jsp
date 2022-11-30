<%@ page import="java.io.File, java.util.List, java.util.Iterator" %>
<%@ page import="org.apache.commons.fileupload.*,org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>

<%
	String foldersPath = "E:\\Users\\Benihime\\Documents\\Programming\\CSC206\\Group Lab\\CSC206_Project\\group project\\src\\main\\webapp\\WEB-INF\\employeeFolders\\moneyFolder";
	String realPath = application.getRealPath(foldersPath);
	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setSizeThreshold(1024);
	factory.setRepository(new File(foldersPath));
	ServletFileUpload uploader = new ServletFileUpload(factory);
	
	try 
	{
		List<FileItem> items = uploader.parseRequest(request);
		Iterator<FileItem> iterator = items.iterator();
		while (iterator.hasNext())
		{
			FileItem item = iterator.next();
			File file = new File(foldersPath + "/" + item.getName());
			item.write(file);
			out.write("<p>" + file.getName() + " was uploaded successfully.</p>");
			request.getSession().invalidate();
		}
	}
	catch (FileUploadException e)
	{
		out.write("<p>error uploading file. </p>");
	}

%>
<table>
	<tr><th><a href = "index.html">User Homepage</a></th></tr>
</table>