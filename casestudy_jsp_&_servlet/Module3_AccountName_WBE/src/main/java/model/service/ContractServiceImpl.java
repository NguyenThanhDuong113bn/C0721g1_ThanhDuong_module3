package model.service;

import model.bean.Contract;
import model.repository.ContractRepository;
import model.repository.ContractRepositoryImpl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ContractServiceImpl implements ContractService {
    ContractRepository repository = new ContractRepositoryImpl();

    @Override
    public List<Contract> selectAllContract() {
        return  repository.selectAllContract();
    }

    @Override
    public Map<String, String> insertContract(Contract contract) throws SQLException {
        Map<String, String> mapMessage = new HashMap<>();

        return mapMessage;
    }
}
