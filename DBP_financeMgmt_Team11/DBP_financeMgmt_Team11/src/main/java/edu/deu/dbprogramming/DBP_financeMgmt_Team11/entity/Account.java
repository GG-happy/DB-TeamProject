package edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Company;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.LocalDate;

@Entity
@Table(name = "ACCOUNT")
public class Account {
    @Id
    @Size(max = 20)
    @Column(name = "ACCOUNT_ID", nullable = false, length = 20)
    private String accountId;

    @Size(max = 20)
    @NotNull
    @Column(name = "ACCOUNT_NO", nullable = false, length = 20)
    private String accountNo;

    @Size(max = 30)
    @Column(name = "ACCOUNT_NAME", length = 30)
    private String accountName;

    @Size(max = 10)
    @NotNull
    @Column(name = "CLASSIFICA", nullable = false, length = 10)
    private String classifica;

    @Size(max = 10)
    @Column(name = "BRANCH", length = 10)
    private String branch;

    @NotNull
    @Column(name = "OPEN_DATE", nullable = false)
    private LocalDate openDate;

    @NotNull
    @Column(name = "BALANCE", nullable = false)
    private Long balance;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "COMPANY_ID", nullable = false)
    private Company company;

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public String getAccountNo() {
        return accountNo;
    }

    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getClassifica() {
        return classifica;
    }

    public void setClassifica(String classifica) {
        this.classifica = classifica;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public LocalDate getOpenDate() {
        return openDate;
    }

    public void setOpenDate(LocalDate openDate) {
        this.openDate = openDate;
    }

    public Long getBalance() {
        return balance;
    }

    public void setBalance(Long balance) {
        this.balance = balance;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

}