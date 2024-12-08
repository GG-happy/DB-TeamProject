package edu.deu.dbprogramming.DBP_financeMgmt_Team11.service;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Company;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Financialstatement;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.CompanyRepository;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.FinancialstatementRepository;
import org.springframework.stereotype.Service;

import java.sql.SQLException;

@Service
public class FinancialStatementEditService {

    private final FinancialstatementRepository financialstatementRepository;
    private final CompanyRepository companyRepository;

    public FinancialStatementEditService(FinancialstatementRepository financialstatementRepository, CompanyRepository companyRepository) {
        this.financialstatementRepository = financialstatementRepository;
        this.companyRepository = companyRepository;
    }

    public Financialstatement getFinancialStatement(String year, String quarter, String companyID) {
        String db_year_quarter= dbQuarterPaser(year,quarter);
        Company company=companyRepository.findByCompanyId(companyID);
        return financialstatementRepository.findByQuarterAndCompany(db_year_quarter,company);
    }

    public boolean saveFinancialStatement(String year, String quarter, String companyID, Financialstatement financialstatement) {
        String db_year_quarter= dbQuarterPaser(year,quarter);
        Company company=companyRepository.findByCompanyId(companyID);

        Financialstatement old_financialstatement=financialstatementRepository.findByQuarterAndCompany(db_year_quarter,company);
        if(old_financialstatement==null){   //신규 재무제표는 pk를 null로 설정
            financialstatement.setSatementId(null);
            System.out.println("신규 재무제표");
        }else{
            financialstatement.setSatementId(old_financialstatement.getSatementId());
            System.out.println("재무제표 수정");
        }

        financialstatement.setCompany(company);
        financialstatement.setQuarter(db_year_quarter);

        try{
            financialstatementRepository.save(financialstatement);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }

    }

    private String dbQuarterPaser(String year, String quarter){
        String db_quarter="";
        db_quarter = switch (quarter) {
            case "Q1" -> "1";
            case "Q2" -> "2";
            case "Q3" -> "3";
            case "Q4" -> "4";
            default -> db_quarter;
        };
        return year +"-"+db_quarter;
    }


}
