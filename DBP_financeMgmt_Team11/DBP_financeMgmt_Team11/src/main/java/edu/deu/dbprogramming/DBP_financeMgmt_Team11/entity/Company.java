package edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.annotations.ColumnDefault;

@Entity
@Table(name = "COMPANY")
public class Company {
    @Id
    @Size(max = 20)
    @Column(name = "COMPANY_ID", nullable = false, length = 20)
    private String companyId;

    @Size(max = 30)
    @NotNull
    @Column(name = "BUSINESS_NO", nullable = false, length = 30)
    private String businessNo;

    @Size(max = 100)
    @NotNull
    @Column(name = "COMPANY_NAME", nullable = false, length = 100)
    private String companyName;

    @Size(max = 50)
    @Column(name = "COMPANY_SIZE", length = 50)
    private String companySize;

    @Size(max = 10)
    @ColumnDefault("'A'")
    @Column(name = "CREDIT_GRADE", length = 10)
    private String creditGrade;

    public String getCompanyId() {
        return companyId;
    }

    public void setCompanyId(String companyId) {
        this.companyId = companyId;
    }

    public String getBusinessNo() {
        return businessNo;
    }

    public void setBusinessNo(String businessNo) {
        this.businessNo = businessNo;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanySize() {
        return companySize;
    }

    public void setCompanySize(String companySize) {
        this.companySize = companySize;
    }

    public String getCreditGrade() {
        return creditGrade;
    }

    public void setCreditGrade(String creditGrade) {
        this.creditGrade = creditGrade;
    }

}