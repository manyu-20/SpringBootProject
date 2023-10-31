package com.dk.bootwebapp.service;

import com.dk.bootwebapp.model.Employee;
import com.dk.bootwebapp.model.Training;
import com.dk.bootwebapp.model.TrainingParticipant;
import com.dk.bootwebapp.repo.EmployeeRepository;
import com.dk.bootwebapp.repo.TrainingParticipantRepository;
import com.dk.bootwebapp.repo.TrainingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class EmoloyeeServiceImpl implements EmployeeService {

    @Autowired
    TrainingParticipantRepository trainingParticipantRepository;

    @Autowired
    TrainingRepository trainingRepository;

    @Autowired
    EmployeeRepository employeeRepository;

    @Autowired
    PasswordService passwordService;
    @Override
    public Employee CheckAuth(String email, String password) {
        System.out.println(email + " " + password);
        String hashedPassword = passwordService.hashPassword(password);
        return employeeRepository.findByEmailAndPassword(email,hashedPassword);
    }

    public List<Employee> findAllTrainees(){
        List<Employee> All;
        All = employeeRepository.findAll();
        List<Employee> trainees =  All.stream().filter((emp) -> !emp.getUserType().equals("admin")).collect(Collectors.toList());
        return trainees;
    }

    @Transactional
    @Override
    public boolean updatePhone(String email,String phoneNumber) {
        Employee emp = employeeRepository.findByEmail(email);
        if(emp != null){
            emp.setPhone(phoneNumber);
            employeeRepository.save(emp);
            return true;
        }
        return false;
    }

    @Transactional
    @Override
    public boolean updatePassword(String email,String password) {
        Employee emp = employeeRepository.findByEmail(email);
        String hashPassword = passwordService.hashPassword(password);
        if(emp != null){
            emp.setPassword(hashPassword);
            employeeRepository.save(emp);
            return true;
        }
        return false;
    }

    @Transactional
    @Override
    public void addTrainingToEmployee(Long empId, Long trainingId) {
        try{
            Optional<Training> optionalTraining = trainingRepository.findById(trainingId);
            Optional<Employee> optionalEmployee = employeeRepository.findById(empId);
            if(optionalTraining.isPresent()){
                Training myTraining = optionalTraining.get();
                Employee myEmployee = optionalEmployee.get();
                TrainingParticipant trainingParticipant = new TrainingParticipant();
                trainingParticipant.setTraining(myTraining);
                trainingParticipant.setEmployee(myEmployee);
                trainingParticipantRepository.save(trainingParticipant);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public HashMap<String, List<Training>> getAllTimeTrainings(long id) {
        HashMap<String,List<Training>> hm = new HashMap<>();
        Date currentDate = new Date();

        try{
            Optional<Employee> optionalEmployee = employeeRepository.findById(id);
            if(optionalEmployee.isPresent()){
                Employee employee = optionalEmployee.get();
                List<TrainingParticipant> trainingParticipantList = trainingParticipantRepository.findAll();
                List<Training> myTrainings = new ArrayList<>();
                List<TrainingParticipant> ls =  trainingParticipantList.stream().filter((item) -> {
                  Employee temp = item.getEmployee();
                  return Objects.equals(employee.getId(), item.getEmployee().getId());
                }).collect(Collectors.toList());
                ls.stream().forEach((item) -> myTrainings.add(item.getTraining()));

                List<Training> previousTrainings = getPreviousTrainings(myTrainings, currentDate);
                List<Training> currentTrainings = getCurrentTrainings(myTrainings, currentDate);
                List<Training> futureTrainings = getFutureTrainings(myTrainings, currentDate);

                hm.put("previous", previousTrainings);
                hm.put("current", currentTrainings);
                hm.put("future", futureTrainings);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return hm;
    }

    private List<Training> getPreviousTrainings(List<Training> trainings, Date currentDate) {
        return trainings
                .stream()
                .filter(training -> training.getEndDate().before(currentDate))
                .collect(Collectors.toList());
    }

    private List<Training> getCurrentTrainings(List<Training> trainings, Date currentDate) {
        return trainings
                .stream()
                .filter(training -> !training.getStartDate().after(currentDate) && !training.getEndDate().before(currentDate))
                .collect(Collectors.toList());
    }

    private List<Training> getFutureTrainings(List<Training> trainings, Date currentDate) {
        return trainings
                .stream()
                .filter(training -> training.getStartDate().after(currentDate))
                .collect(Collectors.toList());
    }


}
