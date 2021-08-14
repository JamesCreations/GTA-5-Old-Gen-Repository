class com.rockstargames.gtav.levelDesign.bikerBusinesses.Business
{
   static var TYPE_DOCS = 0;
   static var TYPE_WEED = 1;
   static var TYPE_CASH = 2;
   static var TYPE_METH = 3;
   static var TYPE_CRACK = 4;
   static var TYPES = ["BIKEBIZ_DOCS","BIKEBIZ_WEED","BIKEBIZ_CASH","BIKEBIZ_METH","BIKEBIZ_CRACK"];
   static var DESCS = ["BIKEBIZ_DOCS2","BIKEBIZ_WEED2","BIKEBIZ_CASH2","BIKEBIZ_METH2","BIKEBIZ_CRACK2"];
   static var STATUS_UNOWNED = 0;
   static var STATUS_ACTIVE = 1;
   static var STATUS_PENDING_RESTART = 2;
   static var STATUS_SUSPENDED = 3;
   static var STATUS_NOT_SET_UP = 4;
   static var STATUSES = ["BIKEBIZ_STATUS_UNOWNED","BIKEBIZ_STATUS_ACTIVE","BIKEBIZ_STATUS_RESTART","BIKEBIZ_STATUS_SUSPENDED","BIKEBIZ_STATUS_NOT_SET_UP"];
   static var SELL_SMALL = 0;
   static var SELL_MEDIUM = 1;
   static var SELL_ALL = 2;
   function Business(_id, _type, _txd, _location, _description, _status, _price, _salePrice, _stockLevel, _stockValue, _suppliesLevel, _canResupply, _totalSales, _timesRaided, _successfulSales, _resupplyButtonEnabled, _resupplyCost, _resupplySaleCost)
   {
      this._upgrades = [];
      this._buyers = [];
      this._id = _id;
      this._type = _type;
      this._txd = _txd;
      this._location = _location;
      this._description = _description;
      this._status = _status;
      this._price = _salePrice < 0?_price:_salePrice;
      this._originalPrice = _price;
      this._salePrice = _salePrice;
      this._stockLevel = _stockLevel;
      this._stockValue = _stockValue;
      this._suppliesLevel = _suppliesLevel;
      this._canResupply = _canResupply;
      this._totalSales = _totalSales;
      this._timesRaided = _timesRaided;
      this._successfulSales = _successfulSales;
      this._resupplyButtonEnabled = _resupplyButtonEnabled;
      this._resupplyCost = _resupplyCost;
      this._resupplySaleCost = _resupplySaleCost != undefined?_resupplySaleCost:-1;
   }
   function setStats(_resupplySuccess, _sellSuccessLS, _sellSuccessBC, _ceasedSupplies, _ceasedCapacity)
   {
      this._resupplySuccess = _resupplySuccess;
      this._sellSuccessLS = _sellSuccessLS;
      this._sellSuccessBC = _sellSuccessBC;
      this._ceasedSupplies = _ceasedSupplies;
      this._ceasedCapacity = _ceasedCapacity;
   }
   function addUpgrade(index, description, price, txd, salePrice)
   {
      if(salePrice == undefined)
      {
         salePrice = -1;
      }
      this._upgrades[index - 1] = {description:description,price:price,salePrice:salePrice,txd:txd,isEnabled:true};
   }
   function removeUpgrade(index)
   {
      delete this._upgrades.index - 1;
   }
   function setUpgradeStatus(index, isEnabled)
   {
      if(this._upgrades[index - 1])
      {
         this._upgrades[index - 1].isEnabled = isEnabled;
      }
   }
   function addBuyer(index, buyerName, amount, price)
   {
      this._buyers[index - 1] = {buyerName:buyerName,amount:amount,price:price,isEnabled:true};
   }
   function removeBuyer(index)
   {
      delete this._buyers.index - 1;
   }
   function setBuyerStatus(index, isEnabled)
   {
      if(this._buyers[index - 1])
      {
         this._buyers[index - 1].isEnabled = isEnabled;
      }
   }
   function __get__id()
   {
      return this._id;
   }
   function __get__type()
   {
      return this._type;
   }
   function __get__txd()
   {
      return this._txd;
   }
   function __get__location()
   {
      return this._location;
   }
   function __get__description()
   {
      return this._description;
   }
   function __get__status()
   {
      return this._status;
   }
   function __get__price()
   {
      return this._price;
   }
   function __get__originalPrice()
   {
      return this._originalPrice;
   }
   function __get__salePrice()
   {
      return this._salePrice;
   }
   function __get__stockLevel()
   {
      return this._stockLevel;
   }
   function __get__stockValue()
   {
      return this._stockValue;
   }
   function __get__suppliesLevel()
   {
      return this._suppliesLevel;
   }
   function __get__canResupply()
   {
      return this._canResupply;
   }
   function __get__totalSales()
   {
      return this._totalSales;
   }
   function __get__timesRaided()
   {
      return this._timesRaided;
   }
   function __get__successfulSales()
   {
      return this._successfulSales;
   }
   function __get__resupplyButtonEnabled()
   {
      return this._resupplyButtonEnabled;
   }
   function __get__resupplyCost()
   {
      return this._resupplyCost;
   }
   function __get__resupplySaleCost()
   {
      return this._resupplySaleCost;
   }
   function __get__resupplySuccess()
   {
      return this._resupplySuccess;
   }
   function __get__sellSuccessLS()
   {
      return this._sellSuccessLS;
   }
   function __get__sellSuccessBC()
   {
      return this._sellSuccessBC;
   }
   function __get__ceasedSupplies()
   {
      return this._ceasedSupplies;
   }
   function __get__ceasedCapacity()
   {
      return this._ceasedCapacity;
   }
   function __get__isOwned()
   {
      return this._status != com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.STATUS_UNOWNED;
   }
   function getUpgrade(index)
   {
      return this._upgrades[index];
   }
   function getBuyer(index)
   {
      return this._buyers[index];
   }
}
