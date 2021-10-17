<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/14/2021
  Time: 11:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="static/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="static/bootstrap/dataTables.bootstrap.min.css">
    <style>
        .message{
            color:green;
        }
        label {
            text-align: right;
        }
    </style>
</head>
<body>
<div style="margin: 50px 20px 20px 50px">
    <h1 style="margin-top: 20px ; color: #007bff ;text-align: center; font-family: 'Baby Universe'">Create new Contract</h1>

    <p>
        <c:if test='${requestScope["message"] != null}'>
            <span class="message">${requestScope["message"]}</span>
        </c:if>
    </p>
    <%--                int contractId, String contractStartDate, String contractEndDate, double contractDeposit,--%>
    <%--                double contractTotalMoney, int employeeId, int customerId, int serviceId--%>
    <form action="/contract" method="post">
        <input type="hidden" name="action" value="create">

        <div class="form-group row">
            <label class="col-sm-3 col-form-label">contractStartDate</label>
            <div class="col-sm-6">
                <input type="date" class="form-control"  name="contractStartDate" >
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">contractEndDate</label>
            <div class="col-sm-6">
                <input type="date" class="form-control"  name="contractEndDate" >
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">contractDeposit</label>
            <div class="col-sm-6">
                <input type="text" class="form-control"  name="contractDeposit" >
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">contractTotalMoney</label>
            <div class="col-sm-6">
                <input type="text" class="form-control"  name="contractTotalMoney" >
            </div>
        </div>


        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">employee</label>
            <div class="col-sm-6">
                <select class="form-control" name="employeeId">
                    <c:forEach var="type" items="${employeeList}">
                        <option value="${type.employeeId}" >${type.employeeName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">customer</label>
            <div class="col-sm-6">
                <select class="form-control" name="customerId">
                    <c:forEach var="type" items="${customerList}">
                        <option value="${type.customerId}" >${type.customerName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>


        <div class="form-group row">
            <label  class="col-sm-3 col-form-label">service</label>
            <div class="col-sm-6">
                <select class="form-control" name="serviceId">
                    <c:forEach var="type" items="${serviceList}">
                        <option value="${type.serviceId}" >${type.serviceName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>






        <div class="form-group row">
            <label  class="col-sm-3 col-form-label"></label>
            <div class="col-sm-6 btn-primary">
                <input type="submit"  class="form-control btn-primary"  value="Create contract">
            </div>
        </div>

        <div class="d-flex ">
            <a href="/contract" class="btn btn-primary" style="margin-left: 50px">Back to list</a>
        </div>
    </form>

</div>

<script src="static/jquery/jquery-3.6.0.min.js"></script>
<script src="static/jquery/jquery.dataTables.min.js"></script>
<script src="static/bootstrap/dataTables.bootstrap4.min.js"></script>
<script src="static/jquery/popper.min.js"></script>
<script src="static/bootstrap/bootstrap.min.js"></script>


</body>
</html>
