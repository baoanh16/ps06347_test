<%-- 
    Document   : student_form
    Created on : May 16, 2018, 8:07:39 AM
    Author     : MSI
--%>

<%@page import="controller.EmpController"%>
<%@page import="bean.NhanVien"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="${pageContext.servletContext.contextPath}/css/style.css" rel="stylesheet"/>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("empID"));
            NhanVien e = EmpController.getInfoEmp(id);
        %>
        <div class="form-style-6">
            <form action="editEmp.htm" method="post">
                Mã sinh viên: <input type="text" name="id" placeholder="" value="<%=e.getManv()%>" readonly="readonly"/><br>
                Tên sinh viên: <input type="text" name="name" placeholder="" value="<%=e.getTennv()%>"/><br>
                Địa chỉ: <input type="text" name="address" placeholder="" value="<%=e.getDiachi()%>"><br>
                Giới tính: <select name="gender">
                    <option value="Nam" <%= e.getGioitinh().equals("Nam")?"selected":""%>>Nam</option>
                    <option value="Nữ" <%= e.getGioitinh().equals("Nữ")?"selected":""%>>Nữ</option>
                </select><br>
                <input type="submit" value="Send" />
            </form>  
        </div>

    </body>
</html>
