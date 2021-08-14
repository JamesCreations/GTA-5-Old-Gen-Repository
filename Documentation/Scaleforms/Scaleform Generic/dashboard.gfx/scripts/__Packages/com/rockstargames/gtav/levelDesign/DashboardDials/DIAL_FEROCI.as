class com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_FEROCI extends com.rockstargames.gtav.levelDesign.DashboardDials.BaseVehicleDashboard
{
   var _mcName = "FEROCI";
   function DIAL_FEROCI(mc)
   {
      super(mc);
      mc._height = 256;
      mc._width = 512;
      this.RPM_MIN_ROT = -120;
      this.RPM_MAX_ROT = 87;
      this.SPEED_MIN_ROT = -128;
      this.SPEED_MAX_ROT = 135;
      this.FUEL_MIN_ROT = 112;
      this.FUEL_MAX_ROT = 240;
      this.TEMP_MIN_ROT = -180;
      this.TEMP_MAX_ROT = 88;
      this.OIL_PRESSURE_MIN_ROT = -180;
      this.OIL_PRESSURE_MAX_ROT = 88;
      this.RPM_IS_CLOCKWISE = true;
      this.SPEED_IS_CLOCKWISE = true;
      this.FUEL_IS_CLOCKWISE = false;
      this.TEMP_IS_CLOCKWISE = true;
      this.OIL_PRESSURE_IS_CLOCKWISE = true;
      this.TOP_SPEED = 155;
   }
}
