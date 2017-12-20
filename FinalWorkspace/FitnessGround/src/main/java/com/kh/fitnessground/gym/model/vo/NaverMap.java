package com.kh.fitnessground.gym.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class NaverMap implements Serializable {

   /**
    * AJAX에서 사용될 지도 좌표를 가진 객체
    */
   private static final long serialVersionUID = 2100L;

   private double minLat;
   private double maxLat;
   private double minLng;
   private double maxLng;

   public NaverMap() {
      super();
   }

   public NaverMap(double minLat, double maxLat, double minLng, double maxLng) {
      super();
      this.minLat = minLat;
      this.maxLat = maxLat;
      this.minLng = minLng;
      this.maxLng = maxLng;
   }

   public double getMinLat() {
      return minLat;
   }

   public void setMinLat(double minLat) {
      this.minLat = minLat;
   }

   public double getMaxLat() {
      return maxLat;
   }

   public void setMaxLat(double maxLat) {
      this.maxLat = maxLat;
   }

   public double getMinLng() {
      return minLng;
   }

   public void setMinLng(double minLng) {
      this.minLng = minLng;
   }

   public double getMaxLng() {
      return maxLng;
   }

   public void setMaxLng(double maxLng) {
      this.maxLng = maxLng;
   }

   public static long getSerialversionuid() {
      return serialVersionUID;
   }

   @Override
   public String toString() {
      return "NaverMap [minLat=" + minLat + ", maxLat=" + maxLat + ", minLng=" + minLng
            + ", maxLng=" + maxLng + "]";
   }

}