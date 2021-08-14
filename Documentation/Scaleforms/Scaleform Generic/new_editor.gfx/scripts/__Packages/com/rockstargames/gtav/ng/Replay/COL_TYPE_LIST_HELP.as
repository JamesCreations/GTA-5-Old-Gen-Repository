class com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST_HELP extends MovieClip
{
   function COL_TYPE_LIST_HELP()
   {
      super();
      this._textUtil = new com.rockstargames.ui.utils.Text();
      this.clearBlipLayer();
   }
   function initColours(receivedColours)
   {
      com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,receivedColours[0][0],receivedColours[0][1],receivedColours[0][2],70);
      com.rockstargames.ui.utils.Colour.Colourise(this.helpTop,receivedColours[0][0],receivedColours[0][1],receivedColours[0][2],70);
   }
   function __set__data(value)
   {
      this._data = value;
      this.clearBlipLayer();
      this.titleTF.autoSize = true;
      this.titleTF.wordWrap = true;
      this._textUtil.setTextWithIcons(this._data,this._blipLayer,this.titleTF,0,13,2,false);
      this.bgMC._height = this.titleTF.textHeight + 12;
      return this.__get__data();
   }
   function clearBlipLayer()
   {
      if(this._blipLayer != undefined)
      {
         this._blipLayer.removeMovieClip();
      }
      this._blipLayer = this.createEmptyMovieClip("blipLayer",1000);
   }
}
