package com.zzj.course.service;

import com.zzj.course.model.Inform;

import java.util.List;

public interface InformService {
   public List<Inform> selectAllInform();

   public List<Inform> findAllInformPh(int infid);


   public List<Inform> selectInformByosition();

   public List<Inform> selectInformByStates();
}
