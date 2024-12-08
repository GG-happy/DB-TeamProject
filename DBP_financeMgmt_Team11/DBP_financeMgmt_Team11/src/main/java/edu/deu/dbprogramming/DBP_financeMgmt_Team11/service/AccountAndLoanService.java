package edu.deu.dbprogramming.DBP_financeMgmt_Team11.service;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.AccountAndLoanDto;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.AccountAndLoanDao;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountAndLoanService {

    private final AccountAndLoanDao accountAndLoanDao;

    @Autowired
    public AccountAndLoanService(AccountAndLoanDao accountAndLoanDao) {
        this.accountAndLoanDao = accountAndLoanDao;
    }

    public List<AccountAndLoanDto> getAccountAndLoanDto(String companyId) {
        return accountAndLoanDao.getAccountAndLoanInfo(companyId);
    }

    public AccountAndLoanDto getAccountAndLoanDto(String companyId, String accountId) {
        return accountAndLoanDao.getAccountAndLoanInfo(companyId, accountId);
    }

    @Transactional
    public boolean updateAccountAndLoan(String clientCode, AccountAndLoanDto accountAndLoanDto) {
        boolean accountUpdated = accountAndLoanDao.updateAccount(accountAndLoanDto, clientCode);
        if (!accountUpdated) {
            return false;
        }

        if (accountAndLoanDto.getLoanId() != null) {
            boolean loanUpdated = accountAndLoanDao.updateLoan(accountAndLoanDto, clientCode);
            boolean rateUpdated = accountAndLoanDao.updateAppliedRate(accountAndLoanDto, clientCode);

            if (!loanUpdated) {
                throw new RuntimeException("Loan update failed!");
            }
            if (!rateUpdated) {
                throw new RuntimeException("Rate update failed!");
            }
        }

        return true;
    }
}
