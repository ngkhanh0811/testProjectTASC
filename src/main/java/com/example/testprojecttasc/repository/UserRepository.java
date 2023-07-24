package com.example.testprojecttasc.repository;

import com.example.testprojecttasc.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long>, JpaSpecificationExecutor{
    @Query(value = "from user u where u.username like %:searchString%")
    List<User> findByName(@Param("searchString")String searchString);
}
