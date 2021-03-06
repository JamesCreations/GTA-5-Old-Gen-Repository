class com.rockstargames.gtav.levelDesign.DashboardDials.BaseAircraftDial
{
   var _mcName = "AIRCRAFT";
   function BaseAircraftDial(mc)
   {
      mc.attachMovie(this._mcName,"DIALS",10);
      this.PITCH_LIMIT = 40;
      this.PITCH_LIMIT_HUD = 470;
      this.FUEL_MIN_ROT = -120;
      this.FUEL_MAX_ROT = 120;
      this.FUEL_IS_CLOCKWISE = true;
      this.TEMP_MIN_ROT = 150;
      this.TEMP_MAX_ROT = 22;
      this.TEMP_IS_CLOCKWISE = true;
      this.OIL_PRES_MIN_ROT = -155;
      this.OIL_PRES_MAX_ROT = -15;
      this.OIL_IS_CLOCKWISE = true;
      this.BATTERY_MIN_ROT = 155;
      this.BATTERY_MAX_ROT = 22;
      this.BATTERY_IS_CLOCKWISE = false;
      this.FUEL_PSI_MIN_ROT = -155;
      this.FUEL_PSI_MAX_ROT = -10;
      this.FUEL_PSI_IS_CLOCKWISE = true;
      this.AIR_SPEED_MIN_ROT = 0;
      this.AIR_SPEED_MAX_ROT = 345;
      this.AIR_SPEED_IS_CLOCKWISE = true;
      this.VERT_AIR_SPEED_MIN_ROT = -90;
      this.VERT_AIR_SPEED_MAX_ROT = 90;
      this.VERT_AIR_SPEED_IS_CLOCKWISE = true;
      this.COMPASS_MIN_ROT = -180;
      this.COMPASS_MAX_ROT = 180;
      this.COMPASS_IS_CLOCKWISE = true;
      this.ALTI_BIG_MIN_ROT = 0;
      this.ALTI_BIG_MAX_ROT = 360;
      this.ALTI_BIG_IS_CLOCKWISE = true;
      this.ALTI_SM_MIN_ROT = 0;
      this.ALTI_SM_MAX_ROT = 360;
      this.ALTI_SM_IS_CLOCKWISE = true;
   }
}
