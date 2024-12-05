package edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.LocalDate;

@Entity
@Table(name = "FINANCIALFACTOR")
public class Financialfactor {
    @Id
    @Size(max = 20)
    @Column(name = "FACTOR_ID", nullable = false, length = 20)
    private String factorId;

    @NotNull
    @Column(name = "EVALUATION_DATE", nullable = false)
    private LocalDate evaluationDate;

    @NotNull
    @Column(name = "STABILITY", nullable = false)
    private Long stability;

    @NotNull
    @Column(name = "PROFITABILITY", nullable = false)
    private Long profitability;

    @NotNull
    @Column(name = "ACTIVITY", nullable = false)
    private Long activity;

    @NotNull
    @Column(name = "CASH_FLOW", nullable = false)
    private Long cashFlow;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "COMPANY_ID", nullable = false)
    private Company company;

    @Column(name = "TOTAL_SCORE")
    private Long totalScore;

    public String getFactorId() {
        return factorId;
    }

    public void setFactorId(String factorId) {
        this.factorId = factorId;
    }

    public LocalDate getEvaluationDate() {
        return evaluationDate;
    }

    public void setEvaluationDate(LocalDate evaluationDate) {
        this.evaluationDate = evaluationDate;
    }

    public Long getStability() {
        return stability;
    }

    public void setStability(Long stability) {
        this.stability = stability;
    }

    public Long getProfitability() {
        return profitability;
    }

    public void setProfitability(Long profitability) {
        this.profitability = profitability;
    }

    public Long getActivity() {
        return activity;
    }

    public void setActivity(Long activity) {
        this.activity = activity;
    }

    public Long getCashFlow() {
        return cashFlow;
    }

    public void setCashFlow(Long cashFlow) {
        this.cashFlow = cashFlow;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public Long getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(Long totalScore) {
        this.totalScore = totalScore;
    }

}