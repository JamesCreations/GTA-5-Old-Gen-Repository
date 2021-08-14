class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_HAIR_COLOUR_LIST extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var colourData = new Array();
   var colourMCs = new Array();
   function PAUSE_MENU_HAIR_COLOUR_LIST()
   {
      super();
      this.dbgID = "PAUSE_MENU_HAIR_COLOUR_LIST";
   }
   function INITIALISE(mc)
   {
      if(mc != undefined)
      {
         super.INITIALISE(mc);
      }
      else
      {
         this.CONTENT = this;
      }
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.titleMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.paletteMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      var _loc3_ = this.titleMC.attachMovie("GenericColourBar","barMC",this.titleMC.getNextHighestDepth());
      this.barMC = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar)_loc3_;
      this.barMC._x = 7;
      this.barMC._y = 30;
      this.barMC.init(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,274);
      this.titleMC._visible = false;
      this.paletteMC._visible = false;
      this.colourMCs = [];
      this.colourData = [];
   }
   function debug()
   {
      this.SET_TITLE("OPACITY","COLOUR",34);
      this.SET_DATA_SLOT_EMPTY();
      var _loc6_ = 5;
      var _loc2_ = 0;
      while(_loc2_ < _loc6_)
      {
         var _loc4_ = Math.floor(Math.random() * 255);
         var _loc5_ = Math.floor(Math.random() * 255);
         var _loc3_ = Math.floor(Math.random() * 255);
         this.SET_DATA_SLOT(_loc2_,_loc4_,_loc5_,_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      this.DISPLAY_VIEW();
      this.SET_HIGHLIGHT(3);
   }
   function SET_TITLE(str)
   {
      var _loc4_ = arguments[1];
      var _loc3_ = arguments[2];
      if(_loc4_ != undefined)
      {
         com.rockstargames.ui.utils.UIText.setSizedText(this.paletteMC.opacityTF,_loc4_,true);
      }
      if(_loc3_ != undefined)
      {
         com.rockstargames.ui.utils.UIText.setSizedText(this.titleMC.opacityTF,str,true);
         com.rockstargames.ui.utils.UIText.setSizedText(this.titleMC.minTF,"0%",true);
         com.rockstargames.ui.utils.UIText.setSizedText(this.titleMC.maxTF,"100%",true);
         if(_loc3_ != NaN)
         {
            this.barMC.percent(_loc3_);
         }
         this.titleMC._visible = true;
         this.paletteMC._y = this.titleMC._y + this.titleMC._height;
      }
      else
      {
         this.titleMC._visible = false;
         this.paletteMC._y = 0;
      }
   }
   function SET_INPUT_EVENT(direction)
   {
   }
   function SET_DATA_SLOT(_viewIndex, _slotIndex)
   {
      this.colourData[_viewIndex] = arguments;
   }
   function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.colourMCs.length)
      {
         var _loc3_ = this.colourMCs[_loc2_];
         _loc3_.removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.colourData = [];
      this.colourMCs = [];
      this.paletteMC._visible = false;
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.colourData.length)
      {
         var _loc4_ = this.colourData[_loc2_];
         var _loc3_ = this.paletteMC.containerMC.attachMovie("swatch","swatch" + _loc2_ + "MC",_loc2_);
         _loc3_._x = _loc3_._width * _loc2_;
         var _loc5_ = _loc4_[1];
         var _loc7_ = _loc4_[2];
         var _loc6_ = _loc4_[3];
         if(_loc5_ != undefined)
         {
            com.rockstargames.ui.utils.Colour.Colourise(_loc3_.innerMC,_loc5_,_loc7_,_loc6_,100);
         }
         this.colourMCs[_loc2_] = _loc3_;
         _loc2_ = _loc2_ + 1;
      }
      this.repositionPallattes();
      this.paletteMC._visible = true;
   }
   function repositionPallattes()
   {
      var _loc5_ = this.colourMCs.length;
      var _loc6_ = 9;
      var _loc4_ = 30;
      var _loc9_ = 10;
      var _loc7_ = _loc6_ * 30;
      var _loc8_ = _loc5_ * _loc4_;
      if(_loc5_ <= _loc6_)
      {
         _loc4_ = _loc7_ / _loc5_;
      }
      else
      {
         _loc4_ = 30;
      }
      var _loc3_ = 0;
      while(_loc3_ < this.colourMCs.length)
      {
         var _loc2_ = this.colourMCs[_loc3_];
         _loc2_.highlightMC.vMC._width = _loc4_;
         _loc2_.highlightMC.maskMC._x = _loc4_ / 2;
         _loc2_.innerMC._width = _loc4_;
         _loc2_._x = _loc3_ * _loc4_;
         _loc3_ = _loc3_ + 1;
      }
   }
   function UPDATE_SLOT(_viewIndex, _slotIndex)
   {
      this.SET_DATA_SLOT.apply(this,arguments);
      var _loc6_ = this.colourMCs[_viewIndex];
      var _loc3_ = this.colourData[_viewIndex];
      var _loc4_ = _loc3_[1];
      var _loc7_ = _loc3_[2];
      var _loc5_ = _loc3_[3];
      if(_loc4_ != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(_loc6_.innerMC,_loc4_,_loc7_,_loc5_,100);
      }
   }
   function SET_HIGHLIGHT(index)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.colourMCs.length)
      {
         var _loc3_ = this.colourMCs[_loc2_];
         var _loc4_ = _loc2_ != index?false:true;
         _loc3_.highlightMC._visible = _loc4_;
         _loc2_ = _loc2_ + 1;
      }
   }
}
