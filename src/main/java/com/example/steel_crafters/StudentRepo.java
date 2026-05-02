package com.example.steel_crafters;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
@Repository
public interface StudentRepo extends JpaRepository <Student ,Integer> {
    
}
