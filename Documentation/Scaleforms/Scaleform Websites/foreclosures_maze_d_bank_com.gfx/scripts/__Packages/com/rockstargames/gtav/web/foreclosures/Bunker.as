class com.rockstargames.gtav.web.foreclosures.Bunker
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
   static var STYLE_1_COST = 9;
   static var STYLE_2_COST = 10;
   static var STYLE_3_COST = 11;
   static var QUARTERS_COST = 12;
   static var FIRING_RANGE_1_COST = 13;
   static var FIRING_RANGE_2_COST = 14;
   static var GUN_LOCKER_COST = 15;
   static var TRANSPORTATION_1_COST = 16;
   static var TRANSPORTATION_2_COST = 17;
   static var BASE_SALE_COST = 18;
   static var STYLE_1_SALE_COST = 19;
   static var STYLE_2_SALE_COST = 20;
   static var STYLE_3_SALE_COST = 21;
   static var QUARTERS_SALE_COST = 22;
   static var FIRING_RANGE_1_SALE_COST = 23;
   static var FIRING_RANGE_2_SALE_COST = 24;
   static var GUN_LOCKER_SALE_COST = 25;
   static var TRANSPORTATION_1_SALE_COST = 26;
   static var TRANSPORTATION_2_SALE_COST = 27;
   static var MAP_COORD_SCALE = 0.3415;
   static var MAP_ORIGIN_X = 1415.5;
   static var MAP_ORIGIN_Y = 2774;
   function Bunker(data, _isOwned)
   {
      this._id = data[com.rockstargames.gtav.web.foreclosures.Bunker.ID];
      this._name = data[com.rockstargames.gtav.web.foreclosures.Bunker.NAME];
      this._type = data[com.rockstargames.gtav.web.foreclosures.Bunker.TYPE];
      this._address = data[com.rockstargames.gtav.web.foreclosures.Bunker.ADDRESS];
      this._description = data[com.rockstargames.gtav.web.foreclosures.Bunker.DESCRIPTION];
      this._x = data[com.rockstargames.gtav.web.foreclosures.Bunker.X] * com.rockstargames.gtav.web.foreclosures.Bunker.MAP_COORD_SCALE + com.rockstargames.gtav.web.foreclosures.Bunker.MAP_ORIGIN_X;
      this._y = data[com.rockstargames.gtav.web.foreclosures.Bunker.Y] * (- com.rockstargames.gtav.web.foreclosures.Bunker.MAP_COORD_SCALE) + com.rockstargames.gtav.web.foreclosures.Bunker.MAP_ORIGIN_Y;
      this._txd = data[com.rockstargames.gtav.web.foreclosures.Bunker.TXD];
      this._isOwned = _isOwned;
      this.baseCost = data[com.rockstargames.gtav.web.foreclosures.Bunker.BASE_COST];
      this.styleCosts = [data[com.rockstargames.gtav.web.foreclosures.Bunker.STYLE_1_COST],data[com.rockstargames.gtav.web.foreclosures.Bunker.STYLE_2_COST],data[com.rockstargames.gtav.web.foreclosures.Bunker.STYLE_3_COST]];
      this.quartersCost = data[com.rockstargames.gtav.web.foreclosures.Bunker.QUARTERS_COST];
      this.firingRangeCosts = [0,data[com.rockstargames.gtav.web.foreclosures.Bunker.FIRING_RANGE_1_COST],data[com.rockstargames.gtav.web.foreclosures.Bunker.FIRING_RANGE_2_COST]];
      this.gunLockerCost = data[com.rockstargames.gtav.web.foreclosures.Bunker.GUN_LOCKER_COST];
      this.transportationCosts = [0,data[com.rockstargames.gtav.web.foreclosures.Bunker.TRANSPORTATION_1_COST],data[com.rockstargames.gtav.web.foreclosures.Bunker.TRANSPORTATION_2_COST]];
      this.baseSaleCost = data[com.rockstargames.gtav.web.foreclosures.Bunker.BASE_SALE_COST];
      this.styleSaleCosts = [data[com.rockstargames.gtav.web.foreclosures.Bunker.STYLE_1_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Bunker.STYLE_2_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Bunker.STYLE_3_SALE_COST]];
      this.quartersSaleCost = data[com.rockstargames.gtav.web.foreclosures.Bunker.QUARTERS_SALE_COST];
      this.firingRangeSaleCosts = [0,data[com.rockstargames.gtav.web.foreclosures.Bunker.FIRING_RANGE_1_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Bunker.FIRING_RANGE_2_SALE_COST]];
      this.gunLockerSaleCost = data[com.rockstargames.gtav.web.foreclosures.Bunker.GUN_LOCKER_SALE_COST];
      this.transportationSaleCosts = [0,data[com.rockstargames.gtav.web.foreclosures.Bunker.TRANSPORTATION_1_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Bunker.TRANSPORTATION_2_SALE_COST]];
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
   function getQuartersCost()
   {
      return this.quartersCost;
   }
   function getQuartersSaleCost()
   {
      return !(this.quartersSaleCost == undefined || this.quartersSaleCost < 0)?this.quartersSaleCost:0;
   }
   function getQuartersBestCost()
   {
      return this.getBestPrice(this.quartersCost,this.quartersSaleCost);
   }
   function getFiringRangeCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.firingRangeCosts,selection,purchasedSelection);
   }
   function getFiringRangeSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.firingRangeSaleCosts,selection,purchasedSelection);
   }
   function getFiringRangeBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.firingRangeCosts[selection],this.firingRangeSaleCosts[selection]);
   }
   function getGunLockerCost()
   {
      return this.gunLockerCost;
   }
   function getGunLockerSaleCost()
   {
      return !(this.gunLockerSaleCost == undefined || this.gunLockerSaleCost < 0)?this.gunLockerSaleCost:0;
   }
   function getGunLockerBestCost()
   {
      return this.getBestPrice(this.gunLockerCost,this.gunLockerSaleCost);
   }
   function getTransportationCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.transportationCosts,selection,purchasedSelection);
   }
   function getTransportationSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.transportationSaleCosts,selection,purchasedSelection);
   }
   function getTransportationBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.transportationCosts[selection],this.transportationSaleCosts[selection]);
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
}
