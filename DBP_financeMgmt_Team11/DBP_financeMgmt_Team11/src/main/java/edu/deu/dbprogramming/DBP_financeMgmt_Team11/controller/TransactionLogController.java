package edu.deu.dbprogramming.DBP_financeMgmt_Team11.controller;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Transaction;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class TransactionLogController {

    @Autowired
    private TransactionService transactionService;

    @GetMapping("/transactionsLog")
    public String listTransactions(@AuthenticationPrincipal User user,
                                   @RequestParam(value = "accountId", required = false) String accountId,
                                   Model model) {

        //TODO:DB 연동 필요

        List<Transaction> transactions = transactionService.getAllTransactions();
        model.addAttribute("transactions", transactions);
        return "transactionLog"; // 이 HTML 파일 이름이 `transactions.html`과 일치해야 합니다.
    }
}
