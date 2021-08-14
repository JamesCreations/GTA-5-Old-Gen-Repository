class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   static var SUPPRESSOR_ATTACHMENT_DISPLAY = 0;
   static var FLASHLIGHT_ATTACHMENT_DISPLAY = 3;
   static var SCOPE_02_ATTACHMENT_DISPLAY = 6;
   static var LASER_ATTACHMENT_DISPLAY = 9;
   static var CLIP_01_ATTACHMENT_DISPLAY = 12;
   static var CLIP_02_ATTACHMENT_DISPLAY = 15;
   static var SCOPE_01_ATTACHMENT_DISPLAY = 18;
   static var GRIP_ATTACHMENT_DISPLAY = 21;
   static var NUM_ATTACHMENTS = 8;
   static var NUM_DISPLAY_STATES = 3;
   static var BIT_DISPLAY_PURCHASED = 0;
   static var BIT_DISPLAY_LOCKED = 1;
   static var BIT_DISPLAY_EQUIPPED = 2;
   static var BITMASK_DISPLAY_UNAVAILABLE = -1;
   static var BITMASK_DISPLAY_EMPTY = 0;
   static var BIT_WEAPON_DISPLAY_PURCHASED = 0;
   static var BIT_WEAPON_DISPLAY_PURCHASABLE = 1;
   static var BIT_WEAPON_DISPLAY_LOCKED = 2;
   function PauseMPMenuWeaponsItem()
   {
      super();
      this.weaponMC.gotoAndStop(1);
      this.attachments = ["suppressorMC","flashlightMC","scope02MC","laserMC","clip01MC","clip02MC","scope01MC","gripMC"];
      this.bgMC._visible = false;
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      this.attDisplayBM = new com.rockstargames.ui.utils.BitMonger(this.initialIndex);
      this.wDisplayBM = new com.rockstargames.ui.utils.BitMonger(this.isSelectable);
      this.lockedMC._visible = false;
      if(this.wDisplayBM.__get__bitfield() == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BITMASK_DISPLAY_EMPTY)
      {
         this.weaponMC._visible = false;
         return undefined;
      }
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.lockedMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY);
      this.weaponMC.gotoAndStop("INT" + this.type);
      this.colourWeapon();
      this.debugAttStates();
      return this.__get__data();
   }
   function __set__highlighted(_h)
   {
      this.highlightMC._visible = _h;
      this._highlighted = _h;
      return this.__get__highlighted();
   }
   function colourWeapon()
   {
      var _loc10_ = this.wDisplayBM._bitfield == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BITMASK_DISPLAY_UNAVAILABLE;
      var _loc11_ = undefined;
      var _loc9_ = new com.rockstargames.ui.utils.HudColour();
      if(_loc10_)
      {
         this.lockedMC._visible = true;
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MID_GREY_MP,_loc9_);
         _loc11_ = new flash.geom.ColorTransform(0,0,0,1,_loc9_.r,_loc9_.g,_loc9_.b,0);
      }
      else if(this.wDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_WEAPON_DISPLAY_PURCHASED))
      {
         _loc11_ = new flash.geom.ColorTransform();
      }
      else
      {
         var _loc12_ = this.wDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_WEAPON_DISPLAY_LOCKED);
         if(_loc12_)
         {
            this.lockedMC._visible = true;
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PM_WEAPONS_LOCKED,_loc9_);
         }
         else
         {
            this.lockedMC._visible = false;
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE,_loc9_);
         }
         _loc11_ = new flash.geom.ColorTransform(0,0,0,1,_loc9_.r,_loc9_.g,_loc9_.b,0);
      }
      this.weaponMC.weaponMC.transform.colorTransform = _loc11_;
      var _loc3_ = 0;
      while(_loc3_ < com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.NUM_ATTACHMENTS)
      {
         var _loc7_ = this.attachments[_loc3_];
         var _loc6_ = this.weaponMC.attachmentMC[_loc7_];
         if(_loc6_)
         {
            var _loc5_ = undefined;
            var _loc2_ = new com.rockstargames.ui.utils.HudColour();
            if(_loc10_)
            {
               com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MID_GREY_MP,_loc2_);
               _loc5_ = new flash.geom.ColorTransform(0,0,0,1,_loc2_.r,_loc2_.g,_loc2_.b,0);
            }
            else
            {
               var _loc4_ = _loc3_ * com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.NUM_DISPLAY_STATES;
               if(this.attDisplayBM.isBitSet(_loc4_ + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_PURCHASED) || this.attDisplayBM.isBitSet(_loc4_ + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_EQUIPPED))
               {
                  _loc5_ = new flash.geom.ColorTransform();
                  this.handleExclusiveAtt(_loc7_);
               }
               else
               {
                  var _loc8_ = this.attDisplayBM.isBitSet(_loc4_ + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_LOCKED);
                  com.rockstargames.ui.utils.Colour.setHudColour(!_loc8_?com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE:com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PM_WEAPONS_LOCKED,_loc2_);
                  _loc5_ = new flash.geom.ColorTransform(0,0,0,1,_loc2_.r,_loc2_.g,_loc2_.b,0);
               }
            }
            _loc6_.transform.colorTransform = _loc5_;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function handleExclusiveAtt(attName)
   {
      if(attName == "clip02MC")
      {
         this.weaponMC.attachmentMC.clip01MC._visible = false;
      }
      else if(attName == "scope02MC")
      {
         this.weaponMC.attachmentMC.scope01MC._visible = false;
      }
   }
   function debugAttStates()
   {
      com.rockstargames.ui.utils.Debug.log("**************** WEAPON *******************  " + this.index + "  *********************");
      com.rockstargames.ui.utils.Debug.log("SUPPRESSOR_ATTACHMENT_DISPLAY_PURCHASED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_PURCHASED));
      com.rockstargames.ui.utils.Debug.log("SUPPRESSOR_ATTACHMENT_DISPLAY_LOCKED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_LOCKED));
      com.rockstargames.ui.utils.Debug.log("SUPPRESSOR_ATTACHMENT_DISPLAY_EQUIPPED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_EQUIPPED));
      com.rockstargames.ui.utils.Debug.log("FLASHLIGHT_ATTACHMENT_DISPLAY_PURCHASED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.FLASHLIGHT_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_PURCHASED));
      com.rockstargames.ui.utils.Debug.log("FLASHLIGHT_ATTACHMENT_DISPLAY_LOCKED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.FLASHLIGHT_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_LOCKED));
      com.rockstargames.ui.utils.Debug.log("FLASHLIGHT_ATTACHMENT_DISPLAY_EQUIPPED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.FLASHLIGHT_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_EQUIPPED));
      com.rockstargames.ui.utils.Debug.log("SCOPE_02_ATTACHMENT_DISPLAY_PURCHASED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.SCOPE_02_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_PURCHASED));
      com.rockstargames.ui.utils.Debug.log("SCOPE_02_ATTACHMENT_DISPLAY_LOCKED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.SCOPE_02_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_LOCKED));
      com.rockstargames.ui.utils.Debug.log("SCOPE_02_ATTACHMENT_DISPLAY_EQUIPPED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.SCOPE_02_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_EQUIPPED));
      com.rockstargames.ui.utils.Debug.log("LASER_ATTACHMENT_DISPLAY_PURCHASED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.LASER_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_PURCHASED));
      com.rockstargames.ui.utils.Debug.log("LASER_ATTACHMENT_DISPLAY_LOCKED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.LASER_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_LOCKED));
      com.rockstargames.ui.utils.Debug.log("LASER_ATTACHMENT_DISPLAY_EQUIPPED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.LASER_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_EQUIPPED));
      com.rockstargames.ui.utils.Debug.log("CLIP_01_ATTACHMENT_DISPLAY_PURCHASED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.CLIP_01_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_PURCHASED));
      com.rockstargames.ui.utils.Debug.log("CLIP_01_ATTACHMENT_DISPLAY_LOCKED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.CLIP_01_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_LOCKED));
      com.rockstargames.ui.utils.Debug.log("CLIP_01_ATTACHMENT_DISPLAY_EQUIPPED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.CLIP_01_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_EQUIPPED));
      com.rockstargames.ui.utils.Debug.log("CLIP_02_ATTACHMENT_DISPLAY_PURCHASED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.CLIP_02_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_PURCHASED));
      com.rockstargames.ui.utils.Debug.log("CLIP_02_ATTACHMENT_DISPLAY_LOCKED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.CLIP_02_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_LOCKED));
      com.rockstargames.ui.utils.Debug.log("CLIP_02_ATTACHMENT_DISPLAY_EQUIPPED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.CLIP_02_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_EQUIPPED));
      com.rockstargames.ui.utils.Debug.log("SCOPE_01_ATTACHMENT_DISPLAY_PURCHASED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.SCOPE_01_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_PURCHASED));
      com.rockstargames.ui.utils.Debug.log("SCOPE_01_ATTACHMENT_DISPLAY_LOCKED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.SCOPE_01_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_LOCKED));
      com.rockstargames.ui.utils.Debug.log("SCOPE_01_ATTACHMENT_DISPLAY_EQUIPPED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.SCOPE_01_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_EQUIPPED));
      com.rockstargames.ui.utils.Debug.log("GRIP_ATTACHMENT_DISPLAY_PURCHASED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.GRIP_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_PURCHASED));
      com.rockstargames.ui.utils.Debug.log("GRIP_ATTACHMENT_DISPLAY_LOCKED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.GRIP_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_LOCKED));
      com.rockstargames.ui.utils.Debug.log("GRIP_ATTACHMENT_DISPLAY_EQUIPPED: " + this.attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.GRIP_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_EQUIPPED));
   }
}
