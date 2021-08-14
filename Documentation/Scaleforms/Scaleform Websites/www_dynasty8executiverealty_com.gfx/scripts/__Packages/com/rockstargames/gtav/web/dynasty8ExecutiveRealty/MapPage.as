class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.MapPage extends com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page
{
   static var MAP_SCALE_STEP = 0.1;
   static var MAP_SCALE_MIN = 0.2;
   static var MAP_SCALE_MAX = 1.25;
   static var MAP_MOVE_SPEED = 20;
   function MapPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"mapPage",pageName,isFirstPage,progressPanel,header);
      this.nextOfficePageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.STYLE_PAGE.name;
      this.nextGaragePageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.GARAGE_1_PAGE.name;
      this.officeDataSet = false;
      this.markers = [];
      this.garageMarkers = [];
      this.mapMoveX = 0;
      this.mapMoveY = 0;
      this.mapScaleStep = 0;
      this.mapIsBeingDragged = false;
      this.safeZoneLeft = website.displayConfig.safeLeft * com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_WIDTH;
      this.safeZoneRight = website.displayConfig.safeRight * com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_WIDTH;
      this.safeZoneTop = website.displayConfig.safeTop * com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_HEIGHT + 148;
      this.safeZoneBottom = website.displayConfig.safeBottom * com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_HEIGHT;
      this.scrollWheelValue = 0;
      this.view._alpha = 100;
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(header.label,"DYN8_EXEC_OFFICE_MAP");
      var _loc5_ = header.label.getTextFormat();
      _loc5_.letterSpacing = 3;
      header.label.setTextFormat(_loc5_);
      progressPanel.initOverview();
      progressPanel.hide();
      if(website.__get__selectedOfficeID() != -1)
      {
         if(!website.garageSelected)
         {
            this.showOfficeDetails(true);
         }
      }
   }
   function setOfficeData(officeData)
   {
      if(this.officeDataSet)
      {
         return undefined;
      }
      this.officeData = officeData;
      var _loc5_ = 0;
      var _loc6_ = officeData.length;
      while(_loc5_ < _loc6_)
      {
         var _loc2_ = officeData[_loc5_].id;
         var _loc4_ = "officeMarker_" + _loc2_;
         var _loc7_ = this.view.markers[_loc4_] || this.view.markers.marker0.duplicateMovieClip(_loc4_,_loc2_);
         if(_loc2_ != this.website.__get__selectedOfficeID())
         {
            _loc7_._xscale = _loc7_._yscale = 1;
            _loc7_.gotoAndStop(!officeData[_loc5_].isOwned?"unownedInactive":"ownedInactive");
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc7_,0.2,{delay:_loc5_ * 0.05,_xscale:100,_yscale:100,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
         }
         this.markers[_loc2_] = _loc7_;
         this.website.dataTextScope.push(_loc7_.btnTxt);
         if(officeData[_loc5_].hasGarage)
         {
            _loc4_ = "garageMarker_" + _loc2_;
            _loc7_ = this.view.markers[_loc4_] || this.view.markers.attachMovie("garageMarker",_loc4_,_loc2_ + 1000);
            _loc7_.disabled = true;
            if(_loc2_ != this.website.__get__selectedOfficeID())
            {
               _loc7_.gotoAndStop(!officeData[_loc5_].garageIsOwned?"unownedInactive":"ownedInactive");
            }
            this.garageMarkers[_loc2_] = _loc7_;
            this.website.dataTextScope.push(_loc7_.btnTxt);
         }
         _loc5_ = _loc5_ + 1;
      }
      this.updateMarkers();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.officeDataSet = true;
      if(this.website.__get__selectedOfficeID() != -1)
      {
         var _loc12_ = this.website.getOfficeByID(this.website.__get__selectedOfficeID());
         if(_loc12_)
         {
            if(_loc12_.__get__hasGarage())
            {
               _loc7_ = this.garageMarkers[this.website.__get__selectedOfficeID()];
               if(_loc7_)
               {
                  _loc7_.swapDepths(_loc7_._parent.getNextHighestDepth());
                  _loc7_.gotoAndStop(!_loc12_.__get__garageIsOwned()?"unownedActive":"ownedActive");
                  _loc7_.icon.gotoAndStop(_loc7_.icon._totalframes);
                  _loc7_.disabled = false;
               }
               if(this.website.garageSelected)
               {
                  this.showGarageDetails(true);
               }
            }
            else
            {
               this.showOfficeDetails(true);
            }
            _loc7_ = this.markers[this.website.__get__selectedOfficeID()];
            if(_loc7_)
            {
               _loc7_.swapDepths(_loc7_._parent.getNextHighestDepth());
               _loc7_.gotoAndStop(!_loc12_.__get__isOwned()?"unownedActive":"ownedActive");
               _loc7_.icon.gotoAndStop(_loc7_.icon._totalframes);
            }
         }
      }
      _loc5_ = 0;
      _loc6_ = officeData.length;
      while(_loc5_ < _loc6_)
      {
         _loc7_ = this.view.markers["officeMarker_" + officeData[_loc5_].id];
         if(officeData[_loc5_].isOwned)
         {
            _loc7_.swapDepths(this.view.markers.getNextHighestDepth());
         }
         _loc5_ = _loc5_ + 1;
      }
   }
   function handleClick(type, id)
   {
      var _loc2_ = undefined;
      var _loc3_ = parseInt(id);
      if(type == "officeMarker")
      {
         if(_loc3_ != this.website.__get__selectedOfficeID())
         {
            this.resetMarkers(false);
            this.website.setSelectedOffice(_loc3_);
            this.showOfficeDetails(false);
         }
         var _loc4_ = this.website.getOfficeByID(_loc3_);
         if(_loc4_)
         {
            if(_loc4_.__get__hasGarage())
            {
               _loc2_ = this.garageMarkers[_loc3_];
               if(_loc2_)
               {
                  _loc2_.swapDepths(_loc2_._parent.getNextHighestDepth());
                  _loc2_.gotoAndStop(!_loc4_.__get__garageIsOwned()?"unownedActive":"ownedActive");
                  _loc2_.disabled = false;
               }
            }
            _loc2_ = this.markers[_loc3_];
            if(_loc2_)
            {
               _loc2_.swapDepths(_loc2_._parent.getNextHighestDepth());
               _loc2_.gotoAndStop(!_loc4_.__get__isOwned()?"unownedActive":"ownedActive");
            }
            this.showOfficeDetails(true);
         }
         this.website.garageSelected = false;
      }
      else if(type == "garageMarker")
      {
         this.resetMarkers(true);
         this.showGarageDetails(false);
         this.website.garageSelected = true;
      }
      else if(type == "nextButton")
      {
         this.website.browser.GO_TO_WEBPAGE(!this.website.garageSelected?this.nextOfficePageName:this.nextGaragePageName);
      }
      else
      {
         this.resetMarkers(false);
      }
   }
   function handleLT()
   {
      this.mapScaleStep = -0.5 * com.rockstargames.gtav.web.dynasty8ExecutiveRealty.MapPage.MAP_SCALE_STEP;
      this.updateMapView();
   }
   function handleRT()
   {
      this.mapScaleStep = 0.5 * com.rockstargames.gtav.web.dynasty8ExecutiveRealty.MapPage.MAP_SCALE_STEP;
      this.updateMapView();
   }
   function handleLTRelease()
   {
      this.mapScaleStep = 0;
      this.updateMapView();
   }
   function handleRTRelease()
   {
      this.mapScaleStep = 0;
      this.updateMapView();
   }
   function handleRB()
   {
      if(this.website.garageSelected)
      {
         var _loc2_ = this.website.getSelectedOffice();
         if(_loc2_ && _loc2_.__get__isOwned())
         {
            this.website.browser.GO_TO_WEBPAGE(this.nextGaragePageName);
         }
      }
      else if(this.website.__get__selectedOfficeID() != -1)
      {
         this.website.browser.GO_TO_WEBPAGE(this.nextOfficePageName);
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
            this.mapMoveX = (- com.rockstargames.gtav.web.dynasty8ExecutiveRealty.MapPage.MAP_MOVE_SPEED) * x / 150;
            this.mapMoveY = (- com.rockstargames.gtav.web.dynasty8ExecutiveRealty.MapPage.MAP_MOVE_SPEED) * y / 150;
            this.updateMapView();
         }
      }
   }
   function handleMouseClick(inputIsMouseClick)
   {
      this.resetMarkers(false);
      var _loc3_ = this.website.browser.CURSOR._x;
      var _loc2_ = this.website.browser.CURSOR._y;
      if(_loc3_ > this.safeZoneLeft && _loc3_ < this.safeZoneRight && _loc2_ > this.safeZoneTop && _loc2_ < this.safeZoneBottom)
      {
         this.progressPanel.hide();
         this.website.setSelectedOffice(-1);
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
      _loc3_ = 0;
      _loc4_ = this.garageMarkers.length;
      while(_loc3_ < _loc4_)
      {
         if(this.garageMarkers[_loc3_])
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.garageMarkers[_loc3_]);
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
      if(this.view.map._width > com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_WIDTH)
      {
         this.view.map._x = Math.min(0,Math.max(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_WIDTH - this.view.map._width,this.mapDragX0 + _loc3_));
      }
      if(this.view.map._height > com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_HEIGHT)
      {
         this.view.map._y = Math.min(0,Math.max(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_HEIGHT - this.view.map._height,this.mapDragY0 + _loc2_));
      }
   }
   function moveMap()
   {
      var _loc2_ = this.view.map._x + this.mapMoveX;
      var _loc3_ = this.view.map._y + this.mapMoveY;
      var _loc4_ = 98;
      var _loc6_ = 0.5 * (com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_WIDTH - this.view.map._width);
      var _loc5_ = 0.5 * (com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_HEIGHT - _loc4_ - this.view.map._height) + _loc4_;
      var _loc9_ = 0.5 * com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_WIDTH - this.view.map._width;
      var _loc7_ = 0.5 * com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_WIDTH;
      var _loc10_ = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_HEIGHT - this.view.map._height - _loc4_;
      var _loc8_ = _loc4_;
      if(this.mapMoveX > 0)
      {
         if(_loc2_ <= _loc6_ || _loc2_ >= _loc9_ && _loc2_ <= _loc7_)
         {
            this.view.map._x = _loc2_;
         }
      }
      else if(_loc2_ >= _loc6_ || _loc2_ >= _loc9_ && _loc2_ <= _loc7_)
      {
         this.view.map._x = _loc2_;
      }
      if(this.mapMoveY > 0)
      {
         if(_loc3_ <= _loc5_ || _loc3_ >= _loc10_ && _loc3_ <= _loc8_)
         {
            this.view.map._y = _loc3_;
         }
      }
      else if(_loc3_ >= _loc5_ || _loc3_ >= _loc10_ && _loc3_ <= _loc8_)
      {
         this.view.map._y = _loc3_;
      }
      this.website.mapX = this.view.map._x;
      this.website.mapY = this.view.map._y;
      this.website.mapMatrix = this.view.map.transform.matrix.clone();
   }
   function scaleMap()
   {
      var _loc2_ = this.view.map.transform.matrix;
      var _loc3_ = this.mapScaleStep + 1;
      var _loc4_ = _loc2_.a * _loc3_;
      if(_loc4_ > com.rockstargames.gtav.web.dynasty8ExecutiveRealty.MapPage.MAP_SCALE_MAX)
      {
         _loc3_ = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.MapPage.MAP_SCALE_MAX / _loc2_.a;
      }
      else if(_loc4_ < com.rockstargames.gtav.web.dynasty8ExecutiveRealty.MapPage.MAP_SCALE_MIN)
      {
         _loc3_ = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.MapPage.MAP_SCALE_MIN / _loc2_.a;
      }
      _loc2_.translate(- com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_CENTRE_X,- com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_CENTRE_Y);
      _loc2_.scale(_loc3_,_loc3_);
      _loc2_.translate(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_CENTRE_X,com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_CENTRE_Y);
      this.view.map.transform.matrix = _loc2_;
      this.website.mapX = this.view.map._x;
      this.website.mapY = this.view.map._y;
      this.website.mapMatrix = _loc2_.clone();
   }
   function updateMarkers()
   {
      var _loc10_ = this.view.map._x;
      var _loc9_ = this.view.map._y;
      var _loc5_ = this.view.map.transform.matrix.a;
      var _loc3_ = 0;
      var _loc6_ = this.officeData.length;
      while(_loc3_ < _loc6_)
      {
         var _loc4_ = this.officeData[_loc3_].id;
         var _loc2_ = this.markers[_loc4_];
         if(_loc2_)
         {
            var _loc8_ = _loc5_ * this.officeData[_loc3_].x + _loc10_;
            var _loc7_ = _loc5_ * this.officeData[_loc3_].y + _loc9_;
            _loc2_._x = _loc8_;
            _loc2_._y = _loc7_;
            if(this.isHiddenByProgressPanel(_loc2_) || this.isOffScreen(_loc2_))
            {
               _loc2_.disabled = true;
               _loc2_._visible = false;
            }
            else
            {
               _loc2_.disabled = false;
               _loc2_._visible = true;
            }
         }
         _loc2_ = this.garageMarkers[_loc4_];
         if(_loc2_)
         {
            _loc8_ = _loc5_ * this.officeData[_loc3_].x + _loc10_;
            _loc7_ = _loc5_ * this.officeData[_loc3_].y + _loc9_;
            _loc2_._x = _loc8_;
            _loc2_._y = _loc7_;
            if(this.isHiddenByProgressPanel(_loc2_) || this.isOffScreen(_loc2_))
            {
               _loc2_.disabled = true;
               _loc2_._visible = false;
            }
            else
            {
               _loc2_.disabled = _loc4_ != this.website.__get__selectedOfficeID();
               _loc2_._visible = true;
            }
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function resetMarkers(holdActiveOffice)
   {
      var _loc6_ = this.website.__get__selectedOfficeID();
      var _loc3_ = 0;
      var _loc5_ = this.officeData.length;
      while(_loc3_ < _loc5_)
      {
         var _loc4_ = this.officeData[_loc3_].id;
         var _loc2_ = this.markers[_loc4_];
         if(_loc2_)
         {
            if(!holdActiveOffice || _loc4_ != _loc6_)
            {
               _loc2_.gotoAndStop(!this.officeData[_loc3_].isOwned?"unownedInactive":"ownedInactive");
            }
         }
         _loc2_ = this.garageMarkers[_loc4_];
         if(_loc2_)
         {
            if(!holdActiveOffice || _loc4_ != _loc6_)
            {
               _loc2_.gotoAndStop(!this.officeData[_loc3_].garageIsOwned?"unownedInactive":"ownedInactive");
               _loc2_.disabled = true;
            }
         }
         _loc3_ = _loc3_ + 1;
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
   function showOfficeDetails(showImmediately)
   {
      var _loc2_ = this.website.getSelectedOffice();
      this.progressPanel.showOverview(_loc2_,showImmediately);
   }
   function showGarageDetails(showImmediately)
   {
      var _loc2_ = this.website.getSelectedOffice();
      this.progressPanel.showGarageOverview(_loc2_,showImmediately);
   }
}
