class com.rockstargames.gtav.levelDesign.heists.selectors.HeistBoardGamplaySelect extends com.rockstargames.ui.components.GUIMenuItem
{
   var isAnimating = false;
   function HeistBoardGamplaySelect()
   {
      super();
      this.gameplayMC.tintMC.gotoAndStop(2);
      _global.gfxExtensions = true;
   }
   function __set__data(_d)
   {
      this._data = _d;
      this.gameplayMC.gotoAndStop(this.__get__data()[2]);
      this.gameplayMC.tintMC.gotoAndStop(2);
      return this.__get__data();
   }
   function __set__highlighted(_h)
   {
      this.isAnimating = false;
      this.gameplayMC.tintMC.gotoAndStop(!_h?2:1);
      this._highlighted = _h;
      return this.__get__highlighted();
   }
   function __set__labels(_l)
   {
      var _loc3_ = _l.slice(3);
      var _loc4_ = this.gameplayMC._currentframe;
      var _loc5_ = _loc3_[_loc4_ - 1];
      var _loc2_ = this.gameplayMC.tintMC.choiceMC.subtitleMC.labelTF;
      _loc2_.textAutoSize = "shrink";
      _loc2_.text = _loc5_;
      return this.__get__labels();
   }
}
