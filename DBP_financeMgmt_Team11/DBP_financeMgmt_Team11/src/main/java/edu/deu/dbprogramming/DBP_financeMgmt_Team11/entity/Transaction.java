package edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Account;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.LocalDate;

@Entity
@Table(name = "TRANSACTION")
public class Transaction {
    @Id
    @Size(max = 20)
    @Column(name = "TRANSACTION_ID", nullable = false, length = 20)
    private String transactionId;

    @NotNull
    @Column(name = "TRANSACTION_DATETIME", nullable = false)
    private LocalDate transactionDatetime;

    @NotNull
    @Column(name = "TRANSACTION_AMOUNT", nullable = false)
    private Long transactionAmount;

    @Size(max = 30)
    @Column(name = "TRANSACTION_TYPE", length = 30)
    private String transactionType;

    @NotNull
    @Column(name = "BALANCE", nullable = false)
    private Long balance;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "ACCOUNT_ID", nullable = false)
    private Account account;

    @Size(max = 100)
    @Column(name = "REMARKS", length = 100)
    private String remarks;

    public String getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(String transactionId) {
        this.transactionId = transactionId;
    }

    public LocalDate getTransactionDatetime() {
        return transactionDatetime;
    }

    public void setTransactionDatetime(LocalDate transactionDatetime) {
        this.transactionDatetime = transactionDatetime;
    }

    public Long getTransactionAmount() {
        return transactionAmount;
    }

    public void setTransactionAmount(Long transactionAmount) {
        this.transactionAmount = transactionAmount;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    public Long getBalance() {
        return balance;
    }

    public void setBalance(Long balance) {
        this.balance = balance;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

}