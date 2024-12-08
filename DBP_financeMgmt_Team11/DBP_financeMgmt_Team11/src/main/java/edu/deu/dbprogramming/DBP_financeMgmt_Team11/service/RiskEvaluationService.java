package edu.deu.dbprogramming.DBP_financeMgmt_Team11.service;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Riskevaluation;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.RiskevaluationRepository;
import jakarta.validation.constraints.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.NoSuchElementException;
import java.util.Optional;

@Service
public class RiskEvaluationService {

    @Autowired
    private RiskevaluationRepository repository;

    public Riskevaluation getCurrentRisk(String riskId, String companyId) {
        // risk_id로 현재 데이터 조회
        Optional<Riskevaluation> currentRiskOpt = repository.findByRiskIdAndCompanyId(riskId, companyId).stream().findFirst();
        if(riskId.equals("null")) {
            return new Riskevaluation();
        }

        if (currentRiskOpt.isEmpty()) {
            throw new NoSuchElementException("현재 riskId로 데이터를 찾을 수 없습니다: " + riskId);
        }
        return currentRiskOpt.get();

    }

    /**
     * 특정 risk_id를 기준으로 이전 데이터를 조회
     * @param riskId 기준 risk_id
     * @param companyId 기업 ID
     * @return 이전 데이터
     */
    public Riskevaluation getPreviousRisk(String riskId, String companyId) {
        // risk_id로 현재 데이터 조회
        Optional<Riskevaluation> currentRiskOpt = repository.findByRiskIdAndCompanyId(riskId, companyId).stream().findFirst();
        if (currentRiskOpt.isEmpty()) {
            throw new NoSuchElementException("현재 riskId로 데이터를 찾을 수 없습니다: " + riskId);
        }
        Riskevaluation currentRisk = currentRiskOpt.get();

        // 현재 데이터의 evaluation_date로 이전 데이터 조회
        Optional<Riskevaluation> previousRiskOpt = repository.findPreviousRiskByDateAndCompanyId(currentRisk.getEvaluationDate(), companyId).stream().findFirst();
        if (previousRiskOpt.isEmpty()) {
            throw new NoSuchElementException("이전 데이터가 존재하지 않습니다.");
        }
        return previousRiskOpt.get();
    }

    /**
     * 특정 risk_id를 기준으로 이후 데이터를 조회
     * @param riskId 기준 risk_id
     * @param companyId 기업 ID
     * @return 이후 데이터
     */
    public Riskevaluation getNextRisk(String riskId, String companyId) {
        // risk_id로 현재 데이터 조회
        Optional<Riskevaluation> currentRiskOpt = repository.findByRiskIdAndCompanyId(riskId, companyId).stream().findFirst();
        if (currentRiskOpt.isEmpty()) {
            throw new NoSuchElementException("현재 riskId로 데이터를 찾을 수 없습니다: " + riskId);
        }
        Riskevaluation currentRisk = currentRiskOpt.get();

        // 현재 데이터의 evaluation_date로 이후 데이터 조회
        System.out.println(currentRisk.getEvaluationDate());
        //DB의 Date에 저장되는 시간과 여기서 활용되는 0시0분0초의 차이로 인해 현재 날짜로 조회되어 +1일 후 레포지토리에서 현재날짜+1로 포함하여 사용
        Optional<Riskevaluation> nextRiskOpt = repository.findNextRiskByDateAndCompanyId(currentRisk.getEvaluationDate().plusDays(1), companyId).stream().findFirst();
        if (nextRiskOpt.isEmpty()) {
            throw new NoSuchElementException("다음 데이터가 존재하지 않습니다.");
        }
        return nextRiskOpt.get();
    }

    /**
     * 가장 최근의 리스크 평가 보고서를 가져옴
     * @param companyId 기업 ID
     * @return 가장 최근의 리스크 평가 데이터
     */
    public Riskevaluation getLatestRiskEvaluation(String companyId) {
        Optional<Riskevaluation> latestRiskOpt = repository.findLatestRiskEvaluationByCompanyId(companyId).stream().findFirst();
        if (latestRiskOpt.isEmpty()) {
            throw new NoSuchElementException("해당 기업에 대한 가장 최근의 리스크 평가 데이터가 없습니다. 회사 ID: " + companyId);
        }
        return latestRiskOpt.get();
    }

    /**
     * 리스크 평가 데이터 저장
     * @param riskevaluation 저장할 리스크 평가 데이터
     * @return 저장된 데이터
     */
    public Riskevaluation saveRiskEvaluation(Riskevaluation riskevaluation) {
        // 새로 저장 시 PK는 DB에서 생성되므로 riskId는 null이어야 함
        return repository.save(riskevaluation);
    }
}
