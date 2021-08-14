class com.rockstargames.gtav.web.WWW_SOUTHERNSANANDREASSUPERAUTOS_COM extends com.rockstargames.gtav.web.WWW_SOUTHERNSANANDREASSUPERAUTOS_COM_WRAPPER
{
   function WWW_SOUTHERNSANANDREASSUPERAUTOS_COM()
   {
      super();
      this._name = "WWW_SOUTHERNSANANDREASSUPERAUTOS_COM";
      this.defaultButtonOnColour = 0;
      this.defaultButtonOffColour = 0;
      this.purchaseButtonOnColour = 16777215;
      this.purchaseButtonOffColour = 16777215;
      this.sortButtonOnColour = 0;
      this.sortButtonOffColour = 16777215;
      this.dropDownButtonOnColour = 0;
      this.dropDownButtonOffColour = 16777215;
      this.favourUpperCase = false;
      this.DETAILS_PAGE = "CARDETAILS";
      this.PURCHASE_PAGE = "PURCHASECAR";
      this.TOOLBAR_LABEL = "SSS_TOOLBAR";
      this.HOME_PAGE_HEADER_LABEL = "SSS_PG1_HEADER";
      this.HOME_PAGE_BODY_LABEL = "SSS_PG1_BODY1";
      this.BUY_NOW_LABEL = "SSS_BUYNOW";
      this.SORT_PRICE_LABEL = "SSSA_SORT_PRICE";
      this.SORT_NEW_IN_LABEL = "SSSA_SORT_NEW_IN";
      this.DESCRIPTION_HEADER_LABEL = "SSSA_DESCRIPTION_HEADER";
      this.LIVERY_HEADER_LABEL = "SSSA_LIVERY_HEADER";
      this.STATS_HEADER_LABEL = "SSSA_STATS_HEADER";
      this.FILTER_ALL_LABEL = "SSSA_ALL";
      this.DESCRIPTION_LABEL_PREFIX = "SSS_";
      this.DROP_DOWN_ITEM_SPACING = 39;
      this.DROP_DOWN_HEADER_OFFSET = 44;
      this.VEHICLE_BUTTON_ROW_HEIGHT = 236;
      this.USE_SEPARATE_DETAIL_IMAGES = true;
      this.DETAILS_PAGE_IMAGE_SUFFIX = "B";
      this.hasSelectedBuyItNow = true;
   }
   function filterVehicles()
   {
      if(this.isMP)
      {
         this.categoryOrder = ["SSSA_EXCLUSIVE","SSSA_2DOOR","SSSA_OFFROAD","SSSA_4DOOR","SSSA_LUXURY","SSSA_MOTORBIKES"];
         this.vehicles = {SSSA_EXCLUSIVE:[this.vehicles.RETINUE,this.vehicles.YOUGA2,this.vehicles.ESSKEY,this.vehicles.TORNADO6,this.vehicles.SANCTUS,this.vehicles.VORTEX,this.vehicles.DAEMON2,this.vehicles.DEFILER,this.vehicles.CHIMERA,this.vehicles.ZOMBIEB,this.vehicles.FAGGIO3,this.vehicles.FAGGION,this.vehicles.AVARUS,this.vehicles.NIGHTBLADE,this.vehicles.ZOMBIEA,this.vehicles.WOLFSBANE,this.vehicles.BLAZER4,this.vehicles.MANCHEZ,this.vehicles.RATBIKE,this.vehicles.BAGGER,this.vehicles.OMNIS,this.vehicles.TROPOS,this.vehicles.BRIOSO,this.vehicles.TROPHY,this.vehicles.TROPHY2,this.vehicles.CONTENDER,this.vehicles.CLIFFHANGER,this.vehicles.BF400,this.vehicles.RALLYTRUCK,this.vehicles.TAMPA2,this.vehicles.GARGOYLE,this.vehicles.STALION2,this.vehicles.DOMINATOR2,this.vehicles.GAUNTLET2,this.vehicles.BUFFALO3,this.vehicles.RUMPO3,this.vehicles.TAMPA,this.vehicles.BTYPE2,this.vehicles.LURCHER,this.vehicles.GUARDIAN,this.vehicles.ENDURO,this.vehicles.GBURRITO2,this.vehicles.KURUMA,this.vehicles.KURUMA2,this.vehicles.RLOADER2,this.vehicles.SLAMVAN,this.vehicles.MASSACRO2,this.vehicles.JESTER2,this.vehicles.DUKES,this.vehicles.BLISTA2,this.vehicles.STALLION,this.vehicles.KALAHARI_TOPLESS,this.vehicles.SOVEREIGN,this.vehicles.PIGALLE,this.vehicles.BLADE,this.vehicles.WARRENER,this.vehicles.GLENDALE,this.vehicles.RHAPSODY,this.vehicles.PANTO,this.vehicles.RLOADER,this.vehicles.BIFTA,this.vehicles.KALAHARI,this.vehicles.PARADISE],SSSA_2DOOR:[this.vehicles.TORNADO6,this.vehicles.RLOADER2,this.vehicles.SLAMVAN,this.vehicles.MASSACRO2,this.vehicles.JESTER2,this.vehicles.STALION2,this.vehicles.DOMINATOR2,this.vehicles.GAUNTLET2,this.vehicles.DUKES,this.vehicles.BLISTA2,this.vehicles.STALLION,this.vehicles.PIGALLE,this.vehicles.BLADE,this.vehicles.RHAPSODY,this.vehicles.PANTO,this.vehicles.RLOADER,this.vehicles.SCHWARZE,this.vehicles.ZION,this.vehicles.ZION2,this.vehicles.GAUNTLET,this.vehicles.VIGERO,this.vehicles.ISSI2,this.vehicles.DOMINATO,this.vehicles.F620,this.vehicles.FUSILADE,this.vehicles.PENUMBRA,this.vehicles.SURFER,this.vehicles.YOUGA,this.vehicles.SENTINEL,this.vehicles.SENTINEL_CONVERTABLE,this.vehicles.PICADOR],SSSA_OFFROAD:[this.vehicles.GUARDIAN,this.vehicles.GBURRITO2,this.vehicles.KALAHARI_TOPLESS,this.vehicles.BIFTA,this.vehicles.KALAHARI,this.vehicles.PARADISE,this.vehicles.BFINJECT,this.vehicles.SEMINOLE,this.vehicles.RUMPO,this.vehicles.SANDKING,this.vehicles.SANDKIN2,this.vehicles.BISON,this.vehicles.BODHI2,this.vehicles.DUNE,this.vehicles.REBEL,this.vehicles.REBEL2,this.vehicles.SADLER,this.vehicles.RANCHERX],SSSA_4DOOR:[this.vehicles.KURUMA,this.vehicles.KURUMA2,this.vehicles.BUFFALO3,this.vehicles.WARRENER,this.vehicles.GLENDALE,this.vehicles.FUGITIVE,this.vehicles.JACKAL,this.vehicles.ORACLE1,this.vehicles.SCHAFTER2,this.vehicles.SURGE,this.vehicles.DILETTAN,this.vehicles.ASEA,this.vehicles.GRANGER,this.vehicles.INGOT,this.vehicles.INTRUDER,this.vehicles.MINIVAN,this.vehicles.PREMIER,this.vehicles.RADI,this.vehicles.STANIER,this.vehicles.STRATUM,this.vehicles.WASHINGT,this.vehicles.ASTROPE,this.vehicles.REGINA,this.vehicles.PRIMO,this.vehicles.BUFFALO,this.vehicles.BUFFALO2,this.vehicles.TAILGATER],SSSA_LUXURY:[this.vehicles.BALLER2,this.vehicles.GRESLEY,this.vehicles.LANDSTALKER,this.vehicles.CAVCADE,this.vehicles.CAVCADE2,this.vehicles.BOBCATXL,this.vehicles.ROCOTO,this.vehicles.FELON,this.vehicles.FELON2,this.vehicles.ORACLE,this.vehicles.STRETCH],SSSA_MOTORBIKES:[this.vehicles.WOLFSBANE,this.vehicles.FAGGIO3,this.vehicles.VORTEX,this.vehicles.BLAZER4,this.vehicles.SANCTUS,this.vehicles.MANCHEZ,this.vehicles.ESSKEY,this.vehicles.NIGHTBLADE,this.vehicles.DEFILER,this.vehicles.AVARUS,this.vehicles.ZOMBIEA,this.vehicles.ZOMBIEB,this.vehicles.CHIMERA,this.vehicles.DAEMON2,this.vehicles.RATBIKE,this.vehicles.BAGGER,this.vehicles.CLIFFHANGER,this.vehicles.BF400,this.vehicles.GARGOYLE,this.vehicles.ENDURO,this.vehicles.SOVEREIGN,this.vehicles.BATI,this.vehicles.NEMESIS,this.vehicles.HAKUCHOU,this.vehicles.INNOVATION,this.vehicles.BATI2,this.vehicles.RUFFIAN,this.vehicles.VADER,this.vehicles.BLAZER,this.vehicles.BLAZER3,this.vehicles.PCJ,this.vehicles.SANCHEZ,this.vehicles.SANCHEZ2,this.vehicles.FAGGIO,this.vehicles.AKUMA,this.vehicles.DOUBLE,this.vehicles.HEXER]};
      }
      else
      {
         this.categoryOrder = ["SSSA_EXCLUSIVE","SSSA_2DOOR","SSSA_SPORTS","SSSA_OFFROAD","SSSA_4DOOR","SSSA_LUXURY","SSSA_MOTORBIKES"];
         this.vehicles = {SSSA_EXCLUSIVE:[this.vehicles.BTYPE2,this.vehicles.LURCHER,this.vehicles.RLOADER2,this.vehicles.SLAMVAN,this.vehicles.MASSACRO2,this.vehicles.JESTER2,this.vehicles.DUKES,this.vehicles.BLISTA2,this.vehicles.STALLION,this.vehicles.BLADE,this.vehicles.BIFTA,this.vehicles.PARADISE,this.vehicles.KALAHARI,this.vehicles.KALAHARI_TOPLESS,this.vehicles.INNOVATION],SSSA_2DOOR:[this.vehicles.SCHWARZE,this.vehicles.ZION,this.vehicles.GAUNTLET,this.vehicles.VIGERO,this.vehicles.ISSI2],SSSA_SPORTS:[this.vehicles.INFERNUS,this.vehicles.SURANO,this.vehicles.VACCA,this.vehicles.NINEF,this.vehicles.COMET2,this.vehicles.BANSHEE,this.vehicles.FELTZER],SSSA_OFFROAD:[this.vehicles.BFINJECT,this.vehicles.SANDKING],SSSA_4DOOR:[this.vehicles.FUGITIVE,this.vehicles.DILETTAN],SSSA_LUXURY:[this.vehicles.SUPERD,this.vehicles.EXEMPLAR,this.vehicles.BALLER2,this.vehicles.CAVCADE,this.vehicles.ROCOTO,this.vehicles.FELON,this.vehicles.ORACLE],SSSA_MOTORBIKES:[this.vehicles.BATI,this.vehicles.AKUMA,this.vehicles.RUFFIAN,this.vehicles.VADER,this.vehicles.BLAZER,this.vehicles.PCJ,this.vehicles.SANCHEZ,this.vehicles.FAGGIO]};
      }
   }
   function setCommonPageIDs()
   {
      this.PAGE_NAMES[1] = this.HOME_PAGE;
      this.PAGE_NAMES[2] = this.SUCCESS_PAGE;
      this.PAGE_NAMES[34] = this.PURCHASE_PAGE;
      this.PAGE_NAMES[35] = this.FAILED_PAGE;
      this.PAGE_NAMES[36] = this.ERROR_PAGE;
      this.CAN_STORE_PAGE[2] = false;
      this.CAN_STORE_PAGE[34] = false;
      this.CAN_STORE_PAGE[35] = false;
      this.CAN_STORE_PAGE[36] = false;
   }
   function setOptionsButtons(selectedOption)
   {
      super.setOptionsButtons(selectedOption);
      var _loc6_ = this.CONTENT.details;
      var _loc8_ = !this.currentVehicle.livery?this.NUM_COLOUR_OPTIONS:this.currentVehicle.livery.length;
      if(this.currentVehicle.livery)
      {
         var _loc9_ = this.currentVehicle.price;
         if(selectedOption != 0)
         {
            if(this.currentVehicle.secondaryPrice != 0)
            {
               _loc9_ = this.currentVehicle.secondaryPrice;
            }
         }
         if(_loc9_ == 0)
         {
            _loc6_.priceText.text = "";
         }
         else
         {
            _loc6_.priceText.text = !isNaN(_loc9_)?this.formatPrice(_loc9_):_loc9_;
         }
         var _loc10_ = this.currentVehicle.salePrice;
         if(selectedOption != 0)
         {
            if(this.currentVehicle.secondarySalePrice != 0)
            {
               _loc10_ = this.currentVehicle.secondarySalePrice;
            }
         }
         if(_loc10_ == 0)
         {
            _loc6_.reducedPriceText.text = "";
         }
         else
         {
            _loc6_.reducedPriceText.text = !isNaN(_loc10_)?this.formatPrice(_loc10_):_loc10_;
         }
      }
      if(this.currentVehicle.buyItNow)
      {
         if(this.currentVehicle.colourways)
         {
            var _loc3_ = 0;
            while(_loc3_ < _loc8_)
            {
               if(this.currentVehicle.secondaryPrice > 0)
               {
                  var _loc4_ = _loc6_["BUYITNOWSTOCK_A" + (_loc3_ + 1)];
                  var _loc5_ = selectedOption == _loc3_;
                  _loc4_.disabled = !_loc5_;
                  _loc4_._alpha = !_loc5_?50:100;
                  _loc4_._visible = _loc5_;
               }
               _loc4_ = _loc6_["BUYITNOWSTOCK_B" + (_loc3_ + 1)];
               _loc5_ = selectedOption == _loc3_;
               _loc4_.disabled = !_loc5_;
               _loc4_._alpha = !_loc5_?50:100;
               _loc4_._visible = _loc5_;
               _loc3_ = _loc3_ + 1;
            }
         }
         else
         {
            _loc6_.BUYITNOWSTOCK_1.disabled = false;
            _loc6_.BUYITNOWSTOCK_1._alpha = 100;
            _loc6_.BUYITNOWSTOCK_2.disabled = false;
            _loc6_.BUYITNOWSTOCK_2._alpha = 100;
         }
      }
   }
   function initOutcomePage(headerText, bodyText, soldLabel, pauseBeforeShowing)
   {
      super.initOutcomePage(headerText,bodyText,soldLabel,pauseBeforeShowing);
      var _loc3_ = this.CONTENT.purchase;
      if(this.currentVehicle.livery)
      {
         var _loc4_ = this.currentVehicle.price;
         if(this.selectedOption != 0)
         {
            if(this.currentVehicle.secondaryPrice != 0)
            {
               _loc4_ = this.currentVehicle.secondaryPrice;
            }
         }
         if(_loc4_ == 0)
         {
            _loc3_.priceText.text = "";
         }
         else
         {
            _loc3_.priceText.text = !isNaN(_loc4_)?this.formatPrice(_loc4_):_loc4_;
         }
         var _loc5_ = this.currentVehicle.salePrice;
         if(this.selectedOption != 0)
         {
            if(this.currentVehicle.secondarySalePrice != 0)
            {
               _loc5_ = this.currentVehicle.secondarySalePrice;
            }
         }
         if(_loc5_ == 0)
         {
            _loc3_.reducedPriceText.text = "";
         }
         else
         {
            _loc3_.reducedPriceText.text = !isNaN(_loc5_)?this.formatPrice(_loc5_):_loc5_;
         }
      }
      if(this.currentVehicle.buyItNow)
      {
         if(this.hasSelectedBuyItNow)
         {
            if(this.currentVehicle.secondarySalePrice != undefined && this.currentVehicle.secondarySalePrice > 0)
            {
               _loc3_.priceText.text = this.formatPrice(this.currentVehicle.secondaryPrice);
               _loc3_.reductionLine._width = _loc3_.priceText.textWidth + 5;
               _loc3_.reducedPriceText._x = _loc3_.priceText._x - _loc3_.priceText.textWidth - 20;
               _loc3_.reducedPriceText.text = this.formatPrice(this.currentVehicle.secondarySalePrice);
               _loc3_.reductionLine._visible = true;
            }
            else
            {
               _loc3_.priceText.text = !isNaN(this.currentVehicle.secondaryPrice)?this.formatPrice(this.currentVehicle.secondaryPrice):this.currentVehicle.secondaryPrice;
               _loc3_.reductionLine._visible = false;
            }
         }
         else if(this.currentVehicle.salePrice != undefined && this.currentVehicle.salePrice > 0)
         {
            _loc3_.priceText.text = this.formatPrice(this.currentVehicle.price);
            _loc3_.reductionLine._width = _loc3_.priceText.textWidth + 5;
            _loc3_.reducedPriceText._x = _loc3_.priceText._x - _loc3_.priceText.textWidth - 20;
            _loc3_.reducedPriceText.text = this.formatPrice(this.currentVehicle.salePrice);
            _loc3_.reductionLine._visible = true;
         }
         else
         {
            _loc3_.priceText.text = !isNaN(this.currentVehicle.price)?this.formatPrice(this.currentVehicle.price):this.currentVehicle.price;
            _loc3_.reductionLine._visible = false;
         }
      }
   }
   function initStats(page)
   {
      page.statsHeaderText.autoSize = "left";
      this.setLocalisedText(page.statsHeaderText,this.STATS_HEADER_LABEL);
      this.setStatLine(page.stats.topSpeedLabel,"WEB_VEHICLE_TOP_SPEED",page.stats.topSpeed,this.currentVehicle.topSpeed);
      this.setStatLine(page.stats.accelerationLabel,"WEB_VEHICLE_ACCELERATION",page.stats.acceleration,this.currentVehicle.acceleration);
      this.setStatLine(page.stats.brakingLabel,"WEB_VEHICLE_BRAKING",page.stats.braking,this.currentVehicle.braking);
      this.setStatLine(page.stats.tractionLabel,"WEB_VEHICLE_TRACTION",page.stats.traction,this.currentVehicle.traction);
   }
   function setStatLine(txt, label, bar, value)
   {
      txt.textAutoSize = "shrink";
      this.setLocalisedText(txt,label);
      value = value * 500;
      bar.bar4._xscale = Math.min(100,Math.max(0,value - 400));
      bar.bar3._xscale = Math.min(100,Math.max(0,value - 300));
      bar.bar2._xscale = Math.min(100,Math.max(0,value - 200));
      bar.bar1._xscale = Math.min(100,Math.max(0,value - 100));
      bar.bar0._xscale = Math.min(100,Math.max(0,value));
   }
   function goToAnchor(link)
   {
      var _loc4_ = Math.max(0,link.lastIndexOf("_")) || link.length;
      var _loc6_ = link.slice(0,_loc4_);
      var _loc5_ = link.slice(_loc4_ + 1);
      if(_loc6_ == "BUYITNOWSTOCK")
      {
         if(_loc5_.charAt(0) == "A" && this.currentVehicle.price1Unlocked)
         {
            this.hasSelectedBuyItNow = false;
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + this.PURCHASE_PAGE);
         }
         else if(_loc5_.charAt(0) == "B" && this.currentVehicle.price2Unlocked)
         {
            this.hasSelectedBuyItNow = true;
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + this.PURCHASE_PAGE);
         }
      }
      else
      {
         super.goToAnchor(link);
      }
   }
   function initDetailsPage(pageName, newPage)
   {
      var _loc4_ = this.CONTENT.details;
      var _loc3_ = parseInt(pageName.substr(this.DETAILS_PAGE.length));
      this.currentVehicle = this.getVehicleFromId(_loc3_);
      if(this.currentVehicle.buyItNow && this.currentVehicle.price >= 0 && this.currentVehicle.secondaryPrice >= 0)
      {
         this.initBuyItNowDetailsPage(_loc3_,this.currentVehicle,newPage,"buyItNow");
      }
      else
      {
         super.initDetailsPage(pageName,newPage);
      }
   }
   function initBuyItNowDetailsPage(id, currentVehicle, newPage, frame)
   {
      this.dataTextScope.length = 0;
      this.priceSortDirection = -1;
      this.currentFilter = this.FILTER_ALL_LABEL;
      this.selectedOption = -1;
      this.selectedStyle = -1;
      var _loc2_ = this.CONTENT.details;
      _loc2_.gotoAndStop(frame);
      _loc2_.nameText.text = this.setLocalisedText(_loc2_.nameText,currentVehicle.brand,this.favourUpperCase) + " " + this.setLocalisedText(_loc2_.nameText,currentVehicle.name,this.favourUpperCase);
      _loc2_.reductionLine._visible = false;
      _loc2_.reducedPriceText._visible = false;
      _loc2_.reductionLine._visible = false;
      _loc2_.priceText._visible = false;
      this.addVehicleImage(currentVehicle,_loc2_);
      if(!this.pricesSet)
      {
         _loc2_.options._visible = false;
         _loc2_.purchaseButton._visible = false;
         _loc2_.purchaseButton2._visible = false;
         return undefined;
      }
      if(!newPage && this.currentPageInitialised)
      {
         return undefined;
      }
      _loc2_.options._visible = true;
      _loc2_.purchaseButton._visible = true;
      _loc2_.purchaseButton2._visible = true;
      this.initStats(_loc2_);
      var _loc4_ = this.initOptions(_loc2_);
      this.initBuyItNowPriceButtons(_loc2_,_loc4_);
      this.initNormalPriceButtons(_loc2_,_loc4_);
      _loc2_.descriptionText.autoSize = "left";
      if(currentVehicle.desc)
      {
         this.setLocalisedText(_loc2_.descriptionText,currentVehicle.desc);
      }
      else
      {
         this.setLocalisedText(_loc2_.descriptionText,this.DESCRIPTION_LABEL_PREFIX + currentVehicle.name);
      }
      _loc2_.options._y = _loc2_.optionsHeaderText._y + _loc2_.optionsHeaderText._height + 5;
      var _loc5_ = !_loc2_.options._visible?_loc2_.optionsHeaderText._y:_loc2_.options._y + _loc2_.options._height + 18;
      if(currentVehicle.buyItNow)
      {
         var _loc3_ = 1;
         while(_loc3_ <= _loc4_)
         {
            _loc2_["BUYITNOWSTOCK_A" + _loc3_]._y = _loc5_;
            _loc3_ = _loc3_ + 1;
         }
         if(currentVehicle.secondaryPrice > 0)
         {
            _loc5_ = _loc5_ + (_loc2_.BUYITNOWSTOCK_1._height + 10);
         }
         _loc3_ = 1;
         while(_loc3_ <= _loc4_)
         {
            _loc2_["BUYITNOWSTOCK_B" + _loc3_]._y = _loc5_;
            _loc3_ = _loc3_ + 1;
         }
         _loc5_ = _loc5_ + (_loc2_.BUYITNOWSTOCK_1._height + 10);
      }
      _loc2_.descriptionText._y = _loc5_;
      _loc2_.statsHeaderText._y = _loc2_.descriptionText._y + _loc2_.descriptionText._height + 16;
      _loc2_.stats._y = _loc2_.statsHeaderText._y + _loc2_.statsHeaderText._height + 5;
      var _loc8_ = _loc2_.stats._y + _loc2_.stats._height + 20;
      var _loc7_ = 0;
      if(_loc8_ > _loc2_.subHeader._y)
      {
         _loc7_ = _loc8_ - _loc2_.subHeader._y;
         _loc2_.subHeader._y = _loc2_.subHeader._y + _loc7_;
         _loc2_.priceSortButton._y = _loc2_.priceSortButton._y + _loc7_;
         _loc2_.filterDropDown._y = _loc2_.filterDropDown._y + _loc7_;
      }
      this.initVehicleButtons(_loc2_,this.DETAILS_PAGE_VEHICLE_BUTTON_OFFSET + _loc7_);
      this.initSortingButtons(_loc2_,2 * _loc4_);
      this.dataTextScope.push(_loc2_.PAGE1.btnTxt);
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      this.currentPageInitialised = true;
   }
   function initNormalPriceButtons(page, numOptions)
   {
      var _loc2_ = undefined;
      var _loc5_ = page.BUYITNOWSTOCK_1;
      var _loc3_ = numOptions - 1;
      while(_loc3_ >= 0)
      {
         _loc2_ = _loc5_.duplicateMovieClip("BUYITNOWSTOCK_A" + (_loc3_ + 1),page.getNextHighestDepth(),{_x:_loc5_._x,_y:_loc5_._y});
         _loc2_._visible = _loc3_ == 0;
         _loc2_.onColour = this.purchaseButtonOnColour;
         _loc2_.offColour = this.purchaseButtonOffColour;
         _loc2_.disabled = numOptions > 1;
         _loc2_._alpha = numOptions <= 1?100:50;
         if(this.currentVehicle.secondaryPrice > 0)
         {
            _loc2_.onColour = this.purchaseButtonOffColour;
            _loc2_.offColour = this.purchaseButtonOffColour;
            _loc2_._alpha = 50;
            var _loc6_ = _loc2_._width;
            if(this.currentVehicle.salePrice != undefined && this.currentVehicle.salePrice > 0 && this.currentVehicle.salePrice != this.currentVehicle.price)
            {
               _loc2_.originalPriceText.text = this.formatPrice(this.currentVehicle.price);
               _loc2_.priceText.text = this.formatPrice(this.currentVehicle.salePrice);
               var _loc7_ = _loc2_.originalPriceText.textWidth + _loc2_.priceText.textWidth + 10;
               _loc2_.originalPriceText.autoSize = "left";
               _loc2_.priceText.autoSize = "left";
               _loc2_.originalPriceText._x = 0.5 * (_loc6_ - _loc7_);
               _loc2_.originalPriceText._y = _loc2_.priceText._y + 5;
               _loc2_.priceText._x = _loc2_.originalPriceText._x + _loc2_.originalPriceText.textWidth + 10;
               _loc2_.reductionLine._x = _loc2_.originalPriceText._x + _loc2_.originalPriceText._width;
               _loc2_.reductionLine._y = _loc2_.originalPriceText._y + 7;
               _loc2_.reductionLine._width = _loc2_.originalPriceText._width;
            }
            else
            {
               _loc2_.priceText.text = this.formatPrice(this.currentVehicle.price);
               _loc2_.reductionLine._visible = false;
            }
            _loc2_.padlock._visible = !this.currentVehicle.price1Unlocked;
            this.setLocalisedText(_loc2_.buyItNowText,"SSSA_NORMAL_PRICE");
            _loc2_.disabled = numOptions > 1;
         }
         else
         {
            _loc2_._visible = false;
            page.buyItNowText._visible = false;
         }
         this.dataTextScope.unshift(_loc2_.btnTxt);
         _loc3_ = _loc3_ - 1;
      }
      _loc5_._visible = false;
   }
   function initBuyItNowPriceButtons(page, numOptions)
   {
      var _loc2_ = undefined;
      var _loc5_ = page.BUYITNOWSTOCK_2;
      var _loc3_ = numOptions - 1;
      while(_loc3_ >= 0)
      {
         _loc2_ = _loc5_.duplicateMovieClip("BUYITNOWSTOCK_B" + (_loc3_ + 1),page.getNextHighestDepth(),{_x:_loc5_._x,_y:_loc5_._y});
         _loc2_._visible = _loc3_ == 0;
         _loc2_.onColour = this.purchaseButtonOnColour;
         _loc2_.offColour = this.purchaseButtonOffColour;
         _loc2_.disabled = numOptions > 1;
         _loc2_._alpha = numOptions <= 1?100:50;
         _loc2_.onColour = this.purchaseButtonOffColour;
         _loc2_.offColour = this.purchaseButtonOffColour;
         _loc2_._alpha = 50;
         var _loc6_ = _loc2_._width;
         if(this.currentVehicle.secondarySalePrice != undefined && this.currentVehicle.secondarySalePrice > 0 && this.currentVehicle.secondarySalePrice != this.currentVehicle.secondaryPrice)
         {
            _loc2_.originalPriceText.text = this.formatPrice(this.currentVehicle.secondaryPrice);
            _loc2_.priceText.text = this.formatPrice(this.currentVehicle.secondarySalePrice);
            var _loc7_ = _loc2_.originalPriceText.textWidth + _loc2_.priceText.textWidth + 10;
            _loc2_.originalPriceText.autoSize = "left";
            _loc2_.priceText.autoSize = "left";
            _loc2_.originalPriceText._x = 0.5 * (_loc6_ - _loc7_);
            _loc2_.originalPriceText._y = _loc2_.priceText._y + 5;
            _loc2_.priceText._x = _loc2_.originalPriceText._x + _loc2_.originalPriceText.textWidth + 10;
            _loc2_.reductionLine._x = _loc2_.originalPriceText._x + _loc2_.originalPriceText._width;
            _loc2_.reductionLine._y = _loc2_.originalPriceText._y + 7;
            _loc2_.reductionLine._width = _loc2_.originalPriceText._width;
         }
         else
         {
            _loc2_.priceText.text = this.formatPrice(this.currentVehicle.secondaryPrice);
            _loc2_.reductionLine._visible = false;
         }
         _loc2_.padlock._visible = !this.currentVehicle.price2Unlocked;
         this.setLocalisedText(_loc2_.buyItNowText,"SSSA_BIN_PRICE");
         _loc2_.disabled = numOptions > 1;
         this.dataTextScope.unshift(_loc2_.btnTxt);
         _loc3_ = _loc3_ - 1;
      }
      _loc5_._visible = false;
   }
}
