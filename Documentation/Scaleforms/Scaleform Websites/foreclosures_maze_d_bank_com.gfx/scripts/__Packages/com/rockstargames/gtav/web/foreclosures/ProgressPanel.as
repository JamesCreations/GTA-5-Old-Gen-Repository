class com.rockstargames.gtav.web.foreclosures.ProgressPanel
{
   function ProgressPanel(view, website)
   {
      this.view = view;
      this.website = website;
      this.init();
   }
   function dispose()
   {
      this.slideshow.dispose();
      this.website = null;
      this.clubhouse = null;
      this.displayConfig = null;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
   }
   function init()
   {
      var _loc3_ = this.view.getBounds(_root);
      this.left = _loc3_.xMin;
      this.right = _loc3_.xMax;
      this.top = _loc3_.yMin;
      this.bottom = _loc3_.yMax;
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      this.displayConfig = this.website.browser.getConfig();
      this.hide();
   }
   function initOverview()
   {
      this.view.gotoAndStop("overview");
      this.view.nextButton.onColour = 16777215;
      this.view.nextButton.offColour = 16777215;
      this.view.nextButton.disabled = true;
      this.website.dataTextScope.push(this.view.nextButton.btnTxt);
      this.hide();
   }
   function showOverview(clubhouse, showImmediately)
   {
      this.clubhouse = clubhouse;
      this.bunker = null;
      this.hangar = null;
      this.truncate(this.view.clubhouseName,clubhouse.__get__name(),this.view.clubhouseName._width - 5);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.clubhouseAddress,clubhouse.__get__address(),true);
      var _loc7_ = !clubhouse.__get__isOwned()?"FORECLOSURES_BUY_FROM":"FORECLOSURES_RENOVATE";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,_loc7_,false);
      if(!clubhouse.__get__isOwned())
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,this.view.nextButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(clubhouse.getBaseBestCost()),true);
      }
      var _loc6_ = 0;
      if(clubhouse.__get__isOwned())
      {
         var _loc2_ = "";
         _loc2_ = _loc2_ + ("<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_MURAL"));
         _loc2_ = _loc2_ + (":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FC_MURAL_" + (this.website.getSelectedClubhouseType() * 9 + this.website.__get__purchasedMural())) + "</font><br>");
         _loc2_ = _loc2_ + ("<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_STYLE"));
         _loc2_ = _loc2_ + (":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FC_WALL_" + this.website.__get__purchasedWall()));
         _loc2_ = _loc2_ + (", " + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FC_HANGING_" + this.website.__get__purchasedHanging()));
         _loc2_ = _loc2_ + (", " + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FC_FURNITURE_" + this.website.__get__purchasedFurniture()) + "</font><br>");
         _loc2_ = _loc2_ + ("<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_CLUB_EMBLEM"));
         _loc2_ = _loc2_ + (":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FC_EMBLEM_" + this.website.__get__purchasedEmblem()) + "</font><br>");
         _loc2_ = _loc2_ + ("<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_CLUB_NAME"));
         if(this.website.__get__purchasedHideSignage() == 1 || this.website.__get__purchasedSignage() == "")
         {
            _loc2_ = _loc2_ + (":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"NONE") + "</font><br>");
         }
         else
         {
            _loc2_ = _loc2_ + (":</font> <font color=\'#333333\'>" + this.website.__get__purchasedSignage() + "</font><br>");
         }
         _loc2_ = _loc2_ + ("<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_GUN_LOCKER"));
         _loc2_ = _loc2_ + (":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,!this.website.__get__purchasedGunLocker()?"FORECLOSURES_NO":"FORECLOSURES_YES") + "</font><br>");
         _loc2_ = _loc2_ + ("<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_BIKE_SHOP"));
         _loc2_ = _loc2_ + (":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,!this.website.__get__purchasedBikeShop()?"FORECLOSURES_NO":"FORECLOSURES_YES") + "</font>");
         this.view.description.htmlText = _loc2_;
         _loc6_ = 10;
      }
      else
      {
         this.view.description.autoSize = "left";
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,clubhouse.__get__description(),true);
      }
      var _loc5_ = this.view.description.getTextFormat();
      _loc5_.leading = _loc6_;
      this.view.description.setTextFormat(_loc5_);
      var _loc4_ = this.view.description._y + this.view.description.textHeight + 10;
      if(clubhouse.getBaseCost() != clubhouse.getBaseBestCost() && !clubhouse.__get__isOwned())
      {
         this.view.originalCost.autoSize = "left";
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"$" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(clubhouse.getBaseCost()),true);
         this.view.strikethrough._visible = true;
         this.view.originalCost._y = _loc4_;
         this.view.strikethrough._width = this.view.originalCost._width;
         this.view.strikethrough._y = _loc4_ + 12;
         _loc4_ = _loc4_ + 25;
         this.view.nextButton._y = _loc4_;
      }
      else
      {
         this.view.originalCost.text = "";
         this.view.strikethrough._visible = false;
         _loc4_ = _loc4_ + 15;
      }
      this.view.nextButton._y = _loc4_;
      this.view.nextButton.disabled = false;
      this.view.bg._height = this.view.nextButton._y + this.view.nextButton._height + 20;
      this.bottom = this.top + this.view.bg._height;
      this.showClubhouseImage();
      this.view.marker.gotoAndStop(!clubhouse.__get__isOwned()?"unownedInactive":"ownedInactive");
      if(showImmediately)
      {
         this.view._alpha = 100;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      }
      else if(!this.view._visible)
      {
         this.view._alpha = 0;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,0.25,{_alpha:100});
      }
   }
   function initProgress(numCompleteSteps)
   {
      this.view.gotoAndStop("progress");
      this.clubhouse = this.website.getSelectedClubhouse();
      this.showClubhouseImage();
      this.showPurchaseButton();
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY",false);
      if(!this.clubhouse.__get__isOwned())
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,this.view.purchaseButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(this.clubhouse.getBaseBestCost()),true);
      }
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      this.truncate(this.view.clubhouseName,this.clubhouse.__get__name(),this.view.clubhouseName._width - 5);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.clubhouseAddress,this.clubhouse.__get__address(),true);
      this.website.dataTextScope.push(this.view.MURAL.btnTxt);
      this.website.dataTextScope.push(this.view.STYLE.btnTxt);
      this.website.dataTextScope.push(this.view.CLUB_D_EMBLEM.btnTxt);
      this.website.dataTextScope.push(this.view.CLUB_D_NAME.btnTxt);
      this.website.dataTextScope.push(this.view.GUN_D_LOCKER.btnTxt);
      this.website.dataTextScope.push(this.view.BIKE_D_SHOP.btnTxt);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.MURAL.btnTxt,"FORECLOSURES_MURAL",false);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.STYLE.btnTxt,"FORECLOSURES_STYLE",false);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.CLUB_D_EMBLEM.btnTxt,"FORECLOSURES_CLUB_EMBLEM",false);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.CLUB_D_NAME.btnTxt,"FORECLOSURES_CLUB_NAME",false);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.GUN_D_LOCKER.btnTxt,"FORECLOSURES_GUN_LOCKER",false);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.BIKE_D_SHOP.btnTxt,"FORECLOSURES_BIKE_SHOP",false);
      this.setProgressDots(numCompleteSteps);
      if(this.clubhouse.__get__isOwned() && this.website.__get__purchasedGunLocker() == 1)
      {
         this.view.GUN_D_LOCKER.disabled = true;
         this.view.GUN_D_LOCKER.btnTxt._alpha = 30;
         this.view.stepDot4.tick._visible = true;
      }
      else
      {
         this.view.GUN_D_LOCKER.disabled = false;
         this.view.GUN_D_LOCKER.btnTxt._alpha = 100;
         this.view.stepDot4.tick._visible = false;
      }
      if(this.clubhouse.__get__isOwned() && this.website.__get__purchasedBikeShop() == 1)
      {
         this.view.BIKE_D_SHOP.disabled = true;
         this.view.BIKE_D_SHOP.btnTxt._alpha = 30;
         this.view.stepDot5.tick._visible = true;
      }
      else
      {
         this.view.BIKE_D_SHOP.disabled = false;
         this.view.BIKE_D_SHOP.btnTxt._alpha = 100;
         this.view.stepDot5.tick._visible = false;
      }
      this.updateCosts();
      this.view.bg._yscale = 100;
   }
   function showClubhouseImage()
   {
      if(this.currImageId != this.clubhouse.__get__txd())
      {
         this.currImageId = this.clubhouse.txd;
         this.slideshow.show([this.clubhouse.__get__txd(),this.clubhouse.__get__txd()],[this.clubhouse.__get__txd() + "_EXT",this.clubhouse.__get__txd() + "_INT"]);
      }
   }
   function setProgressDots(numCompleteSteps)
   {
      var _loc2_ = 0;
      while(_loc2_ < 7)
      {
         this.view["stepDot" + _loc2_].gotoAndStop(_loc2_ >= numCompleteSteps?"incomplete":"complete");
         this.view["stepDot" + _loc2_].tick._visible = false;
         this.view["stepDot" + _loc2_].exclamation._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   function showBunkerOverview(bunker, showImmediately)
   {
      this.view.gotoAndStop("bunkerOverview");
      this.bunker = bunker;
      this.clubhouse = null;
      this.hangar = null;
      this.truncate(this.view.clubhouseName,bunker.__get__name(),this.view.clubhouseName._width - 5);
      var _loc8_ = !bunker.__get__isOwned()?"FORECLOSURES_BUY_FROM":"FORECLOSURES_RENOVATE";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,_loc8_,false);
      if(!bunker.__get__isOwned())
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,this.view.nextButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(bunker.getBaseBestCost()),true);
      }
      var _loc7_ = 0;
      if(bunker.__get__isOwned())
      {
         var _loc2_ = "";
         _loc2_ = _loc2_ + ("<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_BUNKER_STYLE"));
         var _loc5_ = "FORECLOSURES_BUNKER_STYLE_" + (this.website.__get__purchasedBunkerStyle() + 1);
         _loc2_ = _loc2_ + (":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc5_) + "</font><br>");
         _loc2_ = _loc2_ + ("<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_QUARTERS"));
         _loc2_ = _loc2_ + (":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,!this.website.__get__purchasedQuarters()?"FORECLOSURES_NO":"FORECLOSURES_YES") + "</font><br>");
         _loc2_ = _loc2_ + ("<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_FIRING_RANGE"));
         _loc5_ = "FORECLOSURES_NO";
         switch(this.website.__get__purchasedFiringRange())
         {
            case 1:
               _loc5_ = "FORECLOSURES_SHOOTING_1";
               break;
            case 2:
               _loc5_ = "FORECLOSURES_SHOOTING_1";
         }
         _loc2_ = _loc2_ + (":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc5_) + "</font><br>");
         _loc2_ = _loc2_ + ("<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_GUN_LOCKER"));
         _loc2_ = _loc2_ + (":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,!this.website.__get__purchasedBunkerGunLocker()?"FORECLOSURES_NO":"FORECLOSURES_YES") + "</font><br>");
         _loc2_ = _loc2_ + ("<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_TRANSPORTATION"));
         _loc5_ = "FORECLOSURES_NO";
         switch(this.website.__get__purchasedTransportation())
         {
            case 1:
               _loc5_ = "FORECLOSURES_TRANSPORTATION_1";
               break;
            case 2:
               _loc5_ = "FORECLOSURES_TRANSPORTATION_2";
         }
         _loc2_ = _loc2_ + (":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc5_) + "</font><br>");
         this.view.description.htmlText = _loc2_;
         _loc7_ = 10;
      }
      else
      {
         this.view.description.autoSize = "left";
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,bunker.__get__description(),true);
      }
      var _loc6_ = this.view.description.getTextFormat();
      _loc6_.leading = _loc7_;
      this.view.description.setTextFormat(_loc6_);
      var _loc4_ = this.view.description._y + this.view.description.textHeight + 10;
      if(bunker.getBaseCost() != bunker.getBaseBestCost() && !bunker.__get__isOwned())
      {
         this.view.originalCost.autoSize = "left";
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"$" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(bunker.getBaseCost()),true);
         this.view.strikethrough._visible = true;
         this.view.originalCost._y = _loc4_;
         this.view.strikethrough._width = this.view.originalCost._width;
         this.view.strikethrough._y = _loc4_ + 12;
         _loc4_ = _loc4_ + 25;
         this.view.nextButton._y = _loc4_;
      }
      else
      {
         this.view.originalCost.text = "";
         this.view.strikethrough._visible = false;
         _loc4_ = _loc4_ + 15;
      }
      this.view.nextButton._y = _loc4_;
      this.view.nextButton.disabled = false;
      this.view.bg._height = this.view.nextButton._y + this.view.nextButton._height + 20;
      this.bottom = this.top + this.view.bg._height;
      this.showBunkerImage();
      this.view.marker.gotoAndStop(!bunker.__get__isOwned()?"unownedInactive":"ownedInactive");
      if(showImmediately)
      {
         this.view._alpha = 100;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      }
      else if(!this.view._visible)
      {
         this.view._alpha = 0;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,0.25,{_alpha:100});
      }
   }
   function showBunkerImage()
   {
      if(this.currImageId != this.bunker.__get__txd())
      {
         this.currImageId = this.bunker.txd;
         this.slideshow.show([this.bunker.__get__txd(),this.bunker.__get__txd()],[this.bunker.__get__txd() + "_EXT",this.bunker.__get__txd() + "_INT"]);
      }
   }
   function initBunkerProgress(numCompleteSteps)
   {
      this.view.gotoAndStop("bunkerProgress");
      this.bunker = this.website.getSelectedBunker();
      this.showBunkerImage();
      this.showPurchaseButton();
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY",false);
      if(!this.bunker.__get__isOwned())
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,this.view.purchaseButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(this.bunker.getBaseBestCost()),true);
      }
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      this.truncate(this.view.clubhouseName,this.bunker.__get__name(),this.view.clubhouseName._width - 5);
      this.website.dataTextScope.push(this.view.BUNKER_D_STYLE.btnTxt);
      this.website.dataTextScope.push(this.view.PERSONAL_D_QUARTERS.btnTxt);
      this.website.dataTextScope.push(this.view.SHOOTING_D_RANGE.btnTxt);
      this.website.dataTextScope.push(this.view.BUNKER_D_GUN_D_LOCKER.btnTxt);
      this.website.dataTextScope.push(this.view.TRANSPORTATION.btnTxt);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.BUNKER_D_STYLE.btnTxt,"FORECLOSURES_BUNKER_STYLE");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.PERSONAL_D_QUARTERS.btnTxt,"FORECLOSURES_QUARTERS");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.SHOOTING_D_RANGE.btnTxt,"FORECLOSURES_FIRING_RANGE");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.BUNKER_D_GUN_D_LOCKER.btnTxt,"FORECLOSURES_GUN_LOCKER");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.TRANSPORTATION.btnTxt,"FORECLOSURES_TRANSPORTATION");
      this.setProgressDots(numCompleteSteps);
      this.disableRenovatingOption(this.bunker.__get__isOwned(),this.website.__get__purchasedQuarters(),this.view.PERSONAL_D_QUARTERS,this.view.stepDot1);
      this.disableRenovatingOption(this.bunker.__get__isOwned(),this.website.__get__purchasedBunkerGunLocker(),this.view.BUNKER_D_GUN_D_LOCKER,this.view.stepDot3);
      this.updateBunkerCosts();
      this.view.bg._yscale = 100;
   }
   function disableRenovatingOption(bunkerIsOwned, optionPurchased, stepView, stepDot)
   {
      if(bunkerIsOwned && optionPurchased == 1)
      {
         stepView.disabled = true;
         stepView.btnTxt._alpha = 30;
         stepDot.tick._visible = true;
      }
      else
      {
         stepView.disabled = false;
         stepView.btnTxt._alpha = 100;
         stepDot.tick._visible = false;
      }
   }
   function showLightingExclamation()
   {
      this.view.stepDot1.exclamation._visible = true;
   }
   function hideLightingExclamation()
   {
      this.view.stepDot1.exclamation._visible = false;
   }
   function showHangarOverview(hangar, showImmediately)
   {
      this.view.gotoAndStop("hangarOverview");
      this.hangar = hangar;
      this.bunker = null;
      this.clubhouse = null;
      this.truncate(this.view.clubhouseName,hangar.__get__name(),this.view.clubhouseName._width - 5);
      var _loc8_ = !hangar.__get__isOwned()?"FORECLOSURES_BUY_FROM":"FORECLOSURES_RENOVATE";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,_loc8_,false);
      if(!hangar.__get__isOwned())
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,this.view.nextButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(hangar.getBaseBestCost()),true);
      }
      var _loc7_ = 0;
      if(hangar.__get__isOwned())
      {
         var _loc2_ = "";
         _loc2_ = _loc2_ + ("<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCHNGR_STY"));
         var _loc9_ = "FCHNGR_STY_" + (this.website.__get__purchasedHangarStyle() + 1);
         _loc2_ = _loc2_ + (":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc9_) + "</font><br>");
         _loc2_ = _loc2_ + ("<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCHNGR_LGT"));
         var _loc5_ = this.website.__get__purchasedHangarLighting() + 1;
         if(_loc5_ > 2)
         {
            _loc5_ = _loc5_ + 1;
         }
         _loc9_ = "FCHNGR_LGT_" + _loc5_;
         _loc2_ = _loc2_ + (":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc9_) + "</font><br>");
         _loc2_ = _loc2_ + ("<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCHNGR_FLR"));
         _loc9_ = "FCHNGR_FLR_" + (this.website.__get__purchasedHangarDecal() + 1);
         _loc2_ = _loc2_ + (":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc9_) + "</font><br>");
         _loc2_ = _loc2_ + ("<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCHNGR_FRN"));
         _loc9_ = "FCHNGR_FRN_" + (this.website.__get__purchasedHangarFurniture() + 1);
         _loc2_ = _loc2_ + (":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc9_) + "</font><br>");
         _loc2_ = _loc2_ + ("<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCHNGR_QRT"));
         _loc9_ = this.website.hangarQuarters != 0?"FCHNGR_FRN_" + (this.website.__get__purchasedHangarQuarters() + 1):"FORECLOSURES_NO";
         _loc2_ = _loc2_ + (":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc9_) + "</font><br>");
         _loc2_ = _loc2_ + ("<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCHNGR_WKS"));
         _loc2_ = _loc2_ + (":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,this.website.__get__purchasedHangarWorkshop() != 1?"FORECLOSURES_NO":"FORECLOSURES_YES") + "</font><br>");
         this.view.description.htmlText = _loc2_;
         _loc7_ = 10;
      }
      else
      {
         this.view.description.autoSize = "left";
         this.view.description.htmlText = hangar.description;
      }
      var _loc6_ = this.view.description.getTextFormat();
      _loc6_.leading = _loc7_;
      this.view.description.setTextFormat(_loc6_);
      var _loc4_ = this.view.description._y + this.view.description.textHeight + 10;
      if(hangar.getBaseCost() != hangar.getBaseBestCost() && !hangar.__get__isOwned())
      {
         this.view.originalCost.autoSize = "left";
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"$" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(hangar.getBaseCost()),true);
         this.view.strikethrough._visible = true;
         this.view.originalCost._y = _loc4_;
         this.view.strikethrough._width = this.view.originalCost._width;
         this.view.strikethrough._y = _loc4_ + 12;
         _loc4_ = _loc4_ + 25;
         this.view.nextButton._y = _loc4_;
      }
      else
      {
         this.view.originalCost.text = "";
         this.view.strikethrough._visible = false;
         _loc4_ = _loc4_ + 15;
      }
      this.view.nextButton._y = _loc4_;
      this.view.nextButton.disabled = false;
      this.view.bg._height = this.view.nextButton._y + this.view.nextButton._height + 20;
      this.bottom = this.top + this.view.bg._height;
      this.showHangarImage();
      this.view.marker.gotoAndStop(!hangar.__get__isOwned()?"unownedInactive":"ownedInactive");
      if(showImmediately)
      {
         this.view._alpha = 100;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      }
      else if(!this.view._visible)
      {
         this.view._alpha = 0;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,0.25,{_alpha:100});
      }
   }
   function showHangarImage()
   {
      if(this.currImageId != this.hangar.__get__txd())
      {
         this.currImageId = this.hangar.txd;
         this.slideshow.show([this.hangar.__get__txd(),this.hangar.__get__txd()],[this.hangar.__get__txd() + "_EXT",this.hangar.__get__txd() + "_INT"]);
      }
   }
   function initHangarProgress(numCompleteSteps)
   {
      this.view.gotoAndStop("hangarProgress");
      this.hangar = this.website.getSelectedHangar();
      this.showHangarImage();
      this.showPurchaseButton();
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY",false);
      if(!this.hangar.__get__isOwned())
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,this.view.purchaseButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(this.hangar.getBaseBestCost()),true);
      }
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      this.truncate(this.view.clubhouseName,this.hangar.__get__name(),this.view.clubhouseName._width - 5);
      this.website.dataTextScope.push(this.view.HANGAR_D_STYLE.btnTxt);
      this.website.dataTextScope.push(this.view.HANGAR_D_LIGHTING.btnTxt);
      this.website.dataTextScope.push(this.view.HANGAR_D_FLOORING.btnTxt);
      this.website.dataTextScope.push(this.view.HANGAR_D_FURNITURE.btnTxt);
      this.website.dataTextScope.push(this.view.HANGAR_D_QUARTERS.btnTxt);
      this.website.dataTextScope.push(this.view.HANGAR_D_WORKSHOP.btnTxt);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.HANGAR_D_STYLE.btnTxt,"FCHNGR_STY");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.HANGAR_D_LIGHTING.btnTxt,"FCHNGR_LGT");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.HANGAR_D_FLOORING.btnTxt,"FCHNGR_FLR");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.HANGAR_D_FURNITURE.btnTxt,"FCHNGR_FRN");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.HANGAR_D_QUARTERS.btnTxt,"FCHNGR_QRT");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.HANGAR_D_WORKSHOP.btnTxt,"FCHNGR_WKS");
      this.setProgressDots(numCompleteSteps);
      this.disableRenovatingOption(this.hangar.__get__isOwned(),this.website.__get__purchasedHangarWorkshop(),this.view.HANGAR_D_WORKSHOP,this.view.stepDot5);
      this.updateHangarCosts();
      this.view.bg._yscale = 100;
   }
   function hide()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.view._visible = false;
      this.view.nextButton.disabled = true;
   }
   function show()
   {
      this.view._visible = true;
      this.view.nextButton.disabled = false;
   }
   function hidePurchaseButton()
   {
      this.view.purchaseButton._visible = false;
      this.view.purchaseButton.disabled = true;
   }
   function showPurchaseButton()
   {
      this.view.purchaseButton._visible = true;
      this.view.purchaseButton.disabled = false;
   }
   function __get__isHidden()
   {
      return !this.view._visible;
   }
   function stopSlideshow()
   {
      this.slideshow.stopOn(1);
   }
   function restartSlideshow()
   {
      this.slideshow.restart();
   }
   function truncate(tf, text, availableWidth)
   {
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(tf,text,true);
      var _loc4_ = tf.getTextFormat();
      tf.letterSpacing = 1;
      if(tf.textWidth > availableWidth)
      {
         var _loc1_ = text.length;
         while(_loc1_ > 0)
         {
            tf.text = text.substring(0,_loc1_) + "...";
            tf.setTextFormat(_loc4_);
            if(tf.textWidth <= availableWidth)
            {
               break;
            }
            _loc1_ = _loc1_ - 1;
         }
      }
   }
   function updateCosts()
   {
      this.updateCostStep(0,-1,-1,-1,"");
      var _loc5_ = !this.clubhouse.__get__isOwned()?this.clubhouse.getBaseBestCost():0;
      var _loc2_ = undefined;
      var _loc4_ = undefined;
      var _loc3_ = undefined;
      var _loc6_ = undefined;
      _loc2_ = this.clubhouse.getMuralBestCost(this.website.mural,this.website.__get__purchasedMural());
      _loc4_ = this.clubhouse.getMuralCost(this.website.mural,this.website.__get__purchasedMural());
      _loc3_ = this.clubhouse.getMuralSaleCost(this.website.mural,this.website.__get__purchasedMural());
      _loc5_ = _loc5_ + this.updateCostStep(0,_loc2_,_loc4_,_loc3_,"+");
      var _loc18_ = this.clubhouse.getWallBestCost(this.website.wall,this.website.__get__purchasedWall());
      var _loc14_ = this.clubhouse.getWallCost(this.website.wall,this.website.__get__purchasedWall());
      var _loc11_ = this.clubhouse.getWallSaleCost(this.website.wall,this.website.__get__purchasedWall());
      var _loc20_ = this.clubhouse.getHangingBestCost(this.website.hanging,this.website.__get__purchasedHanging());
      var _loc15_ = this.clubhouse.getHangingCost(this.website.hanging,this.website.__get__purchasedHanging());
      var _loc7_ = this.clubhouse.getHangingSaleCost(this.website.hanging,this.website.__get__purchasedHanging());
      var _loc22_ = this.clubhouse.getFurnitureBestCost(this.website.furniture,this.website.__get__purchasedFurniture());
      var _loc16_ = this.clubhouse.getFurnitureCost(this.website.furniture,this.website.__get__purchasedFurniture());
      var _loc10_ = this.clubhouse.getFurnitureSaleCost(this.website.furniture,this.website.__get__purchasedFurniture());
      _loc2_ = _loc18_ + _loc20_ + _loc22_;
      _loc4_ = _loc14_ + _loc15_ + _loc16_;
      _loc3_ = _loc11_ + _loc7_ + _loc10_;
      _loc6_ = _loc11_ != 0?_loc11_:_loc14_;
      _loc6_ = _loc6_ + (_loc7_ != 0?_loc7_:_loc15_);
      _loc6_ = _loc6_ + (_loc10_ != 0?_loc10_:_loc16_);
      _loc5_ = _loc5_ + this.updateCostStep(1,_loc2_,_loc4_,_loc3_,"+",_loc6_);
      _loc2_ = this.clubhouse.getEmblemBestCost(this.website.emblem,this.website.__get__purchasedEmblem());
      _loc4_ = this.clubhouse.getEmblemCost(this.website.emblem,this.website.__get__purchasedEmblem());
      _loc3_ = this.clubhouse.getEmblemSaleCost(this.website.emblem,this.website.__get__purchasedEmblem());
      _loc5_ = _loc5_ + this.updateCostStep(2,_loc2_,_loc4_,_loc3_,"+");
      var _loc23_ = this.clubhouse.getFontBestCost(this.website.font,this.website.__get__purchasedFont());
      var _loc17_ = this.clubhouse.getFontCost(this.website.font,this.website.__get__purchasedFont());
      var _loc8_ = this.clubhouse.getFontSaleCost(this.website.font,this.website.__get__purchasedFont());
      var _loc19_ = this.clubhouse.getSignageBestCost(this.website.__get__signage(),this.website.__get__purchasedSignage());
      var _loc13_ = this.clubhouse.getSignageCost(this.website.__get__signage(),this.website.__get__purchasedSignage());
      var _loc9_ = this.clubhouse.getSignageSaleCost(this.website.__get__signage(),this.website.__get__purchasedSignage());
      _loc2_ = _loc23_ + _loc19_;
      _loc4_ = _loc17_ + _loc13_;
      _loc3_ = _loc8_ + _loc9_;
      _loc6_ = _loc8_ != 0?_loc8_:_loc17_;
      _loc6_ = _loc6_ + (_loc9_ != 0?_loc9_:_loc13_);
      _loc5_ = _loc5_ + this.updateCostStep(3,_loc2_,_loc4_,_loc3_,"+",_loc6_);
      _loc2_ = this.clubhouse.getGunLockerBestCost(this.website.gunLocker,this.website.__get__purchasedGunLocker());
      _loc4_ = this.clubhouse.getGunLockerCost(this.website.gunLocker,this.website.__get__purchasedGunLocker());
      _loc3_ = this.clubhouse.getGunLockerSaleCost(this.website.gunLocker,this.website.__get__purchasedGunLocker());
      _loc5_ = _loc5_ + this.updateCostStep(4,_loc2_,_loc4_,_loc3_,"+");
      _loc2_ = this.clubhouse.getBikeShopBestCost(this.website.bikeShop,this.website.__get__purchasedBikeShop());
      _loc4_ = this.clubhouse.getBikeShopCost(this.website.bikeShop,this.website.__get__purchasedBikeShop());
      _loc3_ = this.clubhouse.getBikeShopSaleCost(this.website.bikeShop,this.website.__get__purchasedBikeShop());
      _loc5_ = _loc5_ + this.updateCostStep(5,_loc2_,_loc4_,_loc3_,"+");
      var _loc21_ = !this.clubhouse.__get__isOwned()?"FORECLOSURES_BUY":"FORECLOSURES_RENOVATE";
      var _loc12_ = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.purchaseButton.btnTxt,_loc21_);
      if(_loc5_ > 0)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc12_ + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc5_),true);
      }
      else
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc12_,true);
      }
   }
   function updateCostStep(step, actualPrice, normalPrice, salePrice, prefix, saleSumCost)
   {
      if(salePrice > 0)
      {
         this.view["cost" + step].text = "";
         if(saleSumCost != undefined)
         {
            this.view["saleCost" + step].text = "$" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(saleSumCost);
         }
         else
         {
            this.view["saleCost" + step].text = "$" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(salePrice);
         }
         this.view["originalCost" + step].autoSize = "left";
         this.view["originalCost" + step].text = prefix + " $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(normalPrice);
         this.view["strikethrough" + step]._width = this.view["originalCost" + step]._width;
         this.view["strikethrough" + step]._visible = true;
      }
      else
      {
         this.view["cost" + step].text = normalPrice <= 0?"":prefix + " $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(normalPrice);
         this.view["saleCost" + step].text = "";
         this.view["originalCost" + step].text = "";
         this.view["strikethrough" + step]._visible = false;
      }
      if(this.displayConfig.isAsian)
      {
         var _loc3_ = undefined;
         _loc3_ = this.view["saleCost" + step].getNewTextFormat();
         _loc3_.size = 14;
         this.view["saleCost" + step].setNewTextFormat(_loc3_);
         _loc3_ = this.view["cost" + step].getNewTextFormat();
         _loc3_.size = 14;
         this.view["cost" + step].setNewTextFormat(_loc3_);
      }
      return actualPrice;
   }
   function updateBunkerCosts()
   {
      this.updateCostStep(0,-1,-1,-1,"");
      var _loc2_ = !this.bunker.__get__isOwned()?this.bunker.getBaseBestCost():0;
      var _loc3_ = undefined;
      var _loc5_ = undefined;
      var _loc4_ = undefined;
      var _loc9_ = undefined;
      var _loc6_ = undefined;
      if(this.website.bunkerStyle != -1)
      {
         _loc3_ = this.bunker.getStyleBestCost(this.website.bunkerStyle,this.website.__get__purchasedBunkerStyle());
         _loc5_ = this.bunker.getStyleCost(this.website.bunkerStyle,this.website.__get__purchasedBunkerStyle());
         _loc4_ = this.bunker.getStyleSaleCost(this.website.bunkerStyle,this.website.__get__purchasedBunkerStyle());
         _loc2_ = _loc2_ + this.updateCostStep(0,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ = _loc2_ + this.updateCostStep(0,0,0,0,"+");
      }
      _loc6_ = !this.bunker.__get__isOwned() && this.website.quarters == 1 || this.bunker.__get__isOwned() && this.website.quarters != this.website.__get__purchasedQuarters();
      if(_loc6_)
      {
         _loc3_ = this.bunker.getQuartersBestCost();
         _loc5_ = this.bunker.getQuartersCost();
         _loc4_ = this.bunker.getQuartersSaleCost();
         _loc2_ = _loc2_ + this.updateCostStep(1,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ = _loc2_ + this.updateCostStep(1,0,0,0,"+");
      }
      if(this.website.firingRange != -1)
      {
         _loc3_ = this.bunker.getFiringRangeBestCost(this.website.firingRange,this.website.__get__purchasedFiringRange());
         _loc5_ = this.bunker.getFiringRangeCost(this.website.firingRange,this.website.__get__purchasedFiringRange());
         _loc4_ = this.bunker.getFiringRangeSaleCost(this.website.firingRange,this.website.__get__purchasedFiringRange());
         _loc2_ = _loc2_ + this.updateCostStep(2,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ = _loc2_ + this.updateCostStep(2,0,0,0,"+");
      }
      _loc6_ = !this.bunker.__get__isOwned() && this.website.bunkerGunLocker == 1 || this.bunker.__get__isOwned() && this.website.bunkerGunLocker != this.website.__get__purchasedBunkerGunLocker();
      if(_loc6_)
      {
         _loc3_ = this.bunker.getGunLockerBestCost();
         _loc5_ = this.bunker.getGunLockerCost();
         _loc4_ = this.bunker.getGunLockerSaleCost();
         _loc2_ = _loc2_ + this.updateCostStep(3,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ = _loc2_ + this.updateCostStep(3,0,0,0,"+");
      }
      if(this.website.transportation != -1)
      {
         _loc3_ = this.bunker.getTransportationBestCost(this.website.transportation,this.website.__get__purchasedTransportation());
         _loc5_ = this.bunker.getTransportationCost(this.website.transportation,this.website.__get__purchasedTransportation());
         _loc4_ = this.bunker.getTransportationSaleCost(this.website.transportation,this.website.__get__purchasedTransportation());
         _loc2_ = _loc2_ + this.updateCostStep(4,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ = _loc2_ + this.updateCostStep(4,0,0,0,"+");
      }
      var _loc8_ = !this.bunker.__get__isOwned()?"FORECLOSURES_BUY":"FORECLOSURES_RENOVATE";
      var _loc7_ = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.purchaseButton.btnTxt,_loc8_);
      if(_loc2_ > 0)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc7_ + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
      }
      else
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc7_,true);
      }
   }
   function updateHangarCosts()
   {
      this.updateCostStep(0,-1,-1,-1,"");
      var _loc2_ = !this.hangar.__get__isOwned()?this.hangar.getBaseBestCost():0;
      var _loc3_ = undefined;
      var _loc5_ = undefined;
      var _loc4_ = undefined;
      var _loc9_ = undefined;
      var _loc8_ = undefined;
      if(this.website.hangarStyle != -1)
      {
         _loc3_ = this.hangar.getStyleBestCost(this.website.hangarStyle,this.website.__get__purchasedHangarStyle());
         _loc5_ = this.hangar.getStyleCost(this.website.hangarStyle,this.website.__get__purchasedHangarStyle());
         _loc4_ = this.hangar.getStyleSaleCost(this.website.hangarStyle,this.website.__get__purchasedHangarStyle());
         _loc2_ = _loc2_ + this.updateCostStep(0,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ = _loc2_ + this.updateCostStep(0,0,0,0,"+");
      }
      if(this.website.hangarLighting != -1)
      {
         _loc3_ = this.hangar.getLightingBestCost(this.website.hangarLighting,this.website.__get__purchasedHangarLighting(),this.website.hangarStyle,this.website.__get__purchasedHangarStyle());
         _loc5_ = this.hangar.getLightingCost(this.website.hangarLighting,this.website.__get__purchasedHangarLighting(),this.website.hangarStyle,this.website.__get__purchasedHangarStyle());
         _loc4_ = this.hangar.getLightingSaleCost(this.website.hangarLighting,this.website.__get__purchasedHangarLighting(),this.website.hangarStyle,this.website.__get__purchasedHangarStyle());
         _loc2_ = _loc2_ + this.updateCostStep(1,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ = _loc2_ + this.updateCostStep(1,0,0,0,"+");
      }
      if(this.website.hangarDecal != -1)
      {
         _loc3_ = this.hangar.getDecalBestCost(this.website.hangarDecal,this.website.__get__purchasedHangarDecal());
         _loc5_ = this.hangar.getDecalCost(this.website.hangarDecal,this.website.__get__purchasedHangarDecal());
         _loc4_ = this.hangar.getDecalSaleCost(this.website.hangarDecal,this.website.__get__purchasedHangarDecal());
         _loc2_ = _loc2_ + this.updateCostStep(2,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ = _loc2_ + this.updateCostStep(2,0,0,0,"+");
      }
      if(this.website.hangarFurniture != -1)
      {
         _loc3_ = this.hangar.getFurnitureBestCost(this.website.hangarFurniture,this.website.__get__purchasedHangarFurniture());
         _loc5_ = this.hangar.getFurnitureCost(this.website.hangarFurniture,this.website.__get__purchasedHangarFurniture());
         _loc4_ = this.hangar.getFurnitureSaleCost(this.website.hangarFurniture,this.website.__get__purchasedHangarFurniture());
         _loc2_ = _loc2_ + this.updateCostStep(3,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ = _loc2_ + this.updateCostStep(3,0,0,0,"+");
      }
      if(this.website.hangarQuarters != -1)
      {
         _loc3_ = this.hangar.getQuartersBestCost(this.website.hangarQuarters,this.website.__get__purchasedHangarQuarters());
         _loc5_ = this.hangar.getQuartersCost(this.website.hangarQuarters,this.website.__get__purchasedHangarQuarters());
         _loc4_ = this.hangar.getQuartersSaleCost(this.website.hangarQuarters,this.website.__get__purchasedHangarQuarters());
         _loc2_ = _loc2_ + this.updateCostStep(4,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ = _loc2_ + this.updateCostStep(4,0,0,0,"+");
      }
      _loc8_ = !this.hangar.__get__isOwned() && this.website.hangarWorkshop == 1 || this.hangar.__get__isOwned() && this.website.hangarWorkshop != this.website.__get__purchasedHangarWorkshop();
      if(_loc8_)
      {
         _loc3_ = this.hangar.getWorkshopBestCost(this.website.hangarWorkshop,this.website.__get__purchasedHangarWorkshop());
         _loc5_ = this.hangar.getWorkshopCost(this.website.hangarWorkshop,this.website.__get__purchasedHangarWorkshop());
         _loc4_ = this.hangar.getWorkshopSaleCost(this.website.hangarWorkshop,this.website.__get__purchasedHangarWorkshop());
         _loc2_ = _loc2_ + this.updateCostStep(5,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ = _loc2_ + this.updateCostStep(5,0,0,0,"+");
      }
      var _loc7_ = !this.hangar.__get__isOwned()?"FORECLOSURES_BUY":"FORECLOSURES_RENOVATE";
      var _loc6_ = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.purchaseButton.btnTxt,_loc7_);
      if(_loc2_ > 0)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc6_ + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
      }
      else
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc6_,true);
      }
   }
}
