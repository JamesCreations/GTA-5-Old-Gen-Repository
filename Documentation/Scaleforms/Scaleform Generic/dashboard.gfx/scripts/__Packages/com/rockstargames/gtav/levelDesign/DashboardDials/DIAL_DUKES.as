class com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_DUKES extends com.rockstargames.gtav.levelDesign.DashboardDials.BaseVehicleDashboard
{
   var _mcName = "DUKES";
   function DIAL_DUKES(mc)
   {
      super(mc);
      mc._height = 256;
      mc._width = 512;
      this.RPM_MIN_ROT = -124;
      this.RPM_MAX_ROT = 50;
      this.SPEED_MIN_ROT = -124;
      this.SPEED_MAX_ROT = 135;
      this.FUEL_MIN_ROT = -128;
      this.FUEL_MAX_ROT = 128;
      this.TEMP_MIN_ROT = -128;
      this.TEMP_MAX_ROT = 128;
      this.RPM_IS_CLOCKWISE = true;
      this.SPEED_IS_CLOCKWISE = true;
      this.FUEL_IS_CLOCKWISE = true;
      this.TEMP_IS_CLOCKWISE = true;
      this.OIL_TEMP_MIN_ROT = -128;
      this.OIL_TEMP_MAX_ROT = 128;
      this.OIL_TEMP_IS_CLOCKWISE = true;
      this.BOOST_MIN_ROT = -128;
      this.BOOST_MAX_ROT = 128;
      this.BOOST_IS_CLOCKWISE = true;
      this.VACUUM_MIN_ROT = -120;
      this.VACUUM_MAX_ROT = 110;
      this.VACUUM_IS_CLOCKWISE = true;
      this.TOP_SPEED = 180;
   }
}
