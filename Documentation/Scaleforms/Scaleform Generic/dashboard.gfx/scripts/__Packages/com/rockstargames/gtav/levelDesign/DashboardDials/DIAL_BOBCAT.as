class com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_BOBCAT extends com.rockstargames.gtav.levelDesign.DashboardDials.BaseVehicleDashboard
{
   var _mcName = "BOBCAT";
   function DIAL_BOBCAT(mc)
   {
      super(mc);
      mc._height = 256;
      mc._width = 512;
      this.RPM_MIN_ROT = -130;
      this.RPM_MAX_ROT = 95;
      this.SPEED_MIN_ROT = -132;
      this.SPEED_MAX_ROT = 110;
      this.FUEL_MIN_ROT = -40;
      this.FUEL_MAX_ROT = 40;
      this.TEMP_MIN_ROT = -45;
      this.TEMP_MAX_ROT = 45;
      this.RPM_IS_CLOCKWISE = true;
      this.SPEED_IS_CLOCKWISE = true;
      this.FUEL_IS_CLOCKWISE = true;
      this.TEMP_IS_CLOCKWISE = true;
      this.TOP_SPEED = 170;
   }
}
