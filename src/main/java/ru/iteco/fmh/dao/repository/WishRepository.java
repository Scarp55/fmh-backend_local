package ru.iteco.fmh.dao.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;
import ru.iteco.fmh.model.wish.Wish;
import ru.iteco.fmh.model.StatusE;

import java.util.List;

@Repository
public interface WishRepository extends JpaRepository<Wish, Integer> {

    List <Wish> findAllByStatusOrderByPlanExecuteDate(StatusE status);
    List<Wish> findAllByPatient_IdAndDeletedIsFalseAndStatus(Integer patientId, StatusE status);
}