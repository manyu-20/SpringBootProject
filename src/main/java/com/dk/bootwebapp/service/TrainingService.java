package com.dk.bootwebapp.service;

import com.dk.bootwebapp.model.Employee;
import com.dk.bootwebapp.model.Training;
import org.springframework.data.jpa.repository.JpaRepository;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

public interface TrainingService {

    public List<Training> findPrev();

    public List<Training> findCurrent();

    public List<Training> findFuture();
    public List<Training> findAll();
    public void addNewTraining(String topic,Date startDate,Date endDate,String location,String trainerName);
    public void updateTopic(String topic,long id);
    public void updateStartDate(Date startDate,long id);

    public void updateEndDate(Date endDate,long id);

    public void updateLocation(String loc,long id);

    public void trainerName(String trainerName, long id);

    public HashMap<String,List<Employee>> findEmployeesAssociatedWithAndWithoutTraining(long id);
}
