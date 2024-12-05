package edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.LocalDate;

@Entity
@Table(name = "INTERESTRATE")
public class Interestrate {
    @Id
    @Size(max = 20)
    @Column(name = "INTEREST_ID", nullable = false, length = 20)
    private String interestId;

    @NotNull
    @Column(name = "BASE_RATE", nullable = false)
    private Long baseRate;

    @NotNull
    @Column(name = "EFFECTIVE_YEAR", nullable = false)
    private LocalDate effectiveYear;

    @NotNull
    @Column(name = "APPLIED_RATE", nullable = false)
    private Long appliedRate;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "COMPANY_ID", nullable = false)
    private Company company;

    public String getInterestId() {
        return interestId;
    }

    public void setInterestId(String interestId) {
        this.interestId = interestId;
    }

    public Long getBaseRate() {
        return baseRate;
    }

    public void setBaseRate(Long baseRate) {
        this.baseRate = baseRate;
    }

    public LocalDate getEffectiveYear() {
        return effectiveYear;
    }

    public void setEffectiveYear(LocalDate effectiveYear) {
        this.effectiveYear = effectiveYear;
    }

    public Long getAppliedRate() {
        return appliedRate;
    }

    public void setAppliedRate(Long appliedRate) {
        this.appliedRate = appliedRate;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

}