class com.rockstargames.gtav.levelDesign.securoserv.StretchButton extends com.rockstargames.gtav.levelDesign.securoserv.Button
{
   function StretchButton(id, view, label, padding, minSize, isStringLiteral)
   {
      super(id,view,label,isStringLiteral);
      if(padding == undefined)
      {
         padding = 30;
      }
      if(minSize == undefined)
      {
         minSize = view.bg._width;
      }
      this.__set__width(Math.max(minSize,view.label.textWidth + padding));
   }
   function __set__width(w)
   {
      this.view.bg._width = w;
      this.view.label._x = 0.5 * (this.view.bg._width - this.view.label._width);
      this.updateBounds();
      return this.__get__width();
   }
   function setState(state)
   {
      if(state == "off")
      {
         this.view.bg.transform.colorTransform = new flash.geom.ColorTransform(0,0,0,0.9,0,0,0,0);
      }
      else
      {
         this.view.bg.transform.colorTransform = new flash.geom.ColorTransform();
      }
   }
}
