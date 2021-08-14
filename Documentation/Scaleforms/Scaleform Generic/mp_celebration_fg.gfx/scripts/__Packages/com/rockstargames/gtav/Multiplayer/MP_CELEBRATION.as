class com.rockstargames.gtav.Multiplayer.MP_CELEBRATION extends com.rockstargames.ui.core.BaseScreenLayout
{
   var statWallArray = [];
   var positionId = "position";
   var rankBarId = "rank";
   var winnerId = "winner";
   var challengePartId = "challenge_part_win_lose";
   var timeId = "time";
   var worldRecordId = "world_record";
   var statNumericId = "stat_numeric";
   var introId = "intro";
   var challengeSetId = "challenge_set";
   var statTableId = "stat_table";
   var statRowId = "stat_row";
   var readyId = "ready";
   var pointsId = "points";
   var tournamentId = "tournament_qualification";
   var cashWonId = "cash_won";
   var defaultFgAlpha = 40;
   var defaultBgAlpha = 75;
   var slamDuration = 0.333;
   var glideDuration = 15;
   var pauseDuration = 2;
   var ignorePauses = false;
   var bgTopHeight = 60;
   var bgBottomHeight = 100;
   var defaultPadding = 10;
   var ALIGN_LEFT = "left";
   var ALIGN_RIGHT = "right";
   var ALIGN_CENTER = "center";
   var TYPE_BG = "typeBg";
   var TYPE_FG = "typeFg";
   var TYPE_STANDARD = "typeStandard";
   var TYPE_OVERLAY = "typeOverlay";
   var totalDurationMs = 0;
   var pauseNextDuration = 0;
   var wallList = [];
   function MP_CELEBRATION()
   {
      super();
      _global.gfxExtensions = true;
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef)
   {
      super.SET_DISPLAY_CONFIG(_screenWidthPixels,_screenHeightPixels,_safeTopPercent,_safeBottomPercent,_safeLeftPercent,_safeRightPercent,_isWideScreen,_isHiDef);
   }
   function INITIALISE(mc, type)
   {
      super.INITIALISE(mc);
      this.CONTENT = mc;
      this.celebrationGfxType = this.SET_GFX_TYPE(type);
      this.dispConf = new com.rockstargames.ui.utils.DisplayConfig();
      this.dispConf = this.getDisplayConfig(true);
      if(!this.dispConf.isWideScreen)
      {
         Stage.scaleMode = "noBorder";
         this.dispConf.screenWidth = 960;
      }
      this.pricedownTextFormat = new TextFormat();
      this.pricedownTextFormat.font = "$gtaCash";
      this.condensedTextFormat = new TextFormat();
      if(!this.dispConf.isAsian)
      {
         this.condensedTextFormat.font = "$Font2_cond";
      }
      else
      {
         this.condensedTextFormat.font = "$Font2_cond_NOT_GAMERNAME";
      }
      this.scriptTextFormat = new TextFormat();
      this.scriptTextFormat.font = "$Font5";
      this.ascendersPricedown = this.CONTENT.ascendersPricedown.text;
      this.descendersPricedown = this.CONTENT.descendersPricedown.text;
   }
   function SET_GFX_TYPE(type)
   {
      switch(type)
      {
         case this.TYPE_BG:
            return this.TYPE_BG;
         case this.TYPE_FG:
            return this.TYPE_FG;
         case this.TYPE_OVERLAY:
            return this.TYPE_OVERLAY;
         case this.TYPE_STANDARD:
         default:
            return this.TYPE_STANDARD;
      }
   }
   function CREATE_STAT_WALL(id, colourName, fgAlpha)
   {
      if(this.CONTENT[id])
      {
         (MovieClip)this.CONTENT[id].removeMovieClip();
      }
      if(fgAlpha)
      {
         this.defaultFgAlpha = fgAlpha;
      }
      var _loc3_ = this.CONTENT.createEmptyMovieClip(id,this.CONTENT.getNextHighestDepth());
      var _loc12_ = _loc3_.createEmptyMovieClip("bg",_loc3_.getNextHighestDepth());
      var _loc5_ = [];
      var _loc4_ = [];
      var _loc6_ = {mcName:id,currentHeight:0,bgColour:colourName,tweens:_loc5_,tweensToRemove:_loc4_};
      this.wallList.push(_loc6_);
   }
   function SET_PAUSE_DURATION(duration)
   {
      this.pauseDuration = duration;
   }
   function SHOW_STAT_WALL(wallId)
   {
      var _loc5_ = this.getMovieClipFromName(wallId);
      var _loc4_ = this.getObjectFromMcName(wallId);
      var _loc12_ = _loc4_.tweens;
      var _loc6_ = _loc4_.tweensToRemove;
      var _loc2_ = [];
      _loc2_.push({method:"delayCall",mc:_loc5_._parent,duration:this.pauseDuration * 0.85,noDelay:true,tweenerObject:{onComplete:this.playSound,onCompleteScope:this,onCompleteArgs:["SCREEN_SWIPE","CELEBRATION_SOUNDSET"]}});
      this.addAnimationsToWall(wallId,this.dispConf.screenHeight + this.bgTopHeight + this.bgBottomHeight,100,_loc2_);
      this.doNextAnimation(wallId,true);
   }
   function PAUSE_BEFORE_PREVIOUS_LAYOUT(wallId, duration)
   {
      var _loc4_ = this.getObjectFromMcName(wallId);
      var _loc2_ = _loc4_.tweens;
      if(_loc2_.length > 0)
      {
         var _loc3_ = _loc2_.pop();
         if(!duration)
         {
            _loc3_.pauseBefore = true;
         }
         else
         {
            _loc3_.delay = duration;
         }
         _loc2_.push(_loc3_);
      }
   }
   function PAUSE(wallId, duration)
   {
      this.pauseNextDuration = this.pauseNextDuration + duration;
   }
   function UNPAUSE(wallId)
   {
      this.doNextAnimation(wallId,true);
   }
   function OVERRIDE_PAUSES(wallId, ignore)
   {
      if(!ignore)
      {
         ignore = true;
      }
      this.ignorePauses = ignore;
   }
   function GET_TOTAL_WALL_DURATION()
   {
      return this.totalDurationMs;
   }
   function doNextAnimation(wallId, firstRun)
   {
      var _loc12_ = this.getObjectFromMcName(wallId);
      var _loc10_ = this.getMovieClipFromName(wallId);
      var _loc11_ = _loc12_.tweens;
      var _loc9_ = _loc12_.tweensToRemove;
      if(_loc11_.length > 0)
      {
         var _loc5_ = _loc11_.shift();
         if(_loc5_.pauseBefore && !this.ignorePauses)
         {
            _loc5_.pauseBefore = false;
            _loc11_.unshift(_loc5_);
            return undefined;
         }
         var _loc13_ = _loc5_.duration;
         var _loc6_ = _loc5_.delay + _loc5_.pauseNextDuration;
         var _loc7_ = _loc5_.pauseNextDuration;
         var _loc15_ = _loc5_.offsetY;
         var _loc18_ = _loc5_.targetY;
         var _loc14_ = _loc5_.soundName;
         var _loc17_ = Math.abs(_loc18_ + _loc15_);
         var _loc16_ = _loc10_._y + _loc17_;
         if(firstRun)
         {
            _loc6_ = 0;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc10_.bg,_loc13_,{_y:_loc12_.currentHeight * -1,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
            this.playSound("SCREEN_SWIPE","CELEBRATION_SOUNDSET");
         }
         else if(_loc14_)
         {
            this.playSound(_loc14_,"CELEBRATION_SOUNDSET");
         }
         else
         {
            this.playSound("STATS_SCREEN","CELEBRATION_SOUNDSET");
         }
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc10_,_loc13_,{_y:_loc16_,onComplete:this.doNextAnimation,onCompleteScope:this,onCompleteArgs:[wallId],delay:_loc6_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
         if(_loc5_.childAnims && this.celebrationGfxType != this.TYPE_BG)
         {
            var _loc8_ = _loc5_.childAnims;
            var _loc4_ = 0;
            while(_loc4_ < _loc8_.length)
            {
               var _loc2_ = _loc8_[_loc4_];
               var _loc3_ = _loc2_.tweenerObject;
               _loc9_.push(_loc2_.mc);
               switch(_loc2_.method)
               {
                  case "to":
                     if(!_loc3_.delay)
                     {
                        _loc3_.delay = 0;
                     }
                     if(!_loc2_.noDelay)
                     {
                        _loc3_.delay = _loc3_.delay + (this.slamDuration + _loc6_);
                     }
                     else
                     {
                        _loc3_.delay = _loc3_.delay + _loc7_;
                     }
                     com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_.mc,_loc2_.duration,_loc3_);
                     break;
                  case "delayCall":
                     if(!_loc2_.noDelay)
                     {
                        _loc2_.duration = this.slamDuration + _loc6_;
                     }
                     else
                     {
                        _loc2_.duration = _loc2_.duration + _loc7_;
                     }
                     com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(_loc2_.mc,_loc2_.duration,_loc3_);
               }
               _loc4_ = _loc4_ + 1;
            }
         }
      }
      else
      {
         _loc9_.push(_loc10_);
      }
   }
   function SHOW_FLASH(inDuration, holdDuration, outDuration, colourName)
   {
      if(!inDuration)
      {
         inDuration = 0.25;
      }
      if(!holdDuration)
      {
         holdDuration = 0.15;
      }
      if(!outDuration)
      {
         outDuration = 0.25;
      }
      if(!colourName)
      {
         colourName = "HUD_COLOUR_WHITE";
      }
      if(this.CONTENT.flashMc)
      {
         (MovieClip)this.CONTENT.flashMc.removeMovieClip();
      }
      var _loc2_ = this.CONTENT.createEmptyMovieClip("flashMc",this.CONTENT.getNextHighestDepth());
      _loc2_.beginFill(this.getColour(colourName));
      _loc2_.moveTo(0,0);
      _loc2_.lineTo(this.dispConf.screenWidth,0);
      _loc2_.lineTo(this.dispConf.screenWidth,this.dispConf.screenHeight);
      _loc2_.lineTo(0,this.dispConf.screenHeight);
      _loc2_.lineTo(0,0);
      _loc2_.endFill();
      _loc2_._alpha = 0;
      this.playSound("SCREEN_FLASH","CELEBRATION_SOUNDSET");
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,inDuration,{_alpha:100,onComplete:this.fadeAndRemoveMc,onCompleteScope:this,onCompleteArgs:[_loc2_,outDuration,holdDuration],ease:com.rockstargames.ui.tweenStar.Ease.LINEAR});
   }
   function fadeAndRemoveMc(mc, duration, delay)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(mc,duration,{_alpha:0,delay:delay,onComplete:this.removeMovieClip,onCompleteScope:mc,ease:com.rockstargames.ui.tweenStar.Ease.LINEAR});
   }
   function CLEANUP(wallId)
   {
      var _loc5_ = this.getObjectFromMcName(wallId);
      var _loc6_ = this.getMovieClipFromName(wallId);
      var _loc4_ = _loc5_.tweensToRemove;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_.length)
      {
         var _loc3_ = _loc4_[_loc2_];
         if(_loc3_ != null)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc3_);
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc6_.removeMovieClip();
      _loc5_ = {};
      this.wallList = [];
      false;
      false;
   }
   function ADD_BACKGROUND_TO_WALL(wallId, alpha, textureId)
   {
      if(!alpha)
      {
         alpha = this.defaultBgAlpha;
      }
      var _loc3_ = this.getObjectFromMcName(wallId);
      var _loc6_ = this.getMovieClipFromName(wallId);
      var _loc2_ = _loc6_.bg;
      _loc2_._y = (_loc3_.currentHeight + this.bgBottomHeight) * -1;
      var _loc8_ = this.getColour(_loc3_.bgColour);
      var _loc5_ = _loc2_.createEmptyMovieClip("bg_fill",_loc2_.getNextHighestDepth());
      _loc5_.beginFill(_loc8_,alpha);
      _loc5_.moveTo(0,0);
      _loc5_.lineTo(this.dispConf.screenWidth,- this.bgTopHeight + this.bgBottomHeight);
      _loc5_.lineTo(this.dispConf.screenWidth,_loc3_.currentHeight);
      _loc5_.lineTo(0,_loc3_.currentHeight + this.bgBottomHeight);
      _loc5_.lineTo(0,0);
      _loc5_.endFill();
      if(textureId == 1)
      {
         var _loc7_ = _loc2_.attachMovie("shardTexture","shardTexture",_loc2_.getNextHighestDepth(),{_x:this.dispConf.screenWidth,_y:_loc3_.currentHeight});
         var _loc4_ = _loc2_.createEmptyMovieClip("texture_mask_fill",_loc2_.getNextHighestDepth());
         _loc4_.beginFill(0,100);
         _loc4_.moveTo(0,0);
         _loc4_.lineTo(this.dispConf.screenWidth,- this.bgTopHeight + this.bgBottomHeight);
         _loc4_.lineTo(this.dispConf.screenWidth,_loc3_.currentHeight);
         _loc4_.lineTo(0,_loc3_.currentHeight + this.bgBottomHeight);
         _loc4_.lineTo(0,0);
         _loc4_.endFill();
         _loc7_.setMask(_loc4_);
      }
      else if(textureId == 2)
      {
         var _loc10_ = _loc2_.attachMovie("moneyMeshVertical","shardTextureLeft",_loc2_.getNextHighestDepth(),{_x:0,_y:_loc3_.currentHeight + this.bgBottomHeight});
         var _loc15_ = _loc2_.attachMovie("moneyMeshVertical","shardTextureRight",_loc2_.getNextHighestDepth(),{_x:this.dispConf.screenWidth,_y:_loc3_.currentHeight + this.bgBottomHeight,_xscale:-100});
      }
      if(!this.isWideScreen)
      {
         _loc2_._x = _loc2_._x + 160;
      }
      if(this.celebrationGfxType == this.TYPE_FG || this.celebrationGfxType == this.TYPE_OVERLAY)
      {
         _loc2_._visible = false;
      }
   }
   function ADD_SCORE_TO_WALL(wallId, textLabel, score)
   {
      this.ADD_POSITION_TO_WALL(wallId,score,textLabel,false,true);
   }
   function getAvailableTextWidth(tf, belowText, rightToLeft, limit)
   {
      var _loc9_ = this.descendersPricedown;
      if(!belowText)
      {
         _loc9_ = this.ascendersPricedown;
      }
      var _loc7_ = 0;
      var _loc3_ = String(tf.text).split("");
      if(rightToLeft)
      {
         _loc3_.reverse();
      }
      if(!limit)
      {
         limit = _loc3_.length;
      }
      var _loc6_ = "";
      var _loc4_ = tf._parent.createTextField("dummyPos",tf._parent.getNextHighestDepth(),tf._x,tf._y,tf._width,tf._height);
      var _loc11_ = tf.getNewTextFormat();
      _loc4_.setNewTextFormat(_loc11_);
      _loc4_.autoSize = "left";
      _loc4_._visible = false;
      var _loc2_ = 0;
      while(_loc2_ < limit)
      {
         if(!this.stringInArray(_loc9_.split(""),_loc3_[_loc2_]))
         {
            _loc4_.text = _loc4_.text + _loc3_[_loc2_];
            _loc7_ = _loc4_.textWidth;
            if(_loc2_ < limit - 1)
            {
               _loc6_ = String(_loc3_[_loc2_ + 1]).toLowerCase();
            }
            _loc2_ = _loc2_ + 1;
            continue;
         }
         break;
      }
      if(_loc4_.textWidth >= tf.textWidth)
      {
         _loc7_ = 10000;
         _loc6_ = "";
      }
      if(_loc6_ != "")
      {
         _loc4_.text = _loc6_;
         if(_loc6_ == "d" && !belowText && !rightToLeft)
         {
            _loc7_ = _loc7_ + _loc4_.textWidth * 0.53;
         }
         else if(_loc6_ == "q" && belowText && !rightToLeft)
         {
            _loc7_ = _loc7_ + _loc4_.textWidth * 0.53;
         }
      }
      _loc4_.removeTextField();
      return _loc7_;
   }
   function ADD_POSITION_TO_WALL(wallId, position, positionLabel, isPositionLabelRawText, isScore)
   {
      var _loc10_ = this.positionId;
      if(this.dispConf.isAsian)
      {
         _loc10_ = this.positionId + "_asian";
      }
      if(!positionLabel && !isNaN(position))
      {
         positionLabel = "CELEB_YOU_FINISHED";
      }
      var _loc2_ = this.createLayoutMc(wallId,this.positionId);
      if(positionLabel)
      {
         if(!isPositionLabelRawText)
         {
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.finishedText,positionLabel,0,false);
         }
         else
         {
            _loc2_.finishedText.text = positionLabel;
         }
      }
      if(!isNaN(position))
      {
         if(!isScore)
         {
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.positionText,"CELEB_POSITION_" + position,0,false);
         }
         else
         {
            _loc2_.positionText.text = String(position);
         }
      }
      else
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.positionText,"CELEB_POSITION_DNF",0,false);
      }
      this.processTextField(_loc2_.finishedText,this.condensedTextFormat,{autoSize:"right"});
      this.processTextField(_loc2_.positionText,this.pricedownTextFormat,{autoSize:"left"});
      var _loc6_ = this.getAvailableTextWidth(_loc2_.positionText);
      if(isScore)
      {
         this.processTextField(_loc2_.finishedText,this.condensedTextFormat,{autoSize:"left"});
         (TextField)_loc2_.finishedText._x = (TextField)_loc2_.positionText._x + 15;
      }
      else
      {
         if(_loc6_ > _loc2_.positionText.textWidth)
         {
            _loc6_ = _loc2_.positionText.textWidth;
         }
         (TextField)_loc2_.finishedText._x = _loc6_ - ((TextField)_loc2_.finishedText._width + 9);
      }
      if(this.dispConf.isAsian)
      {
         _loc2_.positionText._y = (TextField)_loc2_.finishedText._height;
      }
      var _loc14_ = this.dispConf.screenWidth - this.safeLeft * 2;
      var _loc8_ = 720 - this.safeTop * 2;
      var _loc3_ = _loc2_._height;
      var _loc11_ = this.getAvailableTextWidth(_loc2_.finishedText,true);
      if(_loc11_ >= _loc2_.positionText.textWidth)
      {
         _loc3_ = 520;
      }
      _loc2_._xscale = _loc2_._yscale = _loc14_ / _loc2_._width * 100;
      if(_loc3_ * (_loc2_._xscale / 100) > _loc8_)
      {
         _loc2_._xscale = _loc2_._yscale = _loc8_ / _loc3_ * 100;
      }
      var _loc5_ = 720;
      var _loc12_ = _loc5_ / 2 - _loc3_ * (_loc2_._xscale / 100) / 2;
      this.addMcToWall(wallId,_loc2_,_loc5_,_loc12_,this.ALIGN_CENTER,0);
      var _loc4_ = [];
      _loc4_.push({method:"to",mc:_loc2_.finishedText,duration:this.slamDuration,tweenerObject:{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN,delay:this.pauseDuration}});
      _loc4_.push({method:"delayCall",mc:_loc2_.positionText,duration:0,tweenerObject:{onComplete:this.playSound,onCompleteScope:this,onCompleteArgs:["FINISHED_PLACE_SCREEN","CELEBRATION_SOUNDSET"]}});
      this.addAnimationsToWall(wallId,0,_loc5_,_loc4_);
      this.processMcsForGfxType([_loc2_]);
   }
   function ADD_JOB_POINTS_TO_WALL(wallId, points, xAlign)
   {
      var _loc2_ = "+";
      if(points < 0)
      {
         _loc2_ = "-";
      }
      this.ADD_POINTS_TO_WALL(wallId,points,3,_loc2_,xAlign);
   }
   function ADD_POINTS_TO_WALL(wallId, points, type, prefix, xAlign, marginTop, noAnims)
   {
      var _loc2_ = this.createLayoutMc(wallId,this.pointsId);
      _loc2_.icon.gotoAndStop(type);
      _loc2_.plusMinusText.text = prefix;
      _loc2_.pointsText.text = String(points);
      var _loc9_ = 60;
      if(!xAlign)
      {
         xAlign = this.ALIGN_LEFT;
      }
      if(!marginTop)
      {
         marginTop = 100;
      }
      this.processTextField(_loc2_.plusMinusText,null,{autoSize:"left"});
      this.processTextField(_loc2_.pointsText,null,{autoSize:"left"});
      (TextField)_loc2_.pointsText._x = (TextField)_loc2_.plusMinusText._x + (TextField)_loc2_.plusMinusText.textWidth;
      var _loc5_ = _loc2_._height + marginTop - 60;
      this.addMcToWall(wallId,_loc2_,_loc5_,marginTop,xAlign,_loc9_);
      switch(this.celebrationGfxType)
      {
         case this.TYPE_BG:
         case this.TYPE_FG:
            break;
         default:
            this.processMcsForGfxType([_loc2_.pointsText,_loc2_.plusMinusText]);
            if(noAnims)
            {
               return _loc2_;
            }
            _loc2_.pointsText.text = "0";
            _loc2_._y = _loc2_._y - marginTop;
            var _loc4_ = [];
            var _loc10_ = this.getObjectFromMcName(wallId);
            var _loc7_ = _loc10_.tweens;
            if(_loc7_.length > 0)
            {
               _loc4_.push({method:"to",mc:_loc2_,duration:this.slamDuration,noDelay:true,tweenerObject:{_y:_loc2_._y + marginTop,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN,delay:this.pauseDuration}});
            }
            else
            {
               _loc4_.push({method:"to",mc:_loc2_,duration:this.slamDuration,noDelay:true,tweenerObject:{_y:_loc2_._y + marginTop,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN,delay:0}});
            }
            _loc4_.push({method:"delayCall",mc:_loc2_.pointsText,duration:0.1,tweenerObject:{onComplete:this.doNumericTween,onCompleteScope:this,onCompleteArgs:[(TextField)_loc2_.pointsText,0,points]}});
            this.addAnimationsToWall(wallId,0,_loc5_,_loc4_);
            return _loc2_;
      }
      _loc2_.icon._visible = false;
      this.processMcsForGfxType([_loc2_.pointsText,_loc2_.plusMinusText]);
      if(noAnims)
      {
         return _loc2_;
      }
      _loc2_.pointsText.text = "0";
      _loc2_._y = _loc2_._y - marginTop;
      _loc4_ = [];
      _loc10_ = this.getObjectFromMcName(wallId);
      _loc7_ = _loc10_.tweens;
      if(_loc7_.length > 0)
      {
         _loc4_.push({method:"to",mc:_loc2_,duration:this.slamDuration,noDelay:true,tweenerObject:{_y:_loc2_._y + marginTop,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN,delay:this.pauseDuration}});
      }
      else
      {
         _loc4_.push({method:"to",mc:_loc2_,duration:this.slamDuration,noDelay:true,tweenerObject:{_y:_loc2_._y + marginTop,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN,delay:0}});
      }
      _loc4_.push({method:"delayCall",mc:_loc2_.pointsText,duration:0.1,tweenerObject:{onComplete:this.doNumericTween,onCompleteScope:this,onCompleteArgs:[(TextField)_loc2_.pointsText,0,points]}});
      this.addAnimationsToWall(wallId,0,_loc5_,_loc4_);
      return _loc2_;
   }
   function ADD_REP_POINTS_AND_RANK_BAR_TO_WALL(wallId, repPointsGained, startRepPoints, minRepPointsForRank, maxRepPointsForRank, currentRank, nextRank)
   {
      var _loc23_ = "+";
      if(repPointsGained < 0)
      {
         _loc23_ = "-";
      }
      var _loc18_ = 230;
      var _loc13_ = this.ADD_POINTS_TO_WALL(wallId,repPointsGained,2,_loc23_,this.ALIGN_LEFT,_loc18_,true);
      _loc13_.pointsText.text = "0";
      var _loc10_ = [];
      var _loc32_ = this.getObjectFromMcName(wallId);
      var _loc26_ = _loc32_.tweens;
      _loc13_._y = _loc13_._y - _loc18_;
      if(_loc26_.length > 0)
      {
         _loc10_.push({method:"to",mc:_loc13_,duration:this.slamDuration,noDelay:true,tweenerObject:{_y:_loc13_._y + _loc18_,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN,delay:this.pauseDuration}});
      }
      else
      {
         _loc10_.push({method:"to",mc:_loc13_,duration:this.slamDuration,noDelay:true,tweenerObject:{_y:_loc13_._y + _loc18_,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN,delay:0}});
      }
      var _loc2_ = this.createLayoutMc(wallId,this.rankBarId);
      _loc2_.currentRankText.text = String(currentRank);
      _loc2_.nextRankText.text = String(nextRank);
      this.processTextField(_loc2_.currentRankText,null,{autoSize:"left"});
      this.processTextField(_loc2_.nextRankText,null,{autoSize:"left"});
      if((TextField)_loc2_.currentRankText.textWidth > _loc2_.currentRankIcon._width * 0.8)
      {
         _loc2_.currentRankText._xscale = _loc2_.currentRankText._yscale = _loc2_.currentRankIcon._width / _loc2_.currentRankText._width * 80;
      }
      if((TextField)_loc2_.nextRankText.textWidth > _loc2_.nextRankIcon._width * 0.8)
      {
         _loc2_.nextRankText._xscale = _loc2_.nextRankText._yscale = _loc2_.nextRankIcon._width / _loc2_.nextRankText._width * 80;
      }
      (TextField)_loc2_.currentRankText._x = _loc2_.currentRankIcon._x + _loc2_.currentRankIcon._width / 2 - (TextField)_loc2_.currentRankText._width / 2;
      (TextField)_loc2_.nextRankText._x = _loc2_.nextRankIcon._x + _loc2_.nextRankIcon._width / 2 - (TextField)_loc2_.nextRankText._width / 2;
      _loc2_.nextRankText._y = _loc2_.nextRankIcon._y + (_loc2_.nextRankIcon._height - _loc2_.nextRankText._height) / 2;
      _loc2_.currentRankText._y = _loc2_.currentRankIcon._y + (_loc2_.currentRankIcon._height - _loc2_.currentRankText._height) / 2;
      var _loc20_ = false;
      _loc2_.rankup._visible = false;
      var _loc22_ = maxRepPointsForRank - minRepPointsForRank;
      var _loc21_ = this.pauseDuration * 0.3;
      var _loc27_ = (startRepPoints - minRepPointsForRank) / _loc22_ * 100;
      var _loc24_ = (startRepPoints + repPointsGained - minRepPointsForRank) / _loc22_ * 100;
      if(startRepPoints + repPointsGained >= maxRepPointsForRank)
      {
         _loc20_ = true;
         _loc24_ = 100;
      }
      _loc10_.push({method:"delayCall",mc:_loc13_.pointsText,duration:0,tweenerObject:{onComplete:this.doNumericTween,onCompleteScope:this,onCompleteArgs:[(TextField)_loc13_.pointsText,0,repPointsGained,_loc21_]}});
      _loc2_.rankBarFg._height = _loc2_.rankBarBg._height;
      _loc2_.rankBarFg._y = _loc2_.rankBarBg._y;
      var _loc17_ = 60;
      var _loc25_ = 200;
      if(_loc20_)
      {
         var _loc15_ = 270;
         _loc17_ = 100 + _loc15_;
         _loc25_ = 230;
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.rankup.rankText,"CELEB_RANK_UP_1",0,false);
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.rankup.upText,"CELEB_RANK_UP_2",0,false);
         _loc2_.rankup.rankNumberMc.nextRankText.text = nextRank;
         this.processTextField(_loc2_.rankup.rankText,this.condensedTextFormat,{textAutoSize:"shrink"});
         this.processTextField(_loc2_.rankup.upText,this.pricedownTextFormat,{textAutoSize:"shrink"});
         this.processTextField(_loc2_.rankup.rankNumberMc.nextRankText,null,{autoSize:"center"});
         _loc2_.rankup.upText._y = 112;
         if(this.dispConf.isAsian)
         {
            _loc2_.rankup.rankText._y = _loc2_.rankup.rankText._y - 30;
            _loc2_.rankup.upText._y = _loc2_.rankup.upText._y - 30;
         }
         if(_loc2_.rankup.rankNumberMc._width > _loc2_.rankup.globe._width * 0.8)
         {
            _loc2_.rankup.rankNumberMc._xscale = _loc2_.rankup.rankNumberMc._yscale = _loc2_.rankup.globe._width * 0.8 / _loc2_.rankup.rankNumberMc._width * 100;
            _loc2_.rankup.rankNumberMc._x = _loc2_.rankup.globe._x + _loc2_.rankup.globe._width / 2;
            _loc2_.rankup.rankNumberMc._y = _loc2_.rankup.globe._y + (_loc2_.rankup.globe._height - _loc2_.rankup.rankNumberMc._height) / 2;
         }
         _loc2_.rankup._y = _loc2_.rankup._y + _loc15_;
         _loc2_.currentRankText._y = _loc2_.currentRankText._y + _loc15_;
         _loc2_.currentRankIcon._y = _loc2_.currentRankIcon._y + _loc15_;
         _loc2_.nextRankText._y = _loc2_.nextRankText._y + _loc15_;
         _loc2_.nextRankIcon._y = _loc2_.nextRankIcon._y + _loc15_;
         _loc2_.rankBarFg._y = _loc2_.rankBarFg._y + _loc15_;
         _loc2_.rankBarBg._y = _loc2_.rankBarBg._y + _loc15_;
      }
      var _loc3_ = _loc27_;
      var _loc4_ = _loc24_ - _loc3_;
      var _loc8_ = _loc21_ / Math.ceil(_loc4_ / 10);
      var _loc11_ = 0;
      var _loc5_ = 0;
      while(_loc5_ < 10)
      {
         var _loc6_ = _loc2_.rankBarFg["sect" + _loc5_];
         _loc6_._xscale = 0;
         if(_loc3_ <= 0)
         {
            var _loc7_ = {method:"to",mc:_loc6_,duration:_loc8_};
            if(_loc4_ >= 10)
            {
               _loc7_.tweenerObject = {_width:26,delay:(_loc5_ - _loc11_) * _loc8_};
               _loc4_ = _loc4_ - 10;
            }
            else if(_loc4_ > 0)
            {
               _loc7_.tweenerObject = {_width:2.6 * _loc4_,delay:(_loc5_ - _loc11_) * _loc8_};
               _loc4_ = 0;
            }
            if(_loc7_.tweenerObject)
            {
               _loc10_.push(_loc7_);
            }
         }
         if(_loc3_ >= 10)
         {
            _loc6_._xscale = 100;
            _loc3_ = _loc3_ - 10;
         }
         else if(_loc3_ > 0)
         {
            _loc6_._width = 2.6 * _loc3_;
            var _loc12_ = _loc4_ + _loc3_ <= 10?_loc4_ + _loc3_:10;
            var _loc9_ = _loc12_ - _loc3_;
            _loc4_ = _loc4_ - _loc9_;
            _loc11_ = _loc5_ - 1;
            _loc10_.push({method:"to",mc:_loc6_,duration:_loc8_,tweenerObject:{_width:2.6 * (_loc9_ + _loc3_)}});
            _loc3_ = 0;
         }
         _loc5_ = _loc5_ + 1;
      }
      this.addMcToWall(wallId,_loc2_,_loc17_,_loc25_,this.ALIGN_CENTER,0);
      if(_loc20_)
      {
         _loc10_.push({method:"delayCall",mc:_loc13_.rankBarBg,duration:0,tweenerObject:{delay:_loc21_,onComplete:this.showRankUp,onCompleteScope:this,onCompleteArgs:[_loc2_,currentRank,nextRank]}});
         this.addAnimationsToWall(wallId,0,_loc17_ - 35,_loc10_,0);
         var _loc28_ = [{method:"delayCall",mc:_loc13_.finishedText,duration:0,tweenerObject:{onComplete:this.playSound,onCompleteScope:this,onCompleteArgs:["RANK_UP","HUD_AWARDS"]}}];
         this.addAnimationsToWall(wallId,670,0,_loc28_,this.pauseDuration * 0.5,this.slamDuration * 1.5);
      }
      else
      {
         this.addAnimationsToWall(wallId,280,_loc17_,_loc10_,0);
      }
      switch(this.celebrationGfxType)
      {
         case this.TYPE_BG:
            this.processMcsForGfxType([_loc2_]);
            break;
         case this.TYPE_FG:
            _loc2_.currentRankIcon._visible = false;
            _loc2_.nextRankIcon._visible = false;
            _loc2_.rankBarBg._visible = false;
            _loc2_.rankBarFg._visible = false;
            _loc2_.rankup.glow._visible = false;
            this.processMcsForGfxType([_loc2_.rankup.rankText,_loc2_.rankup.upText]);
            break;
         default:
            _loc2_.rankBarBg._alpha = 30;
            this.processMcsForGfxType([_loc2_.rankup.rankText,_loc2_.rankup.upText]);
      }
   }
   function showRankUp(layoutMc, currentRank, nextRank)
   {
      layoutMc.rankup._visible = true;
      layoutMc.rankup.rankNumberMc.nextRankText.text = String(currentRank);
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(layoutMc.rankup,this.pauseDuration * 0.45,{onComplete:this.playSound,onCompleteScope:this,onCompleteArgs:["NUMBER_TURN","CELEBRATION_SOUNDSET"]});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(layoutMc.rankup.rankNumberMc,this.slamDuration * 0.8,{delay:this.pauseDuration * 0.5,_yrotation:90,onComplete:this.completeRankUpAnimation,onCompleteScope:this,onCompleteArgs:[layoutMc,nextRank]});
   }
   function completeRankUpAnimation(layoutMc, nextRank)
   {
      layoutMc.rankup.rankNumberMc._yrotation = 275;
      layoutMc.rankup.rankNumberMc.nextRankText.text = String(nextRank);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(layoutMc.rankup.rankNumberMc,this.slamDuration * 0.8,{_yrotation:0,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT,onComplete:this.completeRankUpAnimationGlobe,onCompleteScope:this,onCompleteArgs:[layoutMc,nextRank]});
   }
   function completeRankUpAnimationGlobe(layoutMc, nextRank)
   {
      if(nextRank >= 750)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(layoutMc.rankup.globe,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GOLD);
      }
      else if(nextRank >= 500)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(layoutMc.rankup.globe,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_SILVER);
      }
      else if(nextRank >= 100)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(layoutMc.rankup.globe,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BRONZE);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(layoutMc.rankup.globe,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE);
      }
      layoutMc.rankup.globe._x = 633.05;
      layoutMc.rankup.globe._y = -48.45;
      layoutMc.rankup.globe._width = layoutMc.rankup.globe._height = 497.9;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(layoutMc.rankup.globe,this.slamDuration * 2,{_y:-30,_x:652.5,_width:461,_height:461,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT});
      var _loc7_ = layoutMc.rankup.rankNumberMc._x;
      var _loc5_ = layoutMc.rankup.rankNumberMc._y;
      var _loc4_ = layoutMc.rankup.rankNumberMc._width;
      var _loc3_ = layoutMc.rankup.rankNumberMc._height;
      layoutMc.rankup.rankNumberMc._y = layoutMc.rankup.rankNumberMc._y - _loc3_ * 0.05;
      layoutMc.rankup.rankNumberMc._xscale = layoutMc.rankup.rankNumberMc._yscale = layoutMc.rankup.rankNumberMc._xscale + 10;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(layoutMc.rankup.rankNumberMc,this.slamDuration * 2,{_y:_loc5_,_width:_loc4_,_height:_loc3_,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT});
      this.playSound("NUMBER_TURN_STOP","CELEBRATION_SOUNDSET");
      layoutMc.rankup.gotoAndPlay(2);
   }
   function ADD_WINNER_TO_WALL(wallId, winLoseTextLabel, gamerName, crewName, betAmount, isInFlow, teamName)
   {
      this.ADD_CHALLENGE_WINNER_TO_WALL(wallId,gamerName,winLoseTextLabel,crewName,null,betAmount,isInFlow,true,null,null,teamName);
   }
   function ADD_OBJECTIVE_TO_WALL(wallId, objectiveTitleLabel, objectiveText, isObjectiveTitleRawText)
   {
      var _loc5_ = this.winnerId;
      var _loc7_ = 155;
      var _loc4_ = 125 + _loc7_;
      var _loc6_ = -16;
      if(this.dispConf.isAsian)
      {
         _loc5_ = this.winnerId + "_asian";
         _loc6_ = 0;
      }
      var _loc2_ = this.createLayoutMc(wallId,_loc5_);
      if(!isObjectiveTitleRawText)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.introText,objectiveTitleLabel,0,false);
      }
      else
      {
         _loc2_.introText.text = objectiveTitleLabel;
      }
      _loc2_.challengeNameText.text = objectiveText;
      this.processTextField(_loc2_.challengeNameText,this.condensedTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.introText,this.condensedTextFormat,{autoSize:"left"});
      _loc2_.challengeNameText._y = _loc2_.introText.textHeight + _loc6_;
      this.addMcToWall(wallId,_loc2_,_loc4_,_loc7_,this.ALIGN_LEFT);
      var _loc3_ = [];
      _loc3_.push({method:"to",mc:_loc2_,duration:this.slamDuration,tweenerObject:{_y:_loc2_._y + 20,delay:this.pauseDuration * 2 + this.slamDuration}});
      this.addAnimationsToWall(wallId,0,_loc4_,_loc3_);
      this.processMcsForGfxType([_loc2_]);
   }
   function ADD_MISSION_RESULT_TO_WALL(wallId, missionTextLabel, passFailTextLabel, missionReasonString, isReasonRawText, isPassFailRawText)
   {
      this.ADD_CHALLENGE_WINNER_TO_WALL(wallId,missionTextLabel,passFailTextLabel,"",missionReasonString,null,true,false,true,isPassFailRawText);
   }
   function ADD_TIME_TO_WALL(wallId, time, timeTitleLabel, timeDifference)
   {
      var _loc2_ = this.createLayoutMc(wallId,this.timeId);
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.timeTitleText,timeTitleLabel,0,false);
      _loc2_.timeText.text = this.formatTimeMs(time);
      _loc2_.timeDiffText.text = this.formatTimeMs(timeDifference);
      this.processTextField(_loc2_.timeTitleText,this.condensedTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.timeText,null,{autoSize:"left"});
      this.processTextField(_loc2_.timeDiffText,null,{autoSize:"left"});
      (TextField)_loc2_.timeDiffText._x = (TextField)_loc2_.timeText._x + (TextField)_loc2_.timeText._width + 50;
      if(this.dispConf.isAsian)
      {
         _loc2_.timeTitleText._y = _loc2_.timeTitleText._y - 10;
      }
      var _loc4_ = 85;
      var _loc3_ = _loc2_._height + 50;
      this.addMcToWall(wallId,_loc2_,_loc3_,_loc4_,this.ALIGN_LEFT,0);
      this.addAnimationsToWall(wallId,0,_loc3_);
      this.processMcsForGfxType([_loc2_]);
   }
   function ADD_CHALLENGE_SET_TO_WALL(wallId, score, time, setTextLabel, challengeName)
   {
      var _loc4_ = this.challengeSetId;
      if(this.dispConf.isAsian)
      {
         _loc4_ = this.challengeSetId + "_asian";
      }
      var _loc2_ = this.createLayoutMc(wallId,_loc4_);
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.setText,setTextLabel,0,false);
      _loc2_.challengeNameText.text = challengeName;
      if(score)
      {
         _loc2_.scoreText.text = String(score);
         if(!time)
         {
            (TextField)_loc2_.scoreText._xscale = (TextField)_loc2_.scoreText._yscale = 200;
            (TextField)_loc2_.scoreText._x = (TextField)_loc2_.scoreText._x - 5;
            (TextField)_loc2_.scoreText._y = (TextField)_loc2_.scoreText._y - 38;
         }
      }
      if(time)
      {
         _loc2_.timeText.text = this.formatTimeMs(time);
         if(!score)
         {
            (TextField)_loc2_.timeText._xscale = (TextField)_loc2_.timeText._yscale = 200;
            (TextField)_loc2_.timeText._y = _loc2_.scoreText._y - 53;
            (TextField)_loc2_.timeText._x = (TextField)_loc2_.timeText._x - 7;
            _loc2_.challengeNameText._y = _loc2_.challengeNameText._y - 22;
         }
      }
      this.processTextField(_loc2_.setText,this.condensedTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.timeText,null,{autoSize:"left"});
      this.processTextField(_loc2_.scoreText,null,{autoSize:"left"});
      this.processTextField(_loc2_.challengeNameText,this.scriptTextFormat,{autoSize:"left"});
      var _loc3_ = 720;
      var _loc8_ = _loc3_ / 2 - _loc2_._height / 2;
      this.addMcToWall(wallId,_loc2_,_loc3_,_loc8_,this.ALIGN_LEFT,0);
      var _loc6_ = [];
      this.addAnimationsToWall(wallId,0,_loc3_,_loc6_);
      this.processMcsForGfxType([_loc2_]);
   }
   function ADD_STAT_NUMERIC_TO_WALL(wallId, statLabel, statValue, xAlign, isRawText)
   {
      if(!xAlign)
      {
         xAlign = this.ALIGN_LEFT;
      }
      var _loc5_ = !this.dispConf.isAsian?this.statNumericId:this.statNumericId + "_asian";
      var _loc2_ = this.createLayoutMc(wallId,_loc5_);
      if(!isRawText)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.statNameText,statLabel,0,false);
      }
      else
      {
         _loc2_.statNameText.text = statLabel;
      }
      _loc2_.statValueText.text = String(statValue);
      this.processTextField(_loc2_.statValueText,null,{autoSize:"left"});
      this.processTextField(_loc2_.statNameText,this.condensedTextFormat,{autoSize:"left"});
      (TextField)_loc2_.statValueText._x = (TextField)_loc2_.statNameText._x + (TextField)_loc2_.statNameText._width + 30;
      var _loc6_ = 100;
      var _loc4_ = _loc2_._height + 50;
      this.addMcToWall(wallId,_loc2_,_loc4_,_loc6_,xAlign,60);
      _loc2_.statValueText.text = "0";
      var _loc3_ = [];
      _loc3_.push({method:"delayCall",mc:_loc2_.statValueText,duration:0.1,tweenerObject:{onComplete:this.doNumericTween,onCompleteScope:this,onCompleteArgs:[(TextField)_loc2_.statValueText,0,statValue]}});
      this.addAnimationsToWall(wallId,0,_loc4_,_loc3_);
      this.processMcsForGfxType([_loc2_]);
   }
   function ADD_CASH_WON_TO_WALL(wallId, statLabel, statValue, potentialValue, xAlign, isRawText)
   {
      if(!xAlign)
      {
         xAlign = this.ALIGN_LEFT;
      }
      var _loc5_ = !this.dispConf.isAsian?this.cashWonId:this.cashWonId + "_asian";
      var _loc2_ = this.createLayoutMc(wallId,_loc5_);
      if(!isRawText)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.statNameText,statLabel,0,false);
      }
      else
      {
         _loc2_.statNameText.text = statLabel;
      }
      _loc2_.statValueText.text = String(statValue);
      this.processTextField(_loc2_.statValueText,this.pricedownTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.statNameText,this.condensedTextFormat,{autoSize:"left"});
      var _loc6_ = 250;
      var _loc4_ = 720;
      this.addMcToWall(wallId,_loc2_,_loc4_,_loc6_,xAlign,60);
      _loc2_.statValueText.text = potentialValue;
      var _loc3_ = [];
      _loc3_.push({method:"delayCall",mc:_loc2_.statValueText,duration:0.1,tweenerObject:{onComplete:this.doNumericTween,onCompleteScope:this,onCompleteArgs:[(TextField)_loc2_.statValueText,potentialValue,statValue,this.pauseDuration * 0.4,1]}});
      this.addAnimationsToWall(wallId,0,_loc4_,_loc3_);
      this.processMcsForGfxType([_loc2_]);
   }
   function ADD_WAVE_REACHED_TO_WALL(wallId, waveText, reachedLabel)
   {
      if(!reachedLabel)
      {
         reachedLabel = "CELEB_SURVIVED";
      }
      this.ADD_MISSION_RESULT_TO_WALL(wallId,reachedLabel,waveText,null,null,true);
   }
   function ADD_WORLD_RECORD_TO_WALL(wallId, time)
   {
      var _loc5_ = this.worldRecordId;
      if(this.dispConf.isAsian)
      {
         _loc5_ = this.worldRecordId + "_asian";
      }
      var _loc2_ = this.createLayoutMc(wallId,_loc5_);
      var _loc3_ = 38;
      var _loc6_ = 1;
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.introText,"CELEB_YOU_SET_A",0,false);
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.worldText,"CELEB_WORLD",0,false);
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.recordText,"CELEB_RECORD",0,false);
      _loc2_.timeText.text = this.formatTimeMs(time);
      this.processTextField(_loc2_.introText,this.condensedTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.worldText,this.pricedownTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.recordText,this.pricedownTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.timeText,null,{autoSize:"left"});
      var _loc8_ = this.getAvailableTextWidth(_loc2_.worldText);
      var _loc12_ = this.getAvailableTextWidth(_loc2_.worldText,true);
      var _loc7_ = this.getAvailableTextWidth(_loc2_.recordText);
      var _loc10_ = this.getAvailableTextWidth(_loc2_.recordText,true);
      if((TextField)_loc2_.introText.textWidth > _loc8_)
      {
         _loc2_.worldText._y = _loc2_.worldText._y + _loc3_;
         _loc2_.recordText._y = _loc2_.recordText._y + _loc3_;
         _loc2_.timeText._y = _loc2_.timeText._y + _loc3_;
         _loc6_ = _loc6_ + _loc3_;
      }
      if(_loc7_ < _loc12_ && _loc7_ < _loc2_.worldText.textWidth)
      {
         _loc2_.recordText._y = _loc2_.recordText._y + _loc3_;
         _loc2_.timeText._y = _loc2_.timeText._y + _loc3_;
         _loc6_ = _loc6_ + _loc3_;
      }
      if((TextField)_loc2_.timeText.textWidth > _loc10_)
      {
         _loc2_.timeText._y = _loc2_.timeText._y + _loc3_;
      }
      if(this.dispConf.isAsian)
      {
         _loc2_.worldText._y = _loc2_.worldText._y - 65;
         _loc2_.recordText._y = _loc2_.recordText._y - 70;
      }
      var _loc4_ = 720;
      this.addMcToWall(wallId,_loc2_,_loc4_,(_loc4_ - _loc2_._height) / 2,this.ALIGN_CENTER,0);
      var _loc9_ = [];
      this.addAnimationsToWall(wallId,0,_loc4_,_loc9_);
      this.processMcsForGfxType([_loc2_]);
   }
   function ADD_TOURNAMENT_TO_WALL(wallId, playlistName, qualificationLabel, resultText, isResultTextRawText, resultValue)
   {
      var _loc2_ = this.createLayoutMc(wallId,this.tournamentId);
      _loc2_.playlistNameText.text = playlistName;
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.qualificationText,qualificationLabel,0,false);
      if(isResultTextRawText)
      {
         _loc2_.resultText.text = resultText;
      }
      else
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.resultText,resultText,0,false);
      }
      this.processTextField(_loc2_.playlistNameText,this.scriptTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.qualificationText,this.condensedTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.resultText,this.condensedTextFormat,{autoSize:"left"});
      if(resultValue)
      {
         if(resultText == "CELEB_TOTAL_TIME")
         {
            (TextField)_loc2_.resultValueText.text = " " + this.formatTimeMs(resultValue);
            this.processTextField(_loc2_.resultValueText,this.condensedTextFormat,{autoSize:"left"});
         }
         else
         {
            (TextField)_loc2_.resultValueText.text = " " + String(resultValue);
            this.processTextField(_loc2_.resultValueText,this.pricedownTextFormat,{autoSize:"left"});
            _loc2_.resultValueText._y = _loc2_.resultValueText._y + 3;
         }
         (TextField)_loc2_.resultValueText._x = (TextField)_loc2_.resultText.textWidth;
      }
      var _loc3_ = 720;
      var _loc5_ = _loc3_ - (_loc2_._height + 100);
      this.addMcToWall(wallId,_loc2_,_loc3_,_loc5_,this.ALIGN_LEFT,0);
      var _loc4_ = [];
      _loc4_.push({method:"to",mc:_loc2_.playlistNameText,duration:this.glideDuration,tweenerObject:{_x:_loc2_.playlistNameText._x + 50,ease:com.rockstargames.ui.tweenStar.Ease.LINEAR}});
      _loc4_.push({method:"delayCall",mc:_loc2_.resultText,duration:0,tweenerObject:{onComplete:this.playSound,onCompleteScope:this,onCompleteArgs:["SCREEN_START","CELEBRATION_SOUNDSET"]}});
      this.addAnimationsToWall(wallId,this.dispConf.screenHeight - _loc3_,_loc3_,_loc4_);
      switch(this.celebrationGfxType)
      {
         case this.TYPE_BG:
            this.processMcsForGfxType([_loc2_]);
            break;
         case this.TYPE_FG:
            this.processMcsForGfxType([_loc2_.qualificationText,_loc2_.resultText,_loc2_.resultValueText]);
            break;
         default:
            this.processMcsForGfxType([_loc2_.qualificationText,_loc2_.resultText,_loc2_.resultValueText]);
      }
   }
   function ADD_INTRO_TO_WALL(wallId, modeLabel, jobName, challengeTextLabel, challengePartsText, targetTypeTextLabel, targetValue, delay, targetValuePrefix)
   {
      if(!delay)
      {
         delay = this.pauseDuration * 2.5;
      }
      var _loc2_ = this.createLayoutMc(wallId,this.introId);
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.modeText,modeLabel,0,false);
      _loc2_.modeText.text = String(_loc2_.modeText.text).toUpperCase();
      _loc2_.jobNameText.text = jobName;
      if(challengeTextLabel)
      {
         var _loc4_ = (TextField)_loc2_.targetTypeText;
         if(targetTypeTextLabel && targetValue)
         {
            _loc4_ = (TextField)_loc2_.challengeText;
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.targetTypeText,targetTypeTextLabel,0,false);
            if(!targetValuePrefix)
            {
               targetValuePrefix = "";
            }
            if(targetTypeTextLabel == "CELEB_TARGET_TIME")
            {
               (TextField)_loc2_.targetText.text = " " + targetValuePrefix + this.formatTimeMs(targetValue);
               this.processTextField(_loc2_.targetText,this.condensedTextFormat,{autoSize:"left"});
            }
            else
            {
               (TextField)_loc2_.targetText.text = " " + targetValuePrefix + String(targetValue);
               this.processTextField(_loc2_.targetText,this.pricedownTextFormat,{autoSize:"left"});
               _loc2_.targetText._y = _loc2_.targetText._y + 3;
            }
         }
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc4_,challengeTextLabel,0,false);
         if(_loc4_.text != "")
         {
            _loc4_.text = _loc4_.text + " ";
         }
         _loc4_.text = _loc4_.text + challengePartsText;
         this.processTextField(_loc2_.challengeText,this.condensedTextFormat,{autoSize:"left"});
         this.processTextField(_loc2_.targetTypeText,this.condensedTextFormat,{autoSize:"left"});
         this.processTextField(_loc2_.challengePartText,this.condensedTextFormat,{autoSize:"left"});
         (TextField)_loc2_.challengePartText._x = (TextField)_loc2_.challengeText.textWidth;
         (TextField)_loc2_.targetText._x = (TextField)_loc2_.targetTypeText.textWidth;
      }
      this.processTextField(_loc2_.modeText,this.pricedownTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.jobNameText,this.scriptTextFormat,{autoSize:"left"});
      var _loc6_ = 50;
      var _loc3_ = _loc2_._height + 20;
      this.bgTopHeight = -160;
      if(challengeTextLabel && challengeTextLabel != "")
      {
         _loc6_ = _loc6_ + 30;
         _loc3_ = _loc3_ + 30;
         if(targetTypeTextLabel && targetValue)
         {
            _loc6_ = _loc6_ + 30;
            _loc3_ = _loc3_ + 30;
         }
      }
      this.addMcToWall(wallId,_loc2_,_loc3_,_loc6_,this.ALIGN_LEFT,0);
      var _loc5_ = [];
      _loc5_.push({method:"to",mc:_loc2_.jobNameText,duration:this.glideDuration,tweenerObject:{_x:_loc2_.jobNameText._x + 50,ease:com.rockstargames.ui.tweenStar.Ease.LINEAR}});
      _loc5_.push({method:"delayCall",mc:_loc2_.modeText,duration:0,tweenerObject:{onComplete:this.playSound,onCompleteScope:this,onCompleteArgs:["SCREEN_START","CELEBRATION_SOUNDSET"]}});
      this.addAnimationsToWall(wallId,this.dispConf.screenHeight - _loc3_,_loc3_,_loc5_,delay);
      switch(this.celebrationGfxType)
      {
         case this.TYPE_BG:
            this.processMcsForGfxType([_loc2_]);
            break;
         case this.TYPE_FG:
            _loc2_.jobNameText._visible = false;
            this.processMcsForGfxType([_loc2_.modeText,_loc2_.challengeText,_loc2_.targetTypeText,_loc2_.challengePartText,_loc2_.targetText]);
            break;
         default:
            _loc2_.jobNameText._alpha = 100;
            this.processMcsForGfxType([_loc2_.modeText,_loc2_.challengeText,_loc2_.targetTypeText,_loc2_.challengePartText,_loc2_.targetText]);
      }
   }
   function ADD_READY_TO_WALL(wallId, readyLabel)
   {
      var _loc2_ = this.createLayoutMc(wallId,this.readyId);
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.readyText,readyLabel,0,false);
      this.processTextField(_loc2_.readyText,this.pricedownTextFormat,{autoSize:"left",textColor:this.getColour("HUD_COLOUR_FREEMODE"),_alpha:100});
      var _loc3_ = 10;
      var _loc6_ = _loc2_.readyText.textHeight + _loc3_ + 720 * (1 - this.dispConf.safeBottom);
      this.addMcToWall(wallId,_loc2_,_loc6_,_loc3_,this.ALIGN_LEFT,0);
      var _loc5_ = [];
      _loc5_.push({method:"delayCall",mc:_loc2_.readyText,duration:0,tweenerObject:{onComplete:this.playSound,onCompleteScope:this,onCompleteArgs:["SCREEN_START","CELEBRATION_SOUNDSET"]}});
      this.addAnimationsToWall(wallId,720,0,[]);
      this.addAnimationsToWall(wallId,720,0,[],null,null,true);
      switch(this.celebrationGfxType)
      {
         case this.TYPE_BG:
         case this.TYPE_FG:
            break;
         default:
            this.processMcsForGfxType([_loc2_.jobNameText,_loc2_.challengeText,_loc2_.targetTypeText,_loc2_.challengePartText,_loc2_.targetText]);
      }
      _loc2_.readyText._visible = false;
      this.processMcsForGfxType([_loc2_.jobNameText,_loc2_.challengeText,_loc2_.targetTypeText,_loc2_.challengePartText,_loc2_.targetText]);
   }
   function ADD_CASH_TO_WALL(wallId, cashAmount, xAlign)
   {
      if(!cashAmount)
      {
         return undefined;
      }
      var _loc3_ = "+$";
      if(cashAmount < 0)
      {
         _loc3_ = "-$";
      }
      if(!xAlign)
      {
         xAlign = this.ALIGN_RIGHT;
      }
      this.ADD_POINTS_TO_WALL(wallId,cashAmount,1,_loc3_,xAlign);
   }
   function ADD_CHALLENGE_PART_TO_WALL(wallId, winLoseTextLabel, challengePartsText)
   {
      var _loc2_ = this.createLayoutMc(wallId,this.challengePartId);
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.winLoseText,winLoseTextLabel,0,false);
      (TextField)_loc2_.challengePartText.text = challengePartsText;
      this.processTextField(_loc2_.winLoseText,this.pricedownTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.challengePartText,this.condensedTextFormat,{autoSize:"left"});
      var _loc6_ = this.getAvailableTextWidth(_loc2_.winLoseText,true);
      if(_loc6_ < _loc2_.challengePartText.textWidth && !this.dispConf.isAsian)
      {
         _loc2_.challengePartText._y = _loc2_.challengePartText._y + 40;
      }
      if(this.dispConf.isAsian)
      {
         _loc2_.challengePartText._y = _loc2_.challengePartText._y + 60;
      }
      var _loc4_ = 110;
      var _loc3_ = _loc2_._height + _loc4_;
      this.addMcToWall(wallId,_loc2_,_loc3_,_loc4_,this.ALIGN_LEFT);
      var _loc5_ = [];
      this.addAnimationsToWall(wallId,0,_loc3_,_loc5_);
      this.processMcsForGfxType([_loc2_]);
   }
   function CREATE_STAT_TABLE(wallId, tableId)
   {
      var _loc2_ = this.createLayoutMc(wallId,this.statTableId,tableId);
      var _loc3_ = [];
      _loc2_.tableChildAnims = _loc3_;
   }
   function ADD_STAT_TO_TABLE(wallId, tableId, statText, statValue, isStatTextRawText, isStatValueRawText, isTotalRow, isStatValueTime, colour)
   {
      var _loc10_ = this.getMovieClipFromName(wallId);
      var _loc9_ = _loc10_[tableId];
      var _loc5_ = _loc9_.getNextHighestDepth();
      var _loc11_ = _loc9_._height;
      var _loc4_ = this.statRowId;
      var _loc6_ = 24;
      var _loc13_ = 75;
      if(isTotalRow)
      {
         _loc4_ = this.statNumericId;
         _loc6_ = 48;
         _loc13_ = 150;
         if(this.dispConf.isAsian)
         {
            _loc4_ = this.statNumericId + "_asian";
            _loc6_ = 30;
         }
      }
      var _loc2_ = _loc9_.attachMovie(_loc4_,this.statRowId + "_" + _loc5_,_loc5_);
      if(!isStatTextRawText)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.statNameText,statText,0,false);
      }
      else
      {
         _loc2_.statNameText.text = statText;
      }
      if(!isStatValueRawText)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.statValueText,statValue,0,false);
      }
      else
      {
         if(!isNaN(statValue) && isStatValueTime)
         {
            statValue = this.formatTimeMs(Number(statValue));
         }
         _loc2_.statValueText.text = statValue;
      }
      if(colour)
      {
         var _loc3_ = new com.rockstargames.ui.utils.HudColour();
         var _loc7_ = com.rockstargames.ui.utils.HudColour[colour];
         if(isNaN(_loc7_))
         {
            _loc7_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE;
         }
         com.rockstargames.ui.utils.Colour.setHudColour(_loc7_,_loc3_);
         com.rockstargames.ui.utils.Colour.Colourise(_loc2_.statValueText,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      }
      var _loc12_ = this.condensedTextFormat;
      _loc12_.align = "left";
      this.processTextField(_loc2_.statNameText,this.condensedTextFormat,{autoSize:"right"});
      if(!this.dispConf.isAsian)
      {
         this.processTextField(_loc2_.statValueText,this.condensedTextFormat,{autoSize:"left"});
      }
      else
      {
         this.processTextField(_loc2_.statValueText,null,{autoSize:"left"});
      }
      if(_loc5_ > 0)
      {
         _loc2_._y = _loc11_ - _loc6_;
      }
      _loc2_.statValueText._x = 20;
      _loc2_.statNameText._x = _loc2_.statNameText.textWidth * -1;
   }
   function ADD_STAT_TABLE_TO_WALL(wallId, tableId)
   {
      var _loc19_ = this.getMovieClipFromName(wallId);
      var _loc2_ = _loc19_[tableId];
      if(_loc2_)
      {
         var _loc18_ = 720;
         var _loc3_ = [];
         var _loc4_ = 0;
         var _loc5_ = 0;
         for(var _loc16_ in _loc2_)
         {
            if(typeof _loc2_[_loc16_] == "movieclip")
            {
               if(_loc2_[_loc16_].statNameText.textWidth > _loc5_)
               {
                  _loc5_ = _loc2_[_loc16_].statNameText.textWidth;
               }
            }
         }
         for(var _loc16_ in _loc2_)
         {
            if(typeof _loc2_[_loc16_] == "movieclip")
            {
               _loc2_[_loc16_].statNameText._x = _loc2_[_loc16_].statNameText._x + _loc5_;
               _loc2_[_loc16_].statValueText._x = _loc2_[_loc16_].statNameText._x + _loc2_[_loc16_].statNameText.textWidth + 20;
               if(_loc4_ == 0)
               {
                  _loc3_.push({method:"delayCall",mc:_loc2_[_loc16_].statValueText,duration:0,tweenerObject:{onComplete:this.playSound,onCompleteScope:this,onCompleteArgs:["NUMBER_COUNT_STOP","CELEBRATION_SOUNDSET"]}});
                  _loc3_.push({method:"delayCall",mc:_loc2_[_loc16_],duration:0,tweenerObject:{onComplete:this.doNumericTween,onCompleteScope:this,onCompleteArgs:[(TextField)_loc2_[_loc16_].statValueText,0,Number((TextField)_loc2_[_loc16_].statValueText.text),this.slamDuration]}});
               }
               else
               {
                  _loc2_[_loc16_]._y = _loc2_[_loc16_]._y - 520;
                  _loc3_.push({method:"to",mc:_loc2_[_loc16_],duration:this.slamDuration * 1.5,tweenerObject:{_y:_loc2_[_loc16_]._y + 520,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN,delay:this.slamDuration * _loc4_,onComplete:this.playSound,onCompleteScope:this,onCompleteArgs:["NUMBER_COUNT_STOP","CELEBRATION_SOUNDSET"]}});
               }
               _loc4_ = _loc4_ + 1;
            }
         }
         var _loc17_ = 120;
         if(_loc4_ > 6)
         {
            _loc17_ = 70;
         }
         this.addMcToWall(wallId,_loc2_,_loc18_,_loc17_,this.ALIGN_RIGHT,60);
         this.addAnimationsToWall(wallId,0,_loc18_,_loc3_);
         this.processMcsForGfxType([_loc2_]);
      }
   }
   function ADD_CHALLENGE_WINNER_TO_WALL(wallId, challengeTextLabel, winLoseTextLabel, crewName, challengeName, cashAmount, isInFlow, isWinner, isMission, isWinLoseTextLabelRawText, teamName)
   {
      if(!isInFlow)
      {
         isInFlow = false;
      }
      var _loc14_ = this.winnerId;
      if(this.dispConf.isAsian)
      {
         _loc14_ = this.winnerId + "_asian";
      }
      var _loc2_ = this.createLayoutMc(wallId,_loc14_);
      if(isWinLoseTextLabelRawText)
      {
         (TextField)_loc2_.winLoseText.text = winLoseTextLabel;
      }
      else
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.winLoseText,winLoseTextLabel,0,false);
      }
      if(challengeTextLabel && challengeTextLabel != "")
      {
         if(isWinner)
         {
            (TextField)_loc2_.introText.text = challengeTextLabel;
         }
         else
         {
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.introText,challengeTextLabel,0,false);
         }
      }
      if(challengeName)
      {
         _loc2_.challengeNameText.text = challengeName;
      }
      if(crewName)
      {
         _loc2_.crewNameText.htmlText = crewName;
      }
      if(teamName)
      {
         _loc2_.teamNameText.htmlText = teamName;
      }
      if(cashAmount)
      {
         if(cashAmount < 0)
         {
            _loc2_.dollarText.text = " -$";
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.cashText,"CELEB_BET_LOSSES",0,false);
         }
         else
         {
            _loc2_.dollarText.text = " +$";
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.cashText,"CELEB_BET_WINS",0,false);
         }
         if(!isWinner)
         {
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.cashText,"CELEB_CASH",0,false);
         }
         _loc2_.cashAmountText.text = String(Math.abs(cashAmount));
      }
      this.processTextField(_loc2_.cashText,this.condensedTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.teamNameText,this.condensedTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.cashAmountText,null,{autoSize:"left"});
      this.processTextField(_loc2_.dollarText,null,{autoSize:"left"});
      if(!isMission)
      {
         this.processTextField(_loc2_.challengeNameText,this.scriptTextFormat,{textAutoSize:"shrink"});
      }
      else
      {
         this.processTextField(_loc2_.challengeNameText,this.condensedTextFormat,{autoSize:"left"});
      }
      this.processTextField(_loc2_.crewNameText,this.condensedTextFormat,{autoSize:"right"});
      this.processTextField(_loc2_.winLoseText,this.pricedownTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.introText,this.condensedTextFormat,{autoSize:"left"});
      this.doCentralisedTextLayout(_loc2_.winLoseText,[_loc2_.introText],[_loc2_.cashText,_loc2_.dollarText,_loc2_.cashAmountText],[_loc2_.challengeNameText,_loc2_.teamNameText],[_loc2_.crewNameText]);
      _loc2_.teamNameText._x = _loc2_.challengeNameText._x;
      if(challengeName && challengeName != "" && (teamName && teamName != ""))
      {
         this.toggleVisibility([_loc2_.challengeNameText,_loc2_.teamNameText]);
      }
      var _loc7_ = 720;
      var _loc6_ = 1;
      var _loc4_ = _loc2_._height + _loc2_.crewNameText.textHeight * 0.12;
      var _loc17_ = this.dispConf.screenWidth - this.safeLeft * 2;
      if(_loc2_._width > _loc17_)
      {
         _loc6_ = _loc17_ / _loc2_._width;
         _loc4_ = _loc4_ * _loc6_;
      }
      var _loc16_ = 720 * this.dispConf.safeBottom - _loc4_;
      var _loc15_ = _loc4_ - _loc2_.cashText.textHeight * 1.3 * _loc6_;
      if(isMission)
      {
         if(String(challengeTextLabel) == "")
         {
            _loc4_ = _loc4_ - 75 * _loc6_;
         }
         if(String(challengeName) == "" && String(crewName) == "")
         {
            _loc4_ = _loc4_ - 65 * _loc6_;
         }
         _loc16_ = _loc7_ / 2 - _loc4_ / 2;
      }
      if(!isInFlow)
      {
         (TextField)_loc2_.cashAmountText._y = (TextField)_loc2_.cashAmountText._y - 800;
         (TextField)_loc2_.dollarText._y = (TextField)_loc2_.dollarText._y - 800;
         (TextField)_loc2_.cashText._y = (TextField)_loc2_.cashText._y - 800;
      }
      this.addMcToWall(wallId,_loc2_,_loc7_,_loc16_,this.ALIGN_CENTER,0);
      var _loc18_ = this.getMovieClipFromName(wallId);
      var _loc20_ = _loc18_.bg;
      var _loc3_ = [];
      var _loc11_ = "SCREEN_START";
      if(isWinner)
      {
         _loc11_ = "WINNER";
      }
      if(cashAmount)
      {
         _loc2_.cashAmountText.text = "0";
         _loc3_.push({method:"to",mc:_loc2_.cashAmountText,duration:this.slamDuration,tweenerObject:{_y:0,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN,onComplete:this.doNumericTween,onCompleteScope:this,onCompleteArgs:[(TextField)_loc2_.cashAmountText,0,cashAmount]}});
      }
      if(!isInFlow && cashAmount)
      {
         _loc3_.push({method:"to",mc:_loc2_.cashText,duration:this.slamDuration * 0.5,tweenerObject:{_y:0,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN}});
         _loc3_.push({method:"to",mc:_loc2_.dollarText,duration:this.slamDuration * 0.5,tweenerObject:{_y:0,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN}});
         _loc3_.push({method:"to",mc:_loc2_.winLoseText,duration:this.slamDuration,tweenerObject:{_y:_loc2_.winLoseText._y + 200,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN}});
         _loc3_.push({method:"to",mc:_loc20_,duration:this.slamDuration,tweenerObject:{_y:(_loc15_ + 120) * -1,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN}});
      }
      if(!isInFlow)
      {
         var _loc22_ = [{method:"delayCall",mc:_loc2_.crewNameText,duration:0,tweenerObject:{onComplete:this.playSound,onCompleteScope:this,onCompleteArgs:[_loc11_,"CELEBRATION_SOUNDSET"]}}];
         this.addAnimationsToWall(wallId,0,_loc7_,_loc22_);
         if(cashAmount)
         {
            this.addAnimationsToWall(wallId,_loc15_,0,_loc3_,this.pauseDuration);
         }
      }
      else
      {
         _loc3_.push({method:"delayCall",mc:_loc2_.crewNameText,duration:0,tweenerObject:{onComplete:this.playSound,onCompleteScope:this,onCompleteArgs:[_loc11_,"CELEBRATION_SOUNDSET"]}});
         this.addAnimationsToWall(wallId,0,_loc7_,_loc3_,null,null,null);
      }
      this.processMcsForGfxType([_loc2_]);
   }
   function toggleVisibility(mcs, delay, parentMc)
   {
      if(!delay)
      {
         delay = 1;
      }
      if(!parentMc)
      {
         parentMc = mcs[0]._parent._parent;
      }
      var _loc4_ = 0;
      var _loc5_ = 1;
      var _loc3_ = 0;
      while(_loc3_ < mcs.length)
      {
         if(mcs[_loc3_]._visible == true)
         {
            _loc4_ = _loc3_;
            if(_loc4_ + 1 >= mcs.length)
            {
               _loc5_ = 0;
            }
            else
            {
               _loc5_ = _loc4_ + 1;
            }
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < mcs.length)
      {
         if(_loc3_ == _loc5_)
         {
            mcs[_loc3_]._visible = true;
            var _loc6_ = {x:mcs[_loc3_]._x,y:mcs[_loc3_]._y};
            mcs[_loc3_].localToGlobal(_loc6_);
            if(parentMc._y < 720)
            {
               com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(mcs[_loc3_],delay,{onComplete:this.toggleVisibility,onCompleteArgs:[mcs,delay],onCompleteScope:this});
            }
         }
         else
         {
            mcs[_loc3_]._visible = false;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function processTextField(tf, format, props)
   {
      for(var _loc4_ in props)
      {
         tf[_loc4_] = props[_loc4_];
      }
      if(format)
      {
         tf.setTextFormat(format);
      }
      if(this.dispConf.isAsian)
      {
         var _loc5_ = tf.getTextFormat();
         var _loc6_ = _loc5_.size;
         var _loc7_ = tf.textHeight - _loc6_;
         tf._y = tf._y - _loc7_;
      }
   }
   function doCentralisedTextLayout(centralTf, topLeftTfs, topRightTfs, bottomLeftTfs, bottomRightTfs, maxWidth, maxHeight)
   {
      if(!maxWidth)
      {
         maxWidth = 1140;
      }
      if(!maxHeight)
      {
         maxHeight = 540;
      }
      var _loc31_ = centralTf.text;
      var _loc10_ = 0;
      var _loc13_ = 0;
      var _loc11_ = 0;
      var _loc14_ = 0;
      var _loc19_ = 0;
      var _loc17_ = 0;
      var _loc18_ = 0;
      var _loc16_ = 0;
      var _loc29_ = 0;
      var _loc23_ = this.getAvailableTextWidth(centralTf);
      var _loc24_ = this.getAvailableTextWidth(centralTf,false,true);
      var _loc26_ = this.getAvailableTextWidth(centralTf,true);
      var _loc27_ = this.getAvailableTextWidth(centralTf,true,true);
      var _loc30_ = (TextField)centralTf.getTextFormat();
      var _loc9_ = 0;
      while(_loc9_ < topLeftTfs.length)
      {
         var _loc15_ = (TextField)topLeftTfs[_loc9_].getTextFormat();
         if((TextField)topLeftTfs[_loc9_]._height > _loc10_)
         {
            _loc10_ = (TextField)topLeftTfs[_loc9_]._height;
         }
         _loc19_ = _loc19_ + (TextField)topLeftTfs[_loc9_].textWidth;
         _loc13_ = _loc13_ + (TextField)topLeftTfs[_loc9_].textWidth;
         _loc9_ = _loc9_ + 1;
      }
      _loc9_ = 0;
      while(_loc9_ < topRightTfs.length)
      {
         if((TextField)topRightTfs[_loc9_]._height > _loc10_)
         {
            _loc10_ = (TextField)topRightTfs[_loc9_]._height;
         }
         _loc17_ = _loc17_ + (TextField)topRightTfs[_loc9_].textWidth;
         _loc13_ = _loc13_ + (TextField)topRightTfs[_loc9_].textWidth;
         _loc9_ = _loc9_ + 1;
      }
      _loc9_ = 0;
      while(_loc9_ < bottomLeftTfs.length)
      {
         if((TextField)bottomLeftTfs[_loc9_]._height > _loc11_)
         {
            _loc11_ = (TextField)bottomLeftTfs[_loc9_]._height;
         }
         _loc18_ = _loc18_ + (TextField)bottomLeftTfs[_loc9_].textWidth;
         _loc14_ = _loc14_ + (TextField)bottomLeftTfs[_loc9_].textWidth;
         _loc9_ = _loc9_ + 1;
      }
      _loc9_ = 0;
      while(_loc9_ < bottomRightTfs.length)
      {
         if((TextField)bottomRightTfs[_loc9_]._height > _loc11_)
         {
            _loc11_ = (TextField)bottomRightTfs[_loc9_]._height;
         }
         _loc16_ = _loc16_ + ((TextField)bottomRightTfs[_loc9_].textWidth + 15);
         _loc14_ = _loc14_ + ((TextField)bottomRightTfs[_loc9_].textWidth + 15);
         _loc9_ = _loc9_ + 1;
      }
      var _loc32_ = maxHeight - _loc11_ - _loc10_;
      var _loc12_ = 0;
      if(!this.dispConf.isAsian)
      {
         centralTf._y = _loc10_ - centralTf._height * 0.155;
         if(_loc23_ < _loc19_ || _loc24_ < _loc17_)
         {
            centralTf._y = centralTf._y + centralTf._height * 0.15;
         }
         if(_loc26_ < _loc18_ || _loc27_ < _loc16_)
         {
            _loc12_ = _loc12_ + centralTf._height * 0.18;
         }
      }
      var _loc28_ = centralTf._width * 0.01;
      var _loc21_ = centralTf._x + 6;
      var _loc20_ = centralTf._width - 6;
      if(_loc14_ + 30 > centralTf._width || _loc13_ + 30 > centralTf._width)
      {
         _loc21_ = 0;
         _loc20_ = maxWidth;
         centralTf._x = maxWidth / 2 - centralTf._width / 2;
      }
      var _loc2_ = _loc21_;
      _loc9_ = 0;
      while(_loc9_ < topLeftTfs.length)
      {
         var _loc8_ = topLeftTfs[_loc9_];
         _loc8_._x = _loc2_;
         _loc2_ = _loc2_ + _loc8_._width;
         _loc9_ = _loc9_ + 1;
      }
      _loc2_ = _loc20_;
      _loc9_ = topRightTfs.length - 1;
      while(_loc9_ >= 0)
      {
         _loc8_ = topRightTfs[_loc9_];
         _loc2_ = _loc2_ - _loc8_._width;
         _loc8_._x = _loc2_;
         _loc9_ = _loc9_ - 1;
      }
      _loc2_ = _loc21_;
      _loc9_ = 0;
      while(_loc9_ < bottomLeftTfs.length)
      {
         _loc8_ = bottomLeftTfs[_loc9_];
         _loc8_._x = _loc2_;
         _loc2_ = _loc2_ + _loc8_._width;
         if(!this.dispConf.isAsian)
         {
            _loc8_._y = centralTf._y + centralTf._height * 0.76;
            _loc8_._y = _loc8_._y + _loc12_;
         }
         _loc9_ = _loc9_ + 1;
      }
      _loc2_ = _loc20_;
      _loc9_ = bottomRightTfs.length - 1;
      while(_loc9_ >= 0)
      {
         _loc8_ = bottomRightTfs[_loc9_];
         _loc2_ = _loc2_ - _loc8_._width;
         _loc8_._x = _loc2_;
         if(!this.dispConf.isAsian)
         {
            _loc8_._y = centralTf._y + centralTf._height * 0.76;
            _loc8_._y = _loc8_._y + _loc12_;
         }
         _loc9_ = _loc9_ - 1;
      }
   }
   function createLayoutMc(wallId, layoutId, layoutName)
   {
      var _loc8_ = this.getObjectFromMcName(wallId);
      var _loc3_ = this.getMovieClipFromName(wallId);
      var _loc2_ = _loc3_.getNextHighestDepth();
      if(!layoutName)
      {
         layoutName = layoutId + "_" + _loc2_;
      }
      var _loc5_ = _loc3_.attachMovie(layoutId,layoutName,_loc2_);
      return _loc5_;
   }
   function addAnimationsToWall(wallId, targetY, offsetY, childAnims, delay, duration, pauseBefore, soundName)
   {
      if(!duration)
      {
         duration = this.slamDuration;
      }
      if(!delay)
      {
         delay = this.pauseDuration;
      }
      this.totalDurationMs = this.totalDurationMs + (duration + delay + this.pauseNextDuration) * 1000;
      if(!pauseBefore)
      {
         pauseBefore = false;
      }
      var _loc4_ = this.getObjectFromMcName(wallId);
      var _loc2_ = {duration:duration,targetY:targetY,offsetY:offsetY,delay:delay,pauseNextDuration:this.pauseNextDuration,childAnims:childAnims,pauseBefore:pauseBefore,soundName:soundName};
      this.pauseNextDuration = 0;
      var _loc3_ = _loc4_.tweens;
      _loc3_.push(_loc2_);
   }
   function addMcToWall(wallId, mc, mcHeight, mcTopPadding, xAlign, xOffset, vAlign)
   {
      if(!xAlign)
      {
         xAlign = this.ALIGN_LEFT;
      }
      if(!xOffset)
      {
         xOffset = 0;
      }
      var _loc4_ = this.getObjectFromMcName(wallId);
      _loc4_.currentHeight = _loc4_.currentHeight + mcHeight;
      mc._y = (_loc4_.currentHeight - mcTopPadding) * -1;
      var _loc5_ = this.dispConf.screenWidth - this.safeLeft * 2;
      if(mc._width + xOffset > _loc5_)
      {
         mc._xscale = mc._yscale = (_loc5_ - xOffset) / (mc._width + xOffset) * 100;
      }
      switch(this.getAlignment(xAlign))
      {
         case this.ALIGN_LEFT:
            mc._x = this.safeLeft + xOffset;
            if(mc._x < this.safeLeft)
            {
               mc._x = this.safeLeft;
            }
            break;
         case this.ALIGN_RIGHT:
            mc._x = this.safeRight - (mc._width + xOffset);
            if(mc._x + mc._width > this.safeRight)
            {
               mc._x = this.safeRight - mc._width;
            }
            break;
         default:
            mc._x = this.dispConf.screenWidth / 2 - mc._width / 2;
      }
      if(!this.dispConf.isWideScreen)
      {
         mc._x = mc._x + 160;
      }
   }
   function processMcsForGfxType(mcs)
   {
      var _loc3_ = 0;
      while(_loc3_ < mcs.length)
      {
         var _loc2_ = mcs[_loc3_];
         switch(this.celebrationGfxType)
         {
            case this.TYPE_BG:
               com.rockstargames.ui.utils.Colour.Colourise(_loc2_,255,255,255,0);
               break;
            case this.TYPE_FG:
               com.rockstargames.ui.utils.Colour.Colourise(_loc2_,255,255,255,51);
               break;
            default:
               _loc2_._alpha = this.defaultFgAlpha;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function getMovieClipFromName(mcName)
   {
      return this.CONTENT[mcName];
   }
   function getObjectFromMcName(mcName)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.wallList.length)
      {
         var _loc3_ = this.wallList[_loc2_];
         if(_loc3_.mcName == mcName)
         {
            return _loc3_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return {};
   }
   function stringInArray(input, what)
   {
      var _loc1_ = 0;
      while(_loc1_ < input.length)
      {
         if(input[_loc1_] == what)
         {
            return true;
         }
         _loc1_ = _loc1_ + 1;
      }
      return false;
   }
   function getColour(col)
   {
      var _loc1_ = new com.rockstargames.ui.utils.HudColour();
      var _loc2_ = com.rockstargames.ui.utils.HudColour[col];
      if(isNaN(_loc2_))
      {
         _loc2_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE;
      }
      com.rockstargames.ui.utils.Colour.setHudColour(_loc2_,_loc1_);
      return _loc1_.r * 65536 + _loc1_.g * 256 + _loc1_.b;
   }
   function getAlignment(align)
   {
      switch(align)
      {
         case "right":
         case "RIGHT":
            return this.ALIGN_RIGHT;
         case "center":
         case "CENTER":
         case "centre":
         case "CENTRE":
            return this.ALIGN_CENTER;
         default:
            return this.ALIGN_LEFT;
      }
   }
   function doNumericTween(tf, startNumber, targetNumber, duration, delay)
   {
      if(startNumber - targetNumber == 0 || isNaN(Number(tf.text)))
      {
         return undefined;
      }
      if(!duration)
      {
         duration = this.pauseDuration * 0.5;
      }
      if(!delay)
      {
         delay = 0;
      }
      targetNumber = Math.abs(targetNumber);
      var _loc8_ = 40;
      var _loc5_ = Math.ceil(duration * 1000) / _loc8_;
      var _loc4_ = undefined;
      var _loc6_ = false;
      if(targetNumber > startNumber)
      {
         _loc4_ = (targetNumber - startNumber) / _loc5_;
      }
      else
      {
         _loc4_ = (startNumber - targetNumber) / _loc5_;
         _loc6_ = true;
      }
      tf.text = String(startNumber);
      clearInterval(this.counterInterval);
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(tf._parent,delay,{onComplete:this.setCounterInterval,onCompleteScope:this,onCompleteArgs:[_loc8_,tf,targetNumber,_loc4_,_loc6_]});
   }
   function setCounterInterval(interval, tf, targetNumber, increaseBy, countDown)
   {
      this.counterInterval = setInterval(this,"updateNumericTween",interval,tf,targetNumber,increaseBy,countDown);
   }
   function updateNumericTween(tf, targetNumber, increaseBy, countDown)
   {
      if(!countDown && Number(tf.text) + increaseBy >= targetNumber)
      {
         this.playSound("NUMBER_COUNT_STOP","CELEBRATION_SOUNDSET");
         tf.text = String(targetNumber);
         clearInterval(this.counterInterval);
         return undefined;
      }
      if(countDown && Number(tf.text) - increaseBy <= targetNumber)
      {
         this.playSound("NUMBER_COUNT_STOP","CELEBRATION_SOUNDSET");
         tf.text = String(targetNumber);
         clearInterval(this.counterInterval);
         return undefined;
      }
      if(countDown)
      {
         increaseBy = increaseBy * -1;
      }
      this.playSound("NUMBER_COUNT_ONE_SHOT","CELEBRATION_SOUNDSET");
      var _loc4_ = Number(tf.text);
      _loc4_ = _loc4_ + Math.ceil(increaseBy);
      tf.text = String(_loc4_);
   }
   function playSound(soundName, libName)
   {
      if(this.celebrationGfxType == this.TYPE_OVERLAY || this.celebrationGfxType == this.TYPE_STANDARD)
      {
         com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,soundName,libName);
      }
   }
   function formatTimeMs(ms)
   {
      if(!ms || ms == 0)
      {
         return "";
      }
      var _loc7_ = this.zeroPadNumberString(ms.toString().substr(-3,3),3);
      var _loc4_ = Number(ms.toString().slice(0,-3));
      var _loc2_ = 0;
      var _loc5_ = 0;
      var _loc3_ = 0;
      if(!isNaN(_loc4_))
      {
         _loc2_ = Math.floor(_loc4_ / 3600);
         _loc5_ = Math.floor(_loc4_ % 3600 / 60);
         _loc3_ = Math.floor(_loc4_ % 3600 % 60);
      }
      return (_loc2_ != 0?_loc2_ >= 10?_loc2_.toString() + ":":"0" + _loc2_.toString() + ":":"") + (_loc5_ >= 10?_loc5_.toString():"0" + _loc5_.toString()) + ":" + (_loc3_ >= 10?_loc3_.toString():"0" + _loc3_.toString()) + "." + _loc7_;
   }
   function zeroPadNumberString(number, width)
   {
      var _loc1_ = "" + number;
      while(_loc1_.length < width)
      {
         _loc1_ = "0" + _loc1_;
      }
      return _loc1_;
   }
}
