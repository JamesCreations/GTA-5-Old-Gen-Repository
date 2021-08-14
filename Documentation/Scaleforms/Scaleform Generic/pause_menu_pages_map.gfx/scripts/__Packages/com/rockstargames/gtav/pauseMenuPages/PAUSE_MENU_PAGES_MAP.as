class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_MAP extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
   var dx = 0;
   var dy = 430;
   var inFullscreenMode = false;
   function PAUSE_MENU_PAGES_MAP()
   {
      super();
   }
   function setupPage()
   {
      super.setupPage();
      this.column0 = this.addColumn("mapLegend",10,0);
      this.column1 = this.addColumn("mapLegend",1,0);
      this.column2 = this.addColumn("freemodeDetails",2,0);
      this.setupColumns(this.column1,this.column2);
      this.setupColScroll([this.column1,this.column2],[false,false]);
      this.column0.INITIALISE();
      var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_MAP)this.column1;
      this.dx = _loc3_.details._x;
      this.dy = _loc3_.details._y;
   }
   function setDisplayConfig(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen)
   {
      var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_MAP)this.column0;
      var _loc2_ = (com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_MAP)this.column1;
      var _loc7_ = _loc3_.model.getCurrentView().viewContainer;
      var _loc5_ = _loc2_.model.getCurrentView().viewContainer;
      if(this.inFullscreenMode)
      {
         var _loc6_ = 0;
         var _loc4_ = 0;
         if(!_isWideScreen)
         {
            var _loc17_ = 1.7777777777777777;
            var _loc15_ = 1.3333333333333333;
            var _loc8_ = 1280;
            var _loc14_ = 720;
            _loc6_ = (_loc8_ - Math.round(_loc8_ / _loc17_ * _loc15_)) / 2;
            _loc4_ = 0;
            _screenWidthPixels = _loc8_ - _loc6_ * 2;
            _screenHeightPixels = _loc14_ - _loc4_ * 2;
         }
         var _loc10_ = _loc4_ + Math.round(_safeTopPercent * 100 * (_screenHeightPixels / 100));
         var _loc16_ = _loc4_ + Math.round(_safeBottomPercent * 100 * (_screenHeightPixels / 100));
         var _loc9_ = _loc6_ + Math.round(_safeLeftPercent * 100 * (_screenWidthPixels / 100));
         var _loc12_ = _loc6_ + Math.round(_safeRightPercent * 100 * (_screenWidthPixels / 100));
         _loc3_.details._x = _loc2_.details._x = _loc9_;
         _loc3_.details._y = _loc2_.details._y = _loc16_;
         _loc7_._x = _loc5_._x = _loc12_;
         _loc7_._y = _loc5_._y = _loc10_;
         this.column2._x = _loc9_;
         this.column2._y = _loc10_;
      }
      else
      {
         _loc3_.details._x = _loc2_.details._x = this.dx;
         _loc3_.details._y = _loc2_.details._y = this.dy;
         _loc7_._x = _loc5_._x = 868;
         _loc7_._y = _loc5_._y = 0;
         this.column2._x = this.column2._y = 0;
      }
      _loc2_.scrollBase._visible = false;
      _loc2_.updateScroll();
   }
   function setScaledContent()
   {
      this.inFullscreenMode = arguments[0];
   }
   function stateChanged(id)
   {
      super.stateChanged(id);
      this.columnList = [this.column1,this.column2,this.column0];
      this.showColumns();
      var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_MAP)this.column1;
      _loc3_.scrollBase._visible = false;
      _loc3_.updateScroll();
   }
}
