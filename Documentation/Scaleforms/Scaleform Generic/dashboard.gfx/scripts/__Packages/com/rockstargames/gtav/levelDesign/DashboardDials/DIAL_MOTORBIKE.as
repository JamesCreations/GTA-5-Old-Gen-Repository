class com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_MOTORBIKE extends com.rockstargames.gtav.levelDesign.DashboardDials.BaseVehicleDashboard
{
   var _mcName = "MOTORBIKE";
   function DIAL_MOTORBIKE(mc)
   {
      super(mc);
      mc._height = 256;
      mc._width = 512;
      this.RPM_MIN_ROT = -180;
      this.RPM_MAX_ROT = 60;
      this.SPEED_MIN_ROT = -120;
      this.SPEED_MAX_ROT = 95;
      this.FUEL_MIN_ROT = -75;
      this.FUEL_MAX_ROT = 75;
      this.RPM_IS_CLOCKWISE = true;
      this.SPEED_IS_CLOCKWISE = true;
      this.FUEL_IS_CLOCKWISE = true;
      this.TOP_SPEED = 200;
   }
}
