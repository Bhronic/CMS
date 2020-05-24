package com.cms.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.cms.dao.ItemDao;
import com.cms.entity.Item;
import com.cms.service.ItemService;
@Service
@Repository
public class ItemServiceImpl implements ItemService {

	 @Autowired
	 ItemDao  itemdao;
	@Override
	public Item SaveItem(Item item) {
		// TODO Auto-generated method stub
		return itemdao.SaveItem(item);
	}

}
