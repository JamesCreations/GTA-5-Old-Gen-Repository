class com.rockstargames.gtav.pc.PCButtonBase
{
   var _active = true;
   var _highlight = false;
   function PCButtonBase()
   {
   }
   function init(_mc, _type, _args)
   {
      this.mc = _mc;
      this.type = _type;
      var _loc3_ = String(_mc).split(".").slice(3);
      var _loc2_ = _loc3_.join("_");
      this.id = _loc2_ + this.type;
      if(_args != undefined)
      {
         this.args = _args;
      }
   }
   function __set__highlight(h)
   {
      this._highlight = h;
      if(this.mc.highlightMC != undefined)
      {
         if(this.__get__active())
         {
            this.mc.highlightMC.gotoAndStop(!h?"off":"over");
         }
      }
      return this.__get__highlight();
   }
   function __get__highlight()
   {
      return this._highlight;
   }
   function __set__active(a)
   {
      this._active = a;
      if(this.mc.highlightMC != undefined)
      {
         if(a)
         {
            this.mc.highlightMC.gotoAndStop("off");
         }
         else
         {
            this.mc.highlightMC.gotoAndStop("inactive");
         }
      }
      return this.__get__active();
   }
   function __get__active()
   {
      return this._active;
   }
}
