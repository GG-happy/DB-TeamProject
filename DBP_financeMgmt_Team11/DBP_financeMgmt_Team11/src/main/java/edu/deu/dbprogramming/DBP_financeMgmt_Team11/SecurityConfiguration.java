/*
 * Copyright 2020 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package edu.deu.dbprogramming.DBP_financeMgmt_Team11;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.LogoutConfigurer;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.sql.DataSource;

import static org.springframework.security.config.Customizer.withDefaults;

/**
 * An example of explicitly configuring Spring Security with the defaults.
 *
 * @author Rob Winch
 */
@Configuration
@EnableWebSecurity
public class SecurityConfiguration {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        // @formatter:off
        http
                .authorizeHttpRequests((authorize) -> authorize
                        .requestMatchers("/admin-home").hasRole("ADMIN") // "/admin-home" 경로는 ADMIN 권한만 접근 가능
                        .anyRequest().authenticated()
                )
                .httpBasic(withDefaults())
                .formLogin((formLogin) -> formLogin
                        .defaultSuccessUrl("/client-home", true) // 기본적으로 모든 사용자 성공 시 리디렉션
                        .successHandler((request, response, authentication) -> {
                            // 권한에 따라 리디렉션 처리
                            if (authentication.getAuthorities().stream()
                                    .anyMatch(auth -> auth.getAuthority().equals("ROLE_ADMIN"))) {
                                response.sendRedirect("/admin-home");
                            } else {
                                response.sendRedirect("/client-home");
                            }
                        })
                        .permitAll()

                );
        // @formatter:on
        return http.build();
    }

    @Bean
    public UserDetailsService userDetailsService(DataSource dataSource) {
        JdbcUserDetailsManager userDetailsManager = new JdbcUserDetailsManager(dataSource);

        // 사용자 정보 조회 쿼리
        userDetailsManager.setUsersByUsernameQuery(
                "SELECT USER_ID AS username, PASSWORD, ENABLED FROM USERS WHERE USER_ID = ?"
        );

        // 권한 정보 조회 쿼리
        userDetailsManager.setAuthoritiesByUsernameQuery(
                "SELECT USER_ID AS username, ROLE AS authority FROM USERS WHERE USER_ID = ?"
        );

        return userDetailsManager;
    }


    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(); // BCrypt 사용
    }

}