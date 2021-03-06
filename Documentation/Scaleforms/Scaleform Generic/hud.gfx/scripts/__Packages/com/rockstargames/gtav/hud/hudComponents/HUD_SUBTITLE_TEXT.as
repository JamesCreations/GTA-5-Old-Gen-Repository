class com.rockstargames.gtav.hud.hudComponents.HUD_SUBTITLE_TEXT extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var initCalled = false;
   var NEEDS_BIGGER_HELP_AND_SUBTITLES = false;
   var WIDTH_SCALE_STANDARD = 0.415;
   var WIDTH_SCALE_HD = 0.5328125;
   var WIDTH_SCALE_CUTSCENE = 0.68359375;
   function HUD_SUBTITLE_TEXT()
   {
      super();
      this.ON_SCREEN_DURATION_ONE_FRAME = 66;
      this.ON_SCREEN_DURATION_PER_WORD = 333;
   }
   function INITIALISE(mc)
   {
      this.initCalled = true;
      this.TIMELINE = this;
      this.CONTENT = this.TIMELINE.CONTENT;
      this.BOUNDING_BOX = this.TIMELINE.BOUNDING_BOX;
      this.BOUNDING_BOX._visible = false;
      this.subtitleTextField = this.CONTENT.subtitleText;
      this.subtitleTextField.wordWrap = true;
      this.subtitleTextField.autoSize = true;
      this.subtitleTextFieldGlow = this.CONTENT.subtitleTextGlow;
      this.subtitleTextFieldGlow.wordWrap = true;
      this.subtitleTextFieldGlow.autoSize = true;
      this.CONTENT._alpha = 0;
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
   function SET_SUBTITLE_TEXT_CUTSCENE(params)
   {
      this.SET_SUBTITLE_TEXT_RAW([params[0],true]);
   }
   function SET_SUBTITLE_TEXT_RAW(params)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      this.ON_SCREEN_DURATION_TOTAL = this.ON_SCREEN_DURATION;
      var _loc5_ = params[0];
      var _loc2_ = 1280;
      var _loc3_ = this.WIDTH_SCALE_HD;
      if(!this._HUD.isWideScreen)
      {
         _loc3_ = this.WIDTH_SCALE_STANDARD;
         _loc2_ = 960;
      }
      this.subtitleTextField._width = _loc3_ * _loc2_;
      this.subtitleTextFieldGlow._width = _loc3_ * _loc2_;
      if(params[1])
      {
         this.subtitleTextField._width = this.WIDTH_SCALE_CUTSCENE * _loc2_;
         this.subtitleTextFieldGlow._width = this.WIDTH_SCALE_CUTSCENE * _loc2_;
      }
      var _loc6_ = new com.rockstargames.ui.utils.Text();
      var _loc4_ = 20;
      if(this._HUD.NEEDS_BIGGER_HELP_AND_SUBTITLES)
      {
         _loc4_ = 25;
      }
      _loc6_.setTextWithIcons(_loc5_,this.blipLayer,this.CONTENT.subtitleText,0,_loc4_,3,true);
      this.subtitleTextField._y = 120 - this.subtitleTextField._height;
      this.subtitleTextFieldGlow._y = 120 - this.subtitleTextField._height;
      this.subtitleTextField._x = - this.subtitleTextField._width / 2;
      this.subtitleTextFieldGlow._x = - this.subtitleTextField._width / 2;
      this.blipLayer._x = this.subtitleTextField._x;
      this.blipLayer._y = this.subtitleTextField._y;
      this.CONTENT._alpha = 100;
   }
   function CLEAR_SUBTITLE_TEXT()
   {
      this.CONTENT._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,5,{onComplete:this.REMOVE,onCompleteScope:this});
   }
   function CLEAR_SUBTITLE_TEXT_NOW()
   {
      this.CONTENT._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,5,{onComplete:this.REMOVE,onCompleteScope:this});
   }
   function REMOVE()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      this._HUD.REMOVE_HUD_ITEM(this._enumID);
   }
}
