class com.rockstargames.gtav.web.buttons.WebButtonAnchor extends com.rockstargames.gtav.web.buttons.WebButton
{
   function WebButtonAnchor()
   {
      super();
      this.buttonType = 16;
   }
   function buttonEvent()
   {
      var _loc2_ = this._name;
      this.browser.currentWebsite.goToAnchor(_loc2_);
   }
}
