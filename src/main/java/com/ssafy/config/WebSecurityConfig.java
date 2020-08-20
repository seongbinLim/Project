package com.ssafy.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.ssafy.security.AccountUserDetailsService;


@Configuration
@EnableWebSecurity
@EnableGlobalAuthentication
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{
    @Autowired
    private AccountUserDetailsService userDetailsService;
    
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
	LoginSuccessHandler authSuccessHandler;
    
   // @Override
   // protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    //    auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);
    //}
	
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();

        http
        .authorizeRequests()
            .antMatchers("/ssafy/**").permitAll()
            .antMatchers("/mvjoin").permitAll()
            .antMatchers("/insert").permitAll()
            .antMatchers("/login").permitAll()
            .antMatchers("/mvsearchpw").permitAll()
            .antMatchers("/searchpw").permitAll()
            .antMatchers("/vue").hasRole("ADMIN")
            .anyRequest().authenticated()
            .and()        
        .formLogin()
            .loginPage("/mvlogin")
            .usernameParameter("userid")
            .passwordParameter("userpwd")
            .loginProcessingUrl("/login")
            .successHandler(authSuccessHandler)
            //.defaultSuccessUrl("/loginSuccess")
            .failureUrl("/")
            .permitAll()
            .and()
            .logout()
            .logoutUrl("/logout")
            .permitAll();
    }
}
