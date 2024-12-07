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
    private int repaymentPeriod;
    private String repaymentStatus;
    private double appliedRate;

    // 생성자
    public AccountAndLoanDto(String accountId, String accountNo, String accountName, String classifica, double balance,
                             String branch, String openDate, String loanId, double loanAmount, int repaymentPeriod,
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

    // Getters and Setters
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

    public int getRepaymentPeriod() {
        return repaymentPeriod;
    }

    public String getRepaymentStatus() {
        return repaymentStatus;
    }

    public double getAppliedRate() {
        return appliedRate;
    }
}
