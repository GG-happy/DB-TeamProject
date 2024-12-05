package edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Company;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CompanyRepository extends JpaRepository<Company, String> {

    // 사업자 등록번호로 기업 검색
    Company findByBusinessNo(String businessNo);

    // 기업명을 기준으로 기업 검색 (부분 일치)
    List<Company> findByCompanyNameContaining(String companyName);

    // 특정 규모의 기업 검색
    List<Company> findByCompanySize(String companySize);

    // 신용등급으로 기업 검색
    List<Company> findByCreditGrade(String creditGrade);
}
