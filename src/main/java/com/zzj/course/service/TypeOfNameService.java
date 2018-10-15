package com.zzj.course.service;

import com.zzj.course.model.TypeOfName;

import java.util.List;

public interface TypeOfNameService {
    public List<TypeOfName> findAllTON();

   public List<TypeOfName> selectTonById(String typeid);
}
