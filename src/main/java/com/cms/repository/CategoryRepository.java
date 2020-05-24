package com.cms.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cms.entity.Category;
import com.sun.xml.bind.v2.model.core.ID;

public interface CategoryRepository extends JpaRepository<Category, Long> {

}
