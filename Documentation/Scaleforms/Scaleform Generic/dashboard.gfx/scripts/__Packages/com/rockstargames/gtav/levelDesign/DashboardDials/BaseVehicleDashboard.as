class com.rockstargames.gtav.levelDesign.DashboardDials.BaseVehicleDashboard
{
   var _mcName = null;
   function BaseVehicleDashboard(mc)
   {
      mc.attachMovie(this._mcName,"DIALS",10);
      this.IS_DIAL = true;
      this.RPM_MIN_ROT = -129;
      this.RPM_MAX_ROT = 129;
      this.SPEED_MIN_ROT = -129;
      this.SPEED_MAX_ROT = 135;
      this.FUEL_MIN_ROT = 120;
      this.FUEL_MAX_ROT = 35;
      this.TEMP_MIN_ROT = -120;
      this.TEMP_MAX_ROT = -35;
      this.RPM_IS_CLOCKWISE = true;
      this.SPEED_IS_CLOCKWISE = true;
      this.FUEL_IS_CLOCKWISE = true;
      this.TEMP_IS_CLOCKWISE = true;
   }
}
