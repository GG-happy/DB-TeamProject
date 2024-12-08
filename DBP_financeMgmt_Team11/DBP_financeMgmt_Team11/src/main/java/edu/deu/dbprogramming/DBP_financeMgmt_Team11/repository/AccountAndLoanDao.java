package edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.AccountAndLoanDto;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AccountAndLoanDao {
    private final JdbcTemplate jdbcTemplate;

    public AccountAndLoanDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<AccountAndLoanDto> getAccountAndLoanInfo(String companyId) {
        String query = """
                SELECT
                    a.account_id AS accountId,
                    a.account_no AS accountNo,
                    a.account_name AS accountName,
                    a.classifica AS classifica,
                    a.balance AS balance,
                    a.branch AS branch,
                    TO_CHAR(a.open_date, 'YYYY-MM-DD') AS openDate,
                    l.loan_id AS loanId,
                    l.loan_amount AS loanAmount,
                    l.repayment_period AS repaymentPeriod,
                    l.repayment_status AS repaymentStatus,
                    ir.applied_rate AS appliedRate
                FROM Account a
                LEFT JOIN Loan l ON a.account_id = l.account_id
                LEFT JOIN InterestRate ir ON l.loan_rate = ir.interest_id
                WHERE a.company_id = ?
                """;

        RowMapper<AccountAndLoanDto> rowMapper = (rs, rowNum) -> new AccountAndLoanDto(
                rs.getString("accountId"),
                rs.getString("accountNo"),
                rs.getString("accountName"),
                rs.getString("classifica"),
                rs.getDouble("balance"),
                rs.getString("branch"),
                rs.getString("openDate"),
                rs.getString("loanId"),
                rs.getDouble("loanAmount"),
                rs.getInt("repaymentPeriod"),
                rs.getString("repaymentStatus"),
                rs.getDouble("appliedRate")
        );
        return jdbcTemplate.query(query, rowMapper, companyId);
    }

    public AccountAndLoanDto getAccountAndLoanInfo(String companyId, String accountId) {
        String query = """
            SELECT
                a.account_id AS accountId,
                a.account_no AS accountNo,
                a.account_name AS accountName,
                a.classifica AS classifica,
                a.balance AS balance,
                a.branch AS branch,
                TO_CHAR(a.open_date, 'YYYY-MM-DD') AS openDate,
                l.loan_id AS loanId,
                l.loan_amount AS loanAmount,
                l.repayment_period AS repaymentPeriod,
                l.repayment_status AS repaymentStatus,
                ir.applied_rate AS appliedRate
            FROM Account a
            LEFT JOIN Loan l ON a.account_id = l.account_id
            LEFT JOIN InterestRate ir ON l.loan_rate = ir.interest_id
            WHERE a.company_id = ? AND a.account_id = ?
            """;

        RowMapper<AccountAndLoanDto> rowMapper = (rs, _) -> new AccountAndLoanDto(
                rs.getString("accountId"),
                rs.getString("accountNo"),
                rs.getString("accountName"),
                rs.getString("classifica"),
                rs.getDouble("balance"),
                rs.getString("branch"),
                rs.getString("openDate"),
                rs.getString("loanId"),
                rs.getDouble("loanAmount"),
                rs.getInt("repaymentPeriod"),
                rs.getString("repaymentStatus"),
                rs.getDouble("appliedRate")
        );

        try {
            return jdbcTemplate.queryForObject(query, rowMapper, companyId, accountId);
        } catch (EmptyResultDataAccessException e) {
            // 데이터가 없는 경우 null을 반환하거나 예외를 던질 수 있음
            return null;
        } catch (IncorrectResultSizeDataAccessException e) {
            // 결과가 2개 이상인 경우 처리 (원하는 로직에 따라 수정)
            throw new RuntimeException("Unexpected multiple results for accountId: " + accountId);
        }
    }

}
