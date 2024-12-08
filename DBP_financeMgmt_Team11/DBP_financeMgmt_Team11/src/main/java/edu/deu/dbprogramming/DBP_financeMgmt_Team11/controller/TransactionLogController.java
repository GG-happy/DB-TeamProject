package edu.deu.dbprogramming.DBP_financeMgmt_Team11.controller;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Transaction;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.CompanyRepository;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.AccountAndLoanService;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.TransactionService;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class TransactionLogController {

    @Autowired
    private TransactionService transactionService;



    public TransactionLogController(UserService userService) {
    }

    @GetMapping("/transactionsLog")
    public String listTransactions(@AuthenticationPrincipal User user,
                                   @RequestParam(value = "accountId", required = false) String accountId,
                                   Model model, HttpSession session) {

        Map<String, Object> userinfo = UserService.getUserInfo(user);
        String clientCode;
        if(userinfo.get("role").equals("ROLE_bank-manager")) {
            clientCode=(String) session.getAttribute("SelectedClientCode");
            model.addAttribute("isManager", true);
        }else {
            clientCode = (String) userinfo.get("client_code");
            model.addAttribute("isManager", false);
            if (clientCode == null) {
                return "redirect:/"; // client_code가 없는 경우 홈으로 리다이렉션
            }
        }



        List<Transaction> transactions = transactionService.findTransactionByClientCodeAndAccountId(clientCode, accountId);
        model.addAttribute("transactions", transactions);
        return "transactionLog"; // 이 HTML 파일 이름이 `transactions.html`과 일치해야 합니다.
    }
}
