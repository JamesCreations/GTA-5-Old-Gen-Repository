class com.rockstargames.gtav.hud.hudComponents.HUD_HELP_TEXT extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var screenWidth = 1280;
   var screenHeight = 720;
   function HUD_HELP_TEXT()
   {
      super();
      this.TICKET_NUMBER = -98;
      this.defaultWidth = 288;
      this.leftPadding = 7;
      this.rightPadding = 5;
      this.sidePadding = this.leftPadding + this.rightPadding;
      this.topPadding = 4;
      this.bottomPadding = 12;
      this.isAnimating = false;
      this.isClearing = false;
      this.OVERRIDE_DURATION = 0;
      this.ON_SCREEN_DURATION_ONE_FRAME = 66;
      this.ON_SCREEN_DURATION_PER_WORD = 333;
      this.trimForOneLineText = 3;
      this.currentStyle = -1;
      this.defaultHelpTextStyle = new Array(0,0,0,0,0,77);
      this.helpTextType = 0;
      this.txtFormat = this.CONTENT.helpText.getTextFormat();
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = this;
      this.CONTENT = this.TIMELINE.CONTENT;
      this.BOUNDING_BOX = this.TIMELINE.BOUNDING_BOX;
      this.BOUNDING_BOX._visible = false;
      this.clearBlipLayer();
   }
   function clearBlipLayer()
   {
      if(this.blipLayer != undefined)
      {
         this.blipLayer.removeMovieClip();
      }
      this.blipLayer = this.CONTENT.createEmptyMovieClip("blipLayer",1000);
   }
   function READY(id)
   {
      super.READY(id);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BOUNDING_BOX);
      this.background = this.CONTENT.helpTextBackground;
      this.helpTextBackgroundOffscreen = this.CONTENT.helpTextBackgroundOffscreen;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.background,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.helpTextBackgroundOffscreen,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
      this.arrowMCOffscreen = this.CONTENT.arrowMCOffscreen;
      this.offScreenIndicator = this.CONTENT.offScreenIndicator;
      this.arrowMCOffscreen._visible = false;
      this.helpTextBackgroundOffscreen._visible = false;
      this.offScreenIndicator._visible = false;
      this.arrow = this.CONTENT.arrowMC;
      this.arrow._visible = false;
      this.arrowHeight = this.arrow._height;
      this.arrowWidth = this.arrow._width;
      this.helpTextfield = this.CONTENT.helpText;
      this.helpTextfield.wordWrap = true;
      this.CONTENT._alpha = 0;
      this.helpTextfield.autoSize = true;
      this.helpTextfield._x = this.background._x + this.leftPadding;
      this.helpTextfield._y = this.background._y + this.topPadding;
   }
   function SET_HELP_TEXT(params)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BOUNDING_BOX);
      this.clearBlipLayer();
      this.isClearing = false;
      if(this.currentStyle == -1)
      {
         this.SET_HELP_TEXT_STYLE(this.defaultHelpTextStyle);
      }
      this.ON_SCREEN_DURATION_TOTAL = this.ON_SCREEN_DURATION;
      var _loc2_ = params[0];
      var _loc3_ = params[1];
      this.TICKET_NUMBER = params[2];
      if(_loc3_ != undefined)
      {
         this._fadeType = _loc3_;
      }
      else
      {
         this._fadeType = -1;
      }
      var _loc5_ = _loc2_.split(" ");
      if(this.OVERRIDE_DURATION <= 0)
      {
         this.ON_SCREEN_DURATION_TOTAL = this.ON_SCREEN_DURATION_TOTAL + _loc5_.length * this.ON_SCREEN_DURATION_PER_WORD;
         var _loc4_ = this.ON_SCREEN_DURATION_TOTAL / 100 * 30;
         this.ON_SCREEN_DURATION_TOTAL = this.ON_SCREEN_DURATION_TOTAL + _loc4_;
      }
      else
      {
         this.ON_SCREEN_DURATION_TOTAL = this.OVERRIDE_DURATION;
      }
      this.helpTextfield.htmlText = _loc2_;
      this.SET_BACKGROUND_SIZE();
      this.FADE_IN();
   }
   function SET_HELP_TEXT_RAW(params)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BOUNDING_BOX);
      this.clearBlipLayer();
      this.isClearing = false;
      if(this.currentStyle == -1)
      {
         this.SET_HELP_TEXT_STYLE(this.defaultHelpTextStyle);
      }
      this.ON_SCREEN_DURATION_TOTAL = this.ON_SCREEN_DURATION;
      var _loc2_ = params[0];
      var _loc3_ = params[1];
      this.TICKET_NUMBER = params[2];
      if(_loc3_ != undefined)
      {
         this._fadeType = _loc3_;
      }
      else
      {
         this._fadeType = -1;
      }
      var _loc6_ = _loc2_.split(" ");
      if(this.OVERRIDE_DURATION <= 0)
      {
         this.ON_SCREEN_DURATION_TOTAL = this.ON_SCREEN_DURATION_TOTAL + _loc6_.length * this.ON_SCREEN_DURATION_PER_WORD;
         var _loc5_ = this.ON_SCREEN_DURATION_TOTAL / 100 * 30;
         this.ON_SCREEN_DURATION_TOTAL = this.ON_SCREEN_DURATION_TOTAL + _loc5_;
      }
      else
      {
         this.ON_SCREEN_DURATION_TOTAL = this.OVERRIDE_DURATION;
      }
      var _loc8_ = new com.rockstargames.ui.utils.Text();
      var _loc4_ = 14.4;
      if(this._HUD.NEEDS_BIGGER_HELP_AND_SUBTITLES)
      {
         _loc4_ = 20;
      }
      _loc8_.setTextWithIcons(_loc2_,this.blipLayer,this.CONTENT.helpText,0,_loc4_,2.65,false);
      this.SET_BACKGROUND_SIZE();
      this.FADE_IN();
   }
   function SET_HELP_TEXT_POSITION(params)
   {
   }
   function SET_OVERRIDE_DURATION(params)
   {
      this.OVERRIDE_DURATION = params[0];
   }
   function SET_HELP_TEXT_OFFSCREEN(params)
   {
   }
   function toggleOffScreen(isHelpTextVisible)
   {
      if(isHelpTextVisible)
      {
         this.background._visible = true;
         this.helpTextfield._visible = true;
         this.helpTextBackgroundOffscreen._visible = false;
         this.offScreenIndicator._visible = false;
         this.arrowMCOffscreen._visible = false;
         if(this.currentStyle == 0)
         {
            this.arrowPosition = 0;
         }
         if(this.arrowPosition > 0)
         {
            this.arrow._visible = true;
         }
         else
         {
            this.arrow._visible = false;
         }
      }
      else
      {
         this.background._visible = false;
         this.helpTextfield._visible = false;
         this.arrow._visible = false;
         this.helpTextBackgroundOffscreen._visible = true;
         this.offScreenIndicator._visible = true;
         this.arrowMCOffscreen._visible = true;
      }
   }
   function SET_HELP_TEXT_STYLE(params)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BOUNDING_BOX);
      if(params[0] == 2)
      {
         this.currentStyle = 2;
         if(this.logo == undefined)
         {
            this.logo = this.CONTENT.attachMovie("ammunation_logo","ammunation_logo",this.CONTENT.getNextHighestDepth());
         }
         this.background.gotoAndStop(2);
      }
      else if(this.logo != undefined)
      {
         this.logo.removeMovieClip();
         this.logo = undefined;
         this.background.gotoAndStop(1);
      }
   }
   function SET_BACKGROUND_SIZE()
   {
      this.background._height = this.helpTextfield.textHeight + this.topPadding + this.bottomPadding;
      this.background._height = this.background._height - this.trimForOneLineText;
      if(this.logo != undefined)
      {
         this.background._width = this.logo._width;
      }
      else
      {
         this.background._width = this.helpTextfield.textWidth + this.sidePadding * 2;
      }
      var _loc2_ = 0;
      if(this.logo != undefined)
      {
         _loc2_ = 0 + this.logo._height;
      }
      switch(this.arrowPosition)
      {
         case 0:
            this.background._x = 0;
            this.background._y = _loc2_;
            break;
         case 1:
            this.background._x = - this.background._width / 2;
            this.background._y = _loc2_ + this.arrow._height;
            this.arrow._x = this.background._x + this.background._width / 2;
            this.arrow._y = _loc2_ + this.arrow._height;
            this.arrow._rotation = 180;
            break;
         case 2:
            this.background._x = 0 + this.arrowHeight;
            this.background._y = _loc2_ - this.background._height / 2;
            this.arrow._x = 0 + this.arrowHeight;
            this.arrow._y = _loc2_;
            this.arrow._rotation = 90;
            break;
         case 3:
            this.background._x = - this.background._width / 2;
            this.background._y = _loc2_ - this.background._height - this.arrow._height;
            this.arrow._x = this.background._x + this.background._width / 2;
            this.arrow._y = this.background._y + this.background._height;
            this.arrow._rotation = 0;
            break;
         case 4:
            this.background._x = - this.background._width + this.arrowHeight;
            this.background._y = _loc2_ - this.background._height / 2;
            this.arrow._rotation = -90;
            this.arrow._x = - this.arrowHeight;
            this.arrow._y = _loc2_;
            break;
         default:
            this.background._x = 0;
            this.background._y = _loc2_;
      }
      var _loc3_ = undefined;
      if(this.logo != undefined)
      {
         _loc3_ = (this.logo._height + this.background._height) / 720;
         this.BOUNDING_BOX._height = this.background._height + this.logo._height;
      }
      else
      {
         _loc3_ = this.background._height / 720;
         this.BOUNDING_BOX._height = this.background._height;
      }
      this.helpTextfield._x = this.background._x + this.leftPadding;
      this.helpTextfield._y = this.background._y + this.topPadding;
      var _loc6_ = this.CONTENT._x / 1280;
      var _loc5_ = this.CONTENT._y / 720;
      var _loc4_ = this.background._width / 1280;
      com.rockstargames.ui.game.GameInterface.call("SET_REVISED_COMPONENT_VALUES",com.rockstargames.ui.game.GameInterface.HUD_TYPE,this._enumID,_loc6_,_loc5_,_loc4_,_loc3_);
      this.BOUNDING_BOX._width = this.background._width;
      this.BOUNDING_BOX._x = this.background._x;
      this.BOUNDING_BOX._y = this.background._y;
   }
   function FADE_IN()
   {
      this.CONTENT._alpha = 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      if(this._fadeType != 0)
      {
         this.STAY_ON_SCREEN();
      }
   }
   function STAY_ON_SCREEN()
   {
      this.isAnimating = false;
      if(this._fadeType == 1)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.ON_SCREEN_DURATION_ONE_FRAME / 1000,{_alpha:100,onCompleteScope:this,onComplete:this.REMOVE});
      }
      else if(this._fadeType == -1)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.ON_SCREEN_DURATION_TOTAL / 1000,{_alpha:100,onCompleteScope:this,onComplete:this.REMOVE});
      }
   }
   function CLEAR_HELP_TEXT(params)
   {
      this.TICKET_NUMBER = params[0];
      this.CONTENT._alpha = 0;
      this.REMOVE();
   }
   function CLEAR_HELP_TEXT_NOW(params)
   {
      this.TICKET_NUMBER = params[0];
      this.CONTENT._alpha = 0;
      this.REMOVE();
   }
   function REMOVE()
   {
      this.CONTENT._alpha = 0;
      if(this.logo != undefined)
      {
         this.logo.removeMovieClip();
         this.logo = undefined;
      }
      this.CONTENT._alpha = 0;
      this.isAnimating = false;
      this.isClearing = false;
      this.arrowPosition = 0;
      this._fadeType = null;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BOUNDING_BOX);
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.BOUNDING_BOX,0.06,{onCompleteScope:this,onComplete:this.UNLOAD_MOVIE});
   }
   function UNLOAD_MOVIE()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BOUNDING_BOX);
      com.rockstargames.ui.game.GameInterface.call("CLEAR_HELP_TEXT",com.rockstargames.ui.game.GameInterface.HUD_TYPE,this.helpTextType,this.TICKET_NUMBER);
      this._HUD.REMOVE_HUD_ITEM(this._enumID);
   }
   function DEBUG_LOG(str)
   {
      com.rockstargames.ui.game.GameInterface.call("DEBUG_LOG",com.rockstargames.ui.game.GameInterface.HUD_TYPE,str);
   }
   function COORDS_TO_SCREEN(posX, posY)
   {
      return new flash.geom.Point(posX * this.screenWidth,posY * this.screenHeight);
   }
}
