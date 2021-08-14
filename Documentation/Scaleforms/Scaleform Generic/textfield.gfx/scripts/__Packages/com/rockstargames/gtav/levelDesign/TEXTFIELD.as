class com.rockstargames.gtav.levelDesign.TEXTFIELD extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   function TEXTFIELD()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.CONTENT._visible = false;
      this.tf = this.CONTENT.tf;
      this.tf.autoSize = "left";
      this.bgMC = this.CONTENT.bgMC;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
   }
   function SET_TEXT(str)
   {
      if(str == "")
      {
         this.CONTENT._visible = false;
      }
      else
      {
         this.CONTENT._visible = true;
         var _loc2_ = new com.rockstargames.ui.utils.Text();
         if(this.blipLayerMC)
         {
            this.blipLayerMC.removeMovieClip();
         }
         this.blipLayerMC = this.CONTENT.createEmptyMovieClip("blipLayerMC",this.CONTENT.getNextHighestDepth(),{_x:this.tf._x,_y:this.tf._y});
         _loc2_.setTextWithIcons(str,this.blipLayerMC,this.tf,0,13,2,false);
         this.bgMC._height = this.tf.textHeight + 9;
      }
   }
}
