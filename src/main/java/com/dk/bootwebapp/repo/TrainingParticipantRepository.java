package com.dk.bootwebapp.repo;

import com.dk.bootwebapp.model.TrainingParticipant;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TrainingParticipantRepository extends JpaRepository<TrainingParticipant,Long> {
}
