class com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_TRUCK extends com.rockstargames.gtav.levelDesign.DashboardDials.BaseVehicleDashboard
{
   var _mcName = "TRUCK";
   function DIAL_TRUCK(mc)
   {
      super(mc);
      mc._height = 256;
      mc._width = 512;
      this.RPM_MIN_ROT = -136;
      this.RPM_MAX_ROT = 58;
      this.SPEED_MIN_ROT = -135;
      this.SPEED_MAX_ROT = 135;
      this.FUEL_MIN_ROT = -50;
      this.FUEL_MAX_ROT = 50;
      this.TEMP_MIN_ROT = -50;
      this.TEMP_MAX_ROT = 50;
      this.RPM_IS_CLOCKWISE = true;
      this.SPEED_IS_CLOCKWISE = true;
      this.FUEL_IS_CLOCKWISE = true;
      this.TEMP_IS_CLOCKWISE = true;
      this.TOP_SPEED = 120;
   }
}
