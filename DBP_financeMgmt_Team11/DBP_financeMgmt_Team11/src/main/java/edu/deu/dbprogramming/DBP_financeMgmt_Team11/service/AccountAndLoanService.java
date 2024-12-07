package edu.deu.dbprogramming.DBP_financeMgmt_Team11.service;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.AccountAndLoanDto;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.AccountAndLoanDao;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountAndLoanService {

    private final AccountAndLoanDao accountAndLoanDao;

    public AccountAndLoanService(AccountAndLoanDao accountAndLoanDao) {
        this.accountAndLoanDao = accountAndLoanDao;
    }

    public List<AccountAndLoanDto> getAccountAndLoanDto(String companyId) {
        return accountAndLoanDao.getAccountAndLoanInfo(companyId);
    }
}
