package com.zzj.course.service;

import com.zzj.course.model.Resources;

import java.util.List;

public interface ResourceService {
   public List<Resources> findAllResource();


   public Resources findResourceById(String reid);

   public List<Resources> selectTonById(String typeofnameid);

   public List<Resources> selectTypeId(String typeid);

   public  void addResource(Resources resources);

   public  List<Resources> findAllResourceBySeacher(String seacher);

  public List<Resources> findResourcesByUseridPh(String userid);
}
