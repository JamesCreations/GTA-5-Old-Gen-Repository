class com.rockstargames.gtav.levelDesign.importExportWarehouse.Vehicle
{
   static var TYPE_SUPER = 0;
   static var TYPE_MUSCLE = 1;
   static var TYPE_SPORTS = 2;
   static var TYPE_SPORTS_CLASSICS = 3;
   function Vehicle(id, texture, vehicleName, category, value, collectionValue, selected, owned, rangeCategory, actualValue)
   {
      this._id = id;
      this._texture = texture;
      this._vehicleName = vehicleName;
      this._category = category;
      this._value = value;
      this._collectionValue = collectionValue != undefined?collectionValue:0;
      this._selected = selected;
      this._owned = owned;
      this._associatedCollection = -1;
      this._rangeCategory = rangeCategory != undefined?rangeCategory:0;
      this._actualValue = actualValue != undefined?actualValue:0;
   }
   function __get__id()
   {
      return this._id;
   }
   function __get__vehicleName()
   {
      return this._vehicleName;
   }
   function __get__category()
   {
      return this._category;
   }
   function __get__value()
   {
      return this._value;
   }
   function __get__collectionValue()
   {
      return this._collectionValue;
   }
   function __get__texture()
   {
      return this._texture;
   }
   function __get__selected()
   {
      return this._selected;
   }
   function __get__owned()
   {
      return this._owned;
   }
   function __get__associatedCollection()
   {
      return this._associatedCollection;
   }
   function __get__warehousePosition()
   {
      return this._warehousePosition;
   }
   function __get__rangeCategory()
   {
      return this._rangeCategory;
   }
   function __get__actualValue()
   {
      return this._actualValue;
   }
   function __set__selected(value)
   {
      this._selected = value;
      return this.__get__selected();
   }
   function __set__associatedCollection(value)
   {
      this._associatedCollection = value;
      return this.__get__associatedCollection();
   }
}
