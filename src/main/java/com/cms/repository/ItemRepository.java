package com.cms.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cms.entity.Item;

public interface ItemRepository extends JpaRepository<Item, Long>{

}
