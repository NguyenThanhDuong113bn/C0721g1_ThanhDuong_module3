<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/14/2021
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <title>Title</title>
    <link rel="stylesheet" href="static/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="static/bootstrap/dataTables.bootstrap.min.css">


    <style>
        table {
            border: 1px solid;
            margin: 50px 100px 30px 50px;
        }
        p {
            margin-left: 50px;
        }
    </style>
</head>
<body>
<h1 style="text-align: center ; font-family: 'Baby Universe' ; color: #007bff;margin-top: 20px">---- Contract ---</h1>

<div>
    <div class="row mt-5 mb-3">
        <div class="col align-content-start">
            <a href="/contract?action=create" class="btn btn-primary" style="margin-left: 50px">Create Contract</a>
        </div>

        <div class="col align-content-start">
            <a href="/contract?action=createDetail" class="btn btn-primary" style="margin-left: 50px">Create
                ContractDetail</a>
        </div>


    </div>
</div>


<div class="row">
    <div class="col-11">
        <table id="tableCustomer" class="table table-striped">
            <thead>
            <tr>
                <%--                int contractId, String contractStartDate, String contractEndDate, double contractDeposit,--%>
                <%--                double contractTotalMoney, int employeeId, int customerId, int serviceId--%>
                <th scope="col">STT</th>
                <th scope="col">Id</th>
                <th scope="col">contractStartDate</th>
                <th scope="col">contractEndDate</th>
                <th scope="col">contractDeposit</th>
                <th scope="col">contractTotalMoney</th>
                <th scope="col">employeeNAme</th>
                <th scope="col">customerName</th>
                <th scope="col">serviceName</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${contractList}" var="contract" varStatus="a">
                <tr>
                    <td>${a.count}</td>
                    <td>${contract.contractId}</td>
                    <td>${contract.contractStartDate}</td>
                    <td>${contract.contractEndDate}</td>
                    <td>${contract.contractDeposit}</td>
                    <td>${contract.contractTotalMoney}</td>


                    <c:forEach var="type" items="${employeeList}">
                        <c:if test="${type.employeeId == contract.employeeId}">
                            <td>${type.employeeName}</td>
                        </c:if>
                    </c:forEach>


                    <c:forEach var="a" items="${customerList}">
                        <c:if test="${a.customerId == contract.customerId}">
                            <td>${a.customerName}</td>
                        </c:if>
                    </c:forEach>

                    <c:forEach var="type" items="${serviceList}">
                        <c:if test="${type.serviceId == contract.serviceId}">
                            <td>${type.serviceName}</td>
                        </c:if>
                    </c:forEach>


                </tr>

            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="col-1"></div>
</div>

<div class="d-flex mt-3">
    <a href="/view/home/home.jsp" class="btn btn-primary " style="margin-left: 50px"> Back to Menu </a>
</div>

</body>
</html>
