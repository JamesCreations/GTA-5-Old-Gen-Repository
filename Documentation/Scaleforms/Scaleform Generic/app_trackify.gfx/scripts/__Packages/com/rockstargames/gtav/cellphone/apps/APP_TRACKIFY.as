class com.rockstargames.gtav.cellphone.apps.APP_TRACKIFY extends MovieClip
{
   var sweepStep = 4;
   var loadingCounter = 1;
   var sweepTime = 1;
   var targetFadeTime = 4;
   var sonarTime = 2;
   var flashTime = 0.5;
   var firstRun = true;
   var targetVisible = true;
   var targetArrowVisible = true;
   var noTarget = false;
   function APP_TRACKIFY()
   {
      super();
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.loadingAnim = this.TIMELINE.loadingAnim;
      this.loadingText = this.loadingAnim.loadingTextMc;
      this.mainScreen = this.TIMELINE.mainScreen;
      this.target = this.mainScreen.target;
      this.player = this.mainScreen.player;
      this.rings = this.mainScreen.rings;
      this.sweepMC = this.mainScreen.sweepMC;
      this.depthArrow = this.mainScreen.depthArrow;
      this.depthTF = this.mainScreen.depthTF;
      this.showDepth(false);
      this.loadingText.text1TF._visible = false;
      this.loadingText.text2TF._visible = false;
      this.loadingText.text3TF._visible = false;
   }
   function CLOSE_APP()
   {
      this.mainScreen._visible = false;
      clearInterval(this.intervalIdSweep);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.loadingText);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.mainScreen);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.rings);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.target);
   }
   function SET_TARGET(direction, distance, range, relativeDepth)
   {
      if(direction != undefined)
      {
         this._direction = direction;
      }
      if(distance != undefined)
      {
         this._distance = distance;
      }
      if(range != undefined)
      {
         this._range = range;
      }
      this.updateTargetPosition();
      if(this._distance > this._range && this.rings._xscale != 100)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.rings,this.sonarTime,{_xscale:100,_yscale:100,onCompleteScope:this,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteArgs:[this.rings]});
      }
      else if(this._distance <= this._range && this.rings._xscale != 250)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.rings,this.sonarTime,{_xscale:250,_yscale:250,onCompleteScope:this,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteArgs:[this.rings]});
      }
      if(relativeDepth != undefined)
      {
         this.displayDepth(relativeDepth);
      }
      else
      {
         this.showDepth(false);
      }
   }
   function displayDepth(relativeDepth)
   {
      if(relativeDepth < 0)
      {
         this.depthArrow._rotation = 180;
         this.depthArrow._alpha = 100;
      }
      else if(relativeDepth > 0)
      {
         this.depthArrow._rotation = 0;
         this.depthArrow._alpha = 100;
      }
      else if(relativeDepth == 0)
      {
         this.depthArrow._alpha = 0;
      }
      var _loc3_ = com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(Math.abs(relativeDepth),2);
      this.depthTF.text = _loc3_ + "m";
      this.showDepth(true);
   }
   function showDepth(_vis)
   {
      this.depthArrow._visible = _vis;
      this.depthTF._visible = _vis;
   }
   function construct(dataProviderUI)
   {
      _level0.TIMELINE.SET_HEADER();
      this.loadingText.text1TF.autoSize = "center";
      this.loadingText.text2TF.autoSize = "center";
      this.loadingText.text3TF.autoSize = "center";
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"CELL_TRACKIFY1",this.loadingText.text1TF);
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"CELL_TRACKIFY2",this.loadingText.text2TF);
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"CELL_TRACKIFY2",this.loadingText.text3TF);
      this.populateContent(dataProviderUI);
   }
   function populateContent(dataProviderUI)
   {
      if(dataProviderUI[0][0] == undefined || dataProviderUI[0][0] < 0)
      {
         this.noTarget = true;
      }
      this.skipLoadingScreen = dataProviderUI[0][3];
      this.targetArrowVisible = dataProviderUI[0][4];
      if(this.firstRun == true)
      {
         this.firstRun = false;
         if(this.skipLoadingScreen == true)
         {
            this.setupMainScreenSkipLoading();
         }
         else if(this.noTarget == true)
         {
            this.set_loading_text("text3TF");
            this.flashOff();
         }
         else
         {
            this.set_loading_text("text1TF");
            this.flashOff();
         }
      }
      else
      {
         this.SET_TARGET(dataProviderUI[0][0],dataProviderUI[0][1],dataProviderUI[0][2],dataProviderUI[0][5]);
      }
   }
   function APP_FUNCTION()
   {
   }
   function setupMainScreen()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.loadingText);
      this.loadingCounter = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.loadingAnim,1,{_alpha:0,delay:1,onCompleteScope:this,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteArgs:[this.loadingAnim]});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.player,1,{_alpha:100,onCompleteScope:this,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteArgs:[this.player]});
      clearInterval(this.intervalIdSweep);
      this.intervalIdSweep = setInterval(this,"animateSweep",this.sweepTime);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.sweepMC.sweep,1,{_alpha:100,onCompleteScope:this,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteArgs:[this.sweepMC.sweep]});
   }
   function setupMainScreenSkipLoading()
   {
      this.loadingAnim._visible = false;
      this.player._alpha = 100;
      clearInterval(this.intervalIdSweep);
      this.intervalIdSweep = setInterval(this,"animateSweep",this.sweepTime);
      this.sweepMC.sweep._alpha = 100;
   }
   function updateTargetPosition()
   {
      var _loc10_ = -149;
      var _loc8_ = 39;
      var _loc11_ = -84;
      var _loc9_ = 84;
      var _loc16_ = 84 / this._range;
      var _loc13_ = _loc16_ * this._distance;
      var _loc15_ = (this._direction - 90) * 3.141592653589793 / 180;
      var _loc3_ = Math.cos(_loc15_) * _loc13_;
      var _loc2_ = Math.sin(_loc15_) * _loc13_;
      var _loc14_ = undefined;
      var _loc12_ = undefined;
      if(_loc3_ > 0)
      {
         _loc14_ = _loc3_ / _loc9_;
      }
      else
      {
         _loc14_ = _loc3_ / _loc11_;
      }
      if(_loc2_ > 0)
      {
         _loc12_ = _loc2_ / _loc8_;
      }
      else
      {
         _loc12_ = _loc2_ / _loc10_;
      }
      var _loc5_ = Math.max(Math.abs(_loc14_),Math.abs(_loc12_));
      var _loc4_ = false;
      if(this._distance > this._range)
      {
         _loc4_ = true;
      }
      var _loc7_ = _loc3_;
      var _loc6_ = _loc2_;
      if(_loc2_ < _loc10_)
      {
         _loc7_ = _loc3_ / _loc5_;
         _loc4_ = true;
         _loc6_ = _loc10_;
      }
      else if(_loc2_ > _loc8_)
      {
         _loc7_ = _loc3_ / _loc5_;
         _loc4_ = true;
         _loc6_ = _loc8_;
      }
      if(_loc3_ < _loc11_)
      {
         _loc7_ = _loc11_;
         _loc6_ = _loc2_ / _loc5_;
         _loc4_ = true;
      }
      else if(_loc3_ > _loc9_)
      {
         _loc7_ = _loc9_;
         _loc6_ = _loc2_ / _loc5_;
         _loc4_ = true;
      }
      if(_loc2_ < _loc10_ || _loc2_ > _loc8_)
      {
         _loc6_ = _loc2_ / _loc5_;
         _loc4_ = true;
      }
      if(_loc3_ < _loc11_ || _loc3_ > _loc9_)
      {
         _loc7_ = _loc3_ / _loc5_;
         _loc4_ = true;
      }
      if(this.targetArrowVisible == false)
      {
         _loc4_ = false;
      }
      this.target._x = _loc7_ + this.player._x;
      this.target._y = _loc6_ + this.player._y;
      this.target.arrow._rotation = this._direction;
      this.target.arrow._visible = _loc4_;
   }
   function testTarget()
   {
      if(this.targetVisible == true)
      {
         var _loc2_ = this.sweepMC._rotation;
         if(_loc2_ < 0)
         {
            _loc2_ = _loc2_ + 360;
         }
         if(_loc2_ > this._direction - this.sweepStep * 2 && _loc2_ < this._direction + this.sweepStep * 2)
         {
            if(this.target._alpha < 90)
            {
               com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"TRACKIFY_BEEP","PHONE_SOUNDSET_DEFAULT");
            }
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.target);
            this.target._alpha = 100;
            this.target._xscale = 100;
            this.target._yscale = 100;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.target,this.targetFadeTime,{_alpha:0,_xscale:50,_yscale:50,onCompleteScope:this,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteArgs:[this.target]});
         }
      }
   }
   function set_loading_text(textString)
   {
      this.loadingText.text1TF._visible = false;
      this.loadingText.text2TF._visible = false;
      this.loadingText.text3TF._visible = false;
      this.loadingText[textString]._visible = true;
   }
   function flashOn()
   {
      if(this.noTarget == false)
      {
         this.loadingCounter = this.loadingCounter + 1;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.loadingText);
      if(this.loadingCounter < 3)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.loadingText,this.flashTime,{_alpha:100,onCompleteScope:this,onComplete:this.flashOff});
      }
      else
      {
         this.set_loading_text("text2TF");
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.loadingText,this.flashTime,{_alpha:100,onCompleteScope:this,onComplete:this.setupMainScreen});
      }
   }
   function flashOff(mc)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.loadingText);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.loadingText,this.flashTime,{_alpha:40,delay:0.5,onCompleteScope:this,onComplete:this.flashOn});
   }
   function distance(x1, y1, x2, y2)
   {
      var _loc2_ = x2 - x1;
      var _loc1_ = y2 - y1;
      return Math.sqrt(_loc2_ * _loc2_ + _loc1_ * _loc1_);
   }
   function animateSweep()
   {
      var _loc2_ = this.sweepMC._rotation;
      _loc2_ = _loc2_ + this.sweepStep;
      if(_loc2_ > 360)
      {
         _loc2_ = _loc2_ - 360;
      }
      this.sweepMC._rotation = _loc2_;
      this.testTarget();
   }
}
