class com.rockstargames.gtav.web.foreclosures.MapPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   static var MAP_SCALE_STEP = 0.1;
   static var MAP_SCALE_MIN = 0.2;
   static var MAP_SCALE_MAX = 1.25;
   static var MAP_MOVE_SPEED = 20;
   function MapPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"mapPage",pageName,isFirstPage,progressPanel,header);
      this.markerDataSet = false;
      this.bunkerDataSet = false;
      this.hangarDataSet = false;
      this.markers = [];
      this.mapMoveX = 0;
      this.mapMoveY = 0;
      this.mapScaleStep = 0;
      this.mapIsBeingDragged = false;
      this.mapIsZoomingIn = false;
      this.mapIsZoomingOut = false;
      this.safeZoneLeft = website.displayConfig.safeLeft * com.rockstargames.gtav.web.foreclosures.Page.STAGE_WIDTH;
      this.safeZoneRight = website.displayConfig.safeRight * com.rockstargames.gtav.web.foreclosures.Page.STAGE_WIDTH;
      this.safeZoneTop = website.displayConfig.safeTop * com.rockstargames.gtav.web.foreclosures.Page.STAGE_HEIGHT + 148;
      this.safeZoneBottom = website.displayConfig.safeBottom * com.rockstargames.gtav.web.foreclosures.Page.STAGE_HEIGHT;
      this.scrollWheelValue = 0;
      this.view._alpha = 100;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(header.label,"FORECLOSURES_CLUBHOUSE_MAP");
      var _loc6_ = header.label.getTextFormat();
      _loc6_.letterSpacing = 3;
      header.label.setTextFormat(_loc6_);
      progressPanel.initOverview();
      progressPanel.hide();
      if(website.__get__selectedClubhouseID() != -1)
      {
         this.showClubhouseDetails(true);
         progressPanel.restartSlideshow();
      }
      else if(website.__get__selectedBunkerID() != -1)
      {
         this.showBunkerDetails(true);
         progressPanel.restartSlideshow();
      }
      else if(website.__get__selectedHangarID() != -1)
      {
         this.showHangarDetails(true);
         progressPanel.restartSlideshow();
      }
      this.initFilterButtons();
   }
   function initFilterButtons()
   {
      var _loc2_ = 10;
      this.initFilterButton(this.view.filter_all,"FORECLOSURES_TAB_ALL");
      this.initFilterButton(this.view.filter_clubhouses,"FORECLOSURES_TAB_CLUBHOUSES");
      this.initFilterButton(this.view.filter_bunkers,"FORECLOSURES_TAB_BUNKERS");
      this.initFilterButton(this.view.filter_hangars,"FCHNGR_TAB");
      this.view.filter_hangars._x = this.safeZoneRight - _loc2_ - this.view.filter_hangars._width;
      this.view.filter_bunkers._x = this.view.filter_hangars._x - _loc2_ - this.view.filter_bunkers._width;
      this.view.filter_clubhouses._x = this.view.filter_bunkers._x - _loc2_ - this.view.filter_clubhouses._width;
      this.view.filter_all._x = this.view.filter_clubhouses._x - _loc2_ - this.view.filter_all._width;
      this.currentFilter = "all";
   }
   function initFilterButton(buttonView, label)
   {
      var _loc3_ = 10;
      var _loc4_ = 56 + _loc3_;
      buttonView.onColour = 16777215;
      buttonView.offColour = 14737632;
      buttonView.btnTxt.autoSize = "left";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(buttonView.btnTxt,label);
      buttonView.bg._width = buttonView.btnTxt.textWidth + _loc3_;
      buttonView.btnTxt._x = 0.5 * (buttonView.bg._width - buttonView.btnTxt._width);
      buttonView._y = _loc4_;
      this.website.dataTextScope.push(buttonView.btnTxt);
   }
   function setMarkerData(clubhouseData, bunkerData, hangarData)
   {
      if(this.markerDataSet)
      {
         return undefined;
      }
      this.markerData = [].concat(hangarData).concat(bunkerData).concat(clubhouseData);
      var _loc3_ = 0;
      var _loc5_ = this.markerData.length;
      while(_loc3_ < _loc5_)
      {
         var _loc7_ = this.markerData[_loc3_].id;
         var _loc8_ = this.markerData[_loc3_].type < 2;
         var _loc6_ = this.markerData[_loc3_].type == 2;
         var _loc9_ = this.markerData[_loc3_].type == 3;
         if(_loc8_)
         {
            var _loc4_ = "clubhouseMarker_" + _loc7_;
            var _loc2_ = this.view.markers[_loc4_] || this.view.markers.markerClubhouse.duplicateMovieClip(_loc4_,_loc7_);
         }
         else if(_loc6_)
         {
            _loc4_ = "bunkerMarker_" + _loc7_;
            _loc2_ = this.view.markers[_loc4_] || this.view.markers.markerBunker.duplicateMovieClip(_loc4_,_loc7_);
         }
         else if(_loc9_)
         {
            _loc4_ = "hangarMarker_" + _loc7_;
            _loc2_ = this.view.markers[_loc4_] || this.view.markers.markerHangar.duplicateMovieClip(_loc4_,_loc7_);
         }
         if(_loc7_ == this.website.__get__selectedClubhouseID() || _loc7_ == this.website.__get__selectedBunkerID() || _loc7_ == this.website.__get__selectedHangarID())
         {
            _loc2_.gotoAndStop(!this.markerData[_loc3_].isOwned?"unownedActive":"ownedActive");
         }
         else
         {
            _loc2_.gotoAndStop(!this.markerData[_loc3_].isOwned?"unownedInactive":"ownedInactive");
         }
         this.markers[_loc7_] = _loc2_;
         this.website.dataTextScope.push(_loc2_.btnTxt);
         _loc3_ = _loc3_ + 1;
      }
      this.updateMarkers();
      _loc3_ = 0;
      _loc5_ = this.markerData.length;
      while(_loc3_ < _loc5_)
      {
         _loc7_ = this.markerData[_loc3_].id;
         _loc2_ = this.markers[_loc7_];
         _loc2_._xscale = _loc2_._yscale = 1;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,0.2,{delay:_loc3_ * 0.05,_xscale:100,_yscale:100,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
         if(this.markerData[_loc3_].isOwned)
         {
            _loc2_.swapDepths(_loc2_._parent.getNextHighestDepth());
         }
         _loc3_ = _loc3_ + 1;
      }
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.markerDataSet = true;
      var _loc14_ = this.website.getSelectedClubhouse();
      var _loc15_ = this.website.getSelectedBunker();
      var _loc16_ = this.website.getSelectedHangar();
      this.setNextPage(_loc14_,_loc15_,_loc16_);
   }
   function handleClick(type, id)
   {
      this.resetMarkers();
      if(type == "clubhouseMarker")
      {
         var _loc5_ = parseInt(id);
         if(_loc5_ != this.website.__get__selectedClubhouseID())
         {
            this.website.setSelectedClubhouse(_loc5_);
            this.showClubhouseDetails(false);
         }
         var _loc8_ = this.website.getClubhouseByID(_loc5_);
         if(_loc8_)
         {
            var _loc3_ = this.markers[_loc5_];
            if(_loc3_)
            {
               _loc3_.swapDepths(_loc3_._parent.getNextHighestDepth());
               _loc3_.gotoAndStop(!_loc8_.__get__isOwned()?"unownedActive":"ownedActive");
            }
         }
         this.setNextPage(_loc8_,null,null);
         this.website.isInBunkerFlow = false;
         this.website.isInHangarFlow = false;
         this.website.setSelectedBunker(-1);
         this.website.setSelectedHangar(-1);
      }
      else if(type == "bunkerMarker")
      {
         var _loc2_ = parseInt(id);
         if(_loc2_ != this.website.__get__selectedBunkerID())
         {
            this.website.setSelectedBunker(_loc2_);
            this.showBunkerDetails(false);
         }
         var _loc9_ = this.website.getBunkerByID(_loc2_);
         if(_loc9_)
         {
            _loc3_ = this.markers[_loc2_];
            if(_loc3_)
            {
               _loc3_.swapDepths(_loc3_._parent.getNextHighestDepth());
               _loc3_.gotoAndStop(!_loc9_.__get__isOwned()?"unownedActive":"ownedActive");
            }
         }
         this.setNextPage(null,_loc9_,null);
         this.website.isInBunkerFlow = true;
         this.website.isInHangarFlow = false;
         this.website.setSelectedClubhouse(-1);
         this.website.setSelectedHangar(-1);
      }
      else if(type == "hangarMarker")
      {
         var _loc4_ = parseInt(id);
         if(_loc4_ != this.website.__get__selectedHangarID())
         {
            this.website.setSelectedHangar(_loc4_);
            this.showHangarDetails(false);
         }
         var _loc10_ = this.website.getHangarByID(_loc4_);
         if(_loc10_)
         {
            _loc3_ = this.markers[_loc4_];
            if(_loc3_)
            {
               _loc3_.swapDepths(_loc3_._parent.getNextHighestDepth());
               _loc3_.gotoAndStop(!_loc10_.__get__isOwned()?"unownedActive":"ownedActive");
            }
         }
         this.setNextPage(null,null,_loc10_);
         this.website.isInBunkerFlow = false;
         this.website.isInHangarFlow = true;
         this.website.setSelectedClubhouse(-1);
         this.website.setSelectedBunker(-1);
      }
      else if(type == "nextButton")
      {
         this.progressPanel.stopSlideshow();
         this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
      }
      else if(type == "filter")
      {
         this.currentFilter = id;
         if(this.currentFilter == "clubhouses")
         {
            this.website.setSelectedBunker(-1);
            this.website.setSelectedHangar(-1);
         }
         else if(this.currentFilter == "bunkers")
         {
            this.website.setSelectedClubhouse(-1);
            this.website.setSelectedHangar(-1);
         }
         else if(this.currentFilter == "hangars")
         {
            this.website.setSelectedClubhouse(-1);
            this.website.setSelectedBunker(-1);
         }
         if(this.website.__get__selectedClubhouseID() != -1)
         {
            this.showClubhouseDetails(true);
         }
         else if(this.website.__get__selectedBunkerID() != -1)
         {
            this.showBunkerDetails(true);
         }
         else if(this.website.__get__selectedHangarID() != -1)
         {
            this.showHangarDetails(true);
         }
         else
         {
            this.progressPanel.hide();
         }
         if(this.website.__get__selectedBunkerID() != -1)
         {
            _loc3_ = this.markers[this.website.__get__selectedBunkerID()];
            if(_loc3_)
            {
               _loc9_ = this.website.getBunkerByID(this.website.__get__selectedBunkerID());
               _loc3_.swapDepths(_loc3_._parent.getNextHighestDepth());
               _loc3_.gotoAndStop(!_loc9_.__get__isOwned()?"unownedActiveNoAnim":"ownedActiveNoAnim");
            }
         }
         else if(this.website.__get__selectedClubhouseID() != -1)
         {
            _loc3_ = this.markers[this.website.__get__selectedClubhouseID()];
            if(_loc3_)
            {
               _loc8_ = this.website.getClubhouseByID(this.website.__get__selectedClubhouseID());
               _loc3_.swapDepths(_loc3_._parent.getNextHighestDepth());
               _loc3_.gotoAndStop(!_loc8_.__get__isOwned()?"unownedActiveNoAnim":"ownedActiveNoAnim");
            }
         }
         else if(this.website.__get__selectedHangarID() != -1)
         {
            _loc3_ = this.markers[this.website.__get__selectedHangarID()];
            if(_loc3_)
            {
               _loc10_ = this.website.getHangarByID(this.website.__get__selectedHangarID());
               _loc3_.swapDepths(_loc3_._parent.getNextHighestDepth());
               _loc3_.gotoAndStop(!_loc10_.__get__isOwned()?"unownedActiveNoAnim":"ownedActiveNoAnim");
            }
         }
         this.updateMarkers();
      }
   }
   function setNextPage(clubhouse, bunker, hangar)
   {
      this.website.logState();
      if(clubhouse != null)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.MURAL_PAGE.name;
      }
      else if(bunker != null)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BUNKER_STYLE_PAGE.name;
      }
      else if(hangar != null)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_STYLE_PAGE.name;
      }
   }
   function handleLT()
   {
      this.mapScaleStep = -0.5 * com.rockstargames.gtav.web.foreclosures.MapPage.MAP_SCALE_STEP;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.map);
      this.mapIsBeingDragged = false;
      this.mapIsZoomingOut = true;
      this.updateMapView();
   }
   function handleRT()
   {
      this.mapScaleStep = 0.5 * com.rockstargames.gtav.web.foreclosures.MapPage.MAP_SCALE_STEP;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.map);
      this.mapIsBeingDragged = false;
      this.mapIsZoomingIn = true;
      this.updateMapView();
   }
   function handleLTRelease()
   {
      this.mapIsZoomingOut = false;
      if(!this.mapIsZoomingIn)
      {
         this.mapScaleStep = 0;
      }
      this.updateMapView();
   }
   function handleRTRelease()
   {
      this.mapIsZoomingIn = false;
      if(!this.mapIsZoomingOut)
      {
         this.mapScaleStep = 0;
      }
      this.updateMapView();
   }
   function handleRB()
   {
      if(this.website.__get__selectedClubhouseID() != -1)
      {
         this.progressPanel.stopSlideshow();
         this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
      }
      else if(this.website.__get__selectedBunkerID() != -1)
      {
         this.progressPanel.stopSlideshow();
         this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
      }
      else if(this.website.__get__selectedHangarID() != -1)
      {
         this.progressPanel.stopSlideshow();
         this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
      }
   }
   function handleAnalogStickInput(isLeftStick, x, y, isScrollWheel)
   {
      if(!isLeftStick)
      {
         if(isScrollWheel)
         {
            if(y < 0 && y <= this.scrollWheelValue)
            {
               this.scrollWheelValue = y;
               this.handleRT();
            }
            else if(y > 0 && y >= this.scrollWheelValue)
            {
               this.scrollWheelValue = y;
               this.handleLT();
            }
            else
            {
               this.scrollWheelValue = 0;
               this.handleRTRelease();
            }
            this.mapScaleStep = 0;
         }
         else
         {
            this.mapMoveX = (- com.rockstargames.gtav.web.foreclosures.MapPage.MAP_MOVE_SPEED) * x / 150;
            this.mapMoveY = (- com.rockstargames.gtav.web.foreclosures.MapPage.MAP_MOVE_SPEED) * y / 150;
            this.updateMapView();
         }
      }
   }
   function handleMouseClick(inputIsMouseClick)
   {
      this.resetMarkers();
      var _loc3_ = this.website.browser.CURSOR._x;
      var _loc2_ = this.website.browser.CURSOR._y;
      if(_loc3_ > this.safeZoneLeft && _loc3_ < this.safeZoneRight && _loc2_ > this.safeZoneTop && _loc2_ < this.safeZoneBottom)
      {
         this.progressPanel.hide();
         this.website.setSelectedClubhouse(-1);
         this.website.setSelectedBunker(-1);
         this.website.setSelectedHangar(-1);
         if(inputIsMouseClick)
         {
            this.mapIsBeingDragged = true;
            this.mapDragX0 = this.view.map._x;
            this.mapDragY0 = this.view.map._y;
            this.cursorDragX0 = _loc3_;
            this.cursorDragY0 = _loc2_;
            this.updateMapView();
         }
      }
   }
   function handleMouseRelease()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.map);
      this.mapIsBeingDragged = false;
   }
   function dispose()
   {
      var _loc3_ = 0;
      var _loc4_ = this.markers.length;
      while(_loc3_ < _loc4_)
      {
         if(this.markers[_loc3_])
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.markers[_loc3_]);
         }
         _loc3_ = _loc3_ + 1;
      }
      super.dispose();
   }
   function updateMapView()
   {
      if(this.mapIsBeingDragged)
      {
         this.dragMap();
      }
      else
      {
         this.moveMap();
      }
      this.scaleMap();
      this.updateMarkers();
      if(this.mapMoveX != 0 || this.mapMoveY != 0 || this.mapScaleStep != 0 || this.mapIsBeingDragged)
      {
         this.view.map._alpha = 100;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view.map,0.01,{onCompleteScope:this,onComplete:this.updateMapView});
      }
   }
   function dragMap()
   {
      var _loc3_ = this.website.browser.CURSOR._x - this.cursorDragX0;
      var _loc2_ = this.website.browser.CURSOR._y - this.cursorDragY0;
      var _loc4_ = this.mapDragX0 + _loc3_;
      var _loc5_ = this.mapDragY0 + _loc2_;
      this.moveMapWithinLimits(_loc4_,_loc5_,_loc3_,_loc2_);
   }
   function moveMap()
   {
      var _loc2_ = this.view.map._x + this.mapMoveX;
      var _loc3_ = this.view.map._y + this.mapMoveY;
      this.moveMapWithinLimits(_loc2_,_loc3_,this.mapMoveX,this.mapMoveY);
      this.website.mapX = this.view.map._x;
      this.website.mapY = this.view.map._y;
      this.website.mapMatrix = this.view.map.transform.matrix.clone();
   }
   function moveMapWithinLimits(xNew, yNew, dx, dy)
   {
      var _loc4_ = 98;
      var _loc6_ = 0.5 * (com.rockstargames.gtav.web.foreclosures.Page.STAGE_WIDTH - this.view.map._width);
      var _loc5_ = 0.5 * (com.rockstargames.gtav.web.foreclosures.Page.STAGE_HEIGHT - _loc4_ - this.view.map._height) + _loc4_;
      var _loc9_ = 0.5 * com.rockstargames.gtav.web.foreclosures.Page.STAGE_WIDTH - this.view.map._width;
      var _loc7_ = 0.5 * com.rockstargames.gtav.web.foreclosures.Page.STAGE_WIDTH;
      var _loc10_ = com.rockstargames.gtav.web.foreclosures.Page.STAGE_HEIGHT - this.view.map._height - _loc4_;
      var _loc8_ = _loc4_;
      if(dx > 0)
      {
         if(xNew <= _loc6_ || xNew >= _loc9_ && xNew <= _loc7_)
         {
            this.view.map._x = xNew;
         }
      }
      else if(xNew >= _loc6_ || xNew >= _loc9_ && xNew <= _loc7_)
      {
         this.view.map._x = xNew;
      }
      if(dy > 0)
      {
         if(yNew <= _loc5_ || yNew >= _loc10_ && yNew <= _loc8_)
         {
            this.view.map._y = yNew;
         }
      }
      else if(yNew >= _loc5_ || yNew >= _loc10_ && yNew <= _loc8_)
      {
         this.view.map._y = yNew;
      }
   }
   function scaleMap()
   {
      var _loc2_ = this.view.map.transform.matrix;
      var _loc3_ = this.mapScaleStep + 1;
      var _loc4_ = _loc2_.a * _loc3_;
      if(_loc4_ > com.rockstargames.gtav.web.foreclosures.MapPage.MAP_SCALE_MAX)
      {
         _loc3_ = com.rockstargames.gtav.web.foreclosures.MapPage.MAP_SCALE_MAX / _loc2_.a;
      }
      else if(_loc4_ < com.rockstargames.gtav.web.foreclosures.MapPage.MAP_SCALE_MIN)
      {
         _loc3_ = com.rockstargames.gtav.web.foreclosures.MapPage.MAP_SCALE_MIN / _loc2_.a;
      }
      _loc2_.translate(- com.rockstargames.gtav.web.foreclosures.Page.STAGE_CENTRE_X,- com.rockstargames.gtav.web.foreclosures.Page.STAGE_CENTRE_Y);
      _loc2_.scale(_loc3_,_loc3_);
      _loc2_.translate(com.rockstargames.gtav.web.foreclosures.Page.STAGE_CENTRE_X,com.rockstargames.gtav.web.foreclosures.Page.STAGE_CENTRE_Y);
      this.view.map.transform.matrix = _loc2_;
      this.website.mapX = this.view.map._x;
      this.website.mapY = this.view.map._y;
      this.website.mapMatrix = _loc2_.clone();
   }
   function updateMarkers()
   {
      var _loc11_ = this.view.map._x;
      var _loc10_ = this.view.map._y;
      var _loc9_ = this.view.map.transform.matrix.a;
      var _loc3_ = 0;
      var _loc5_ = this.markerData.length;
      while(_loc3_ < _loc5_)
      {
         var _loc6_ = this.markerData[_loc3_].id;
         var _loc2_ = this.markers[_loc6_];
         if(_loc2_)
         {
            var _loc8_ = _loc9_ * this.markerData[_loc3_].x + _loc11_;
            var _loc7_ = _loc9_ * this.markerData[_loc3_].y + _loc10_;
            _loc2_._x = _loc8_;
            _loc2_._y = _loc7_;
            if(_loc2_._xscale == 100 && (this.isHiddenByProgressPanel(_loc2_) || this.isOffScreen(_loc2_)))
            {
               _loc2_.disabled = true;
               _loc2_._visible = false;
            }
            else
            {
               var _loc4_ = this.currentFilter == "all" || this.currentFilter == "clubhouses" && this.markerData[_loc3_].type < 2 || this.currentFilter == "bunkers" && this.markerData[_loc3_].type == 2 || this.currentFilter == "hangars" && this.markerData[_loc3_].type == 3;
               _loc2_.disabled = !_loc4_;
               _loc2_._visible = _loc4_;
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      this.view.filter_all._alpha = 80;
      this.view.filter_clubhouses._alpha = 80;
      this.view.filter_bunkers._alpha = 80;
      this.view.filter_hangars._alpha = 80;
      this.view["filter_" + this.currentFilter]._alpha = 100;
   }
   function resetMarkers()
   {
      var _loc2_ = 0;
      var _loc4_ = this.markerData.length;
      while(_loc2_ < _loc4_)
      {
         var _loc5_ = this.markerData[_loc2_].id;
         var _loc3_ = this.markers[_loc5_];
         if(_loc3_)
         {
            _loc3_.gotoAndStop(!this.markerData[_loc2_].isOwned?"unownedInactive":"ownedInactive");
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function isHiddenByProgressPanel(marker)
   {
      if(this.progressPanel.__get__isHidden())
      {
         return false;
      }
      var _loc3_ = marker.getBounds(_root);
      return _loc3_.xMin >= this.progressPanel.left && _loc3_.xMax <= this.progressPanel.right && _loc3_.yMin >= this.progressPanel.top && _loc3_.yMax <= this.progressPanel.bottom;
   }
   function isOffScreen(marker)
   {
      var _loc3_ = marker.getBounds(_root);
      return _loc3_.xMax < this.safeZoneLeft || _loc3_.xMin > this.safeZoneRight || _loc3_.yMax < this.safeZoneTop || _loc3_.yMin > this.safeZoneBottom;
   }
   function showClubhouseDetails(showImmediately)
   {
      var _loc2_ = this.website.getSelectedClubhouse();
      this.progressPanel.showOverview(_loc2_,showImmediately);
   }
   function showBunkerDetails(showImmediately)
   {
      var _loc2_ = this.website.getSelectedBunker();
      this.progressPanel.showBunkerOverview(_loc2_,showImmediately);
   }
   function showHangarDetails(showImmediately)
   {
      var _loc2_ = this.website.getSelectedHangar();
      this.progressPanel.showHangarOverview(_loc2_,showImmediately);
   }
}
