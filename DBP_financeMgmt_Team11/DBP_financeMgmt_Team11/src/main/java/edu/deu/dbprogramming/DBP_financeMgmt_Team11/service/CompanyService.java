package edu.deu.dbprogramming.DBP_financeMgmt_Team11.service;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.CompanyRepository;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Company; // Company 엔티티 임포트
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyService {

    @Autowired
    private CompanyRepository companyRepository;

    public List<Company> getAllCompanies() {
        return companyRepository.findAll(); // 모든 기업 정보를 가져옵니다.
    }
}
