class com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_SULTAN extends com.rockstargames.gtav.levelDesign.DashboardDials.BaseVehicleDashboard
{
   var _mcName = "SULTAN";
   function DIAL_SULTAN(mc)
   {
      super(mc);
      mc._height = 256;
      mc._width = 512;
      this.RPM_MIN_ROT = -150;
      this.RPM_MAX_ROT = 40;
      this.SPEED_MIN_ROT = -152;
      this.SPEED_MAX_ROT = 90;
      this.FUEL_MIN_ROT = -90;
      this.FUEL_MAX_ROT = -25;
      this.TEMP_MIN_ROT = -90;
      this.TEMP_MAX_ROT = -25;
      this.OIL_PRESSURE_MIN_ROT = -90;
      this.OIL_PRESSURE_MAX_ROT = -25;
      this.RPM_IS_CLOCKWISE = true;
      this.SPEED_IS_CLOCKWISE = true;
      this.FUEL_IS_CLOCKWISE = true;
      this.TEMP_IS_CLOCKWISE = true;
      this.OIL_PRESSURE_IS_CLOCKWISE = true;
      this.TOP_SPEED = 200;
   }
}
