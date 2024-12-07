package edu.deu.dbprogramming.DBP_financeMgmt_Team11.controller;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Company;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.CompanyRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class SearchCompanyController {
    private final CompanyRepository companyRepository;

    // 생성자 주입
    public SearchCompanyController(CompanyRepository companyRepository) {
        this.companyRepository = companyRepository;
    }
    /*
    // 샘플 데이터
    private List<Company> getSampleCompanies() {
        List<Company> companies = new ArrayList<>();
        companies.add(new Company(1L, "123-45-67890", "ABC Corp", "대기업", "A+"));
        companies.add(new Company(2L, "234-56-78901", "XYZ Inc", "중소기업", "B"));
        companies.add(new Company(3L, "345-67-89012", "DEF Ltd", "스타트업", "A"));
        return companies;
    }*/

    // 검색 페이지 및 검색 결과 처리
    @GetMapping("/searchCompany")
    public String searchCompanies(
            @RequestParam(value = "businessNo", required = false) String businessNo,
            @RequestParam(value = "companyName", required = false) String companyName,
            Model model) {

        List<Company> companyList = new ArrayList<>();
        if (businessNo != null && !businessNo.isEmpty() && companyName != null && !companyName.isEmpty()) {
            companyList = companyRepository.findByCompanyNameContainingAndBusinessNoContaining(companyName, businessNo);
        } else if (companyName != null && !companyName.isEmpty()) {
            companyList = companyRepository.findByCompanyNameContaining(companyName);
        } else if (businessNo != null && !businessNo.isEmpty()) {
            companyList = companyRepository.findByBusinessNoContaining(businessNo);
        } else{
            companyList = companyRepository.findAll();
        }

        /*
        // 샘플 데이터 가져오기
        List<Company> companyList = getSampleCompanies();

        // 필터링 조건 적용
        if (businessNo != null && !businessNo.isEmpty()) {
            companyList = companyList.stream()
                    .filter(company -> company.getBusinessNo().contains(businessNo))
                    .collect(Collectors.toList());
        }
        if (companyName != null && !companyName.isEmpty()) {
            companyList = companyList.stream()
                    .filter(company -> company.getCompanyName().contains(companyName))
                    .collect(Collectors.toList());
        }*/

        // 결과를 모델에 추가

        model.addAttribute("companyList", companyList);
        model.addAttribute("businessNo", businessNo);
        model.addAttribute("companyName", companyName);
        return "searchCompany";
    }
}
