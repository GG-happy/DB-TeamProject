package edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity;

public class AccountAndLoanDto {
    private String accountId;
    private String accountNo;
    private String accountName;
    private String classifica;
    private double balance;
    private String branch;
    private String openDate;
    private String loanId;
    private double loanAmount;
    private String repaymentPeriod;
    private String repaymentStatus;
    private double appliedRate;

    // 생성자
    public AccountAndLoanDto(String accountId, String accountNo, String accountName, String classifica, double balance,
                             String branch, String openDate, String loanId, double loanAmount, String repaymentPeriod,
                             String repaymentStatus, double appliedRate) {
        this.accountId = accountId;
        this.accountNo = accountNo;
        this.accountName = accountName;
        this.classifica = classifica;
        this.balance = balance;
        this.branch = branch;
        this.openDate = openDate;
        this.loanId = loanId;
        this.loanAmount = loanAmount;
        this.repaymentPeriod = repaymentPeriod;
        this.repaymentStatus = repaymentStatus;
        this.appliedRate = appliedRate;
    }

    // 기본 생성자 (필요 시 추가)
    public AccountAndLoanDto() {}

    // Getters
    public String getAccountId() {
        return accountId;
    }

    public String getAccountNo() {
        return accountNo;
    }

    public String getAccountName() {
        return accountName;
    }

    public String getClassifica() {
        return classifica;
    }

    public double getBalance() {
        return balance;
    }

    public String getBranch() {
        return branch;
    }

    public String getOpenDate() {
        return openDate;
    }

    public String getLoanId() {
        return loanId;
    }

    public double getLoanAmount() {
        return loanAmount;
    }

    public String getRepaymentPeriod() {
        System.out.println("getRepaymentPeriod:"+ repaymentPeriod);
        return repaymentPeriod;
    }

    public String getRepaymentStatus() {
        return repaymentStatus;
    }

    public double getAppliedRate() {
        return appliedRate;
    }

    // Setters
    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public void setClassifica(String classifica) {
        this.classifica = classifica;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public void setOpenDate(String openDate) {
        this.openDate = openDate;
    }

    public void setLoanId(String loanId) {
        this.loanId = loanId;
    }

    public void setLoanAmount(double loanAmount) {
        this.loanAmount = loanAmount;
    }

    public void setRepaymentPeriod(String repaymentPeriod) {
        this.repaymentPeriod = repaymentPeriod;
    }

    public void setRepaymentStatus(String repaymentStatus) {
        this.repaymentStatus = repaymentStatus;
    }

    public void setAppliedRate(double appliedRate) {
        this.appliedRate = appliedRate;
    }
}
