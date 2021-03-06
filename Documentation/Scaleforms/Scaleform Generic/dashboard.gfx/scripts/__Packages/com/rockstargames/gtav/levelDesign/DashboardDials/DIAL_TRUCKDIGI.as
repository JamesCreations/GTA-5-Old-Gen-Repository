class com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_TRUCKDIGI extends com.rockstargames.gtav.levelDesign.DashboardDials.BaseVehicleDashboard
{
   var _mcName = "DIGITAL_DIAL";
   function DIAL_TRUCKDIGI(mc)
   {
      super(mc);
      mc._height = 256;
      mc._width = 512;
      trace("mc " + mc);
      this.RPM_MIN_ROT = -152;
      this.RPM_MAX_ROT = 92;
      this.SPEED_MIN_ROT = -140;
      this.SPEED_MAX_ROT = 140;
      this.FUEL_MIN_ROT = -90;
      this.FUEL_MAX_ROT = -15;
      this.TEMP_MIN_ROT = -90;
      this.TEMP_MAX_ROT = -15;
      this.RPM_IS_CLOCKWISE = true;
      this.SPEED_IS_CLOCKWISE = true;
      this.FUEL_IS_CLOCKWISE = true;
      this.TEMP_IS_CLOCKWISE = true;
      this.IS_DIAL = false;
      this.TOP_SPEED = 200;
   }
}
