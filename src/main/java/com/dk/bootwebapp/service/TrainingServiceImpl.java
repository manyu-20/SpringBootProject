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
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class TrainingServiceImpl implements TrainingService {
    @Autowired
    TrainingRepository trainingRepository;

    @Autowired
    EmployeeRepository employeeRepository;

    @Autowired
    TrainingParticipantRepository trainingParticipantRepository;

    @Override
    public List<Training> findCurrTrainingsNotAssignedToEmployee(Long empID) {
        List<Training> employeeTrainings = new ArrayList<>();

        try {
            Date currentDate = new Date(System.currentTimeMillis()); // Get the current date
            List<Training> AllCurrentTraining = trainingRepository.findTrainingStartedBeforeAndEndedAfter(currentDate, currentDate);
            Optional<Employee> optionalEmployee = employeeRepository.findById(empID);
            if(optionalEmployee.isPresent()){
                Employee employee = optionalEmployee.get();
                List<TrainingParticipant> trainingParticipantList = trainingParticipantRepository.findAll();
                trainingParticipantList.stream().filter((tempEmployee) -> tempEmployee.getEmployee().getId() == employee.getId()).forEach((item) -> employeeTrainings.add(item.getTraining()));
            }

            return null;
        }
        catch (Exception e){
            e.printStackTrace();
        }
            return employeeTrainings;

    }

    @Override
    public List<Training> findFutureTrainingsNotAssignedToEmployee(Long empID) {
        List<Training> employeeTrainings = new ArrayList<>();

        try {
            Date currentDate = new Date(System.currentTimeMillis()); // Get the current date
            List<Training> AllCurrentTraining = trainingRepository.findTrainingStartedAfter(currentDate);
            Optional<Employee> optionalEmployee = employeeRepository.findById(empID);
            if(optionalEmployee.isPresent()){
                Employee employee = optionalEmployee.get();
                List<TrainingParticipant> trainingParticipantList = trainingParticipantRepository.findAll();
                trainingParticipantList.stream().filter((tempEmployee) -> tempEmployee.getEmployee().getId() == employee.getId()).forEach((item) -> employeeTrainings.add(item.getTraining()));
            }

            return null;
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return employeeTrainings;
    }

    @Override
    public List<Training> findPrev() {
        try{
            Date currentDate = new Date(System.currentTimeMillis()); // Get the current date
            return trainingRepository.findTrainingEndedBefore(currentDate);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Training> findCurrent() {
        try {
            Date currentDate = new Date(System.currentTimeMillis()); // Get the current date
            return trainingRepository.findTrainingStartedBeforeAndEndedAfter(currentDate, currentDate);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Training> findFuture() {
        try {
            Date currentDate = new Date(System.currentTimeMillis()); // Get the current date
            return trainingRepository.findTrainingStartedAfter(currentDate);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Training> findAll() {
        try{
            return trainingRepository.findAll();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Transactional
    @Override
    public void addNewTraining(String topic, Date startDate, Date endDate, String location, String trainerName) {
        try{
            Training myTraining = new Training(startDate,endDate,topic,trainerName,location);
            trainingRepository.save(myTraining);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
    @Transactional
    @Override
    public void updateTopic(String topic, long id) {
        try {
            Optional<Training> training = trainingRepository.findById(id);
            if(training.isPresent()){
                Training myTraining = training.get();
                myTraining.setTopic(topic);
                trainingRepository.save(myTraining);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
    @Transactional
    @Override
    public void updateStartDate(Date startDate, long id) {
        try {
            Optional<Training> training = trainingRepository.findById(id);
            if(training.isPresent()){
                Training myTraining = training.get();
                myTraining.setStartDate(startDate);
                trainingRepository.save(myTraining);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    @Transactional
    @Override
    public void updateEndDate(Date endDate, long id) {
        try {
            Optional<Training> training = trainingRepository.findById(id);
            if(training.isPresent()){
                Training myTraining = training.get();
                myTraining.setEndDate(endDate);
                trainingRepository.save(myTraining);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
    @Transactional
    @Override
    public void updateLocation(String loc, long id) {
        try {
            Optional<Training> training = trainingRepository.findById(id);
            if(training.isPresent()){
                Training myTraining = training.get();
                myTraining.setLocation(loc);
                trainingRepository.save(myTraining);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
    @Transactional
    @Override
    public void trainerName(String trainerName, long id) {
        try {
            Optional<Training> training = trainingRepository.findById(id);
            if(training.isPresent()){
                Training myTraining = training.get();
                myTraining.setTrainerName(trainerName);
                trainingRepository.save(myTraining);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public HashMap<String,List<Employee>> findEmployeesAssociatedWithAndWithoutTraining(long id) {
        HashMap<String,List<Employee>> hm = new HashMap<>();
        try {
            Optional<Training> optionalTraining = trainingRepository.findById(id);
            List<Employee> cuurentPursuing = new ArrayList<>();
            if(optionalTraining.isPresent()){
                Training training = optionalTraining.get();
                List<TrainingParticipant> trainingParticipantList = training.getParticipants();
                for (int i = 0; i < trainingParticipantList.size(); i++) {
                    System.out.println(trainingParticipantList.get(i));
                    cuurentPursuing.add(trainingParticipantList.get(i).getEmployee());
                }
                List<Employee> all = employeeRepository.findAll();
                all = all.stream().filter((emp) -> !cuurentPursuing.contains(emp) && !emp.getUserType().equals("admin")).collect(Collectors.toList());
                System.out.println("all -> " + all);
                hm.put("current",cuurentPursuing);
                hm.put("rest",all);
//                List<Employee> inCourse = trainingParticipantList.
            }

        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            return hm;
        }
    }
}
