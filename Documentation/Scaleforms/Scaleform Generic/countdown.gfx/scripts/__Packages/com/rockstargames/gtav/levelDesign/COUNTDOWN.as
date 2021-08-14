class com.rockstargames.gtav.levelDesign.COUNTDOWN extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var defaultFadeDuration = 500;
   var debugTimeModifier = 1;
   var BIG_TEXT_OUTLINE_STRENGTH = 9;
   function COUNTDOWN()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.messageMC = this.CONTENT.messageMC;
      this.messageAlphaMC = this.messageMC.messageAlphaMC;
      this.messageText = this.messageAlphaMC.messageText;
      this.messageTextOutline = this.messageAlphaMC.messageTextOutline;
      this.messageTextOutline.outline = this.BIG_TEXT_OUTLINE_STRENGTH;
      this.goMC = this.messageAlphaMC.goMC;
      this.goMC._visible = false;
      this.startPosition = new flash.geom.Point(this.messageMC._x,this.messageMC._y);
      this.startPositionMP = new flash.geom.Point(this.messageMC._x,180);
   }
   function SET_MESSAGE(newString, r, g, b, isMP)
   {
      if(isMP)
      {
         this.FADE_MP.apply(this,arguments);
      }
      else
      {
         this.FADE_SP.apply(this,arguments);
      }
   }
   function FADE_SP(newString, r, g, b)
   {
      if(this.circleMC != undefined)
      {
         this.circleMC.removeMovieClip();
      }
      this.goMC._visible = false;
      com.rockstargames.ui.utils.Colour.Colourise(this.messageAlphaMC,r,g,b,100);
      this.messageText.text = this.messageTextOutline.text = newString;
      this.messageMC._x = this.startPosition.x;
      this.messageMC._y = this.startPosition.y;
      this.messageMC._xscale = this.messageMC._yscale = 100;
      this.messageText._alpha = this.messageTextOutline._alpha = 100;
      this.messageTextOutline._visible = true;
      this.messageAlphaMC._alpha = 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.messageMC,0.3,{_xscale:66,_yscale:66,delay:0.4,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.messageText,0.06,{_alpha:0,delay:0.6,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.messageTextOutline,0.05,{_alpha:0,delay:0.6,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
   }
   function FADE_MP(newString, r, g, b)
   {
      this.goMC._visible = false;
      this.messageText.text = newString;
      this.messageText._alpha = 100;
      this.messageMC._xscale = this.messageMC._yscale = 70;
      this.messageMC._x = this.startPositionMP.x;
      this.messageMC._y = this.startPositionMP.y - 8;
      this.messageAlphaMC._alpha = 100;
      this.messageTextOutline._visible = false;
      if(this.circleMC == undefined)
      {
         this.circleMC = this.CONTENT.attachMovie("circle","circleMC",this.messageMC.getDepth() - 1,{_x:this.startPositionMP.x,_y:this.startPositionMP.y});
         this.circleAlphaMC = this.circleMC.alphaMC;
      }
      else
      {
         this.circleMC._y = this.startPositionMP.y;
      }
      com.rockstargames.ui.utils.Colour.Colourise(this.circleMC,r,g,b,100);
      this.circleAlphaMC._alpha = 75;
      if(isNaN(newString))
      {
         this.messageText._alpha = 0;
         this.goMC._visible = true;
         var _loc2_ = 0;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.messageMC,0.33 * this.debugTimeModifier,{delay:0.66 * this.debugTimeModifier,_y:_loc2_ + (this.messageMC._y - this.circleMC._y),ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.circleMC,0.33 * this.debugTimeModifier,{delay:0.66 * this.debugTimeModifier,_y:_loc2_,delay:0.66,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.messageAlphaMC,0.33 * this.debugTimeModifier,{delay:0.66 * this.debugTimeModifier,_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.circleAlphaMC,0.33 * this.debugTimeModifier,{delay:0.66 * this.debugTimeModifier,_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.circleAlphaMC,0.66 * this.debugTimeModifier,{_alpha:0,delay:0.33 * this.debugTimeModifier,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
      }
   }
   function OVERRIDE_FADE_DURATION(newFadeDuration)
   {
      this.defaultFadeDuration = newFadeDuration;
   }
   function IS_COUNTDOWN_VISIBLE()
   {
      return this.messageText._alpha > 0;
   }
}
