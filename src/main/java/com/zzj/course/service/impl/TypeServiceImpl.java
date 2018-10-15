package com.zzj.course.service.impl;

import com.zzj.course.dao.TypeMapper;
import com.zzj.course.model.Type;
import com.zzj.course.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {
    @Autowired
    TypeMapper typeMapper;
   @Override
   public List<Type>  findAllType(){
        return typeMapper .findAllType();

    }

}
