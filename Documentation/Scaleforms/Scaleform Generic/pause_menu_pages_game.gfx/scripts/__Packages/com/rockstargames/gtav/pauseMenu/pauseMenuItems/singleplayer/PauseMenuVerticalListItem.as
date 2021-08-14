class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuVerticalListItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var multiListIndex = 0;
   var multiListItems = new Array();
   function PauseMenuVerticalListItem()
   {
      super();
      this.itemTextRight = this.labelMC.valueTF;
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      if(this.crewTagMC)
      {
         this.crewTagMC._visible = false;
      }
      switch(this.type)
      {
         case 1:
            this.multiListItems = this.__get__data().slice(1);
            com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextLeft,this._data[0]);
            this.__set__textIndex(this.initialIndex);
            break;
         case 2:
            if(!this.crewTagMC)
            {
               this.crewTagMC = this.attachMovie("CREW_TAG_MOVIECLIP","CREW_TAG",this.getNextHighestDepth(),{_y:4,_xscale:70,_yscale:70});
            }
            this.crewTagMC._visible = true;
            this.crewTagMC.UNPACK_CREW_TAG(this.__get__data()[1]);
            this.crewTagMC._x = this.itemTextLeft._x + this.itemTextLeft.textWidth + 10;
      }
      return this.__get__data();
   }
   function initStoreMethod(func, scope)
   {
      this.storeFunc = func;
      this.storeScope = scope;
   }
   function __set__textIndex(ti)
   {
      this.multiListIndex = ti;
      this.selectedIndex = this.multiListIndex;
      this.selectedValue = this.multiListItems[this.multiListIndex];
      com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,this.selectedValue);
      return this.__get__textIndex();
   }
   function __set__highlighted(_h)
   {
      if(this.bgMC)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.bgMC,!_h?com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG:com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      }
      if(this.labelMC)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.labelMC,!this.isSelectable?com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY:!_h?com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE:com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
      }
      this._highlighted = _h;
      return this.__get__highlighted();
   }
   function stepVal(dir)
   {
      if((var _loc0_ = this.type) === 1)
      {
         this.multiListIndex = this.multiListIndex + dir;
         if(this.multiListIndex < 0)
         {
            this.multiListIndex = this.multiListItems.length - 1;
         }
         if(this.multiListIndex > this.multiListItems.length - 1)
         {
            this.multiListIndex = 0;
         }
         this.__set__textIndex(this.multiListIndex);
         this.storeFunc.apply(this.storeScope,[this.index,this.multiListIndex]);
      }
      this.__set__highlighted(this._highlighted);
   }
}
