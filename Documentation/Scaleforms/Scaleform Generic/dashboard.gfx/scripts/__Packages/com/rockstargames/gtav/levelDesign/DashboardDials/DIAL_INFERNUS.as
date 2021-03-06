class com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_INFERNUS extends com.rockstargames.gtav.levelDesign.DashboardDials.BaseVehicleDashboard
{
   var _mcName = "INFERNUS";
   function DIAL_INFERNUS(mc)
   {
      super(mc);
      mc._height = 256;
      mc._width = 512;
      this.RPM_MIN_ROT = -152;
      this.RPM_MAX_ROT = 90;
      this.SPEED_MIN_ROT = -152;
      this.SPEED_MAX_ROT = 90;
      this.FUEL_MIN_ROT = -90;
      this.FUEL_MAX_ROT = -25;
      this.TEMP_MIN_ROT = -90;
      this.TEMP_MAX_ROT = -25;
      this.RPM_IS_CLOCKWISE = true;
      this.SPEED_IS_CLOCKWISE = true;
      this.FUEL_IS_CLOCKWISE = true;
      this.TEMP_IS_CLOCKWISE = true;
      this.TOP_SPEED = 200;
   }
}
