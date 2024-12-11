package edu.deu.dbprogramming.DBP_financeMgmt_Team11.service;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Financialstatement;
import jakarta.persistence.EntityManager;
import jakarta.persistence.StoredProcedureQuery;
import org.springframework.stereotype.Service;

@Service
public class StoredProcedureService {

    private final EntityManager entityManager;

    public StoredProcedureService(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public void callUpdateCreditScore(Financialstatement financialStatement) {
        String companyId = financialStatement.getCompany().getCompanyId();
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("UpdateCreditScore");

        // 입력 파라미터 등록
        query.registerStoredProcedureParameter(1, String.class, jakarta.persistence.ParameterMode.IN);
        query.setParameter(1, companyId);

        // 실행
        query.execute();
    }
}