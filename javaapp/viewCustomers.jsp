<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<html>
<head>
<title>MYSql DB Fetch </title>
</head>

<body>
<h1>MySql DB fetch demo</h1>
<body>
<%
  try {

        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://mysqldb:3306/ALSWDB","aladmin","admin");
        Statement st= con.createStatement();
        ResultSet rs=st.executeQuery("select * from customers");
        while(rs.next())
        {
          out.println("CustomerID: >> "+ rs.getInt(1) + "\n");
          out.println("name: >> "+ rs.getString(2) + " " + rs.getString(3) + "\n");
        }

}
  catch(SQLException e) {
    out.println("SQLException caught: " +e.getMessage());
  }
%>

</body>
</html>

