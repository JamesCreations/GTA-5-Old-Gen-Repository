class com.rockstargames.gtav.levelDesign.heists.selectors.HeistBoardGamplaySelectDocks extends com.rockstargames.gtav.levelDesign.heists.selectors.HeistBoardGamplaySelect
{
   function HeistBoardGamplaySelectDocks()
   {
      super();
   }
   function __set__data(_d)
   {
      this._data = _d;
      this.gameplayMC.gotoAndStop(this.__get__data()[2]);
      this.gameplayMC.tintMC.gotoAndStop(1);
      return this.__get__data();
   }
   function __set__highlighted(_h)
   {
      this.isAnimating = false;
      this.gameplayMC.tintMC.gotoAndStop(!_h?1:2);
      this._highlighted = _h;
      return this.__get__highlighted();
   }
}
