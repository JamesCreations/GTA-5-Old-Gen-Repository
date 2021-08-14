class com.rockstargames.gtav.levelDesign.hangarCargo.Cargo
{
   function Cargo(_type, _currentStockLevel, _totalStockLevel, _bonusPercent, _sellPrice)
   {
      this._type = _type;
      this._currentStockLevel = _currentStockLevel;
      this._totalStockLevel = _totalStockLevel;
      this._bonusPercent = _bonusPercent;
      this._sellPrice = _sellPrice;
   }
   function __get__type()
   {
      return this._type;
   }
   function __get__currentStockLevel()
   {
      return this._currentStockLevel;
   }
   function __get__totalStockLevel()
   {
      return this._totalStockLevel;
   }
   function __get__bonusPercent()
   {
      return this._bonusPercent;
   }
   function __get__sellPrice()
   {
      return this._sellPrice;
   }
}
