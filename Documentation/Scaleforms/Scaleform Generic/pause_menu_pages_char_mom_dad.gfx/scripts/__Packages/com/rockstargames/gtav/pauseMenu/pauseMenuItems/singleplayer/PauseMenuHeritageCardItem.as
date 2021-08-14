class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var barIndex = 1;
   var barStep = 1;
   var picHeight = 158;
   var multiListIndex = 0;
   var multiListItems = new Array();
   static var TYPE_MAIN_CHAR_SELECTOR = 0;
   static var TYPE_DOMINANCE_SLIDER = 1;
   static var TYPE_TEXT_ROTATOR = 2;
   static var TYPE_GRANDPARENTS_FRAME = 3;
   function PauseMenuHeritageCardItem()
   {
      super();
      this.itemTextRight = this.labelMC.valueTF;
      this.isAdjustable = true;
      this.rankBarMC = this.attachMovie("GenericColourBar","rankBarMC",this.getNextHighestDepth(),{_x:158,_y:9});
      this.rankBarMC._visible = false;
      this.barlinebgMC.swapDepths(this.getNextHighestDepth());
      this.barlineMC.swapDepths(this.getNextHighestDepth());
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.highlightMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      this.mdHighlightMC._visible = false;
      this.bgMC._visible = false;
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextLeft,this._data[0],true);
      var _loc5_ = 25;
      var _loc3_ = 25;
      this.mdHighlightMC._visible = false;
      switch(this.type)
      {
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem.TYPE_MAIN_CHAR_SELECTOR:
            if(this.__get__data()[1] != undefined && this.__get__data()[1] != "")
            {
               com.rockstargames.ui.utils.UIText.setSizedText(this.labelMC.midtitleTF,this.__get__data()[1],true,false,19,19);
               this.highlightMC._visible = true;
            }
            else
            {
               this.labelMC.midtitleTF.htmlText = "";
               this.itemTextRight.htmlText = "";
               this.highlightMC._visible = false;
            }
            _loc3_ = this.picHeight + 2;
            this.setAvatarImg(0,this.__get__data()[2],this.__get__data()[3]);
            this.setAvatarImg(1,this.__get__data()[4],this.__get__data()[5]);
            this.barlinebgMC._visible = _loc0_ = false;
            this.barlineMC._visible = _loc0_;
            this.rankBarMC._visible = _loc0_;
            this.labelMC.lMC._visible = _loc0_ = false;
            this.labelMC.rMC._visible = _loc0_;
            if(this.__get__data()[2] != 0 && this.__get__data()[2] != "")
            {
               this.mdHighlightMC._visible = true;
            }
            break;
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem.TYPE_DOMINANCE_SLIDER:
            if(this.__get__data()[1] != undefined)
            {
               this.rankBarMC.init(this.__get__data()[1],108,6);
               this.rankBarMC.mc.baralphaMC._alpha = 30;
               this.rankBarMC.mc.blackMC._alpha = 80;
               this.rankBarMC.percent(50);
            }
            this.labelMC.maleMC._alpha = _loc0_ = 100;
            this.labelMC.femaleMC._alpha = _loc0_;
            this.__set__barscale(this.initialIndex);
            this.barlinebgMC._visible = _loc0_ = true;
            this.barlineMC._visible = _loc0_;
            this.rankBarMC._visible = _loc0_;
            this.labelMC.lMC._visible = _loc0_ = false;
            this.labelMC.rMC._visible = _loc0_;
            break;
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem.TYPE_TEXT_ROTATOR:
            this.multiListItems = this.__get__data().slice(1);
            this.__set__textIndex(this.initialIndex);
            this.barlinebgMC._visible = _loc0_ = false;
            this.barlineMC._visible = _loc0_;
            this.rankBarMC._visible = _loc0_;
            this.labelMC.lMC._visible = _loc0_ = this.__get__data()[2];
            this.labelMC.rMC._visible = _loc0_;
            break;
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem.TYPE_GRANDPARENTS_FRAME:
            if(this.__get__data()[1] != undefined && this.__get__data()[1] != "")
            {
               com.rockstargames.ui.utils.UIText.setSizedText(this.labelMC.midtitleTF,this.__get__data()[1],true,false,19,19);
               this.highlightMC._visible = true;
            }
            else
            {
               this.labelMC.midtitleTF.htmlText = "";
               this.itemTextRight.htmlText = "";
               this.highlightMC._visible = false;
            }
            _loc3_ = 79;
            this.barlinebgMC._visible = _loc0_ = false;
            this.barlineMC._visible = _loc0_;
            this.rankBarMC._visible = _loc0_;
            this.labelMC.lMC._visible = _loc0_ = false;
            this.labelMC.rMC._visible = _loc0_;
            var _loc4_ = this.__get__data()[6];
            if(_loc4_ == undefined)
            {
               _loc4_ = 0;
            }
      }
      this.labelMC._y = _loc0_ = _loc3_ - _loc5_;
      this.highlightMC._y = _loc0_;
      this.bMC._height = _loc0_ = _loc3_;
      this.bgMC._height = _loc0_;
      this.__set__highlighted(this._highlighted);
      return this.__get__data();
   }
   function setAvatarImg(imgindex, txd, txn)
   {
      if(txd != undefined && txn != undefined)
      {
         if(txd != "" && txn != "")
         {
            this.ADD_TXD_REF(imgindex,txd,txn);
         }
      }
   }
   function ADD_TXD_REF(imgindex, txd, txn)
   {
      var _loc7_ = 144;
      var _loc6_ = this.picHeight;
      if(this.avatarImg2 == undefined)
      {
         if(this.avatarCont2 != undefined)
         {
            this.avatarCont2.removeMovieClip();
         }
         this.avatarCont2 = this.createEmptyMovieClip("av2MC",this.getNextHighestDepth(),{_x:0,_y:0});
         this.avatarImg2 = (com.rockstargames.ui.media.ImageLoaderMC)this.avatarCont2.attachMovie("avatarImage","a2",this.avatarCont2.getNextHighestDepth(),{_x:0,_y:0});
      }
      if(this.avatarImg1 == undefined)
      {
         if(this.avatarCont1 != undefined)
         {
            this.avatarCont1.removeMovieClip();
         }
         this.avatarCont1 = this.createEmptyMovieClip("av1MC",this.getNextHighestDepth(),{_x:0,_y:0});
         this.avatarImg1 = (com.rockstargames.ui.media.ImageLoaderMC)this.avatarCont1.attachMovie("avatarImage","a1",this.avatarCont1.getNextHighestDepth(),{_x:0,_y:0});
      }
      var _loc8_ = imgindex + 1;
      var _loc2_ = this["avatarImg" + _loc8_];
      if(_loc2_.textureFilename == txn && _loc2_.textureDict == txd)
      {
         return undefined;
      }
      var _loc5_ = "PAUSE_MENU_SP_CONTENT";
      if(_loc2_.textureDict == txd)
      {
         if(_loc2_.isLoaded)
         {
            if(_loc2_.textureFilename != txn)
            {
               _loc2_.init(_loc5_,txd,txn,_loc7_,_loc6_);
               _loc2_.displayTxdResponse(txd);
            }
         }
      }
      else
      {
         if(_loc2_.isLoaded)
         {
            _loc2_.removeTxdRef();
         }
         _loc2_.init(_loc5_,txd,txn,_loc7_,_loc6_);
         var _loc11_ = 5;
         var _loc10_ = imgindex != 0?this.imageLoaded2:this.imageLoaded1;
         var _loc9_ = _loc2_.splitPath(String(_loc2_),_loc11_);
         _loc2_.requestTxdRef(_loc9_,true,_loc10_,this);
      }
   }
   function imageLoaded1()
   {
      var _loc3_ = 144;
      var _loc2_ = this.picHeight;
      this.avatarCont1._x = _loc3_ / 2 + 5;
      this.avatarCont1._y = _loc2_ / 2;
      this.avatarImg1._x = (- _loc3_) / 2;
      this.avatarImg1._y = (- _loc2_) / 2;
      this.avatarCont1._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.avatarCont1,0.3,{_alpha:100});
   }
   function imageLoaded2()
   {
      var _loc2_ = 144;
      var _loc3_ = this.picHeight;
      this.avatarCont2._x = _loc2_ / 2 + _loc2_ - 5;
      this.avatarCont2._y = _loc3_ / 2;
      this.avatarImg2._x = (- _loc2_) / 2;
      this.avatarImg2._y = (- _loc3_) / 2;
      this.avatarCont2._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.avatarCont2,0.3,{_alpha:100});
   }
   function initStoreMethod(func, scope)
   {
      this.storeFunc = func;
      this.storeScope = scope;
   }
   function __set__barscale(bi)
   {
      this.barIndex = bi;
      this.selectedIndex = this.barIndex;
      this.selectedValue = this.barIndex;
      this.rankBarMC.setFillX(54 * (this.selectedValue / 100));
      return this.__get__barscale();
   }
   function __set__textIndex(ti)
   {
      this.multiListIndex = ti;
      this.selectedIndex = this.multiListIndex;
      this.selectedValue = this.multiListItems[this.multiListIndex];
      var _loc2_ = this.selectedValue;
      com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,_loc2_);
      this.itemTextRight.autoSize = true;
      if(this.itemTextRight._width > 128)
      {
         this.itemTextRight.autoSize = false;
         com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,_loc2_,true);
         this.itemTextRight._width = 128;
      }
      this.itemTextRight._x = this.labelMC.rMC._x - this.itemTextRight._width - 2;
      this.labelMC.lMC._x = this.itemTextRight._x - 2;
      return this.__get__textIndex();
   }
   function __set__highlighted(_h)
   {
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      if(_h)
      {
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc2_);
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc3_);
         if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem.TYPE_TEXT_ROTATOR)
         {
            this.labelMC.rMC._visible = this.labelMC.lMC._visible = this.__get__data()[2];
            this.itemTextRight._x = this.labelMC.rMC._x - this.itemTextRight._width - 2;
            this.labelMC.lMC._x = this.itemTextRight._x - 2;
         }
      }
      else
      {
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc2_);
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
         if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem.TYPE_TEXT_ROTATOR)
         {
            this.labelMC.rMC._visible = this.labelMC.lMC._visible = false;
            this.itemTextRight._x = 282 - this.itemTextRight._width;
         }
      }
      if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem.TYPE_MAIN_CHAR_SELECTOR || this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem.TYPE_GRANDPARENTS_FRAME)
      {
         _loc2_.r = _loc2_.g = _loc2_.b = 0;
         _loc2_.a = 100;
      }
      com.rockstargames.ui.utils.Colour.Colourise(this.highlightMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
      com.rockstargames.ui.utils.Colour.Colourise(this.labelMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      this._highlighted = _h;
      return this.__get__highlighted();
   }
   function ON_DESTROY()
   {
      com.rockstargames.ui.utils.Debug.log("ON_DESTROY ");
      if(this.avatarImg1 != undefined && this.avatarImg1.isLoaded)
      {
         this.avatarImg1.removeTxdRef();
      }
      if(this.avatarImg2 != undefined && this.avatarImg2.isLoaded)
      {
         this.avatarImg2.removeTxdRef();
      }
   }
}
