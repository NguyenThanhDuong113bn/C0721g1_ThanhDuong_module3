package controller;

import model.bean.Contract;
import model.service.ContractService;
import model.service.ContractServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ContractServlet", urlPatterns = {"/contract"})
public class ContractServlet extends HttpServlet {
    ContractService contractService = new ContractServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                insertContract(request, response);
                break;
            default:
                listContract(request, response);
                break;
        }
    }

    private void insertContract(HttpServletRequest request, HttpServletResponse response) {
        String contractStartDate =request.getParameter("contractStartDate");
        String contractEndDate = request.getParameter("contractEndDate");
        double contractDeposit = Double.parseDouble(request.getParameter("contractDeposit"));
        double contractTotalMoney = Double.parseDouble(request.getParameter("contractTotalMoney"));
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        int serviceId = Integer.parseInt(request.getParameter("serviceId"));
        Contract contract = new Contract(contractStartDate, contractEndDate, contractDeposit, contractTotalMoney,
                employeeId, customerId, serviceId);
        try {
            Map<String, String> mapMessage =  contractService.insertContract(contract);
            if (mapMessage.isEmpty()) {
                listContract(request, response);
            } else {
                request.setAttribute("messContractDeposit", mapMessage.get("contractDeposit"));
                request.setAttribute("messContractTotalMoney", mapMessage.get("contractTotalMoney"));
                request.setAttribute("contract",contract);
                showNewContract(request, response);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showNewContract(request, response);
                break;
            default:
                listContract(request, response);
                break;
        }
    }

    private void showNewContract(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/contract/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listContract(HttpServletRequest request, HttpServletResponse response) {
        List<Contract> contractList = contractService.selectAllContract();
        request.setAttribute("contractList", contractList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/contract/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    }

