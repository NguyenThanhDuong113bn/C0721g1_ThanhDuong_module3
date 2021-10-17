package model.repository;

import model.bean.Contract;

import java.sql.SQLException;
import java.util.List;

public interface ContractRepository {
    public List<Contract> selectAllContract();

    public void insertContract(Contract contract) throws SQLException;
}
