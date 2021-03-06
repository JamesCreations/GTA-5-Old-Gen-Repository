class com.rockstargames.gtav.levelDesign.DIGITAL_CAMERA extends com.rockstargames.ui.core.BaseScreenLayout
{
   function DIGITAL_CAMERA()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      var _loc4_ = 640;
      var _loc3_ = 360;
      this.ui = this.CONTENT.attachMovie("uiOverlayMC","uiMC",this.CONTENT.getNextHighestDepth(),{_x:0,_y:0});
      this.photoFrame = this.CONTENT.attachMovie("photoFrameMC","photoFrameMC",this.CONTENT.getNextHighestDepth(),{_x:_loc4_,_y:_loc3_});
      this.shutter = this.CONTENT.attachMovie("shutterSlideMC","shutterMC",this.CONTENT.getNextHighestDepth(),{_x:0,_y:0});
      this.SHOW_FOCUS_LOCK(false,"");
      this.SHOW_PHOTO_FRAME(false);
      this.SET_REMAINING_PHOTOS(1);
      this.SHOW_PHOTO_BORDER(false);
   }
   function initScreenLayout()
   {
      this.ui.savedPhotos._x = this.safeRight;
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isAsian)
   {
      this.isWideScreen = _isWideScreen;
      this.isHiDef = _isHiDef;
      if(!this.isWideScreen)
      {
         Stage.scaleMode = "noBorder";
         var _loc4_ = 1.7777777777777777;
         var _loc3_ = 1.3333333333333333;
         this.FOUR_THREE_PADDING = (this.FILE_WIDTH - Math.round(this.FILE_WIDTH / _loc4_ * _loc3_)) / 2;
         _screenWidthPixels = this.FILE_WIDTH - this.FOUR_THREE_PADDING * 2;
      }
      this.safeLeft = this.FOUR_THREE_PADDING + Math.round(_screenWidthPixels * _safeLeftPercent);
      this.safeRight = this.FOUR_THREE_PADDING + Math.round(_screenWidthPixels * _safeRightPercent);
      this.safeTop = Math.round(_screenHeightPixels * _safeTopPercent);
      this.safeBottom = Math.round(_screenHeightPixels * _safeBottomPercent);
      this.initScreenLayout();
   }
   function SHOW_REMAINING_PHOTOS(vis)
   {
      if(vis == undefined)
      {
         vis = true;
      }
      this.ui.savedPhotos._visible = vis;
   }
   function SET_REMAINING_PHOTOS(photosTaken, photosLeft)
   {
      if(photosLeft == 1)
      {
         this.SHOW_REMAINING_PHOTOS(false);
      }
      else
      {
         var _loc2_ = photosTaken + "/" + photosLeft;
         this.ui.savedPhotos.photosLeftTF.text = _loc2_;
         this.SHOW_REMAINING_PHOTOS(true);
      }
   }
   function SHOW_PHOTO_BORDER(vis, rotation, xpos, ypos)
   {
      if(vis == undefined)
      {
         vis = true;
      }
      if(rotation != undefined)
      {
         this.photoFrame._rotation = rotation;
      }
      var _loc4_ = 640;
      var _loc3_ = 360;
      if(xpos != undefined)
      {
         _loc4_ = 1280 * xpos;
      }
      if(ypos != undefined)
      {
         _loc3_ = 720 * ypos;
      }
      this.photoFrame._x = _loc4_;
      this.photoFrame._y = _loc3_;
      this.photoFrame._visible = vis;
   }
   function SHOW_PHOTO_FRAME(vis)
   {
      if(vis == undefined)
      {
         vis = true;
      }
      this.ui.photoFrame._visible = vis;
      this.ui.focusLockDetail._visible = false;
   }
   function SHOW_FOCUS_LOCK(isVisible, str)
   {
      this.ui.focusLockDetail._visible = isVisible;
      this.ui.savedPhotos.FOCUS_LOCK._visible = isVisible;
      this.ui.savedPhotos.FOCUS_LOCK.focuslockTF.text = str;
   }
   function OPEN_SHUTTER()
   {
      this.goTo("openShutter");
   }
   function CLOSE_SHUTTER()
   {
      this.goTo("closeShutter");
   }
   function CLOSE_THEN_OPEN_SHUTTER()
   {
      this.goTo("close_then_open");
   }
   function goTo(whichFrame)
   {
      if(this.shutter != undefined)
      {
         this.shutter.blade0.gotoAndPlay(whichFrame);
         this.shutter.blade1.gotoAndPlay(whichFrame);
      }
   }
}
