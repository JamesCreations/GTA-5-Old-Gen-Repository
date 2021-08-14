class com.rockstargames.gtav.Multiplayer.POWER_PLAY_GENERIC extends com.rockstargames.ui.core.BaseScreenLayout
{
   static var ICON_HORIZONTAL_PADDING = 8;
   static var ICON_VERTICAL_PADDING = 8;
   static var ICON_ROW_MARGIN = 200;
   static var MESSAGE_VERTICAL_MARGIN = 20;
   static var NORMAL_TEXT_POSITIONS = [9,13,123,124];
   static var DESCENDERS_TEXT_POSITIONS = [-4,0,128,129];
   static var DESCENDERS = [103,121,113,71,89,81,1062,1065,1094,1097];
   function POWER_PLAY_GENERIC()
   {
      super();
      _global.gfxExtensions = true;
      this.displayConfig = this.getDisplayConfig(true);
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.teamColours = [];
      this.icons = [];
      this.iconContainer = this.CONTENT.createEmptyMovieClip("iconContainer",0);
      this.message = this.CONTENT.attachMovie("message","message",1);
      this.message.title.label.textAutoSize = "shrink";
      this.message.titleBackground.label.textAutoSize = "shrink";
      this.message._x = 0.5 * (this.safeLeft + this.safeRight);
      this.message._visible = false;
   }
   function ADD_TEAM(hudColourEnum)
   {
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(hudColourEnum,_loc2_);
      this.teamColours.push(new flash.geom.ColorTransform(1,1,1,1,_loc2_.r,_loc2_.g,_loc2_.b,0));
   }
   function ADD_ICON(type)
   {
      if((var _loc0_ = type) !== 23)
      {
         this.icons.push(new com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon(type,this.iconContainer));
      }
      else
      {
         this.icons.push(new com.rockstargames.gtav.Multiplayer.powerplay.ScoreRingIcon(type,this.iconContainer));
      }
      this.updateLayout();
   }
   function PULSE_ICON(iconIndex, teamIndex)
   {
      var _loc2_ = this.icons[iconIndex];
      _loc2_.activate();
      _loc2_.setBackgroundColour(this.teamColours[teamIndex]);
      _loc2_.animate();
   }
   function SET_ICON_SCORE(iconIndex, score, teamIndex)
   {
      this.icons[iconIndex].setScore(score,this.teamColours[teamIndex]);
   }
   function SET_ICON_TIMER(iconIndex)
   {
      arguments.shift();
      this.icons[iconIndex].setTimer(arguments,this.teamColours);
   }
   function SET_ICON_METER(iconIndex)
   {
      arguments.shift();
      this.icons[iconIndex].setMeter(arguments,this.teamColours);
   }
   function ACTIVATE_ICON(iconIndex, teamIndex)
   {
      var _loc2_ = this.icons[iconIndex];
      _loc2_.activate();
      _loc2_.setBackgroundColour(this.teamColours[teamIndex]);
   }
   function DEACTIVATE_ICON(iconIndex)
   {
      this.icons[iconIndex].deactivate();
   }
   function DEACTIVATE_ALL_ICONS()
   {
      var _loc2_ = 0;
      var _loc3_ = this.icons.length;
      while(_loc2_ < _loc3_)
      {
         this.icons[_loc2_].deactivate();
         _loc2_ = _loc2_ + 1;
      }
   }
   function SHOW_MESSAGE(title, strapline, teamIndex)
   {
      this.message.title.label.text = title;
      this.message.titleBackground.label.text = title;
      this.message.strapline.label.text = strapline;
      this.message.straplineBackground.label.text = strapline;
      var _loc9_ = this.teamColours[teamIndex];
      this.message.title.transform.colorTransform = _loc9_;
      this.message.strapline.transform.colorTransform = _loc9_;
      this.message.background.transform.colorTransform = _loc9_;
      var _loc5_ = false;
      var _loc4_ = 0;
      var _loc7_ = title.length;
      while(_loc4_ < _loc7_)
      {
         var _loc2_ = 0;
         var _loc3_ = com.rockstargames.gtav.Multiplayer.POWER_PLAY_GENERIC.DESCENDERS.length;
         while(_loc2_ < _loc3_)
         {
            if(title.charCodeAt(_loc4_) == com.rockstargames.gtav.Multiplayer.POWER_PLAY_GENERIC.DESCENDERS[_loc2_])
            {
               _loc5_ = true;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
         if(_loc5_)
         {
            break;
         }
         _loc4_ = _loc4_ + 1;
      }
      var _loc8_ = !_loc5_?com.rockstargames.gtav.Multiplayer.POWER_PLAY_GENERIC.NORMAL_TEXT_POSITIONS:com.rockstargames.gtav.Multiplayer.POWER_PLAY_GENERIC.DESCENDERS_TEXT_POSITIONS;
      this.message.title._y = _loc8_[0];
      this.message.titleBackground._y = _loc8_[1];
      this.message.strapline._y = _loc8_[2];
      this.message.straplineBackground._y = _loc8_[3];
      this.message._visible = true;
   }
   function HIDE_MESSAGE()
   {
      this.message._visible = false;
   }
   function updateLayout()
   {
      this.message._y = 0;
      var _loc10_ = this.icons.length;
      var _loc5_ = this.icons[0].view.bg._width;
      var _loc12_ = this.safeRight - this.safeLeft - 2 * com.rockstargames.gtav.Multiplayer.POWER_PLAY_GENERIC.ICON_ROW_MARGIN;
      var _loc11_ = (_loc5_ + com.rockstargames.gtav.Multiplayer.POWER_PLAY_GENERIC.ICON_HORIZONTAL_PADDING) * _loc10_ - com.rockstargames.gtav.Multiplayer.POWER_PLAY_GENERIC.ICON_HORIZONTAL_PADDING;
      var _loc3_ = Math.min(3,Math.ceil(_loc11_ / _loc12_));
      var _loc8_ = _loc10_ % _loc3_;
      var _loc9_ = Math.floor(_loc10_ / _loc3_);
      var _loc7_ = this.displayConfig.safeTop * this.displayConfig.screenHeight + 0.5 * _loc5_;
      var _loc6_ = 0;
      var _loc4_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         _loc6_ = _loc4_;
         _loc4_ = _loc4_ + _loc9_;
         if(_loc3_ > 1 && _loc8_ == _loc3_ - 1)
         {
            if(_loc2_ % 2 == 0)
            {
               _loc4_ = _loc4_ + 1;
            }
         }
         else if(_loc3_ > 2 && _loc8_ == _loc3_ - 2)
         {
            if(_loc2_ % 2 == 1)
            {
               _loc4_ = _loc4_ + 1;
            }
         }
         this.layoutIconRow(_loc5_,_loc7_,_loc6_,_loc4_);
         _loc7_ = _loc7_ + (_loc5_ + com.rockstargames.gtav.Multiplayer.POWER_PLAY_GENERIC.ICON_VERTICAL_PADDING);
         _loc2_ = _loc2_ + 1;
      }
   }
   function layoutIconRow(iconDiameter, y, startIndex, endIndex)
   {
      var _loc10_ = 0.5 * (this.safeRight - this.safeLeft) + this.safeLeft;
      var _loc11_ = 0.5 * (endIndex - startIndex - 1) * (iconDiameter + com.rockstargames.gtav.Multiplayer.POWER_PLAY_GENERIC.ICON_HORIZONTAL_PADDING);
      var _loc4_ = _loc10_ - _loc11_;
      var _loc2_ = startIndex;
      while(_loc2_ < endIndex)
      {
         var _loc3_ = this.icons[_loc2_].view;
         _loc3_._x = _loc4_;
         _loc3_._y = y;
         _loc4_ = _loc4_ + (iconDiameter + com.rockstargames.gtav.Multiplayer.POWER_PLAY_GENERIC.ICON_HORIZONTAL_PADDING);
         _loc2_ = _loc2_ + 1;
      }
      var _loc9_ = y + 0.5 * iconDiameter + com.rockstargames.gtav.Multiplayer.POWER_PLAY_GENERIC.MESSAGE_VERTICAL_MARGIN;
      if(_loc9_ > this.message._y)
      {
         this.message._y = _loc9_;
      }
   }
}
