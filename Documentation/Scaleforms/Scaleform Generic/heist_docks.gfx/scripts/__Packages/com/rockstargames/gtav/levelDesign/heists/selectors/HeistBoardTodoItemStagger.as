class com.rockstargames.gtav.levelDesign.heists.selectors.HeistBoardTodoItemStagger extends com.rockstargames.ui.components.GUIMenuItem
{
   function HeistBoardTodoItemStagger()
   {
      super();
   }
   function __set__data(_d)
   {
      this._data = _d;
      this.tickMC.gotoAndStop(!Boolean(this._data[0])?1:2);
      this.todoItemTF.text = this._data[1];
      this.todoItemTF.autoSize = "left";
      this.todoItemTF.multiline = false;
      this.todoItemTF.wordWrap = false;
      this.tickMC._x = this.todoItemTF._x + this.todoItemTF._width + 5;
      return this.__get__data();
   }
   function clampText(obj, maxVal)
   {
      if(obj._width > maxVal)
      {
         obj._xscale = maxVal / obj._width * 100;
      }
   }
   function __set__highlighted(_h)
   {
      this.highlightMC.gotoAndStop(!_h?1:2);
      this._highlighted = _h;
      return this.__get__highlighted();
   }
}
