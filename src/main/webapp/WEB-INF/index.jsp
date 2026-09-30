<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSPLAB2</title>
</head>

<body>

<h2>Student Records</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>MARKS</th>
    </tr>

    <%
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/rohith1",
                    "root",
                    "RohithEmp@2006"
            );

            st = con.createStatement();

            rs = st.executeQuery("SELECT * FROM student");

            while (rs.next()) {
    %>

    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getInt("marks") %></td>
    </tr>

    <%
        }

    } catch (Exception e) {
    %>

    <tr>
        <td colspan="3">
            Error: <%= e.getMessage() %>
        </td>
    </tr>

    <%
        } finally {

            try {
                if (rs != null) rs.close();
            } catch (Exception e) {
            }

            try {
                if (st != null) st.close();
            } catch (Exception e) {
            }

            try {
                if (con != null) con.close();
            } catch (Exception e) {
            }
        }
    %>

</table>

</body>
</html>