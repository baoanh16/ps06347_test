<%-- 
    Document   : welcome
    Created on : May 16, 2018, 7:57:12 AM
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nhân viên poly</title>
        <style>
            table{
                border-collapse: collapse;
                width: 100%;
            }
            th,td{
                line-height: 25px;
                border: 1px solid black;
                padding: 5px;
                text-align: center;
            }
            th{
                background-color: grey;
            }
        </style>
    </head>
    <body>
        <table>
            <tr>
                <th>Mã nhân viên</th>
                <th>Tên nhân viên</th>
                <th>Địa chỉ</th>
                <th>Giới tính</th>
                <th>Thao tác</th>
            </tr>
            <c:forEach var="e" items="${emp}">
                <tr>
                    <td>${e.manv}</td>
                    <td>${e.tennv}</td>
                    <td>${e.diachi}</td>
                    <td>${e.gioitinh}</td>
                    <td>
                        <a href="emp_form.htm?empID=${e.manv}">Sửa</a>
                        <a href="deleteEmp.htm?empID=${e.manv}">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <a href="emp_add.htm">
            <button>Thêm</button>
        </a>
    </body>
</html>
