class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Garage3Page extends com.rockstargames.gtav.web.dynasty8ExecutiveRealty.GaragePage
{
   function Garage3Page(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,pageName,isFirstPage,progressPanel,header);
      this.init(18,website.__get__purchasedGarage3Equipped() == 1,false,"DYN8_EXEC_UNEQUIP_3");
   }
   function init(numberSwatchOffset, garageIsOwned, isLevel1, unequipLabel)
   {
      if(this.website.garage1Equipped != 1)
      {
         this.website.garage1Equipped = 1;
      }
      if(this.website.garage1Style == -1)
      {
         this.website.garage1Style = 0;
      }
      if(this.website.garage1Lighting == -1)
      {
         this.website.garage1Lighting = 0;
      }
      if(this.website.garage1Number == -1)
      {
         this.website.garage1Number = 0;
      }
      if(this.website.garage2Equipped == -1)
      {
         this.website.garage2Equipped = 0;
      }
      if(this.website.garage2Style == -1)
      {
         this.website.garage2Style = 0;
      }
      if(this.website.garage2Lighting == -1)
      {
         this.website.garage2Lighting = 0;
      }
      if(this.website.garage2Number == -1)
      {
         this.website.garage2Number = 0;
      }
      if(this.website.garage3Equipped == -1)
      {
         this.website.garage3Equipped = 0;
      }
      if(this.website.garage3Style == -1)
      {
         this.website.garage3Style = 0;
      }
      if(this.website.garage3Lighting == -1)
      {
         this.website.garage3Lighting = 0;
      }
      if(this.website.garage3Number == -1)
      {
         this.website.garage3Number = 0;
      }
      this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.GARAGE_2_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.MOD_SHOP_PAGE.name;
      this.view.description.text = "";
      this.progressPanel.show();
      this.progressPanel.initGarageProgress(3);
      this.progressPanel.hideGarage3Exclamation();
      this.initEquipButtons();
      super.init(numberSwatchOffset,garageIsOwned,isLevel1,unequipLabel);
      this.updateEquipped(this.website.garage3Equipped == 1,this.website.__get__purchasedGarage3Equipped() == 1,this.website.garage3Style,this.website.garage3Lighting,this.website.garage3Number);
      if(this.website.garage2Equipped != 1)
      {
         this.view.equipButton.gotoAndStop("grey");
         this.view.equipButton.disabled = true;
      }
      if(this.website.garage3Equipped == 1)
      {
         this.updateSelectedStyle(this.website.garage3Style);
      }
      this.selectTab(this.view.styleTab,this.website.garage3Equipped == 1);
      this.view.equipButton._y = this.view.bodyText._y;
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.title,"DYN8_EXEC_FLOOR_3",false);
      this.updateDisplay();
   }
   function initEquipButtons()
   {
      if(this.website.__get__purchasedGarage3Equipped() == 1)
      {
         this.view.equipButton._visible = false;
         this.view.unequipButton._visible = false;
      }
      else
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.equipButton.btnTxt,"DYN8_EXEC_ADD_FLOOR_3",false);
         this.website.dataTextScope.push(this.view.equipButton.btnTxt);
         this.website.dataTextScope.push(this.view.unequipButton.btnTxt);
         if(this.website.garage2Equipped != 1)
         {
            this.view.equipButton.gotoAndStop("grey");
            this.view.equipButton.disabled = true;
         }
         else
         {
            this.view.equipButton.onColour = 16777215;
            this.view.equipButton.offColour = 16777215;
         }
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "styleTab":
         case "lightingTab":
         case "numberTab":
            this.selectTab(this.view[type],this.website.garage3Equipped == 1);
            this.updateSlideshow();
            break;
         case "equipButton":
            this.website.garage3Equipped = 1;
            this.updateEquipped(true,this.website.__get__purchasedGarage3Equipped() == 1,this.website.garage3Style,this.website.garage3Lighting,this.website.garage3Number);
            this.updateDisplay();
            this.selectTab(this.activeTab,true);
            break;
         case "unequipButton":
            this.website.garage3Equipped = 0;
            this.updateEquipped(false,this.website.__get__purchasedGarage3Equipped() == 1,this.website.garage3Style,this.website.garage3Lighting,this.website.garage3Number);
            this.updateDisplay();
            this.selectTab(this.activeTab,false);
            break;
         case "styleButton":
            this.website.garage3Style = parseInt(id);
            this.updateSelectedStyle(this.website.garage3Style);
            this.updateDisplay();
            break;
         case "lightingButton":
            this.website.garage3Lighting = parseInt(id);
            this.updateSelectedLighting(this.website.garage3Lighting);
            this.updateDisplay();
            break;
         case "numberButton":
            this.website.garage3Number = parseInt(id);
            this.updateSelectedNumber(this.website.garage3Number);
            this.updateDisplay();
            break;
         case "purchaseButton":
            this.website.dispatchPlayerSelections();
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
      }
   }
   function updateDisplay()
   {
      this.updateSlideshow();
      if(this.website.garage3Equipped)
      {
         var _loc2_ = this.website.getSelectedOffice();
         var _loc3_ = undefined;
         var _loc4_ = undefined;
         _loc3_ = _loc2_.getGarage3StyleCost(this.website.garage3Style,this.website.__get__purchasedGarage3Style());
         _loc4_ = _loc2_.getGarage3StyleSaleCost(this.website.garage3Style,this.website.__get__purchasedGarage3Style());
         this.updateTab(this.view.styleTabPrices,_loc3_,_loc4_);
         _loc3_ = _loc2_.getGarage3LightingCost(this.website.garage3Lighting,this.website.__get__purchasedGarage3Lighting());
         _loc4_ = _loc2_.getGarage3LightingSaleCost(this.website.garage3Lighting,this.website.__get__purchasedGarage3Lighting());
         this.updateTab(this.view.lightingTabPrices,_loc3_,_loc4_);
         _loc3_ = _loc2_.getGarage3NumberCost(this.website.garage3Number,this.website.__get__purchasedGarage3Number());
         _loc4_ = _loc2_.getGarage3NumberSaleCost(this.website.garage3Number,this.website.__get__purchasedGarage3Number());
         this.updateTab(this.view.numberTabPrices,_loc3_,_loc4_);
      }
      else
      {
         this.updateTab(this.view.styleTabPrices,-1,-1);
         this.updateTab(this.view.lightingTabPrices,-1,-1);
         this.updateTab(this.view.numberTabPrices,-1,-1);
      }
   }
   function updateSlideshow()
   {
      switch(this.activeTab)
      {
         case this.view.styleTab:
            this.slideshow.show("DYN_GARAGE",["INTERIOR_" + this.website.garage3Style]);
            break;
         case this.view.lightingTab:
            this.slideshow.show("DYN_GARAGE",["LIGHTING_" + this.website.garage3Lighting]);
            break;
         case this.view.numberTab:
            this.slideshow.show("DYN_GARAGE",["SIGNAGE_3_" + this.website.garage3Number]);
      }
   }
}
