package edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Account;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name = "LOAN")
public class Loan {
    @Id
    @Size(max = 20)
    @Column(name = "LOAN_ID", nullable = false, length = 20)
    private String loanId;

    @NotNull
    @Column(name = "LOAN_AMOUNT", nullable = false)
    private Long loanAmount;

    @NotNull
    @Column(name = "REPAYMENT_PERIOD", nullable = false)
    private Long repaymentPeriod;

    @Size(max = 20)
    @NotNull
    @Column(name = "REPAYMENT_STATUS", nullable = false, length = 20)
    private String repaymentStatus;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "ACCOUNT_ID", nullable = false)
    private Account account;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "LOAN_RATE", nullable = false)
    private Interestrate loanRate;

    public String getLoanId() {
        return loanId;
    }

    public void setLoanId(String loanId) {
        this.loanId = loanId;
    }

    public Long getLoanAmount() {
        return loanAmount;
    }

    public void setLoanAmount(Long loanAmount) {
        this.loanAmount = loanAmount;
    }

    public Long getRepaymentPeriod() {
        return repaymentPeriod;
    }

    public void setRepaymentPeriod(Long repaymentPeriod) {
        this.repaymentPeriod = repaymentPeriod;
    }

    public String getRepaymentStatus() {
        return repaymentStatus;
    }

    public void setRepaymentStatus(String repaymentStatus) {
        this.repaymentStatus = repaymentStatus;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Interestrate getLoanRate() {
        return loanRate;
    }

    public void setLoanRate(Interestrate loanRate) {
        this.loanRate = loanRate;
    }

}