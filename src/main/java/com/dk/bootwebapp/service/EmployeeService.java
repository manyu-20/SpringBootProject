package com.dk.bootwebapp.service;

import com.dk.bootwebapp.model.Employee;
import com.dk.bootwebapp.model.Training;

import java.util.HashMap;
import java.util.List;

public interface EmployeeService {
    public Employee CheckAuth(String email,String password);
    public List<Employee> findAllTrainees();

    public boolean updatePhone(String email,String number);

    public boolean updatePassword(String email,String password);

    public void addTrainingToEmployee(Long empId,Long trainingId);

    public HashMap<String,List<Training>> getAllTimeTrainings(long id);

}
