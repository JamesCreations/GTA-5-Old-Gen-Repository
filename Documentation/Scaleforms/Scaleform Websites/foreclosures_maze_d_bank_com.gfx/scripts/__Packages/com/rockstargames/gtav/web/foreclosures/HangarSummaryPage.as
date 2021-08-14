class com.rockstargames.gtav.web.foreclosures.HangarSummaryPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   static var TXD = "FORECLOSURES_HANGAR";
   function HangarSummaryPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"hangarSummaryPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.hangarStyle == -1)
      {
         this.website.hangarStyle = 0;
      }
      if(this.website.hangarLighting == -1)
      {
         this.website.hangarLighting = 0;
      }
      if(this.website.hangarDecal == -1)
      {
         this.website.hangarDecal = 4;
      }
      if(this.website.hangarFurniture == -1)
      {
         this.website.hangarFurniture = 0;
      }
      if(this.website.hangarQuarters == -1)
      {
         this.website.hangarQuarters = 0;
      }
      if(this.website.hangarWorkshop == -1)
      {
         this.website.hangarWorkshop = 0;
      }
      var _loc2_ = this.website.getSelectedHangar();
      if(this.website.__get__purchasedHangarWorkshop() != 1 || !_loc2_.__get__isOwned())
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_WORKSHOP_PAGE.name;
      }
      else
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_QUARTERS_PAGE.name;
      }
      this.progressPanel.show();
      this.progressPanel.initHangarProgress(6);
      this.progressPanel.hidePurchaseButton();
      this.initPurchaseButton();
      this.initThumbnails();
      this.initTotalCost();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initThumbnails()
   {
      var _loc2_ = com.rockstargames.gtav.web.foreclosures.Hangar.getAbsoluteLightingIndex(this.website.hangarStyle,this.website.hangarLighting) + 1;
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.HangarSummaryPage.TXD,"style" + _loc2_,this.view.style);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.HangarSummaryPage.TXD,"light" + _loc2_,this.view.lighting);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.HangarSummaryPage.TXD,"decal" + (this.website.hangarDecal + 1),this.view.flooring);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.HangarSummaryPage.TXD,"furniture" + (this.website.hangarFurniture + 1),this.view.furniture);
      if(this.website.hangarQuarters == 0)
      {
         this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.HangarSummaryPage.TXD,"quarters1",this.view.quarters);
         this.view.quarters._alpha = 50;
      }
      else
      {
         this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.HangarSummaryPage.TXD,"quarters" + this.website.hangarQuarters,this.view.quarters);
      }
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.HangarSummaryPage.TXD,"workshop",this.view.workshop);
      if(this.website.hangarWorkshop == 0)
      {
         this.view.workshop._alpha = 50;
      }
   }
   function initPurchaseButton()
   {
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY");
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      var _loc2_ = this.website.getSelectedHangar();
      if(_loc2_.__get__isOwned() && this.website.hangarDecal == this.website.__get__purchasedHangarDecal() && this.website.hangarStyle == this.website.__get__purchasedHangarStyle() && this.website.hangarLighting == this.website.__get__purchasedHangarLighting() && this.website.hangarQuarters == this.website.__get__purchasedHangarQuarters() && this.website.hangarFurniture == this.website.__get__purchasedHangarFurniture() && this.website.hangarWorkshop == this.website.__get__purchasedHangarWorkshop())
      {
         this.view.purchaseButton.disabled = true;
         this.view.purchaseButton._alpha = 50;
      }
   }
   function initTotalCost()
   {
      var _loc2_ = this.website.getSelectedHangar();
      var _loc3_ = !_loc2_.__get__isOwned()?_loc2_.getBaseBestCost():0;
      _loc3_ = _loc3_ + _loc2_.getDecalBestCost(this.website.hangarDecal,this.website.__get__purchasedHangarDecal());
      _loc3_ = _loc3_ + _loc2_.getStyleBestCost(this.website.hangarStyle,this.website.__get__purchasedHangarStyle());
      _loc3_ = _loc3_ + _loc2_.getLightingBestCost(this.website.hangarLighting,this.website.__get__purchasedHangarLighting(),this.website.hangarStyle,this.website.__get__purchasedHangarStyle());
      _loc3_ = _loc3_ + _loc2_.getQuartersBestCost(this.website.hangarQuarters,this.website.__get__purchasedHangarQuarters());
      _loc3_ = _loc3_ + _loc2_.getFurnitureBestCost(this.website.hangarFurniture,this.website.__get__purchasedHangarFurniture());
      if(this.website.hangarWorkshop == 1 && !(_loc2_.__get__isOwned() && this.website.__get__purchasedHangarWorkshop() == 1))
      {
         _loc3_ = _loc3_ + _loc2_.getWorkshopBestCost(this.website.hangarWorkshop,this.website.__get__purchasedHangarWorkshop());
      }
      this.view.cost.text = "$" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc3_);
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "purchaseButton":
            this.website.dispatchPlayerHangarSelections();
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name);
            break;
         case "cancelButton":
            this.website.dataTextScope = this.buttonsHiddenByAlert;
            this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
            this.hideTradeInAlert();
            break;
         case "okButton":
            this.hideTradeInAlert();
            this.website.dispatchPlayerHangarSelections();
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name);
      }
   }
   function handleLB()
   {
      this.hideTradeInAlert();
      this.website.browser.GO_TO_WEBPAGE(this.prevPageName);
   }
   function showTradeInAlert()
   {
      this.tradeInAlert = this.website.showTradeInAlert();
      this.tradeInAlert.okButton.onColour = 16777215;
      this.tradeInAlert.okButton.offColour = 16777215;
      this.tradeInAlert.cancelButton.onColour = 16777215;
      this.tradeInAlert.cancelButton.offColour = 16777215;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.tradeInAlert.cancelButton.btnTxt,"FORECLOSURES_CANCEL");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.tradeInAlert.okButton.btnTxt,"FORECLOSURES_OK");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.tradeInAlert.message,"FCHNGR_TRADEIN");
      this.buttonsHiddenByAlert = [].concat(this.website.dataTextScope);
      this.website.dataTextScope = [];
      this.website.dataTextScope.push(this.tradeInAlert.cancelButton.btnTxt);
      this.website.dataTextScope.push(this.tradeInAlert.okButton.btnTxt);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function hideTradeInAlert()
   {
      if(this.tradeInAlert)
      {
         this.tradeInAlert.removeMovieClip();
         this.tradeInAlert = null;
      }
      this.buttonsHiddenByAlert = null;
   }
}
