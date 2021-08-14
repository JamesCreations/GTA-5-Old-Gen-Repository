class com.rockstargames.gtav.levelDesign.securoserv.SpecialVehicle
{
   function SpecialVehicle(_id, _vehicleName, _description, _txd, _lockNum, _enabled, _cashBonus, _rpBonus)
   {
      this._id = _id;
      this._vehicleName = _vehicleName;
      this._description = _description;
      this._txd = _txd;
      this._lockNum = _lockNum;
      this._enabled = _enabled;
      this._cashBonus = _cashBonus != undefined?_cashBonus:0;
      this._rpBonus = _rpBonus != undefined?_rpBonus:0;
   }
   function __get__id()
   {
      return this._id;
   }
   function __get__vehicleName()
   {
      return this._vehicleName;
   }
   function __get__description()
   {
      return this._description;
   }
   function __get__txd()
   {
      return this._txd;
   }
   function __get__lockNum()
   {
      return this._lockNum;
   }
   function __get__cashBonus()
   {
      return this._cashBonus;
   }
   function __get__rpBonus()
   {
      return this._rpBonus;
   }
   function __get__enabled()
   {
      return this._enabled;
   }
}
