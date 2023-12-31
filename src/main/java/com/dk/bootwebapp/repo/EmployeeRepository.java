package com.dk.bootwebapp.repo;

import com.dk.bootwebapp.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface EmployeeRepository extends JpaRepository<Employee,Long> {
    @Query("SELECT e FROM Employee e WHERE e.email = :email AND e.password = :password")
    Employee findByEmailAndPassword(String email, String password);

    @Query("SELECT e from Employee e WHERE e.email = :email")
    Employee findByEmail(String email);
}
