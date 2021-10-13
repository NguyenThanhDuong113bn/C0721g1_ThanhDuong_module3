<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/13/2021
  Time: 10:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" type="text/css" href="bootstrap4/css/bootstrap.css">
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a class="btn btn-primary" href="/users?action=users" role="button">List All Users</a>
    </h2>
</center>
<form action="/users" method="post">
    <input type="hidden" name="action" value="create">
    <fieldset>
        <table >
            <legend>User information</legend>
            <tr>
                <th>User Name:</th>
                <td>
                    <input type="text" name="name" id="name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>User Email:</th>
                <td>
                    <input type="text" name="email" id="email" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Country:</th>
                <td>
                    <input type="text" name="country" id="country" size="15"/>
                </td>
            </tr>
            <tr>
                <td><input type="submit" value="Create user"></td>
            </tr>
        </table>
    </fieldset>
</form>

<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="jquery/popper.min.js"></script>
<script src="bootstrap4/js/bootstrap.js"></script>

</body>
</html>
