class com.rockstargames.ui.core.BaseComponentInfo
{
   function BaseComponentInfo(newID)
   {
      this._enumId = newID;
      this._status = 0;
      this._listener = {};
      this._functionCache = [];
      this._intendedVisibleState = true;
      this._displayList = -1;
      this._displayListPriority = -1;
      this._mc = new MovieClip();
      this._hasGfx = true;
   }
   function sanitise()
   {
      this._mc = new MovieClip();
      this._status = 0;
      this._listener = {};
      this._displayList = -1;
      this._displayListPriority = -1;
      this._position = [];
      this._size = [];
      this._colour = [];
      this._functionCache = [];
      this._hasGfx = true;
   }
}
