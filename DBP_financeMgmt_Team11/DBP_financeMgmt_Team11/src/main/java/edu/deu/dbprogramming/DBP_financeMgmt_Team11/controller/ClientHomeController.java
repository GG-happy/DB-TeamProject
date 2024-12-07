package edu.deu.dbprogramming.DBP_financeMgmt_Team11.controller;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.AccountAndLoanDto;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Company;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.CompanyRepository;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.AccountAndLoanService;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.UserService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@Controller
public class ClientHomeController {

    private final CompanyRepository companyRepository;
    private final AccountAndLoanService accountAndLoanService;
    private final UserService userService;

    public ClientHomeController(CompanyRepository companyRepository, AccountAndLoanService accountAndLoanService, UserService userService) {
        this.companyRepository = companyRepository;
        this.accountAndLoanService = accountAndLoanService;
        this.userService = userService;
    }

    @GetMapping("/client-home")
    public String myInfo(@AuthenticationPrincipal User user, Model model) {
        // 로그인된 사용자 정보 가져오기
        Map<String, Object> userinfo = userService.getUserInfo(user);

        // 사용자 이름, 타이틀, 연락처 등 가져오기
        String clientCode = (String) userinfo.get("client_code");
        if (clientCode == null) {
            return "redirect:/"; // client_code가 없는 경우 홈으로 리다이렉션
        }

        // 기업 정보 가져오기
        Company companyInfo = companyRepository.findByCompanyId(clientCode);

        // 계좌 및 대출 정보 가져오기
        List<AccountAndLoanDto> accountAndLoanDtoList = accountAndLoanService.getAccountAndLoanDto(clientCode);

        // 모델에 데이터 추가
        model.addAttribute("companyInfo", companyInfo);
        model.addAttribute("accounts", accountAndLoanDtoList);
        model.addAttribute("name", userinfo.get("name"));
        model.addAttribute("title", userinfo.get("title"));
        model.addAttribute("phone", userinfo.get("phone"));
        model.addAttribute("email", userinfo.get("email"));

        return "clientHome"; // clientHome.html 뷰로 이동
    }
}
