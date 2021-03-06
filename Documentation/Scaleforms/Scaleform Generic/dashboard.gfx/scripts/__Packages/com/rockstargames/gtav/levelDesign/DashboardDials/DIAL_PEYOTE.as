class com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_PEYOTE extends com.rockstargames.gtav.levelDesign.DashboardDials.BaseVehicleDashboard
{
   var _mcName = "PEYOTE";
   function DIAL_PEYOTE(mc)
   {
      super(mc);
      mc._height = 256;
      mc._width = 512;
      this.SPEED_MIN_ROT = 0;
      this.SPEED_MAX_ROT = 150;
      this.FUEL_MIN_ROT = -45;
      this.FUEL_MAX_ROT = 45;
      this.TEMP_MIN_ROT = -45;
      this.TEMP_MAX_ROT = 45;
      this.FUEL_IS_CLOCKWISE = true;
      this.TEMP_IS_CLOCKWISE = true;
      this.TOP_SPEED = 150;
   }
}
