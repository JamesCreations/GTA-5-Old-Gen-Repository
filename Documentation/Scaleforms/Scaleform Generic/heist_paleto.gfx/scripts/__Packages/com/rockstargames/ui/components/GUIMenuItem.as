class com.rockstargames.ui.components.GUIMenuItem extends MovieClip
{
   var _data = new Array();
   var _highlighted = false;
   var _labels = new Array();
   function GUIMenuItem()
   {
      super();
      this._data = new Array();
      this._labels = new Array();
   }
   function __set__data(_d)
   {
      this._data = _d;
      return this.__get__data();
   }
   function __get__data()
   {
      return this._data;
   }
   function __set__labels(_l)
   {
      this._labels = _l;
      return this.__get__labels();
   }
   function __get__labels()
   {
      return this._labels;
   }
   function __set__highlighted(_h)
   {
      if(!_h)
      {
         this.gotoAndStop(1);
      }
      else
      {
         this.gotoAndStop(2);
      }
      §§pop();
      this._highlighted = _h;
      return this.__get__highlighted();
   }
   function __get__highlighted()
   {
      return this._highlighted;
   }
   function getHeight()
   {
      return this._height;
   }
}
