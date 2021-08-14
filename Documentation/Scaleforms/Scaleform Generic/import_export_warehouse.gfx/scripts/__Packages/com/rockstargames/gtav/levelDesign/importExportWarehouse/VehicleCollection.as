class com.rockstargames.gtav.levelDesign.importExportWarehouse.VehicleCollection
{
   function VehicleCollection(id, collectionNameToken, value, vehicles, selected, disabled, completionOfCollectionInPercent)
   {
      this._id = id;
      this._collectionNameToken = collectionNameToken;
      this._value = value;
      this._selected = selected;
      this._disabled = disabled;
      this._completionPercentage = completionOfCollectionInPercent;
      this._vehicles = [];
      if(!this._disabled)
      {
         this.checkAndAddVehicleID(vehicles[0]);
         this.checkAndAddVehicleID(vehicles[1]);
         this.checkAndAddVehicleID(vehicles[2]);
         this.checkAndAddVehicleID(vehicles[3]);
      }
   }
   function __get__id()
   {
      return this._id;
   }
   function __get__collectionNameToken()
   {
      return this._collectionNameToken;
   }
   function __get__vehicles()
   {
      return this._vehicles;
   }
   function __get__requiredDrivers()
   {
      return this._vehicles.length;
   }
   function __get__value()
   {
      return this._value;
   }
   function __get__selected()
   {
      return this._selected;
   }
   function __get__disabled()
   {
      return this._disabled;
   }
   function __get__completionPercentage()
   {
      return this._completionPercentage;
   }
   function __set__selected(value)
   {
      this._selected = value;
      var _loc2_ = 0;
      while(_loc2_ < this._vehicles.length)
      {
         this._vehicles[_loc2_].selected = value;
         _loc2_ = _loc2_ + 1;
      }
      return this.__get__selected();
   }
   function checkAndAddVehicleID(id)
   {
      if(id != undefined || id == -1)
      {
         this._vehicles.push(id);
      }
   }
}
