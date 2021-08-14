class com.rockstargames.ui.mouse.MOUSE_EVENTS
{
   var MOUSE_DRAG_OUT = 0;
   var MOUSE_DRAG_OVER = 1;
   var MOUSE_DOWN = 2;
   var MOUSE_MOVE = 3;
   var MOUSE_UP = 4;
   var MOUSE_PRESS = 5;
   var MOUSE_RELEASE = 6;
   var MOUSE_RELEASE_OUTSIDE = 7;
   var MOUSE_ROLL_OUT = 8;
   var MOUSE_ROLL_OVER = 9;
   var SF_BASE_CLASS_MOUSE = 10;
   var DEFAULT_BUTTON_TYPE = 0;
   var _ui_movie = -1;
   static var UI_MOVIE_VIDEO_EDITOR = 0;
   static var UI_MOVIE_ONLINE_POLICY = 1;
   static var UI_MOVIE_INSTRUCTIONAL_BUTTONS = 2;
   function MOUSE_EVENTS()
   {
      this.__set__INTERFACE_TYPE(this.SF_BASE_CLASS_MOUSE);
   }
   function __set__UI_MOVIE(uiMovie)
   {
      this._ui_movie = uiMovie;
      return this.__get__UI_MOVIE();
   }
   function __get__UI_MOVIE()
   {
      return this._ui_movie;
   }
   function __set__INTERFACE_TYPE(iType)
   {
      this._interfaceType = iType;
      return this.__get__INTERFACE_TYPE();
   }
   function __get__INTERFACE_TYPE()
   {
      return this._interfaceType;
   }
   function triggerEvent()
   {
      var _loc3_ = arguments;
      _loc3_.unshift("MOUSE_EVENT",this.__get__INTERFACE_TYPE(),this.__get__UI_MOVIE());
      flash.external.ExternalInterface.call.apply(null,_loc3_);
   }
}
