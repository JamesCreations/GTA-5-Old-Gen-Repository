class com.rockstargames.gtav.Multiplayer.items.MPMMFreemodeItem extends MovieClip
{
   var index = 0;
   var initialIndex = 0;
   var _highlighted = false;
   var _data = new Array();
   var hBGColourEnum = 2;
   var SELECT_ALPHA = 100;
   var NONSELECT_ALPHA = 30;
   function MPMMFreemodeItem()
   {
      super();
      _global.gfxExtensions = true;
      this.labelMC.nameTF.textAutoSize = "shrink";
      this.rankNumTF.textAutoSize = "shrink";
      this.jpIconMC._visible = false;
   }
   function __get__data()
   {
      return this._data;
   }
   function __set__data(_d)
   {
      this.index = _d[0];
      this.initialIndex = _d[1];
      if(_d.length >= 3)
      {
         this._data = _d.slice(2);
      }
      if(this.__get__data()[0] != undefined)
      {
         if(this.__get__data()[0] == "")
         {
            this.__get__data()[0] = "-";
         }
         com.rockstargames.ui.utils.UIText.setSizedText(this.labelMC.nameTF,this.__get__data()[0],true,false,18,18);
      }
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.bgMC,2);
      this.bgMC._alpha = this.index % 2 != 0?60:50;
      if(this.crewTagMC)
      {
         this.crewTagMC._visible = false;
      }
      this.hBGColourEnum = this.__get__data()[1];
      if(this.hBGColourEnum == undefined)
      {
         this.hBGColourEnum = 1;
      }
      if(this.hBGColourEnum == 1 || this.hBGColourEnum == 0)
      {
         this.hBGColourEnum = !Boolean(this.hBGColourEnum)?6:9;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.taggedMC,this.hBGColourEnum);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.taggedMC,this.hBGColourEnum);
      }
      this.taggedMC.gotoAndStop(2);
      this.setIcon(this.__get__data()[2],this.icon2MC);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.avatarBGMC,2);
      var _loc2_ = false;
      var _loc3_ = false;
      if(this.__get__data()[7] != undefined && this.__get__data()[8] != undefined)
      {
         if(this.__get__data()[7] != "" && this.__get__data()[8] != "")
         {
            this.setAvatarImg(this.__get__data()[7],this.__get__data()[8]);
            _loc2_ = true;
         }
         else
         {
            _loc3_ = true;
         }
      }
      else
      {
         _loc3_ = true;
      }
      if(this.__get__data()[9])
      {
         this.friendOrCrewTF.text = this.__get__data()[9];
      }
      this.rankingTF.text = this.__get__data()[3];
      this.rankingTF._visible = this.__get__data()[3] >= 0;
      this.avatarImg._alpha = !this.rankingTF._visible?100:60;
      _loc2_ = this.__get__data()[3] != -1;
      if(_loc2_)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.avatarBGMC,117);
      }
      this.setRightText(this.__get__data()[4],this.__get__data()[6]);
      this.setCrewTag(this.__get__data()[5]);
      this.formatNameTF();
      this.rankNumTF.text = "" + this.initialIndex;
      if(_loc3_ == true)
      {
         _loc2_ = true;
      }
      this.avatarBGMC._visible = _loc2_;
      this.__set__highlighted(this._highlighted);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.labelMC,1);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.rankNumTF,1);
      return this.__get__data();
   }
   function setRightText(rightText, isJob)
   {
      this.jpIconMC._visible = isJob;
      this.jobPointsTF._visible = isJob;
      this.scoreTF._visible = !isJob;
      if(isJob)
      {
         this.jobPointsTF.text = this.__get__data()[4];
      }
      else
      {
         com.rockstargames.ui.utils.UIText.setSizedText(this.scoreTF,this.__get__data()[4],true);
      }
   }
   function setIcon(iconEnum, iconMC)
   {
      if(iconEnum == undefined)
      {
         iconEnum = 0;
      }
      var _loc1_ = new Array();
      _loc1_.ICON0 = "EMPTY";
      _loc1_.ICON48 = "INACTIVE_HEADSET";
      _loc1_.ICON49 = "MUTED_HEADSET";
      _loc1_.ICON47 = "ACTIVE_HEADSET";
      _loc1_.ICON65 = "RANK_FREEMODE";
      _loc1_.ICON64 = "KICK";
      _loc1_.ICON79 = "LOBBY_DRIVER";
      _loc1_.ICON80 = "LOBBY_CODRIVER";
      _loc1_.ICON66 = "SPECTATOR";
      _loc1_.ICON115 = "BOUNTY";
      _loc1_.ICON116 = "DEAD";
      var _loc3_ = _loc1_["ICON" + iconEnum];
      iconMC.gotoAndStop(_loc3_);
      if(_loc3_ == "RANK_FREEMODE")
      {
         com.rockstargames.gtav.utils.GTAVUIUtils.colourRankIcon(iconMC.rankMC);
      }
      if(iconMC.animIcon)
      {
         iconMC.animIcon.play();
      }
   }
   function setAvatarImg(txd, txn)
   {
      if(txd != undefined && txn != undefined)
      {
         this.ADD_TXD_REF(txd,txn);
      }
   }
   function setCrewTag(crewTagStr)
   {
      if(crewTagStr && crewTagStr != "")
      {
         if(!this.crewTagMC)
         {
            this.crewTagMC = this.attachMovie("CREW_TAG_MOVIECLIP","crewTagMC",this.getNextHighestDepth(),{_y:4,_xscale:70,_yscale:70});
         }
         this.crewTagMC.UNPACK_CREW_TAG(crewTagStr);
         this.crewTagMC._visible = true;
      }
   }
   function formatNameTF()
   {
      var _loc2_ = 210 - (!this.crewTagMC._visible?0:this.crewTagMC._width);
      this.labelMC.nameTF._width = _loc2_;
      this.crewTagMC._x = this.labelMC._x + this.labelMC.nameTF._x + this.labelMC.nameTF.textWidth + 10;
   }
   function __set__highlighted(_h)
   {
      var _loc2_ = !_h?this.NONSELECT_ALPHA:this.SELECT_ALPHA;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.highlightBGMC,this.hBGColourEnum);
      this.highlightBGMC._alpha = _loc2_;
      this._highlighted = _h;
      return this.__get__highlighted();
   }
   function ADD_TXD_REF(txd, txn)
   {
      if(this.avatarImg == undefined)
      {
         this.avatarImg = (com.rockstargames.ui.media.ImageLoaderMC)this.attachMovie("avatarImage","a",this.getNextHighestDepth(),{_x:25,_y:0});
         this.avatarImg.swapDepths(this.rankingTF);
      }
      if(this.avatarImg.textureDict == txd)
      {
         if(this.avatarImg.isLoaded)
         {
            this.avatarImg.init("MP_MM_CARD_FREEMODE",txd,txn,25,25);
            this.avatarImg.displayTxdResponse(txd);
         }
      }
      else
      {
         if(this.avatarImg.isLoaded)
         {
            this.avatarImg.removeTxdRef();
         }
         this.avatarImg.init("MP_MM_CARD_FREEMODE",txd,txn,25,25);
         var _loc3_ = this.avatarImg.splitPath(String(this.avatarImg),2);
         this.avatarImg.requestTxdRef(_loc3_,true,this.fadeIn,this);
      }
   }
   function fadeIn()
   {
      this.avatarImg._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.avatarImg,0.2,{_alpha:100});
   }
   function ON_DESTROY()
   {
      if(this.avatarImg != undefined && this.avatarImg.isLoaded)
      {
         this.avatarImg.removeTxdRef();
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this);
   }
}
