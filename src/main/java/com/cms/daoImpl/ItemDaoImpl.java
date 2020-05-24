package com.cms.daoImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cms.dao.ItemDao;
import com.cms.entity.Item;
import com.cms.repository.ItemRepository;
@Repository
public class ItemDaoImpl implements ItemDao{

	@Autowired
	ItemRepository itemrepository;
	@Override
	public Item SaveItem(Item item) {
		return itemrepository.save(item);
	}

}
