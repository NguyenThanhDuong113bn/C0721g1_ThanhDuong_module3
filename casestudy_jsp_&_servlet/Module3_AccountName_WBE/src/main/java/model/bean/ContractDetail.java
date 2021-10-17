package model.bean;

public class ContractDetail {
    private int contractDetailId ;
    private int quantity ;
    private int contractId ;
    private int attachServiceId;

    public ContractDetail(int quantity, int contractId, int attachServiceId) {
        this.quantity = quantity;
        this.contractId = contractId;
        this.attachServiceId = attachServiceId;
    }

    public ContractDetail(int contractDetailId, int quantity, int contractId, int attachServiceId) {
        this.contractDetailId = contractDetailId;
        this.quantity = quantity;
        this.contractId = contractId;
        this.attachServiceId = attachServiceId;
    }

    public int getContractDetailId() {
        return contractDetailId;
    }

    public void setContractDetailId(int contractDetailId) {
        this.contractDetailId = contractDetailId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public int getAttachServiceId() {
        return attachServiceId;
    }

    public void setAttachServiceId(int attachServiceId) {
        this.attachServiceId = attachServiceId;
    }
}
