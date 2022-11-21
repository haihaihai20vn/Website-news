package com.javaweb.config;

import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableJpaRepositories(basePackages = {"com.javaweb.repository"})
@EnableTransactionManagement
public class JPAConfig {
	//Tạo entity manager factory
	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
		LocalContainerEntityManagerFactoryBean em = new LocalContainerEntityManagerFactoryBean();
		em.setDataSource(dataSource());
		em.setPersistenceUnitName("persistence-data"); //định nghĩa trong persistence.xml các entity được mapping
		JpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
		em.setJpaVendorAdapter(vendorAdapter);
		em.setJpaProperties(additionalProperties());
		return em;
	}
	
	//thay thế close(), rollback trong jdbc
	@Bean
	JpaTransactionManager transactionManager(EntityManagerFactory entityManagerFactory) {
		JpaTransactionManager transactionManager = new JpaTransactionManager();
		transactionManager.setEntityManagerFactory(entityManagerFactory);
		return transactionManager;
	}
	
	@Bean
	public PersistenceExceptionTranslationPostProcessor exceptionTranslation() {
		return new PersistenceExceptionTranslationPostProcessor();
	}
	
	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/websitenews");
		dataSource.setUsername("root");
		dataSource.setPassword("haihai20");
		return dataSource;
	}
	
	Properties additionalProperties() {
		Properties properties = new Properties();
		//properties.setProperty("hibernate.hbm2ddl.auto", "update"); //cập nhật thêm trường, ko khởi tạo bảng, ko mất dữ liệu
		//properties.setProperty("hibernate.hbm2ddl.auto", "create");//khởi tạo table, mất dữ liệu
		properties.setProperty("hibernate.hbm2ddl.auto", "none"); //Không tạo lại dữ liệu, nếu không sẽ bị xóa dữ liệu
		properties.setProperty("hibernate.enable_lazy_load_no_trans", "true"); //Để sử dụng @ManyToMany(fetch = FetchType.LAZY) trong UserEntity
		return properties;
	}
}
