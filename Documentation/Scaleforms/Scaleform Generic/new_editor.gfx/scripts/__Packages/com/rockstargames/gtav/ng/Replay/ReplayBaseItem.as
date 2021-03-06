class com.rockstargames.gtav.ng.Replay.ReplayBaseItem extends com.rockstargames.ui.components.GUIMenuItem
{
   var BLACK_ALPHA = 70;
   var _isSelectable = true;
   var _isMouseEnabled = false;
   function ReplayBaseItem()
   {
      super();
      this.OPTIONS = new com.rockstargames.gtav.ng.Replay.ListOptions();
      this.APP_DATA = new Object();
      this.hudColourWhite = new com.rockstargames.ui.utils.HudColourLite();
      this.hudColourWhite.r = 240;
      this.hudColourWhite.g = 240;
      this.hudColourWhite.b = 240;
      this.hudColourWhite.a = 100;
      this.hudColourBlack = new com.rockstargames.ui.utils.HudColourLite();
      this.hudColourBlack.r = 0;
      this.hudColourBlack.g = 0;
      this.hudColourBlack.b = 0;
      this.hudColourBlack.a = 100;
   }
   function setGreyedOut()
   {
   }
   function removeGreyOut()
   {
   }
   function clearIfUndefinied(TF, str)
   {
      if(str == undefined)
      {
         str = "";
      }
      TF.text = str;
   }
   function __get__hasItemBeenSetUpGrey()
   {
      return this._hasItemBeenSetUpGrey;
   }
   function __set__hasItemBeenSetUpGrey(value)
   {
      this._hasItemBeenSetUpGrey = value;
      return this.__get__hasItemBeenSetUpGrey();
   }
   function SetAsSelected()
   {
   }
}
