class com.rockstargames.gtav.levelDesign.TEXT_INPUT_BOX extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   function TEXT_INPUT_BOX()
   {
      super();
      trace("TEXT_INPUT_BOX Constructor");
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.CONTENT.InputTF.text = "";
      this.CONTENT.TitleTF.text = "";
      this.CONTENT.DescriptionTF.text = "";
      trace(this.CONTENT.InputTF);
   }
   function SET_TEXT_BOX()
   {
      var _loc3_ = this.CONTENT.TitleTF;
      var _loc5_ = this.CONTENT.DescriptionTF;
      var _loc4_ = this.CONTENT.InputTF;
      _loc3_.text = arguments[0];
      _loc5_.text = arguments[1];
      _loc4_.text = arguments[2];
   }
   function UPDATE_DISPLAY_PARAMS()
   {
      var _loc3_ = arguments[0];
      var _loc4_ = arguments[1];
      this.TIMELINE._x = 0;
      this.TIMELINE._y = 0;
      this.TIMELINE._width = _loc3_;
      this.TIMELINE._height = _loc4_;
   }
   function UPDATE_INPUT()
   {
      var _loc3_ = this.CONTENT.InputTF;
      _loc3_.text = arguments[0];
   }
}
