class com.rockstargames.gtav.Multiplayer.MPNextJobSelectionItem extends MovieClip
{
   static var IMAGE_TYPE_CLOUD = 0;
   static var IMAGE_TYPE_DISK = 1;
   function MPNextJobSelectionItem()
   {
      super();
      this.verifiedbgMC._visible = this.bgFlashMC._visible = false;
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.titleTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      this.defaultTitleA = this.titleTF._alpha;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.imgPlaceholderMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      this.defaultPlaceholderA = this.imgPlaceholderMC._alpha;
      this.votesTF.textAutoSize = "shrink";
      this.titleTF.textAutoSize = "shrink";
      this.nameTF.textAutoSize = "shrink";
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.iconCheckMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN);
      this.rpIconMC._visible = this.cashIconMC._visible = false;
      this.queuedGamerNames = [];
   }
   function setData(sTitle, txd, txn, textureLoadType, verifiedType, eIcon, bCheck, rpMult, cashMult, bDisabled, iconCol)
   {
      this.titleTF.text = sTitle;
      this.titleTF._x = 272 - this.titleTF.textWidth;
      this.setVotes(0,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      if(textureLoadType != -1)
      {
         if(txd != undefined && txn != undefined && txd != "" && txn != "")
         {
            if(!this.imgMC)
            {
               this.imgMC = (com.rockstargames.ui.media.ImageLoaderMC)this.imgContainerMC.attachMovie("GenericImageLoader","imgMC",this.imgContainerMC.getNextHighestDepth());
            }
            var _loc7_ = this.imgMC.textureDict == txd && this.imgMC.textureFilename == txn;
            if(!_loc7_)
            {
               if(this.imgMC.isLoaded)
               {
                  this.imgMC.removeTxdRef();
               }
            }
            this.imgMC.init("MP_NEXT_JOB_SELECTION",txd,txn,288,160,0,0);
            var _loc3_ = String(this.imgMC).split(".");
            var _loc4_ = _loc3_.slice(_loc3_.length - 4).join(".");
            if(textureLoadType == com.rockstargames.gtav.Multiplayer.MPNextJobSelectionItem.IMAGE_TYPE_CLOUD)
            {
               this.imgMC.addTxdRef(_loc4_,this.transitionInBitmap,this);
            }
            else
            {
               this.imgMC.requestTxdRef(_loc4_,_loc7_,this.transitionInBitmap,this);
            }
         }
         this.imgPlaceholderMC._visible = true;
         this.bgFlashMC._height = 160;
      }
      else
      {
         this.titleTF._y = 12;
         this.votesTF._y = 10;
         this.voteBGMC._y = this.votecircMC._y = this.votesTF._y + 1;
         this.checkMarkMC._y = this.votesTF._y - 3;
         this.bgFlashMC._height = 52;
         this.imgPlaceholderMC._visible = false;
      }
      if(verifiedType != undefined)
      {
         var _loc5_ = 1.5;
         if(!this.verifiedMC)
         {
            this.verifiedMC = (com.rockstargames.gtav.Multiplayer.ROCKSTAR_VERIFIED)this.attachMovie("verified","verifiedMC",this.getNextHighestDepth(),{_x:this.verifiedbgMC._x + _loc5_,_y:this.verifiedbgMC._y + _loc5_});
         }
         this.verifiedbgMC._visible = verifiedType > 0;
         this.verifiedMC.SET_VERIFIED(verifiedType);
      }
      if(eIcon != undefined)
      {
         this.iconMC.gotoAndStop(eIcon + 2);
         if(iconCol != undefined)
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.iconMC,iconCol);
         }
      }
      this.iconCheckMC._visible = bCheck;
      this.setItemMultiplier(rpMult,this.rpMultTF,this.rpIconMC);
      this.setItemMultiplier(cashMult,this.cashMultTF,this.cashIconMC);
      var _loc6_ = rpMult <= 0?0:30;
      this.cashMultTF._y = this.rpMultTF._y + _loc6_;
      this.cashIconMC._y = this.rpIconMC._y + _loc6_;
      this.titleTF._alpha = !bDisabled?this.defaultTitleA:30;
   }
   function setItemMultiplier(mult, tf, iconMC)
   {
      if(mult > 0)
      {
         iconMC._visible = tf._visible = true;
         tf.text = mult + " x";
      }
      else
      {
         iconMC._visible = tf._visible = false;
      }
   }
   function getHeight()
   {
      return !(this.imgMC || this.imgPlaceholderMC._visible)?52:160;
   }
   function transitionInBitmap()
   {
      this.imgMC._alpha = 0;
      this.imgMC._visible = true;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.imgMC,0.3,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.imgPlaceholderMC,0.3,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT,onCompleteScope:this,onComplete:this.transitionComplete});
   }
   function transitionComplete()
   {
      this.imgPlaceholderMC._alpha = this.defaultPlaceholderA;
      this.imgPlaceholderMC._visible = false;
   }
   function setVotes(iNumVotes, voteBGColour, bShowCheckMark, bFlashBG)
   {
      if(iNumVotes <= 0)
      {
         this.votesTF._visible = this.voteBGMC._visible = this.votecircMC._visible = this.checkMarkMC._visible = false;
      }
      else
      {
         this.votesTF._visible = this.voteBGMC._visible = this.votecircMC._visible = true;
         com.rockstargames.ui.utils.UIText.setSizedText(this.votesTF,"" + iNumVotes,true,false,-2);
         if(this.voteBGColour != voteBGColour)
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.voteBGMC,voteBGColour);
         }
         this.checkMarkMC._visible = bShowCheckMark;
         if(bFlashBG)
         {
            this.bgFlashMC._alpha = 30;
            this.bgFlashMC._visible = true;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.bgFlashMC,0.5,{_alpha:0,onCompleteScope:this,onComplete:this.onBGFlashComplete});
         }
      }
   }
   function queueGamerNameFlash(sGamerName, hexColour)
   {
      if(this.flashingName)
      {
         this.queuedGamerNames.push({name:sGamerName,colour:hexColour});
      }
      else
      {
         this.flashGamerName(sGamerName,hexColour);
      }
   }
   function flashGamerName(sGamerName, hexColour)
   {
      this.nameTF._visible = true;
      this.flashingName = sGamerName;
      this.nameTF.text = sGamerName;
      this.nameTF.textColor = hexColour;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.nameTF,0.1,{_alpha:100,onComplete:this.onNameFadeInComplete,onCompleteScope:this});
   }
   function onNameFadeInComplete()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.nameTF,0.6,{onComplete:this.onNameDelayComplete,onCompleteScope:this});
   }
   function onNameDelayComplete()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.nameTF,0.25,{_alpha:0,onComplete:this.onNameFadeOutComplete,onCompleteScope:this});
   }
   function onNameFadeOutComplete()
   {
      if(this.queuedGamerNames.length > 0)
      {
         var _loc2_ = this.queuedGamerNames.shift();
         this.flashGamerName(_loc2_.name,_loc2_.colour);
      }
      else
      {
         this.nameTF._visible = false;
         this.flashingName = null;
      }
   }
   function findAndRemoveGamerName(sGamerName)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.queuedGamerNames.length)
      {
         if(sGamerName == this.queuedGamerNames[_loc2_].name)
         {
            this.queuedGamerNames.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function onBGFlashComplete()
   {
      this.bgFlashMC._visible = false;
   }
   function onCleanup()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.bgFlashMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.imgMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.imgPlaceholderMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.nameTF);
      if(this.imgMC && this.imgMC.isLoaded)
      {
         this.imgMC.removeTxdRef();
      }
   }
}
