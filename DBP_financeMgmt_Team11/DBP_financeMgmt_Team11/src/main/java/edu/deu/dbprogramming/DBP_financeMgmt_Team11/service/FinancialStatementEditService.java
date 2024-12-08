package edu.deu.dbprogramming.DBP_financeMgmt_Team11.service;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Company;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Financialstatement;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.CompanyRepository;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.FinancialstatementRepository;
import org.springframework.stereotype.Service;

@Service
public class FinancialStatementEditService {

    private final FinancialstatementRepository financialstatementRepository;
    private final CompanyRepository companyRepository;

    public FinancialStatementEditService(FinancialstatementRepository financialstatementRepository, CompanyRepository companyRepository) {
        this.financialstatementRepository = financialstatementRepository;
        this.companyRepository = companyRepository;
    }

    public Financialstatement getFinancialStatement(String year, String quarter, String companyID) {
        String db_quarter="";

        db_quarter = switch (quarter) {
            case "Q1" -> "1";
            case "Q2" -> "2";
            case "Q3" -> "3";
            case "Q4" -> "4";
            default -> db_quarter;
        };
        String db_year_quarter= year +"-"+db_quarter;

        Company company=companyRepository.findByCompanyId(companyID);
        return financialstatementRepository.findByQuarterAndCompany(db_year_quarter,company);
    }


}
