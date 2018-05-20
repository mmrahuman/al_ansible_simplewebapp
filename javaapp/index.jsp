Application Server Host details </h3><br>
<%@page import="java.net.InetAddress;" %>
<% out.println("Hello world!!!");%>

<%String ip = "";
InetAddress inetAddress = InetAddress.getLocalHost();
ip = inetAddress.getHostAddress();
out.println("Application Server Host Name :: "+inetAddress.getHostName());%><br>
<%out.println("Application Server IP Address :: "+ip);%>


