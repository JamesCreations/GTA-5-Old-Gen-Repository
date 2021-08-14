class com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM extends com.rockstargames.ui.core.BaseWebsite
{
   static var PAGES = {SPLASH_PAGE:{name:"PAGE1",pageClass:com.rockstargames.gtav.web.foreclosures.SplashPage},MAP_PAGE:{name:"PROPERTIES",pageClass:com.rockstargames.gtav.web.foreclosures.MapPage},STYLE_PAGE:{name:"STYLE",pageClass:com.rockstargames.gtav.web.foreclosures.StylePage},MURAL_PAGE:{name:"MURAL",pageClass:com.rockstargames.gtav.web.foreclosures.MuralPage},NAME_PAGE:{name:"CLUB_D_NAME",pageClass:com.rockstargames.gtav.web.foreclosures.NamePage},GUN_LOCKER_PAGE:{name:"GUN_D_LOCKER",pageClass:com.rockstargames.gtav.web.foreclosures.GunLockerPage},BIKE_SHOP_PAGE:{name:"BIKE_D_SHOP",pageClass:com.rockstargames.gtav.web.foreclosures.BikeShopPage},SUMMARY_PAGE:{name:"SUMMARY",pageClass:com.rockstargames.gtav.web.foreclosures.SummaryPage},PURCHASE_PAGE:{name:"PURCHASE",pageClass:com.rockstargames.gtav.web.foreclosures.PurchasePage},SUCCESS_PAGE:{name:"PURCHASE_D_SUCCESS",pageClass:com.rockstargames.gtav.web.foreclosures.PurchasePage},FAILED_PAGE:{name:"PURCHASE_D_FAILED",pageClass:com.rockstargames.gtav.web.foreclosures.PurchasePage},ERROR_PAGE:{name:"PURCHASE_D_ERROR",pageClass:com.rockstargames.gtav.web.foreclosures.PurchasePage},WAYPOINT_SET:{name:"WAYPOINT_D_SET",pageClass:com.rockstargames.gtav.web.foreclosures.PurchasePage},UNDER_CONSTRUCTION_PAGE:{name:"UNDER_CONSTRUCTION",pageClass:com.rockstargames.gtav.web.foreclosures.UnderConstructionPage},EMBLEM_PAGE:{name:"CLUB_D_EMBLEM",pageClass:com.rockstargames.gtav.web.foreclosures.EmblemPage},BUNKER_STYLE_PAGE:{name:"BUNKER_D_STYLE",pageClass:com.rockstargames.gtav.web.foreclosures.BunkerStylePage},BUNKER_QUARTERS_PAGE:{name:"PERSONAL_D_QUARTERS",pageClass:com.rockstargames.gtav.web.foreclosures.PersonalQuartersPage},BUNKER_FIRING_RANGE_PAGE:{name:"SHOOTING_D_RANGE",pageClass:com.rockstargames.gtav.web.foreclosures.FiringRangePage},BUNKER_GUN_LOCKER_PAGE:{name:"BUNKER_D_GUN_D_LOCKER",pageClass:com.rockstargames.gtav.web.foreclosures.BunkerGunLockerPage},BUNKER_TRANSPORTATION_PAGE:{name:"TRANSPORTATION",pageClass:com.rockstargames.gtav.web.foreclosures.TransportationPage},BUNKER_SUMMARY_PAGE:{name:"BUNKER_D_SUMMARY",pageClass:com.rockstargames.gtav.web.foreclosures.BunkerSummaryPage},HANGAR_FLOORING_PAGE:{name:"HANGAR_D_FLOORING",pageClass:com.rockstargames.gtav.web.foreclosures.HangarFlooringPage},HANGAR_STYLE_PAGE:{name:"HANGAR_D_STYLE",pageClass:com.rockstargames.gtav.web.foreclosures.HangarStylePage},HANGAR_LIGHTING_PAGE:{name:"HANGAR_D_LIGHTING",pageClass:com.rockstargames.gtav.web.foreclosures.HangarLightingPage},HANGAR_QUARTERS_PAGE:{name:"HANGAR_D_QUARTERS",pageClass:com.rockstargames.gtav.web.foreclosures.HangarQuartersPage},HANGAR_FURNITURE_PAGE:{name:"HANGAR_D_FURNITURE",pageClass:com.rockstargames.gtav.web.foreclosures.HangarFurniturePage},HANGAR_WORKSHOP_PAGE:{name:"HANGAR_D_WORKSHOP",pageClass:com.rockstargames.gtav.web.foreclosures.HangarWorkshopPage},HANGAR_SUMMARY_PAGE:{name:"HANGAR_D_SUMMARY",pageClass:com.rockstargames.gtav.web.foreclosures.HangarSummaryPage}};
   static var OWNED_BUNKER_DATA_INDEX = 15;
   static var OWNED_HANGAR_DATA_INDEX = 47;
   function FORECLOSURES_MAZE_D_BANK_COM()
   {
      super();
      _global.gfxExtensions = true;
      this.defaultButtonOnColour = 3355443;
      this.defaultButtonOffColour = 0;
      this.isInBunkerFlow = false;
      this.isInHangarFlow = false;
      this.setSelectedClubhouse(-1);
      this.setSelectedBunker(-1);
      this.setSelectedHangar(-1);
   }
   function POPULATE_TEXT(pageName, searchArgs, newPage)
   {
      this.CONTENT._y = 0;
      this.browser.SUPRESS_HISTORY(false);
      if(this.currPage.__get__name() == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.MAP_PAGE.name)
      {
         this.clubhouses.length = 0;
         this.bunkers.length = 0;
         this.hangars.length = 0;
         var _loc2_ = 3;
         var _loc3_ = this.dataProviderUI.length;
         while(_loc2_ < _loc3_)
         {
            if(!(_loc2_ == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.OWNED_BUNKER_DATA_INDEX || _loc2_ == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.OWNED_HANGAR_DATA_INDEX))
            {
               if(this.dataProviderUI[_loc2_])
               {
                  var _loc5_ = this.dataProviderUI[_loc2_][2] < 2;
                  var _loc4_ = this.dataProviderUI[_loc2_][2] == 2;
                  var _loc6_ = this.dataProviderUI[_loc2_][2] == 3;
                  if(_loc5_)
                  {
                     var _loc7_ = this.dataProviderUI[_loc2_][0] == this.dataProviderUI[0][0];
                     this.clubhouses.push(new com.rockstargames.gtav.web.foreclosures.Clubhouse(this.dataProviderUI[_loc2_],_loc7_));
                  }
                  else if(_loc4_)
                  {
                     _loc7_ = this.dataProviderUI[_loc2_][0] == this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.OWNED_BUNKER_DATA_INDEX][0];
                     this.bunkers.push(new com.rockstargames.gtav.web.foreclosures.Bunker(this.dataProviderUI[_loc2_],_loc7_));
                  }
                  else if(_loc6_)
                  {
                     _loc7_ = this.dataProviderUI[_loc2_][0] == this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.OWNED_HANGAR_DATA_INDEX][0];
                     this.hangars.push(new com.rockstargames.gtav.web.foreclosures.Hangar(this.dataProviderUI[_loc2_],_loc7_));
                  }
               }
            }
            _loc2_ = _loc2_ + 1;
         }
         (com.rockstargames.gtav.web.foreclosures.MapPage)this.currPage.setMarkerData(this.clubhouses,this.bunkers,this.hangars);
      }
   }
   function displayPage(pageName)
   {
      if(this.currPage.__get__name() == pageName)
      {
         return undefined;
      }
      if(!this.isMP)
      {
         this.setPage(com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.UNDER_CONSTRUCTION_PAGE.name,com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.UNDER_CONSTRUCTION_PAGE.pageClass);
         return undefined;
      }
      loop0:
      for(var _loc3_ in com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES)
      {
         if(com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES[_loc3_].name == pageName)
         {
            this.setPage(pageName,com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES[_loc3_].pageClass);
            while(true)
            {
               if(!§§pop())
               {
                  break loop0;
               }
            }
         }
         else
         {
            continue;
         }
      }
   }
   function TXD_HAS_LOADED(txd, success, id)
   {
      this.imageManager.textureLoaded(txd);
   }
   function CLEANUP()
   {
      this.imageManager.dispose();
      this.imageManager = null;
      this.progressPanel.dispose();
      this.progressPanel = null;
      if(this.currPage)
      {
         this.currPage.dispose();
      }
      this.currPage = null;
      this.clubhouses = null;
      this.bunkers = null;
      this.hangars = null;
      this.clubhouseToMarkAsPurchased = null;
      this.bunkerToMarkAsPurchased = null;
      this.hangarToMarkAsPurchased = null;
      super.CLEANUP();
   }
   function goToAnchor(link)
   {
      var _loc2_ = link.lastIndexOf("_");
      var _loc5_ = _loc2_ != -1?link.substring(0,_loc2_):link;
      var _loc4_ = link.substring(_loc2_ + 1);
      this.currPage.handleClick(_loc5_,_loc4_);
   }
   function handleLB()
   {
      this.currPage.handleLB();
   }
   function handleRB()
   {
      this.currPage.handleRB();
   }
   function handleLT()
   {
      this.currPage.handleLT();
   }
   function handleRT()
   {
      this.currPage.handleRT();
   }
   function handleLTRelease()
   {
      this.currPage.handleLTRelease();
   }
   function handleRTRelease()
   {
      this.currPage.handleRTRelease();
   }
   function handleAnalogStickInput(isLeftStick, x, y, isScrollWheel)
   {
      this.currPage.handleAnalogStickInput(isLeftStick,x,y,isScrollWheel);
   }
   function handleMouseClick(inputIsMouseClick)
   {
      this.currPage.handleMouseClick(inputIsMouseClick);
   }
   function handleMouseRelease()
   {
      this.currPage.handleMouseRelease();
   }
   function setSelectedClubhouse(id)
   {
      this._selectedClubhouseID = id;
      if(id == this.__get__purchasedClubhouseID() && id != -1)
      {
         this.wall = this.purchasedWall;
         this.hanging = this.purchasedHanging;
         this.furniture = this.purchasedFurniture;
         this.mural = this.purchasedMural;
         this.font = this.purchasedFont;
         this.fontColour = this.purchasedFontColour;
         this.emblem = this.purchasedEmblem;
         this.hideSignage = this.purchasedHideSignage;
         this.gunLocker = this.purchasedGunLocker;
         this.bikeShop = this.purchasedBikeShop;
      }
      else
      {
         this.wall = -1;
         this.hanging = -1;
         this.furniture = -1;
         this.mural = -1;
         this.font = -1;
         this.fontColour = -1;
         this.emblem = -1;
         this.hideSignage = -1;
         this.gunLocker = -1;
         this.bikeShop = -1;
      }
   }
   function __get__selectedClubhouseID()
   {
      return this._selectedClubhouseID;
   }
   function getSelectedClubhouse()
   {
      if(this._selectedClubhouseID == -1)
      {
         return null;
      }
      return this.getClubhouseByID(this._selectedClubhouseID);
   }
   function getClubhouseByID(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.clubhouses.length;
      while(_loc2_ < _loc3_)
      {
         if(this.clubhouses[_loc2_].id == id)
         {
            return this.clubhouses[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function getSelectedClubhouseType()
   {
      if(this._selectedClubhouseID == -1)
      {
         return 0;
      }
      return this.getClubhouseByID(this._selectedClubhouseID).__get__type();
   }
   function __get__purchasedClubhouseID()
   {
      return this.dataProviderUI[0][0];
   }
   function __get__purchasedWall()
   {
      return this.dataProviderUI[0][1];
   }
   function __get__purchasedHanging()
   {
      return this.dataProviderUI[0][2];
   }
   function __get__purchasedFurniture()
   {
      return this.dataProviderUI[0][3];
   }
   function __get__purchasedMural()
   {
      return this.dataProviderUI[0][4];
   }
   function __get__purchasedFont()
   {
      return this.dataProviderUI[0][5];
   }
   function __get__purchasedFontColour()
   {
      return this.dataProviderUI[0][6];
   }
   function __get__purchasedEmblem()
   {
      return this.dataProviderUI[0][7];
   }
   function __get__purchasedHideSignage()
   {
      return this.dataProviderUI[0][8];
   }
   function __get__purchasedSignage()
   {
      return this.dataProviderUI[0][9];
   }
   function __get__signage()
   {
      return this.dataProviderUI[0][10];
   }
   function __get__purchasedGunLocker()
   {
      return this.dataProviderUI[0][11];
   }
   function __get__purchasedBikeShop()
   {
      return this.dataProviderUI[0][12];
   }
   function __get__fontsSupported()
   {
      return this.dataProviderUI[0][13];
   }
   function __get__crewEmblem()
   {
      return this.dataProviderUI[0][14];
   }
   function dispatchPlayerSelections()
   {
      if(this.wall == -1)
      {
         this.wall = 0;
      }
      if(this.hanging == -1)
      {
         this.hanging = 0;
      }
      if(this.furniture == -1)
      {
         this.furniture = 0;
      }
      if(this.mural == -1)
      {
         this.mural = 0;
      }
      if(this.font == -1)
      {
         this.font = 0;
      }
      if(this.fontColour == -1)
      {
         this.fontColour = 0;
      }
      if(this.emblem == -1)
      {
         this.emblem = this.__get__crewEmblem() != ""?0:1;
      }
      if(this.hideSignage == -1)
      {
         this.hideSignage = 0;
      }
      if(this.gunLocker == -1)
      {
         this.gunLocker = 0;
      }
      if(this.bikeShop == -1)
      {
         this.bikeShop = 0;
      }
      var _loc10_ = 6;
      var _loc13_ = 1;
      var _loc8_ = 1;
      var _loc14_ = 1;
      var _loc16_ = 4;
      var _loc11_ = 4;
      var _loc15_ = 4;
      var _loc12_ = 4;
      var _loc7_ = 1;
      var _loc9_ = 1;
      var _loc17_ = 1;
      var _loc3_ = 0;
      var _loc5_ = 0;
      var _loc6_ = 0;
      var _loc2_ = 0;
      var _loc4_ = this.clubhouses.length;
      while(_loc2_ < _loc4_)
      {
         if(this.clubhouses[_loc2_].id == this._selectedClubhouseID)
         {
            _loc6_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc5_ = _loc5_ | _loc6_ << _loc3_;
      _loc3_ = _loc3_ + _loc10_;
      _loc5_ = _loc5_ | this.wall << _loc3_;
      _loc3_ = _loc3_ + _loc13_;
      _loc5_ = _loc5_ | this.hanging << _loc3_;
      _loc3_ = _loc3_ + _loc8_;
      _loc5_ = _loc5_ | this.furniture << _loc3_;
      _loc3_ = _loc3_ + _loc14_;
      _loc5_ = _loc5_ | this.mural << _loc3_;
      _loc3_ = _loc3_ + _loc16_;
      _loc5_ = _loc5_ | this.font << _loc3_;
      _loc3_ = _loc3_ + _loc11_;
      _loc5_ = _loc5_ | this.fontColour << _loc3_;
      _loc3_ = _loc3_ + _loc15_;
      _loc5_ = _loc5_ | this.emblem << _loc3_;
      _loc3_ = _loc3_ + _loc12_;
      _loc5_ = _loc5_ | this.hideSignage << _loc3_;
      _loc3_ = _loc3_ + _loc7_;
      _loc5_ = _loc5_ | this.gunLocker << _loc3_;
      _loc3_ = _loc3_ + _loc9_;
      _loc5_ = _loc5_ | this.bikeShop << _loc3_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.CLUBHOUSE,_loc5_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("FORECLOSURES_MAZE_D_BANK_COM::PROPERTY DATA OUT");
      com.rockstargames.ui.utils.Debug.log("    [PROPERTY ID: " + this._selectedClubhouseID + "]");
      com.rockstargames.ui.utils.Debug.log("PROPERTY INDEX: " + _loc6_);
      com.rockstargames.ui.utils.Debug.log("WALL: " + this.wall);
      com.rockstargames.ui.utils.Debug.log("HANGING: " + this.hanging);
      com.rockstargames.ui.utils.Debug.log("FURNITURE: " + this.furniture);
      com.rockstargames.ui.utils.Debug.log("MURAL: " + this.mural);
      com.rockstargames.ui.utils.Debug.log("FONT: " + this.font);
      com.rockstargames.ui.utils.Debug.log("FONT COLOUR: " + this.fontColour);
      com.rockstargames.ui.utils.Debug.log("EMBLEM: " + this.emblem);
      com.rockstargames.ui.utils.Debug.log("HIDE SIGNAGE: " + this.hideSignage);
      com.rockstargames.ui.utils.Debug.log("SIGNAGE: " + this.__get__signage());
      com.rockstargames.ui.utils.Debug.log("GUN LOCKER: " + this.gunLocker);
      com.rockstargames.ui.utils.Debug.log("BIKE SHOP: " + this.bikeShop);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("BIT FIELD: " + _loc5_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
   }
   function updateNewlyPurchasedClubhouse()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.clubhouses.length)
      {
         this.clubhouses[_loc2_].playerHasSold();
         _loc2_ = _loc2_ + 1;
      }
      this.clubhouseToMarkAsPurchased.playerHasPurchased();
      this.clubhouseToMarkAsPurchased = null;
   }
   function setSelectedBunker(id)
   {
      this._selectedBunkerID = id;
      if(id == this.__get__purchasedBunkerID() && id != -1)
      {
         this.bunkerStyle = this.purchasedBunkerStyle;
         this.quarters = this.purchasedQuarters;
         this.firingRange = this.purchasedFiringRange;
         this.bunkerGunLocker = this.purchasedBunkerGunLocker;
         this.transportation = this.purchasedTransportation;
      }
      else
      {
         this.bunkerStyle = -1;
         this.quarters = -1;
         this.firingRange = -1;
         this.bunkerGunLocker = -1;
         this.transportation = -1;
      }
   }
   function __get__selectedBunkerID()
   {
      return this._selectedBunkerID;
   }
   function getSelectedBunker()
   {
      if(this._selectedBunkerID == -1)
      {
         return null;
      }
      return this.getBunkerByID(this._selectedBunkerID);
   }
   function getBunkerByID(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.bunkers.length;
      while(_loc2_ < _loc3_)
      {
         if(this.bunkers[_loc2_].id == id)
         {
            return this.bunkers[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function __get__purchasedBunkerID()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.OWNED_BUNKER_DATA_INDEX][0];
   }
   function __get__purchasedBunkerStyle()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.OWNED_BUNKER_DATA_INDEX][1];
   }
   function __get__purchasedQuarters()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.OWNED_BUNKER_DATA_INDEX][2];
   }
   function __get__purchasedFiringRange()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.OWNED_BUNKER_DATA_INDEX][3];
   }
   function __get__purchasedBunkerGunLocker()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.OWNED_BUNKER_DATA_INDEX][4];
   }
   function __get__purchasedTransportation()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.OWNED_BUNKER_DATA_INDEX][5];
   }
   function dispatchPlayerBunkerSelections()
   {
      if(this.bunkerStyle == -1)
      {
         this.bunkerStyle = 0;
      }
      if(this.quarters == -1)
      {
         this.quarters = 0;
      }
      if(this.firingRange == -1)
      {
         this.firingRange = 0;
      }
      if(this.bunkerGunLocker == -1)
      {
         this.bunkerGunLocker = 0;
      }
      if(this.transportation == -1)
      {
         this.transportation = 0;
      }
      var _loc8_ = 6;
      var _loc11_ = 2;
      var _loc12_ = 1;
      var _loc10_ = 2;
      var _loc9_ = 1;
      var _loc7_ = 2;
      var _loc4_ = 0;
      var _loc6_ = 0;
      var _loc5_ = 0;
      var _loc2_ = 0;
      var _loc3_ = this.bunkers.length;
      while(_loc2_ < _loc3_)
      {
         if(this.bunkers[_loc2_].id == this._selectedBunkerID)
         {
            _loc5_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc6_ = _loc6_ | _loc5_ << _loc4_;
      _loc4_ = _loc4_ + _loc8_;
      _loc6_ = _loc6_ | this.bunkerStyle << _loc4_;
      _loc4_ = _loc4_ + _loc11_;
      _loc6_ = _loc6_ | this.quarters << _loc4_;
      _loc4_ = _loc4_ + _loc12_;
      _loc6_ = _loc6_ | this.firingRange << _loc4_;
      _loc4_ = _loc4_ + _loc10_;
      _loc6_ = _loc6_ | this.bunkerGunLocker << _loc4_;
      _loc4_ = _loc4_ + _loc9_;
      _loc6_ = _loc6_ | this.transportation << _loc4_;
      _loc4_ = _loc4_ + _loc7_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.CLUBHOUSE,_loc6_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("FORECLOSURES_MAZE_D_BANK_COM::BUNKER DATA OUT");
      com.rockstargames.ui.utils.Debug.log("    [BUNKER ID: " + this._selectedBunkerID + "]");
      com.rockstargames.ui.utils.Debug.log("PROPERTY INDEX: " + _loc5_);
      com.rockstargames.ui.utils.Debug.log("STYLE: " + this.bunkerStyle);
      com.rockstargames.ui.utils.Debug.log("QUARTERS: " + this.quarters);
      com.rockstargames.ui.utils.Debug.log("FIRING RANGE: " + this.firingRange);
      com.rockstargames.ui.utils.Debug.log("GUN LOCKER: " + this.bunkerGunLocker);
      com.rockstargames.ui.utils.Debug.log("TRANSPORTATION: " + this.transportation);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("BIT FIELD: " + _loc6_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
   }
   function updateNewlyPurchasedBunker()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.bunkers.length)
      {
         this.bunkers[_loc2_].playerHasSold();
         _loc2_ = _loc2_ + 1;
      }
      this.bunkerToMarkAsPurchased.playerHasPurchased();
      this.bunkerToMarkAsPurchased = null;
   }
   function setSelectedHangar(id)
   {
      this._selectedHangarID = id;
      if(id == this.__get__purchasedHangarID() && id != -1)
      {
         this.hangarStyle = this.purchasedHangarStyle;
         this.hangarLighting = this.purchasedHangarLighting;
         this.hangarDecal = this.purchasedHangarDecal;
         this.hangarFurniture = this.purchasedHangarFurniture;
         this.hangarQuarters = this.purchasedHangarQuarters;
         this.hangarWorkshop = this.purchasedHangarWorkshop;
      }
      else
      {
         this.hangarStyle = -1;
         this.hangarLighting = -1;
         this.hangarDecal = -1;
         this.hangarFurniture = -1;
         this.hangarQuarters = -1;
         this.hangarWorkshop = -1;
      }
   }
   function __get__selectedHangarID()
   {
      return this._selectedHangarID;
   }
   function getSelectedHangar()
   {
      if(this._selectedHangarID == -1)
      {
         return null;
      }
      return this.getHangarByID(this._selectedHangarID);
   }
   function getHangarByID(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.hangars.length;
      while(_loc2_ < _loc3_)
      {
         if(this.hangars[_loc2_].id == id)
         {
            return this.hangars[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function __get__purchasedHangarID()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.OWNED_HANGAR_DATA_INDEX][0];
   }
   function __get__purchasedHangarStyle()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.OWNED_HANGAR_DATA_INDEX][1];
   }
   function __get__purchasedHangarLighting()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.OWNED_HANGAR_DATA_INDEX][2];
   }
   function __get__purchasedHangarDecal()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.OWNED_HANGAR_DATA_INDEX][3];
   }
   function __get__purchasedHangarFurniture()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.OWNED_HANGAR_DATA_INDEX][4];
   }
   function __get__purchasedHangarQuarters()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.OWNED_HANGAR_DATA_INDEX][5];
   }
   function __get__purchasedHangarWorkshop()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.OWNED_HANGAR_DATA_INDEX][6];
   }
   function dispatchPlayerHangarSelections()
   {
      if(this.hangarStyle == -1)
      {
         this.hangarStyle = 0;
      }
      if(this.hangarLighting == -1)
      {
         this.hangarLighting = 0;
      }
      if(this.hangarDecal == -1)
      {
         this.hangarDecal = 4;
      }
      if(this.hangarFurniture == -1)
      {
         this.hangarFurniture = 0;
      }
      if(this.hangarQuarters == -1)
      {
         this.hangarQuarters = 0;
      }
      if(this.hangarWorkshop == -1)
      {
         this.hangarWorkshop = 0;
      }
      var _loc7_ = 6;
      var _loc11_ = 4;
      var _loc10_ = 2;
      var _loc8_ = 4;
      var _loc13_ = 2;
      var _loc12_ = 2;
      var _loc9_ = 1;
      var _loc4_ = 0;
      var _loc5_ = 0;
      var _loc6_ = 0;
      var _loc2_ = 0;
      var _loc3_ = this.hangars.length;
      while(_loc2_ < _loc3_)
      {
         if(this.hangars[_loc2_].id == this._selectedHangarID)
         {
            _loc6_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc5_ = _loc5_ | _loc6_ << _loc4_;
      _loc4_ = _loc4_ + _loc7_;
      _loc5_ = _loc5_ | this.hangarStyle << _loc4_;
      _loc4_ = _loc4_ + _loc11_;
      _loc5_ = _loc5_ | this.hangarLighting << _loc4_;
      _loc4_ = _loc4_ + _loc10_;
      _loc5_ = _loc5_ | this.hangarDecal << _loc4_;
      _loc4_ = _loc4_ + _loc8_;
      _loc5_ = _loc5_ | this.hangarFurniture << _loc4_;
      _loc4_ = _loc4_ + _loc13_;
      _loc5_ = _loc5_ | this.hangarQuarters << _loc4_;
      _loc4_ = _loc4_ + _loc12_;
      _loc5_ = _loc5_ | this.hangarWorkshop << _loc4_;
      _loc4_ = _loc4_ + _loc9_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.CLUBHOUSE,_loc5_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("FORECLOSURES_MAZE_D_BANK_COM::HANGAR DATA OUT");
      com.rockstargames.ui.utils.Debug.log("    [HANGAR ID: " + this._selectedHangarID + "]");
      com.rockstargames.ui.utils.Debug.log("HANGAR INDEX: " + _loc6_);
      com.rockstargames.ui.utils.Debug.log("STYLE: " + this.hangarStyle);
      com.rockstargames.ui.utils.Debug.log("LIGHTING: " + this.hangarLighting);
      com.rockstargames.ui.utils.Debug.log("DECAL: " + this.hangarDecal);
      com.rockstargames.ui.utils.Debug.log("FURNITURE: " + this.hangarFurniture);
      com.rockstargames.ui.utils.Debug.log("QUARTERS: " + this.hangarQuarters);
      com.rockstargames.ui.utils.Debug.log("WORKSHOP: " + this.hangarWorkshop);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("BIT FIELD: " + _loc5_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
   }
   function updateNewlyPurchasedHangar()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.hangars.length)
      {
         this.hangars[_loc2_].playerHasSold();
         _loc2_ = _loc2_ + 1;
      }
      this.hangarToMarkAsPurchased.playerHasPurchased();
      this.hangarToMarkAsPurchased = null;
   }
   function showTradeInAlert()
   {
      return this.CONTENT.attachMovie("tradeInAlert","tradeInAlert",this.CONTENT.getNextHighestDepth());
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.PAGE_NAMES = [];
      this.IS_SITE_DYNAMIC = 0;
      this.browser = _level0.TIMELINE;
      this.browser.DebugTextContent = true;
      this.isMP = this.browser.player == 1;
      this.displayConfig = this.browser.getConfig();
      this.imageManager = new com.rockstargames.gtav.web.foreclosures.ImageManager();
      this.clubhouses = [];
      this.bunkers = [];
      this.hangars = [];
      this.PAGE_NAMES[1] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SPLASH_PAGE.name;
      this.PAGE_NAMES[2] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.MAP_PAGE.name;
      this.PAGE_NAMES[3] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.MURAL_PAGE.name;
      this.PAGE_NAMES[4] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.STYLE_PAGE.name;
      this.PAGE_NAMES[5] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NAME_PAGE.name;
      this.PAGE_NAMES[6] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.GUN_LOCKER_PAGE.name;
      this.PAGE_NAMES[7] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BIKE_SHOP_PAGE.name;
      this.PAGE_NAMES[8] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SUMMARY_PAGE.name;
      this.PAGE_NAMES[9] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name;
      this.PAGE_NAMES[10] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SUCCESS_PAGE.name;
      this.PAGE_NAMES[11] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.FAILED_PAGE.name;
      this.PAGE_NAMES[12] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ERROR_PAGE.name;
      this.PAGE_NAMES[13] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.WAYPOINT_SET.name;
      this.PAGE_NAMES[14] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.EMBLEM_PAGE.name;
      this.PAGE_NAMES[15] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BUNKER_STYLE_PAGE.name;
      this.PAGE_NAMES[16] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BUNKER_QUARTERS_PAGE.name;
      this.PAGE_NAMES[17] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BUNKER_FIRING_RANGE_PAGE.name;
      this.PAGE_NAMES[18] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BUNKER_GUN_LOCKER_PAGE.name;
      this.PAGE_NAMES[19] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BUNKER_TRANSPORTATION_PAGE.name;
      this.PAGE_NAMES[20] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BUNKER_SUMMARY_PAGE.name;
      this.PAGE_NAMES[21] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_FLOORING_PAGE.name;
      this.PAGE_NAMES[22] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_STYLE_PAGE.name;
      this.PAGE_NAMES[23] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_LIGHTING_PAGE.name;
      this.PAGE_NAMES[24] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_QUARTERS_PAGE.name;
      this.PAGE_NAMES[25] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_FURNITURE_PAGE.name;
      this.PAGE_NAMES[26] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_WORKSHOP_PAGE.name;
      this.PAGE_NAMES[27] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_SUMMARY_PAGE.name;
      var _loc3_ = 2;
      while(_loc3_ <= 27)
      {
         this.CAN_STORE_PAGE[_loc3_] = false;
         _loc3_ = _loc3_ + 1;
      }
      this.pageContainer = this.CONTENT.createEmptyMovieClip("pageContainer",this.CONTENT.getNextHighestDepth());
      var _loc4_ = this.CONTENT.attachMovie("progressPanel","progressPanel",this.CONTENT.getNextHighestDepth(),{_x:200});
      this.progressPanel = new com.rockstargames.gtav.web.foreclosures.ProgressPanel(_loc4_,this);
      this.header = this.CONTENT.attachMovie("websiteHeader","websiteHeader",this.CONTENT.getNextHighestDepth());
      this.header._y = - this.header._height;
      this.browser.SET_TITLEBAR_TEXT(com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.CONTENT.websiteHeader.titlebar,"FORECLOSURES_TOOLBAR_MESSAGE"),14474460);
   }
   function setPage(pageName, PageClass)
   {
      this.logState();
      if(this.currPage)
      {
         this.currPage.dispose();
      }
      this.dataTextScope.length = 0;
      var _loc2_ = this.currPage == undefined;
      this.currPage = PageClass(this,this.pageContainer,pageName,_loc2_,this.progressPanel,this.header);
   }
   function logState()
   {
      var _loc5_ = 0;
      var _loc2_ = 0;
      var _loc3_ = this.clubhouses.length;
      while(_loc2_ < _loc3_)
      {
         if(this.clubhouses[_loc2_].id == this._selectedClubhouseID)
         {
            _loc5_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      var _loc4_ = 0;
      _loc2_ = 0;
      _loc3_ = this.bunkers.length;
      while(_loc2_ < _loc3_)
      {
         if(this.bunkers[_loc2_].id == this._selectedBunkerID)
         {
            _loc4_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      var _loc6_ = 0;
      _loc2_ = 0;
      _loc3_ = this.hangars.length;
      while(_loc2_ < _loc3_)
      {
         if(this.hangars[_loc2_].id == this._selectedHangarID)
         {
            _loc6_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("CURRENT CLUBHOUSE CHOICES...");
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("    [PROPERTY ID: " + this._selectedClubhouseID + "]");
      com.rockstargames.ui.utils.Debug.log("PROPERTY INDEX: " + _loc5_);
      com.rockstargames.ui.utils.Debug.log("WALL: " + this.wall);
      com.rockstargames.ui.utils.Debug.log("HANGING: " + this.hanging);
      com.rockstargames.ui.utils.Debug.log("FURNITURE: " + this.furniture);
      com.rockstargames.ui.utils.Debug.log("MURAL: " + this.mural);
      com.rockstargames.ui.utils.Debug.log("FONT: " + this.font);
      com.rockstargames.ui.utils.Debug.log("FONT COLOUR: " + this.fontColour);
      com.rockstargames.ui.utils.Debug.log("EMBLEM: " + this.emblem);
      com.rockstargames.ui.utils.Debug.log("SIGNAGE: " + this.__get__signage());
      com.rockstargames.ui.utils.Debug.log("GUN LOCKER: " + this.gunLocker);
      com.rockstargames.ui.utils.Debug.log("BIKE SHOP: " + this.bikeShop);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("PREVIOUS CLUBHOUSE PURCHASES...");
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("PREV PROPERTY ID: " + this.__get__purchasedClubhouseID());
      com.rockstargames.ui.utils.Debug.log("PREV WALL: " + this.__get__purchasedWall());
      com.rockstargames.ui.utils.Debug.log("PREV HANGING: " + this.__get__purchasedHanging());
      com.rockstargames.ui.utils.Debug.log("PREV FURNITURE: " + this.__get__purchasedFurniture());
      com.rockstargames.ui.utils.Debug.log("PREV MURAL: " + this.__get__purchasedMural());
      com.rockstargames.ui.utils.Debug.log("PREV FONT: " + this.__get__purchasedFont());
      com.rockstargames.ui.utils.Debug.log("PREV FONT COLOUR: " + this.__get__purchasedFontColour());
      com.rockstargames.ui.utils.Debug.log("PREV SIGNAGE: \"" + this.__get__purchasedSignage() + "\"");
      com.rockstargames.ui.utils.Debug.log("PREV GUN LOCKER: " + this.__get__purchasedGunLocker());
      com.rockstargames.ui.utils.Debug.log("PREV BIKE SHOP: " + this.__get__purchasedBikeShop());
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("CURRENT BUNKER CHOICES...");
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("    [BUNKER ID: " + this._selectedBunkerID + "]");
      com.rockstargames.ui.utils.Debug.log("BUNKER INDEX: " + _loc4_);
      com.rockstargames.ui.utils.Debug.log("STYLE: " + this.bunkerStyle);
      com.rockstargames.ui.utils.Debug.log("QUARTERS: " + this.quarters);
      com.rockstargames.ui.utils.Debug.log("FIRING RANGE: " + this.firingRange);
      com.rockstargames.ui.utils.Debug.log("GUN LOCKER: " + this.bunkerGunLocker);
      com.rockstargames.ui.utils.Debug.log("TRANSPORTATION: " + this.transportation);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("PREVIOUS BUNKER PURCHASES...");
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("PREV BUNKER ID: " + this.__get__purchasedBunkerID());
      com.rockstargames.ui.utils.Debug.log("PREV STYLE: " + this.__get__purchasedBunkerStyle());
      com.rockstargames.ui.utils.Debug.log("PREV QUARTERS: " + this.__get__purchasedQuarters());
      com.rockstargames.ui.utils.Debug.log("PREV FIRING RANGE: " + this.__get__purchasedFiringRange());
      com.rockstargames.ui.utils.Debug.log("PREV GUN LOCKER: " + this.__get__purchasedBunkerGunLocker());
      com.rockstargames.ui.utils.Debug.log("PREV TRANSPORTATION: " + this.__get__purchasedTransportation());
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("CURRENT HANGAR CHOICES...");
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("    [HANGAR ID: " + this._selectedHangarID + "]");
      com.rockstargames.ui.utils.Debug.log("HANGAR INDEX: " + _loc6_);
      com.rockstargames.ui.utils.Debug.log("STYLE: " + this.hangarStyle);
      com.rockstargames.ui.utils.Debug.log("LIGHTING: " + this.hangarLighting);
      com.rockstargames.ui.utils.Debug.log("DECAL: " + this.hangarDecal);
      com.rockstargames.ui.utils.Debug.log("FURNITURE: " + this.hangarFurniture);
      com.rockstargames.ui.utils.Debug.log("QUARTERS: " + this.hangarQuarters);
      com.rockstargames.ui.utils.Debug.log("WORKSHOP: " + this.hangarWorkshop);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("PREVIOUS HANGAR PURCHASES...");
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("PREV HANGAR ID: " + this.__get__purchasedHangarID());
      com.rockstargames.ui.utils.Debug.log("PREV STYLE: " + this.__get__purchasedHangarStyle());
      com.rockstargames.ui.utils.Debug.log("PREV LIGHTING: " + this.__get__purchasedHangarLighting());
      com.rockstargames.ui.utils.Debug.log("PREV DECAL: " + this.__get__purchasedHangarDecal());
      com.rockstargames.ui.utils.Debug.log("PREV FURNITURE: " + this.__get__purchasedHangarFurniture());
      com.rockstargames.ui.utils.Debug.log("PREV QUARTERS: " + this.__get__purchasedHangarQuarters());
      com.rockstargames.ui.utils.Debug.log("PREV WORKSHOP: " + this.__get__purchasedHangarWorkshop());
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
   }
   static function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
   static function setSpacedTextField(tf, label, isLiteralLabel)
   {
      if(isLiteralLabel)
      {
         tf.text = label;
      }
      else
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(tf,label);
      }
      var _loc2_ = tf.getTextFormat();
      _loc2_.letterSpacing = 1;
      tf.setTextFormat(_loc2_);
   }
   static function formatNumber(value)
   {
      var _loc3_ = Math.abs(int(value)).toString();
      var _loc4_ = _loc3_.length;
      var _loc2_ = 0;
      var _loc1_ = _loc4_ % 3 || 3;
      var _loc5_ = (value >= 0?"":"-") + _loc3_.slice(_loc2_,_loc1_);
      while(_loc1_ < _loc4_)
      {
         _loc2_ = _loc1_;
         _loc1_ = _loc1_ + 3;
         _loc5_ = _loc5_ + ("," + _loc3_.slice(_loc2_,_loc1_));
      }
      return _loc5_;
   }
   static function delegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,arguments.concat(params));
      };
      return _loc2_;
   }
}
