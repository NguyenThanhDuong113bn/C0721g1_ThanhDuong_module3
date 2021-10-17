package model.service;

import model.bean.Contract;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ContractService {
    public List<Contract> selectAllContract();

    public Map<String, String> insertContract(Contract contract) throws SQLException;
}
