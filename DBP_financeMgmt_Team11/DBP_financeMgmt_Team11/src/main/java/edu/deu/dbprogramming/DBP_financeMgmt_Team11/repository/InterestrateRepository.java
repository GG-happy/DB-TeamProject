package edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Interestrate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface InterestrateRepository extends JpaRepository<Interestrate, String> {

    /**
     * 특정 회사의 가장 최근 이자율 조회
     * @param companyId 회사 ID
     * @return 가장 최근 이자율
     */
    Interestrate findFirstByCompanyCompanyIdOrderByEffectiveYearDesc(String companyId);

    Interestrate findByInterestId(String interestId);

    /**
     * 특정 회사의 이자율 목록 조회
     * @param companyId 회사 ID
     * @return 이자율 목록
     */
    List<Interestrate> findByCompanyCompanyId(String companyId);

    /**
     * 기준 금리가 특정 값 이상인 이자율 조회
     * @param baseRate 최소 기준 금리
     * @return 이자율 목록
     */
    List<Interestrate> findByBaseRateGreaterThanEqual(Long baseRate);

    /**
     * 적용 연도가 특정 연도 이후인 이자율 조회
     * @param effectiveYear 기준 연도
     * @return 이자율 목록
     */
    List<Interestrate> findByEffectiveYearAfter(LocalDate effectiveYear);

    /**
     * 적용 금리가 특정 값 이상인 이자율 조회
     * @param appliedRate 최소 적용 금리
     * @return 이자율 목록
     */
    List<Interestrate> findByAppliedRateGreaterThanEqual(Long appliedRate);
}
