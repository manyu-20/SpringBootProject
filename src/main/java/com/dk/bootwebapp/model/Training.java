package com.dk.bootwebapp.model;

import javax.persistence.*;
import java.sql.Date;
import java.util.List;
import java.util.Set;

@Entity
public class Training {

    public Training(Date startDate, Date endDate, String topic, String trainerName, String location) {
        this.startDate = startDate;
        this.endDate = endDate;
        this.topic = topic;
        this.trainerName = trainerName;
        this.location = location;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Date startDate;
    private Date endDate;
    private String topic;
    private String trainerName;
    private String location;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getTrainerName() {
        return trainerName;
    }

    public void setTrainerName(String trainerName) {
        this.trainerName = trainerName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public List<TrainingParticipant> getParticipants() {
        return participants;
    }

    public void setParticipants(List<TrainingParticipant> participants) {
        this.participants = participants;
    }

    @OneToMany(mappedBy = "training", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<TrainingParticipant> participants;

    public Training() {

    }

    @Override
    public String toString() {
        return "Training{" +
                "id=" + id +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", topic='" + topic + '\'' +
                ", trainerName='" + trainerName + '\'' +
                ", location='" + location + '\'' +
                '}';
    }

    // Getters and setters
}

