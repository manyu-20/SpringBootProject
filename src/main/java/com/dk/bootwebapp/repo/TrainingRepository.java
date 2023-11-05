package com.dk.bootwebapp.repo;

import com.dk.bootwebapp.model.Training;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.sql.Date;
import java.util.List;

public interface TrainingRepository extends JpaRepository<Training,Long> {
    @Query("SELECT t FROM Training t WHERE t.startDate <= :endDate AND t.endDate >= :startDate")
    List<Training> findTrainingStartedBeforeAndEndedAfter(@Param("startDate") Date startDate, @Param("endDate") Date endDate);


    @Query("SELECT t FROM Training t WHERE t.startDate > :currentDate")
    List<Training> findTrainingStartedAfter(@Param("currentDate") Date currentDate);

    @Query("SELECT t FROM Training t WHERE t.endDate < :currentDate")
    List<Training> findTrainingEndedBefore(@Param("currentDate") Date currentDate);


}
