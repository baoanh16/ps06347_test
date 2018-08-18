<%-- 
    Document   : student_success
    Created on : May 16, 2018, 8:20:20 AM
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Thông tin sinh viên</h1>
        <ul>
            <li>Họ và tên: ${name}</li>
            <li>Điểm tb: ${mark}</li>
            <li>Chuyên ngành: ${major}</li>
        </ul>
    </body>
</html>
