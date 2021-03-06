class com.rockstargames.gtav.levelDesign.DashboardDials.DASHBOARD extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var VDT_DEFAULT = -1;
   var VDT_BANSHEE = 0;
   var VDT_BOBCAT = 1;
   var VDT_CAVALCADE = 2;
   var VDT_COMET = 3;
   var VDT_DUKES = 4;
   var VDT_FACTION = 5;
   var VDT_FELTZER = 6;
   var VDT_FEROCI = 7;
   var VDT_FUTO = 8;
   var VDT_GENTAXI = 9;
   var VDT_MAVERICK = 10;
   var VDT_PEYOTE = 11;
   var VDT_RUINER = 12;
   var VDT_SPEEDO = 13;
   var VDT_SULTAN = 14;
   var VDT_SUPERGT = 15;
   var VDT_TAILGATER = 16;
   var VDT_TRUCK = 17;
   var VDT_TRUCKDIGI = 18;
   var VDT_INFERNUS = 19;
   var VDT_ZTYPE = 20;
   var VDT_LAZER = 21;
   var VDT_SPORTBK = 22;
   var currentVehicle = -1;
   var dashType = -1;
   var isDial = true;
   function DASHBOARD()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.TOGGLE_BACKGROUND_VISIBILITY(true);
   }
   function getDialAngle(minRot, maxRot, scale, isClockwise)
   {
      scale = scale * 100;
      if(isClockwise == undefined)
      {
         isClockwise = true;
      }
      var _loc4_ = -1;
      var _loc3_ = -1;
      var _loc1_ = minRot;
      var _loc2_ = maxRot;
      if(!isClockwise)
      {
         _loc1_ = maxRot;
         _loc2_ = minRot;
      }
      if(_loc1_ < 0 && _loc2_ < 0)
      {
         _loc3_ = Math.abs(_loc1_) - Math.abs(_loc2_);
         _loc4_ = minRot + _loc3_ / 100 * scale;
      }
      if(_loc1_ < 0 && _loc2_ >= 0)
      {
         _loc3_ = Math.abs(_loc1_) + _loc2_;
         _loc4_ = minRot + _loc3_ / 100 * scale;
      }
      if(_loc1_ >= 0 && _loc2_ >= 0)
      {
         _loc3_ = _loc2_ - _loc1_;
         _loc4_ = _loc1_ + _loc3_ / 100 * scale;
      }
      return _loc4_;
   }
   function SET_DASHBOARD_LIGHTS(indicator_left, indicator_right, handbrakeLight, engineLight, ABSLight, petrolLight, oilLight, headlights, fullBeam, batteryLight)
   {
      if(this.currentDash == undefined)
      {
         this.SET_VEHICLE_TYPE(this.VDT_TAILGATER);
      }
      this.CONTENT.DIALS.indicator_leftMC.gotoAndStop(Number(indicator_left) + 1);
      this.CONTENT.DIALS.indicator_rightMC.gotoAndStop(Number(indicator_right) + 1);
      this.CONTENT.DIALS.handbrakeMC.gotoAndStop(Number(handbrakeLight) + 1);
      this.CONTENT.DIALS.engine_lightMC.gotoAndStop(Number(engineLight) + 1);
      this.CONTENT.DIALS.abs_lightMC.gotoAndStop(Number(ABSLight) + 1);
      this.CONTENT.DIALS.petrol_lightMC.gotoAndStop(Number(petrolLight) + 1);
      this.CONTENT.DIALS.oil_lightMC.gotoAndStop(Number(oilLight) + 1);
      this.CONTENT.DIALS.headlightsMC.gotoAndStop(Number(headlights) + 1);
      this.CONTENT.DIALS.full_beamMC.gotoAndStop(Number(fullBeam) + 1);
      this.CONTENT.DIALS.battery_lightMC.gotoAndStop(Number(batteryLight) + 1);
   }
   function SET_DASHBOARD_DIALS(RPM, speed, fuel, temp, vacuum, boost, oilTemperature, oilPressure, waterTemp)
   {
      var _loc2_ = speed;
      if(speed > this.currentDash.TOP_SPEED)
      {
         _loc2_ = this.currentDash.TOP_SPEED;
      }
      else
      {
         _loc2_ = speed;
      }
      if(vacuum == undefined)
      {
         vacuum = 0;
      }
      if(boost == undefined)
      {
         boost = 0;
      }
      if(oilTemperature == undefined)
      {
         oilTemperature = 0;
      }
      if(oilPressure == undefined)
      {
         oilPressure = 0;
      }
      if(waterTemp == undefined)
      {
         waterTemp = 0;
      }
      if(this.currentDash == undefined)
      {
         this.SET_VEHICLE_TYPE(this.VDT_TAILGATER);
      }
      if(this.currentDash.IS_DIAL)
      {
         var _loc3_ = _loc2_ / this.currentDash.TOP_SPEED;
         if(this.dashType == this.VDT_PEYOTE)
         {
            var _loc9_ = Math.floor(this.getDialAngle(this.currentDash.SPEED_MIN_ROT,this.currentDash.SPEED_MAX_ROT,_loc3_,this.currentDash.SPEED_IS_CLOCKWISE));
            this.CONTENT.DIALS.speedo_dialMC.gotoAndStop(_loc9_);
         }
         else
         {
            this.CONTENT.DIALS.speedo_dialMC._rotation = this.getDialAngle(this.currentDash.SPEED_MIN_ROT,this.currentDash.SPEED_MAX_ROT,_loc3_,this.currentDash.SPEED_IS_CLOCKWISE);
         }
         this.CONTENT.DIALS.rpm_dialMC._rotation = this.getDialAngle(this.currentDash.RPM_MIN_ROT,this.currentDash.RPM_MAX_ROT,RPM,this.currentDash.RPM_IS_CLOCKWISE);
         this.CONTENT.DIALS.fuel_dialMC._rotation = this.getDialAngle(this.currentDash.FUEL_MIN_ROT,this.currentDash.FUEL_MAX_ROT,fuel,this.currentDash.FUEL_IS_CLOCKWISE);
         this.CONTENT.DIALS.templ_dialMC._rotation = this.getDialAngle(this.currentDash.TEMP_MIN_ROT,this.currentDash.TEMP_MAX_ROT,temp,this.currentDash.TEMP_IS_CLOCKWISE);
         this.CONTENT.DIALS.vacuum_dialMC._rotation = this.getDialAngle(this.currentDash.VACUUM_MIN_ROT,this.currentDash.VACUUM_MAX_ROT,vacuum,this.currentDash.VACUUM_IS_CLOCKWISE);
         this.CONTENT.DIALS.boost_dialMC._rotation = this.getDialAngle(this.currentDash.BOOST_MIN_ROT,this.currentDash.BOOST_MAX_ROT,boost,this.currentDash.BOOST_IS_CLOCKWISE);
         this.CONTENT.DIALS.oiltemp_dialMC._rotation = this.getDialAngle(this.currentDash.OIL_TEMP_MIN_ROT,this.currentDash.OIL_TEMP_MAX_ROT,oilTemperature,this.currentDash.OIL_TEMP_IS_CLOCKWISE);
         this.CONTENT.DIALS.oilpressure_dialMC._rotation = this.getDialAngle(this.currentDash.OIL_PRESSURE_MIN_ROT,this.currentDash.OIL_PRESSURE_MAX_ROT,oilPressure,this.currentDash.OIL_PRESSURE_IS_CLOCKWISE);
         this.CONTENT.DIALS.watertemp_dialMC._rotation = this.getDialAngle(this.currentDash.WATER_TEMP_MIN_ROT,this.currentDash.WATER_TEMP_MAX_ROT,waterTemp,this.currentDash.WATER_TEMP_IS_CLOCKWISE);
      }
      else
      {
         this.CONTENT.DIALS.rpm_dialMC.gotoAndStop(Math.floor(RPM * 100 / 4));
         this.CONTENT.DIALS.speedoTXT.text = Math.floor(_loc2_);
         if(temp > 0)
         {
            this.CONTENT.DIALS.temp_guageMC.gotoAndStop(Math.floor(temp * 15 + 1));
         }
         if(fuel > 0)
         {
            this.CONTENT.DIALS.fuel_guageMC.gotoAndStop(Math.floor(fuel * 15 + 1));
         }
      }
   }
   function TOGGLE_BACKGROUND_VISIBILITY(isVisible)
   {
      this.CONTENT.BG._visible = isVisible;
   }
   function SET_VEHICLE_TYPE(eType)
   {
      this.dashType = eType;
      switch(eType)
      {
         case this.VDT_BANSHEE:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_BANSHEE(this.CONTENT);
            break;
         case this.VDT_BOBCAT:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_BOBCAT(this.CONTENT);
            break;
         case this.VDT_CAVALCADE:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_CAVALCADE(this.CONTENT);
            break;
         case this.VDT_COMET:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_COMET(this.CONTENT);
            break;
         case this.VDT_DUKES:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_DUKES(this.CONTENT);
            break;
         case this.VDT_FACTION:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_FACTION(this.CONTENT);
            break;
         case this.VDT_FELTZER:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_FELTZER(this.CONTENT);
            break;
         case this.VDT_FEROCI:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_FEROCI(this.CONTENT);
            break;
         case this.VDT_FUTO:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_FUTO(this.CONTENT);
            break;
         case this.VDT_GENTAXI:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_GENTAXI(this.CONTENT);
            break;
         case this.VDT_MAVERICK:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_MAVERICK(this.CONTENT);
            break;
         case this.VDT_PEYOTE:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_PEYOTE(this.CONTENT);
            break;
         case this.VDT_RUINER:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_RUINER(this.CONTENT);
            break;
         case this.VDT_SPEEDO:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_SPEEDO(this.CONTENT);
            break;
         case this.VDT_SULTAN:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_SULTAN(this.CONTENT);
            break;
         case this.VDT_SUPERGT:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_SUPERGT(this.CONTENT);
            break;
         case this.VDT_TAILGATER:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_TAILGATER(this.CONTENT);
            break;
         case this.VDT_TRUCK:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_TRUCK(this.CONTENT);
            break;
         case this.VDT_TRUCKDIGI:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_TRUCKDIGI(this.CONTENT);
            break;
         case this.VDT_INFERNUS:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_INFERNUS(this.CONTENT);
            break;
         case this.VDT_ZTYPE:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_ZTYPE(this.CONTENT);
            break;
         case this.VDT_DEFAULT:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_TAILGATER(this.CONTENT);
            break;
         case this.VDT_SPORTBK:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_MOTORBIKE(this.CONTENT);
            break;
         default:
            this.currentDash = new com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_TAILGATER(this.CONTENT);
      }
   }
   function SET_RADIO(tuning, station, artist, song)
   {
      if(tuning != undefined)
      {
         trace("here");
         this.CONTENT.DIALS.RADIO.tuningTXT.text = tuning;
      }
      if(station != undefined)
      {
         this.CONTENT.DIALS.RADIO.stationTXT.text = station;
      }
      if(artist != undefined)
      {
         this.CONTENT.DIALS.RADIO.artistTXT.text = artist;
      }
      if(song != undefined)
      {
         this.CONTENT.DIALS.RADIO.songTXT.text = song;
      }
   }
   function debug()
   {
      this.SET_VEHICLE_TYPE(this.VDT_FEROCI);
      this.SET_DASHBOARD_DIALS(0.5,160,1,0.5,0.5,0.5,1,1);
      this.SET_RADIO("80:2","this","artits here","song here");
      this.SET_DASHBOARD_LIGHTS(true,true,false,true,true,true,true,true,true,true);
   }
}
