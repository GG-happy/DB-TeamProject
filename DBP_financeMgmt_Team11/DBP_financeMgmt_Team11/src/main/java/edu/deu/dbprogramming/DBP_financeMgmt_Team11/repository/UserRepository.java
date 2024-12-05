package edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, String> {

    /**
     * 특정 역할을 가진 사용자 목록 조회
     * @param role 역할
     * @return 사용자 목록
     */
    List<User> findByRole(String role);

    /**
     * 활성화된 사용자 목록 조회
     * @return 활성화된 사용자 목록
     */
    List<User> findByEnabledTrue();

    /**
     * 비활성화된 사용자 목록 조회
     * @return 비활성화된 사용자 목록
     */
    List<User> findByEnabledFalse();

    /**
     * 특정 회사에 소속된 사용자 목록 조회
     * @param clientCode 회사 ID
     * @return 사용자 목록
     */
    List<User> findByClientCodeCompanyId(String clientCode);

    /**
     * 이메일로 사용자 조회
     * @param email 이메일 주소
     * @return 사용자
     */
    Optional<User> findByEmail(String email);

    /**
     * 이름으로 사용자 목록 조회
     * @param name 사용자 이름
     * @return 사용자 목록
     */
    List<User> findByName(String name);
}
