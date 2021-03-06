class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Garage1Page extends com.rockstargames.gtav.web.dynasty8ExecutiveRealty.GaragePage
{
   function Garage1Page(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,pageName,isFirstPage,progressPanel,header);
      this.init(0,website.__get__purchasedGarage1Equipped() == 1,true,"DYN8_EXEC_UNEQUIP_2");
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
      this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.MAP_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.GARAGE_2_PAGE.name;
      this.view.description.autoSize = "left";
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.description,"DYN8_EXEC_GARAGE_1_DESCRIPTION",false);
      this.view.titleBG._visible = false;
      this.progressPanel.show();
      this.progressPanel.initGarageProgress(1);
      this.initEquipButtons();
      super.init(numberSwatchOffset,garageIsOwned,isLevel1,unequipLabel);
      this.updateEquipped(this.website.garage1Equipped == 1,true,this.website.garage1Style,this.website.garage1Lighting,this.website.garage1Number);
      this.updateSelectedStyle(this.website.garage1Style);
      this.updateSelectedLighting(this.website.garage1Lighting);
      this.updateSelectedNumber(this.website.garage1Number);
      this.selectTab(this.view.styleTab,this.website.garage1Equipped == 1);
      this.updateDisplay();
   }
   function initEquipButtons()
   {
      this.view.unequipButton._visible = false;
      this.view.equipButton._visible = false;
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "styleTab":
         case "lightingTab":
         case "numberTab":
            this.selectTab(this.view[type],this.website.garage1Equipped == 1);
            this.updateSlideshow();
            break;
         case "styleButton":
            this.website.garage1Style = parseInt(id);
            this.updateSelectedStyle(this.website.garage1Style);
            this.updateDisplay();
            break;
         case "lightingButton":
            this.website.garage1Lighting = parseInt(id);
            this.updateSelectedLighting(this.website.garage1Lighting);
            this.updateDisplay();
            break;
         case "numberButton":
            this.website.garage1Number = parseInt(id);
            this.updateSelectedNumber(this.website.garage1Number);
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
      if(this.website.garage1Equipped)
      {
         var _loc2_ = this.website.getSelectedOffice();
         var _loc3_ = undefined;
         var _loc4_ = undefined;
         _loc3_ = _loc2_.getGarage1StyleCost(this.website.garage1Style,this.website.__get__purchasedGarage1Style());
         _loc4_ = _loc2_.getGarage1StyleSaleCost(this.website.garage1Style,this.website.__get__purchasedGarage1Style());
         this.updateTab(this.view.styleTabPrices,_loc3_,_loc4_);
         _loc3_ = _loc2_.getGarage1LightingCost(this.website.garage1Lighting,this.website.__get__purchasedGarage1Lighting());
         _loc4_ = _loc2_.getGarage1LightingSaleCost(this.website.garage1Lighting,this.website.__get__purchasedGarage1Lighting());
         this.updateTab(this.view.lightingTabPrices,_loc3_,_loc4_);
         _loc3_ = _loc2_.getGarage1NumberCost(this.website.garage1Number,this.website.__get__purchasedGarage1Number());
         _loc4_ = _loc2_.getGarage1NumberSaleCost(this.website.garage1Number,this.website.__get__purchasedGarage1Number());
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
            this.slideshow.show("DYN_GARAGE",["INTERIOR_" + this.website.garage1Style]);
            break;
         case this.view.lightingTab:
            this.slideshow.show("DYN_GARAGE",["LIGHTING_" + this.website.garage1Lighting]);
            break;
         case this.view.numberTab:
            this.slideshow.show("DYN_GARAGE",["SIGNAGE_1_" + this.website.garage1Number]);
      }
   }
}
