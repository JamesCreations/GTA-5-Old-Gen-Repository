class com.rockstargames.gtav.web.buttons.WebBrowserBack extends com.rockstargames.gtav.web.buttons.WebButton
{
   function WebBrowserBack()
   {
      super();
      this.buttonType = com.rockstargames.gtav.constants.WebBrowserButtonLUT.BACK_BUTTON;
      this.isBrowserButton = true;
   }
   function buttonEvent()
   {
      this.browser.GO_BACK();
   }
}
