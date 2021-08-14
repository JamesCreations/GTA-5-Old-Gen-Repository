class com.rockstargames.gtav.levelDesign.securoserv.Warehouse
{
   static var SIZE_ALL = -1;
   static var SIZE_SMALL = 0;
   static var SIZE_MEDIUM = 1;
   static var SIZE_LARGE = 2;
   static var MAP_COORD_SCALE = 0.3415;
   static var MAP_ORIGIN_X = 1415.5;
   static var MAP_ORIGIN_Y = 2774;
   function Warehouse(_id, _px, _py, _purchaseCost, _nameLabel, _locationLabel, _descriptionLabel, _txd, _isOwned, _size, _capacity, _amountStored, _currentValue, _specialItems, _sellCooldown, _buyCooldown, _displayOrder, _purchaseSaleCost)
   {
      this._id = _id;
      this._x = _px * com.rockstargames.gtav.levelDesign.securoserv.Warehouse.MAP_COORD_SCALE + com.rockstargames.gtav.levelDesign.securoserv.Warehouse.MAP_ORIGIN_X;
      this._y = _py * (- com.rockstargames.gtav.levelDesign.securoserv.Warehouse.MAP_COORD_SCALE) + com.rockstargames.gtav.levelDesign.securoserv.Warehouse.MAP_ORIGIN_Y;
      this._purchaseCost = _purchaseCost;
      this._name = _nameLabel;
      this._location = _locationLabel;
      this._description = _descriptionLabel;
      this._txd = _txd;
      this._isOwned = _isOwned;
      this._size = _size;
      this._capacity = _capacity;
      this._amountStored = _amountStored;
      this._currentValue = _currentValue;
      this._specialItems = _specialItems;
      var _loc2_ = getTimer();
      if(isNaN(_sellCooldown))
      {
         _sellCooldown = 0;
      }
      if(isNaN(_buyCooldown))
      {
         _buyCooldown = 0;
      }
      this._sellCooldown = 1000 * _sellCooldown + _loc2_;
      this._buyCooldown = 1000 * _buyCooldown + _loc2_;
      this.displayOrder = _displayOrder;
      this._purchaseSaleCost = _purchaseSaleCost;
   }
   function setShipmentData(_shipmentDescription, _smallShipmentSize, _smallShipmentCost, _mediumShipmentSize, _mediumShipmentCost, _largeShipmentSize, _largeShipmentCost, _smallShipmentIsSpecial, _smallShipmentSaleCost, _mediumShipmentSaleCost, _largeShipmentSaleCost)
   {
      this._smallShipmentSize = _smallShipmentSize;
      this._smallShipmentCost = _smallShipmentCost;
      this._mediumShipmentSize = _mediumShipmentSize;
      this._mediumShipmentCost = _mediumShipmentCost;
      this._largeShipmentSize = _largeShipmentSize;
      this._largeShipmentCost = _largeShipmentCost;
      this._shipmentDescription = _shipmentDescription;
      this._smallShipmentIsSpecial = _smallShipmentIsSpecial === true;
      this._smallShipmentSaleCost = _smallShipmentSaleCost;
      this._mediumShipmentSaleCost = _mediumShipmentSaleCost;
      this._largeShipmentSaleCost = _largeShipmentSaleCost;
   }
   function __get__id()
   {
      return this._id;
   }
   function __get__x()
   {
      return this._x;
   }
   function __get__y()
   {
      return this._y;
   }
   function __get__purchaseCost()
   {
      return this._purchaseCost;
   }
   function __get__purchaseSaleCost()
   {
      return this._purchaseSaleCost;
   }
   function __get__currentValue()
   {
      return this._currentValue;
   }
   function __get__name()
   {
      return this._name;
   }
   function __get__location()
   {
      return this._location;
   }
   function __get__desciption()
   {
      return this._description;
   }
   function __get__txd()
   {
      return this._txd;
   }
   function __get__isOwned()
   {
      return this._isOwned;
   }
   function __get__size()
   {
      return this._size;
   }
   function __get__capacity()
   {
      return this._capacity;
   }
   function __get__amountStored()
   {
      return this._amountStored;
   }
   function __get__shipmentDescription()
   {
      return this._shipmentDescription;
   }
   function __get__smallShipmentSize()
   {
      return this._smallShipmentSize;
   }
   function __get__smallShipmentCost()
   {
      return this._smallShipmentCost;
   }
   function __get__smallShipmentSaleCost()
   {
      return this._smallShipmentSaleCost;
   }
   function __get__mediumShipmentSize()
   {
      return this._mediumShipmentSize;
   }
   function __get__mediumShipmentCost()
   {
      return this._mediumShipmentCost;
   }
   function __get__mediumShipmentSaleCost()
   {
      return this._mediumShipmentSaleCost;
   }
   function __get__largeShipmentSize()
   {
      return this._largeShipmentSize;
   }
   function __get__largeShipmentCost()
   {
      return this._largeShipmentCost;
   }
   function __get__largeShipmentSaleCost()
   {
      return this._largeShipmentSaleCost;
   }
   function __get__specialItems()
   {
      return this._specialItems;
   }
   function __get__sellCooldown()
   {
      return this._sellCooldown;
   }
   function __get__buyCooldown()
   {
      return this._buyCooldown;
   }
   function __get__smallShipmentIsSpecial()
   {
      return this._smallShipmentIsSpecial;
   }
}
