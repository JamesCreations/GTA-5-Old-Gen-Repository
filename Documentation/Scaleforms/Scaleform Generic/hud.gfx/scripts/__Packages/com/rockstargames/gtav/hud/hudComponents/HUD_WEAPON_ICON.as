class com.rockstargames.gtav.hud.hudComponents.HUD_WEAPON_ICON extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var isAnimating = false;
   var isFadingIn = false;
   var isWeaponWheelActive = false;
   var IS_RED = false;
   var ACTIVE_STATE = false;
   static var ONSCREEN = 7;
   function HUD_WEAPON_ICON()
   {
      super();
      this.IS_AIMING = false;
      this.ON_SCREEN_DURATION = 5000;
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = this;
      this.CONTENT = this.TIMELINE.CONTENT;
      this.BOUNDING_BOX = this.TIMELINE.BOUNDING_BOX;
      this.BOUNDING_BOX._visible = false;
      this.hudColourRed = new com.rockstargames.ui.utils.HudColour();
      this.hudColourRed.r = 194;
      this.hudColourRed.g = 80;
      this.hudColourRed.b = 80;
   }
   function getTopCompOffset()
   {
      return -2;
   }
   function getBottomCompOffset()
   {
      return -4;
   }
   function READY(id)
   {
      super.READY(id);
      this.setAsActive();
      this.WEAPON_ICONS = this.CONTENT;
      this.ammoText = this.WEAPON_ICONS.ammo;
      this.clipCountText = this.WEAPON_ICONS.clipCounter;
      this.ammoStrokeTF = this.WEAPON_ICONS.ammoStroke;
      this.clipCountStrokeTF = this.WEAPON_ICONS.clipCounterStroke;
      this.ammoStrokeTF.outline = this.clipCountStrokeTF.outline = 15;
      this.CONTENT._alpha = 0;
      this.defaultX = this.TIMELINE._x;
      this.defaultY = this.TIMELINE._y;
      this.WEAPON_ICONS.ProgressBarMC._visible = false;
   }
   function SET_WEAPONS_AND_AMMO_FOREVER(params)
   {
      this.setAsActive();
      this.IS_AIMING = Boolean(params[0]);
      if(!this.IS_AIMING)
      {
         this.STAY_ON_SCREEN();
      }
   }
   function fadeInAndDoNothing()
   {
      if(!this.isFadingIn)
      {
         this.isFadingIn = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:100});
      }
   }
   function SHOW_GRENADE_DROP(params)
   {
   }
   function SET_WEAPON_TIMER(params)
   {
      this.setAsActive();
      var _loc3_ = params[0];
      var _loc2_ = 1 + Math.max(0,Math.min(_loc3_,100));
      switch(this.weaponId)
      {
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_STUNGUN:
            _loc2_ = Math.round(101 - _loc2_);
            this.setTextFields(String(_loc2_),"","");
            break;
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_THROWN_GRENADE:
            _loc2_ = 101 - _loc2_;
            if(_loc2_ == 100)
            {
               this.setAmmoStateForGrenade(true);
            }
            else if(_loc2_ >= 98 && _loc2_ <= 99)
            {
               this.setAmmoStateForGrenade(true);
            }
            else if(_loc2_ >= 92 && _loc2_ <= 94)
            {
               this.setAmmoStateForGrenade(true);
            }
            else if(_loc2_ >= 85 && _loc2_ <= 88)
            {
               this.setAmmoStateForGrenade(true);
            }
            else if(_loc2_ >= 77 && _loc2_ <= 80)
            {
               this.setAmmoStateForGrenade(true);
            }
            else if(_loc2_ >= 67 && _loc2_ <= 71)
            {
               this.setAmmoStateForGrenade(true);
            }
            else if(_loc2_ >= 56 && _loc2_ <= 61)
            {
               this.setAmmoStateForGrenade(true);
            }
            else if(_loc2_ >= 43 && _loc2_ <= 49)
            {
               this.setAmmoStateForGrenade(true);
            }
            else if(_loc2_ >= 27 && _loc2_ <= 35)
            {
               this.setAmmoStateForGrenade(true);
            }
            else if(_loc2_ >= 8 && _loc2_ <= 18)
            {
               this.setAmmoStateForGrenade(true);
            }
            else
            {
               this.setAmmoStateForGrenade(false);
            }
      }
   }
   function setAmmoStateForGrenade(isStandard)
   {
      if(isStandard)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.WEAPON_ICONS,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         this.IS_RED = false;
      }
      else if(!this.IS_RED)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.WEAPON_ICONS,this.hudColourRed.r,this.hudColourRed.g,this.hudColourRed.b);
         this.IS_RED = true;
      }
   }
   function SET_AMMO_COUNT(params)
   {
      this.setAsActive();
      this.WEAPON_ICONS.ProgressBarMC._visible = false;
      switch(this.weaponId)
      {
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_STUNGUN:
            this.SET_WEAPON_TIMER([0]);
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_UNARMED:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_OBJECT:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_WRENCH:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_SHOVEL:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_NIGHTSTICK:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_LASSO:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_KNIFE:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_HAMMER:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_CROWBAR:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_BAT:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_GOLFCLUB:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_BOTTLE:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_DAGGER:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_HATCHET:
            this.ammoStrokeTF.text = _loc0_ = "";
            this.ammoText.text = _loc0_;
            this.clipCountStrokeTF.text = _loc0_ = "";
            this.clipCountText.text = _loc0_;
            break;
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_FIRE_EXTINGUISHER:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_JERRY_CAN:
            this.WEAPON_ICONS.ProgressBarMC._visible = false;
            var _loc4_ = params[1] / params[2] * 100;
            var _loc3_ = Math.floor(Math.max(0,Math.min(_loc4_,100)));
            this.setTextFields(String(_loc3_),"","");
            break;
         default:
            this.setTextFields(String(params[0]),String(params[1]),params[2]);
      }
      if(this.isWeaponWheelActive == false)
      {
         this.SHOW();
      }
   }
   function setTextFields(ammoCount, clipCount, clipSize)
   {
      if(clipSize <= 1)
      {
         this.clipCountText.text = "";
      }
      else
      {
         this.clipCountText.text = clipCount;
      }
      this.ammoText.text = ammoCount;
      this.marginForBlur = 3;
      if(ammoCount == "-1")
      {
         if(clipCount == "-1")
         {
            this.clipCountText.text = "";
         }
         this.ammoText.text = "";
      }
      if(ammoCount == "-2")
      {
         this.ammoText.text = "";
         if(clipCount == "-1")
         {
            this.clipCountText.text = "";
         }
      }
      if(this.weaponId == com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_HEAVY_MINIGUN)
      {
         this.clipCountText.text = "";
      }
      this.clipCountStrokeTF.autoSize = "left";
      this.clipCountStrokeTF.multiline = false;
      this.clipCountStrokeTF.wordWrap = false;
      this.clipCountText.autoSize = "left";
      this.clipCountText.multiline = false;
      this.clipCountText.wordWrap = false;
      this.ammoText.autoSize = "left";
      this.ammoText.multiline = false;
      this.ammoText.wordWrap = false;
      this.ammoStrokeTF.autoSize = "left";
      this.ammoStrokeTF.multiline = false;
      this.ammoStrokeTF.wordWrap = false;
      if(this.isWeaponWheelActive)
      {
         this.clipCountText._x = - this.clipCountText._width - this.marginForBlur * 0.5;
         this.ammoText._x = this.marginForBlur * 0.5;
      }
      else
      {
         var _loc2_ = this.BOUNDING_BOX._width;
         this.clipCountText._x = _loc2_ - this.clipCountText.textWidth - this.marginForBlur;
         this.ammoText._x = this.clipCountText._x - this.ammoText._width;
         if(this.clipCountText.text == "")
         {
            this.ammoText._x = _loc2_ - this.ammoText.textWidth - this.marginForBlur;
         }
      }
      this.ammoStrokeTF._x = this.ammoText._x;
      this.ammoStrokeTF.text = this.ammoText.text;
      this.clipCountStrokeTF._x = this.clipCountText._x;
      this.clipCountStrokeTF.text = this.clipCountText.text;
   }
   function SET_PLAYER_WEAPON(params)
   {
      this.setAsActive();
      this.weaponId = params[0];
      var _loc2_ = params[1];
      if(_loc2_ == com.rockstargames.gtav.hud.hudComponents.HUD_WEAPON_ICON.ONSCREEN)
      {
         this.CONTENT._alpha = 100;
         this.STAY_ON_SCREEN();
      }
      else
      {
         this.SHOW();
      }
      this.setAmmoStateForGrenade(true);
   }
   function SHOW()
   {
      this.setAsActive();
      if(!this.isAnimating)
      {
         this.isAnimating = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:100,onCompleteScope:this,onComplete:this.STAY_ON_SCREEN});
      }
   }
   function STAY_ON_SCREEN()
   {
      this.setAsActive();
      if(this.IS_AIMING == false)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.ON_SCREEN_DURATION / 1000,{_alpha:100,onCompleteScope:this,onComplete:this.HIDE});
      }
      this.isAnimating = false;
   }
   function HIDE()
   {
      this.setAsActive();
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:0,onCompleteScope:this,onComplete:this.REMOVE});
   }
   function REMOVE()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.WEAPON_ICONS);
      this.ACTIVE_STATE = false;
      this._HUD.REMOVE_HUD_ITEM(this._enumID);
   }
   function setAsActive()
   {
      if(!this.ACTIVE_STATE)
      {
         this.ACTIVE_STATE = true;
         com.rockstargames.ui.game.GameInterface.call("SET_ACTIVE_STATE",com.rockstargames.ui.game.GameInterface.HUD_TYPE,this._enumID,this.ACTIVE_STATE);
      }
   }
}
