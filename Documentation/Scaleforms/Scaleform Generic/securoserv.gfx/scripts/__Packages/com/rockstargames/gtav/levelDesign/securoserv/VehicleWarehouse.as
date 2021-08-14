class com.rockstargames.gtav.levelDesign.securoserv.VehicleWarehouse
{
   static var MAP_COORD_SCALE = 0.3415;
   static var MAP_ORIGIN_X = 1415.5;
   static var MAP_ORIGIN_Y = 2774;
   function VehicleWarehouse(_id, _px, _py, _interior0Cost, _interior0SaleCost, _interior1Cost, _interior1SaleCost, _interior2Cost, _interior2SaleCost, _warehouseName, _location, _description, _txd, _isOwned, _vehicleCapacity, _numVehiclesStored, _currentValue, _stealCooldown, _purchasedInterior)
   {
      this._id = _id;
      this._x = _px * com.rockstargames.gtav.levelDesign.securoserv.VehicleWarehouse.MAP_COORD_SCALE + com.rockstargames.gtav.levelDesign.securoserv.VehicleWarehouse.MAP_ORIGIN_X;
      this._y = _py * (- com.rockstargames.gtav.levelDesign.securoserv.VehicleWarehouse.MAP_COORD_SCALE) + com.rockstargames.gtav.levelDesign.securoserv.VehicleWarehouse.MAP_ORIGIN_Y;
      this._interior0Cost = _interior0Cost;
      this._interior1Cost = _interior1Cost;
      this._interior2Cost = _interior2Cost;
      this._interior0SaleCost = _interior0SaleCost != undefined?_interior0SaleCost:-1;
      this._interior1SaleCost = _interior1SaleCost != undefined?_interior1SaleCost:-1;
      this._interior2SaleCost = _interior2SaleCost != undefined?_interior2SaleCost:-1;
      this._name = _warehouseName;
      this._location = _location;
      this._description = _description;
      this._txd = _txd;
      this._isOwned = _isOwned;
      this._vehicleCapacity = _vehicleCapacity;
      this._numVehiclesStored = _numVehiclesStored;
      this._currentValue = _currentValue;
      this.stealCooldown = _stealCooldown;
      this._purchasedInterior = _purchasedInterior;
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
   function __get__interior0Cost()
   {
      return this._interior0Cost;
   }
   function __get__interior1Cost()
   {
      return this._interior1Cost;
   }
   function __get__interior2Cost()
   {
      return this._interior2Cost;
   }
   function __get__interior0SaleCost()
   {
      return this._interior0SaleCost;
   }
   function __get__interior1SaleCost()
   {
      return this._interior1SaleCost;
   }
   function __get__interior2SaleCost()
   {
      return this._interior2SaleCost;
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
   function __get__vehicleCapacity()
   {
      return this._vehicleCapacity;
   }
   function __get__numVehiclesStored()
   {
      return this._numVehiclesStored;
   }
   function __get__purchasedInterior()
   {
      return this._purchasedInterior;
   }
}
