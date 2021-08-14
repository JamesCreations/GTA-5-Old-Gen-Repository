class com.rockstargames.gtav.web.foreclosures.Hangar
{
   static var ID = 0;
   static var NAME = 1;
   static var TYPE = 2;
   static var X = 3;
   static var Y = 4;
   static var TXD = 5;
   static var DESCRIPTION = 6;
   static var ADDRESS = 7;
   static var BASE_COST = 8;
   static var STYLE_COST_RANGE = [9,17];
   static var LIGHTING_COST_RANGE = [18,41];
   static var DECAL_COST_RANGE = [42,50];
   static var FURNITURE_COST_RANGE = [51,53];
   static var QUARTERS_COST_RANGE = [54,55];
   static var WORKSHOP_COST_RANGE = [56,56];
   static var BASE_SALE_COST = 57;
   static var STYLE_SALE_COST_RANGE = [58,66];
   static var LIGHTING_SALE_COST_RANGE = [67,90];
   static var DECAL_SALE_COST_RANGE = [91,99];
   static var FURNITURE_SALE_COST_RANGE = [100,102];
   static var QUARTERS_SALE_COST_RANGE = [103,104];
   static var WORKSHOP_SALE_COST_RANGE = [105,105];
   static var LIGHTING_INDEXES_BY_STYLE = [0,2,4,6,8,10,12,16,20];
   static var NUM_LIGHTING_OPTIONS_BY_STYLE = [2,2,2,2,2,2,4,4,4];
   static var MAP_COORD_SCALE = 0.3415;
   static var MAP_ORIGIN_X = 1415.5;
   static var MAP_ORIGIN_Y = 2774;
   function Hangar(data, _isOwned)
   {
      this._id = data[com.rockstargames.gtav.web.foreclosures.Hangar.ID];
      this._name = data[com.rockstargames.gtav.web.foreclosures.Hangar.NAME];
      this._type = data[com.rockstargames.gtav.web.foreclosures.Hangar.TYPE];
      this._address = data[com.rockstargames.gtav.web.foreclosures.Hangar.ADDRESS];
      this._description = data[com.rockstargames.gtav.web.foreclosures.Hangar.DESCRIPTION];
      this._x = data[com.rockstargames.gtav.web.foreclosures.Hangar.X] * com.rockstargames.gtav.web.foreclosures.Hangar.MAP_COORD_SCALE + com.rockstargames.gtav.web.foreclosures.Hangar.MAP_ORIGIN_X;
      this._y = data[com.rockstargames.gtav.web.foreclosures.Hangar.Y] * (- com.rockstargames.gtav.web.foreclosures.Hangar.MAP_COORD_SCALE) + com.rockstargames.gtav.web.foreclosures.Hangar.MAP_ORIGIN_Y;
      this._txd = data[com.rockstargames.gtav.web.foreclosures.Hangar.TXD];
      this._isOwned = _isOwned;
      this.baseCost = data[com.rockstargames.gtav.web.foreclosures.Hangar.BASE_COST];
      this.baseSaleCost = data[com.rockstargames.gtav.web.foreclosures.Hangar.BASE_SALE_COST];
      this.styleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Hangar.STYLE_COST_RANGE);
      this.lightingCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Hangar.LIGHTING_COST_RANGE);
      this.decalCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Hangar.DECAL_COST_RANGE);
      this.furnitureCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Hangar.FURNITURE_COST_RANGE);
      this.quartersCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Hangar.QUARTERS_COST_RANGE,true);
      this.workshopCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Hangar.WORKSHOP_COST_RANGE,true);
      this.styleSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Hangar.STYLE_SALE_COST_RANGE);
      this.lightingSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Hangar.LIGHTING_SALE_COST_RANGE);
      this.decalSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Hangar.DECAL_SALE_COST_RANGE);
      this.furnitureSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Hangar.FURNITURE_SALE_COST_RANGE);
      this.quartersSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Hangar.QUARTERS_SALE_COST_RANGE,true);
      this.workshopSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Hangar.WORKSHOP_SALE_COST_RANGE,true);
   }
   function setupCosts(data, indexes, prefixZero)
   {
      var _loc3_ = !prefixZero?[]:[0];
      var _loc1_ = indexes[0];
      while(_loc1_ <= indexes[1])
      {
         _loc3_.push(data[_loc1_]);
         _loc1_ = _loc1_ + 1;
      }
      return _loc3_;
   }
   function __get__id()
   {
      return this._id;
   }
   function __get__name()
   {
      return this._name;
   }
   function __get__address()
   {
      return this._address;
   }
   function __get__type()
   {
      return this._type;
   }
   function __get__description()
   {
      return this._description;
   }
   function __get__x()
   {
      return this._x;
   }
   function __get__y()
   {
      return this._y;
   }
   function __get__txd()
   {
      return this._txd;
   }
   function __get__isOwned()
   {
      return this._isOwned;
   }
   function playerHasPurchased()
   {
      this._isOwned = true;
   }
   function playerHasSold()
   {
      this._isOwned = false;
   }
   function getBaseCost()
   {
      return this.baseCost;
   }
   function getBaseSaleCost()
   {
      return !(this.baseSaleCost == undefined || this.baseSaleCost < 0)?this.baseSaleCost:0;
   }
   function getBaseBestCost()
   {
      return this.getBestPrice(this.baseCost,this.baseSaleCost);
   }
   function getDecalCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.decalCosts,selection,purchasedSelection);
   }
   function getDecalSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.decalSaleCosts,selection,purchasedSelection);
   }
   function getDecalBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.decalCosts[selection],this.decalSaleCosts[selection]);
   }
   function getStyleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.styleCosts,selection,purchasedSelection);
   }
   function getStyleSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.styleSaleCosts,selection,purchasedSelection);
   }
   function getStyleBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.styleCosts[selection],this.styleSaleCosts[selection]);
   }
   function getLightingCost(selection, purchasedSelection, styleSelection, purchasedStyleSelection)
   {
      if(selection > -1)
      {
         selection = com.rockstargames.gtav.web.foreclosures.Hangar.getAbsoluteLightingIndex(styleSelection,selection);
      }
      if(purchasedSelection > -1)
      {
         purchasedSelection = com.rockstargames.gtav.web.foreclosures.Hangar.getAbsoluteLightingIndex(purchasedStyleSelection,purchasedSelection);
      }
      return this.getPositivePrice(this.lightingCosts,selection,purchasedSelection);
   }
   function getLightingSaleCost(selection, purchasedSelection, styleSelection, purchasedStyleSelection)
   {
      if(selection > -1)
      {
         selection = com.rockstargames.gtav.web.foreclosures.Hangar.getAbsoluteLightingIndex(styleSelection,selection);
      }
      if(purchasedSelection > -1)
      {
         purchasedSelection = com.rockstargames.gtav.web.foreclosures.Hangar.getAbsoluteLightingIndex(purchasedStyleSelection,purchasedSelection);
      }
      return this.getPositivePrice(this.lightingSaleCosts,selection,purchasedSelection);
   }
   function getLightingBestCost(selection, purchasedSelection, styleSelection, purchasedStyleSelection)
   {
      if(selection > -1)
      {
         selection = com.rockstargames.gtav.web.foreclosures.Hangar.getAbsoluteLightingIndex(styleSelection,selection);
      }
      if(purchasedSelection > -1)
      {
         purchasedSelection = com.rockstargames.gtav.web.foreclosures.Hangar.getAbsoluteLightingIndex(purchasedStyleSelection,purchasedSelection);
      }
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.lightingCosts[selection],this.lightingSaleCosts[selection]);
   }
   function getQuartersCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.quartersCosts,selection,purchasedSelection);
   }
   function getQuartersSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.quartersSaleCosts,selection,purchasedSelection);
   }
   function getQuartersBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.quartersCosts[selection],this.quartersSaleCosts[selection]);
   }
   function getFurnitureCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.furnitureCosts,selection,purchasedSelection);
   }
   function getFurnitureSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.furnitureSaleCosts,selection,purchasedSelection);
   }
   function getFurnitureBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.furnitureCosts[selection],this.furnitureSaleCosts[selection]);
   }
   function getWorkshopCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.workshopCosts,selection,purchasedSelection);
   }
   function getWorkshopSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.workshopSaleCosts,selection,purchasedSelection);
   }
   function getWorkshopBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.workshopCosts[selection],this.workshopSaleCosts[selection]);
   }
   function getBestPrice(normalPrice, salePrice)
   {
      if(normalPrice == undefined)
      {
         normalPrice = 0;
      }
      if(salePrice == undefined)
      {
         salePrice = 0;
      }
      return !(salePrice > 0 && salePrice < normalPrice)?normalPrice:salePrice;
   }
   function getPositivePrice(prices, index, purchasedSelection)
   {
      if(this._isOwned && index == purchasedSelection)
      {
         return 0;
      }
      if(index == undefined || index < 0 || index >= prices.length)
      {
         return 0;
      }
      return prices[index] >= 0?prices[index]:0;
   }
   static function getAbsoluteLightingIndex(style, lighting)
   {
      if(style < 0)
      {
         style = 0;
      }
      if(lighting < 0)
      {
         lighting = 0;
      }
      return com.rockstargames.gtav.web.foreclosures.Hangar.LIGHTING_INDEXES_BY_STYLE[style] + lighting;
   }
   static function getRelativeLightingIndex(style, lighting)
   {
      if(style < 0)
      {
         style = 0;
      }
      if(lighting < 0)
      {
         lighting = 0;
      }
      return lighting % com.rockstargames.gtav.web.foreclosures.Hangar.LIGHTING_INDEXES_BY_STYLE[style];
   }
   static function getNumLightingOptions(style)
   {
      if(style < 0)
      {
         style = 0;
      }
      return com.rockstargames.gtav.web.foreclosures.Hangar.NUM_LIGHTING_OPTIONS_BY_STYLE[style];
   }
}
