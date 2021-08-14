class com.rockstargames.gtav.web.foreclosures.PurchasePage extends com.rockstargames.gtav.web.foreclosures.Page
{
   static var CLUBHOUSE_TXD = "FORECLOSURES_STYLE";
   static var BUNKER_TXD = "FORECLOSURES_BUNKER";
   static var HANGAR_TXD = "FORECLOSURES_HANGAR";
   function PurchasePage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"purchasePage",pageName,isFirstPage,progressPanel,header);
      if(website.isInHangarFlow)
      {
         this.initHangar();
      }
      else if(website.isInBunkerFlow)
      {
         this.initBunker();
      }
      else
      {
         this.initClubhouse();
      }
   }
   function initClubhouse()
   {
      if(this.website.mural == -1)
      {
         this.website.mural = 0;
      }
      if(this.website.wall == -1)
      {
         this.website.wall = 0;
      }
      if(this.website.hanging == -1)
      {
         this.website.hanging = 0;
      }
      if(this.website.furniture == -1)
      {
         this.website.furniture = 0;
      }
      if(this.website.font == -1)
      {
         this.website.font = 0;
      }
      if(this.website.fontColour == -1)
      {
         this.website.fontColour = 0;
      }
      if(this.website.hideSignage == -1)
      {
         this.website.hideSignage = 0;
      }
      if(this.website.gunLocker == -1)
      {
         this.website.gunLocker = 0;
      }
      if(this.website.bikeShop == -1)
      {
         this.website.bikeShop = 0;
      }
      if(this.website.emblem == -1)
      {
         this.website.emblem = this.website.__get__crewEmblem() != ""?0:1;
      }
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BED_PAGE.name;
      this.progressPanel.setProgressDots(7);
      this.progressPanel.hidePurchaseButton();
      this.initClubhouseSlideshow();
      this.initButtons();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,"FORECLOSURES_PURCHASE_HEADING",false);
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FORECLOSURES_PURCHASE_DESCRIPTION",false);
      }
      else
      {
         if(this.website.dataProviderUI[1][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,this.website.dataProviderUI[1][0],true);
         }
         if(this.website.dataProviderUI[2][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,this.website.dataProviderUI[2][0],true);
         }
      }
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SUCCESS_PAGE.name)
      {
         this.website.updateNewlyPurchasedClubhouse();
      }
      this.website.setSelectedClubhouse(-1);
   }
   function initClubhouseSlideshow()
   {
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         this.website.purchaseSlideshow = ["STYLE_" + this.website.getSelectedClubhouseType() + "_" + this.website.mural + "_" + this.website.wall + "_" + this.website.hanging + "_" + this.website.furniture];
         this.website.clubhouseToMarkAsPurchased = this.website.getSelectedClubhouse();
      }
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.PurchasePage.CLUBHOUSE_TXD],this.website.purchaseSlideshow);
   }
   function initBunker()
   {
      if(this.website.bunkerStyle == -1)
      {
         this.website.bunkerStyle = 0;
      }
      if(this.website.quarters == -1)
      {
         this.website.quarters = 0;
      }
      if(this.website.firingRange == -1)
      {
         this.website.firingRange = 0;
      }
      if(this.website.bunkerGunLocker == -1)
      {
         this.website.bunkerGunLocker = 0;
      }
      if(this.website.transportation == -1)
      {
         this.website.transportation = 0;
      }
      this.progressPanel.setProgressDots(5);
      this.progressPanel.hidePurchaseButton();
      this.initBunkerSlideshow();
      this.initButtons();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,"FORECLOSURES_PURCHASE_HEADING",false);
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FORECLOSURES_PURCHASE_DESCRIPTION",false);
      }
      else
      {
         if(this.website.dataProviderUI[1][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,this.website.dataProviderUI[1][0],true);
         }
         if(this.website.dataProviderUI[2][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,this.website.dataProviderUI[2][0],true);
         }
      }
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SUCCESS_PAGE.name)
      {
         this.website.updateNewlyPurchasedBunker();
      }
      this.website.setSelectedBunker(-1);
   }
   function initBunkerSlideshow()
   {
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         this.website.purchaseSlideshow = [];
         this.website.purchaseSlideshow.push("STYLE_" + Math.max(1,this.website.bunkerStyle + 1) + "B");
         if(this.website.quarters == 1)
         {
            this.website.purchaseSlideshow.push("QUARTERS");
         }
         if(this.website.firingRange != 0)
         {
            this.website.purchaseSlideshow.push("SHOOTINGB_" + Math.max(1,this.website.firingRange));
         }
         if(this.website.bunkerGunLocker == 1)
         {
            this.website.purchaseSlideshow.push("GUN_LOCKER");
         }
         if(this.website.transportation != 0)
         {
            this.website.purchaseSlideshow.push("TRANSPORTATIONB_" + Math.max(1,this.website.transportation));
         }
         this.website.bunkerToMarkAsPurchased = this.website.getSelectedBunker();
      }
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      var _loc3_ = [];
      var _loc2_ = 0;
      while(_loc2_ < this.website.purchaseSlideshow.length)
      {
         _loc3_.push(com.rockstargames.gtav.web.foreclosures.PurchasePage.BUNKER_TXD);
         _loc2_ = _loc2_ + 1;
      }
      this.slideshow.show(_loc3_,this.website.purchaseSlideshow);
   }
   function initHangar()
   {
      if(this.website.hangarDecal == -1)
      {
         this.website.hangarDecal = 4;
      }
      if(this.website.hangarStyle == -1)
      {
         this.website.hangarStyle = 0;
      }
      if(this.website.hangarLighting == -1)
      {
         this.website.hangarLighting = 0;
      }
      if(this.website.hangarQuarters == -1)
      {
         this.website.hangarQuarters = 0;
      }
      if(this.website.hangarFurniture == -1)
      {
         this.website.hangarFurniture = 0;
      }
      if(this.website.hangarWorkshop == -1)
      {
         this.website.hangarWorkshop = 0;
      }
      this.progressPanel.setProgressDots(6);
      this.progressPanel.hidePurchaseButton();
      this.initHangarSlideshow();
      this.initButtons();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,"FORECLOSURES_PURCHASE_HEADING",false);
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FORECLOSURES_PURCHASE_DESCRIPTION",false);
      }
      else
      {
         if(this.website.dataProviderUI[1][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,this.website.dataProviderUI[1][0],true);
         }
         if(this.website.dataProviderUI[2][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,this.website.dataProviderUI[2][0],true);
         }
      }
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SUCCESS_PAGE.name)
      {
         this.website.updateNewlyPurchasedHangar();
      }
      this.website.setSelectedHangar(-1);
   }
   function initHangarSlideshow()
   {
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         var _loc4_ = com.rockstargames.gtav.web.foreclosures.Hangar.getAbsoluteLightingIndex(this.website.hangarStyle,this.website.hangarLighting) + 1;
         this.website.purchaseSlideshow = [];
         this.website.purchaseSlideshow.push("style" + _loc4_);
         this.website.purchaseSlideshow.push("light" + _loc4_);
         this.website.purchaseSlideshow.push("decal" + (this.website.hangarDecal + 1));
         this.website.purchaseSlideshow.push("furniture" + (this.website.hangarFurniture + 1));
         if(this.website.hangarQuarters > 0)
         {
            this.website.purchaseSlideshow.push("quarters" + this.website.hangarQuarters);
         }
         if(this.website.hangarWorkshop > 0)
         {
            this.website.purchaseSlideshow.push("workshop");
         }
         this.website.hangarToMarkAsPurchased = this.website.getSelectedHangar();
      }
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      var _loc3_ = [];
      var _loc2_ = 0;
      while(_loc2_ < this.website.purchaseSlideshow.length)
      {
         _loc3_.push(com.rockstargames.gtav.web.foreclosures.PurchasePage.HANGAR_TXD);
         _loc2_ = _loc2_ + 1;
      }
      this.slideshow.show(_loc3_,this.website.purchaseSlideshow);
   }
   function initButtons()
   {
      var _loc3_ = 5;
      this.initButton(this.view.waypointButton,"FORECLOSURES_SET_WAYPOINT",_loc3_);
      this.initButton(this.view.mapButton,"FORECLOSURES_RETURN_TO_MAP",_loc3_);
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         this.view.mapButton._visible = false;
         this.view.mapButton.disabled = true;
      }
      else
      {
         this.view.mapButton._visible = true;
         this.view.mapButton.disabled = false;
      }
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SUCCESS_PAGE.name)
      {
         this.view.waypointButton._visible = true;
         this.view.waypointButton.disabled = false;
      }
      else
      {
         this.view.waypointButton._visible = false;
         this.view.waypointButton.disabled = true;
      }
      if(this.view.mapButton._visible && this.view.waypointButton._visible)
      {
         var _loc2_ = Math.max(this.view.mapButton._width,this.view.waypointButton._width);
         this.view.mapButton.bg._width = _loc2_;
         this.view.mapButton.btnTxt.autoSize = "none";
         this.view.mapButton.btnTxt._width = _loc2_ - 2 * _loc3_;
         this.view.waypointButton.bg._width = _loc2_;
         this.view.waypointButton.btnTxt._width = _loc2_ - 2 * _loc3_;
         this.view.waypointButton.btnTxt.autoSize = "none";
         var _loc4_ = (this.view.slideshow._width - 2 * _loc2_) / 3;
         this.view.waypointButton._x = this.view.slideshow._x + _loc4_;
         this.view.mapButton._x = this.view.slideshow._x + this.view.slideshow._width - _loc4_ - _loc2_;
      }
      else if(this.view.mapButton._visible)
      {
         this.view.mapButton._x = 0.5 * (this.view.slideshow._width - this.view.mapButton._width) + this.view.slideshow._x;
      }
      else if(this.view.waypointButton._visible)
      {
         this.view.waypointButton._x = 0.5 * (this.view.slideshow._width - this.view.waypointButton._width) + this.view.slideshow._x;
      }
   }
   function initButton(btn, label, padding)
   {
      var _loc4_ = btn.bg._width;
      btn.onColour = 16777215;
      btn.offColour = 16777215;
      btn.btnTxt.autoSize = "left";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(btn.btnTxt,label,false);
      this.website.dataTextScope.push(btn.btnTxt);
      btn.btnTxt._x = padding;
      btn.bg._width = btn.btnTxt._width + 2 * padding;
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "mapButton":
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.MAP_PAGE.name);
            break;
         case "waypointButton":
            this.view.mapButton.disabled = true;
      }
   }
   function dispose()
   {
      this.slideshow.dispose();
      super.dispose();
   }
}
