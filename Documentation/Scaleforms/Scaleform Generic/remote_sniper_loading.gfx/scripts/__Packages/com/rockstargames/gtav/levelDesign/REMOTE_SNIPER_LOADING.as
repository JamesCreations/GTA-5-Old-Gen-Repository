class com.rockstargames.gtav.levelDesign.REMOTE_SNIPER_LOADING extends com.rockstargames.ui.core.BaseScreenLayout
{
   function REMOTE_SNIPER_LOADING()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
   }
   function START_LOADING()
   {
      this.CONTENT.loadingMC.gotoAndPlay("in");
   }
}
