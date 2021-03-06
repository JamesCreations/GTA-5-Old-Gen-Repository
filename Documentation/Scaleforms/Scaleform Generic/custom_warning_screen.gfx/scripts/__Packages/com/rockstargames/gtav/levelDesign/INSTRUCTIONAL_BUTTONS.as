class com.rockstargames.gtav.levelDesign.INSTRUCTIONAL_BUTTONS extends com.rockstargames.ui.core.BaseScreenLayout
{
   var PADDING = 6;
   var respawn_spinner_frame = 1;
   var numberOfItems = 0;
   var iconSize = 24;
   var fullWidth = 0;
   var _maxWidth = 1280;
   var numberOfLines = 1;
   var is_saving = false;
   var savingText = "";
   var stackType = 0;
   var TEXT_BOX_PADDING = 1;
   var OVERRIDE_BUTTON_SWAP = false;
   var textIndicator = "t";
   var seperator = "%";
   var keyMovieClipID = 999;
   var CLICKABLE = false;
   function INSTRUCTIONAL_BUTTONS()
   {
      super();
      _global.gfxExtensions = true;
      this.CONSTRUCTION_INNARDS();
   }
   function CONSTRUCTION_INNARDS()
   {
      this._leadingSize = 2;
      this.lineYPosition = 0;
      this.spaceBetweenInstructions = 12;
      this.maxLines = 20;
      this.itemList = [];
      this.thisButtonArray = [];
      this.DispConf = new com.rockstargames.ui.utils.DisplayConfig();
      this.DispConf = this.getDisplayConfig(true);
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.buttonList = [];
      this.backgrounds = [];
      this.backgroundMCS = [];
      this.instructionalTextFormat = new TextFormat();
      this.instructionalTextFormat.font = "$Font2";
      this.instructionalTextFormat.size = 12;
      var _loc4_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc4_);
      this.instructionalTextFormat.color = com.rockstargames.ui.utils.Colour.RGBToHex(_loc4_.r,_loc4_.g,_loc4_.b);
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG,_loc3_);
      this.SET_BACKGROUND_COLOUR(_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
   }
   function initScreenLayout()
   {
      if(!this.DispConf.isWideScreen)
      {
         Stage.scaleMode = "noBorder";
         this.DispConf.screenWidth = 960;
         this.FOUR_THREE_PADDING = 160;
      }
      this.container._x = this.FOUR_THREE_PADDING + this.DispConf.safeRight * this.DispConf.screenWidth;
      this.container._y = this.DispConf.safeBottom * this.DispConf.screenHeight;
      var _loc6_ = undefined;
      var _loc5_ = undefined;
      var _loc4_ = undefined;
      var _loc3_ = undefined;
      var _loc2_ = 0;
      while(_loc2_ < this.backgroundMCS.length)
      {
         _loc4_ = this.backgrounds[_loc2_];
         if(_loc2_ < 1)
         {
            _loc4_ = _loc4_ + this.PADDING * 2;
         }
         _loc6_ = this.FOUR_THREE_PADDING + (this.DispConf.safeRight * this.DispConf.screenWidth - _loc4_);
         _loc5_ = this.DispConf.safeBottom * this.DispConf.screenHeight - (this.iconSize + this._leadingSize) * _loc2_ - this.iconSize;
         if(this.backgroundMCS[_loc2_] != undefined)
         {
            _loc3_ = this.backgroundMCS[_loc2_];
            _loc3_._x = _loc6_;
            _loc3_._y = _loc5_;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isCircleAccept)
   {
      this.DispConf.isCircleAccept = _isCircleAccept;
      this.DispConf.isWideScreen = _isWideScreen;
      this.DispConf.safeBottom = _safeBottomPercent;
      this.DispConf.safeLeft = _safeLeftPercent;
      this.DispConf.safeRight = _safeRightPercent;
      this.DispConf.safeTop = _safeTopPercent;
      this.DispConf.screenHeight = _screenHeightPixels;
      this.DispConf.screenWidth = _screenWidthPixels;
      this.initScreenLayout();
   }
   function TOGGLE_MOUSE_BUTTONS(hasButtons)
   {
      this.CLICKABLE = hasButtons;
   }
   function saveSpinerFrame()
   {
      if(typeof this.respawn_spinnerMC == "movieclip")
      {
         var _loc2_ = this.respawn_spinnerMC.spinner;
         if(_loc2_ != undefined)
         {
            this.respawn_spinner_frame = _loc2_._currentframe;
         }
      }
   }
   function SET_SAVING_TEXT(iconEnum, saveStr)
   {
      this.savingText = saveStr;
      this.savingIconID = iconEnum;
      var _loc9_ = 0;
      var _loc5_ = 1;
      var _loc8_ = 2;
      var _loc10_ = 3;
      var _loc7_ = 4;
      var _loc6_ = 5;
      if(saveStr == undefined)
      {
         saveStr = "";
      }
      var _loc2_ = 48;
      if(iconEnum == _loc5_)
      {
         _loc2_ = 48;
      }
      if(iconEnum == _loc7_)
      {
         _loc2_ = 49;
      }
      if(iconEnum == _loc6_)
      {
         _loc2_ = 50;
      }
      if(this.is_saving)
      {
         this.REMOVE_SAVING();
      }
      this.itemList.unshift([_loc2_,saveStr]);
      this.CLEAR_RENDER();
      this.DRAW_INSTRUCTIONAL_BUTTONS(this.stackType);
      this.is_saving = true;
   }
   function REMOVE_SAVING()
   {
      if(this.is_saving)
      {
         this.itemList.shift();
         this.CLEAR_RENDER();
         this.DRAW_INSTRUCTIONAL_BUTTONS(this.stackType);
      }
      this.is_saving = false;
   }
   function CLEAR_ALL()
   {
      this.saveSpinerFrame();
      this.buttonList = [];
      this.backgrounds = [];
      this.CREATE_CONTAINER();
      this.itemList = new Array();
      this.CLEAR_BACKGROUNDS();
      if(this.is_saving)
      {
         this.SET_SAVING_TEXT(this.savingIconID,this.savingText);
      }
   }
   function CLEAR_RENDER()
   {
      this.saveSpinerFrame();
      this.buttonList = [];
      this.backgrounds = [];
      this.backgroundMCS = [];
      this.CREATE_CONTAINER();
      this.CLEAR_BACKGROUNDS();
   }
   function OVERRIDE_POSITION(newX, newY, alignBottomRight)
   {
      if(alignBottomRight == undefined)
      {
         alignBottomRight = false;
      }
      this.container._x = - this.screenWidthPixels + (this.screenWidthPixels - this.background._x);
      this.container._y = - this.screenHeightPixels + (this.screenHeightPixels - this.background._y);
      this.container._x = this.container._x + newX;
      this.container._y = this.container._y + newY;
      if(alignBottomRight)
      {
         this.container._x = this.container._x - this.container._width;
         this.container._y = this.container._y - this.container._height;
      }
   }
   function SET_CLEAR_SPACE(clearSpace)
   {
      this.SET_MAX_WIDTH((this.DispConf.screenWidth - clearSpace) / this.DispConf.screenWidth);
   }
   function SET_LEADING(newLeading)
   {
   }
   function SET_DATA_SLOT()
   {
      var _loc6_ = arguments[0];
      if(this.is_saving)
      {
         _loc6_ = _loc6_ + 1;
      }
      this.thisButtonArray = [];
      var _loc4_ = arguments.slice(1);
      var _loc5_ = _loc4_.length - 1;
      if(this.CLICKABLE)
      {
         _loc5_ = _loc4_.length - 2;
      }
      var _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         this.parse(_loc4_[_loc3_]);
         _loc3_ = _loc3_ + 1;
      }
      if(this.CLICKABLE)
      {
         this.thisButtonArray.push(_loc4_[_loc4_.length - 2]);
         this.thisButtonArray.push(_loc4_[_loc4_.length - 1]);
      }
      else
      {
         this.thisButtonArray.push(_loc4_[_loc4_.length - 1]);
      }
      this.itemList[_loc6_] = this.thisButtonArray;
   }
   function SET_DATA_SLOT_EMPTY()
   {
      this.CLEAR_ALL();
   }
   function CREATE_CONTAINER()
   {
      if(this.container)
      {
         this.container.removeMovieClip();
      }
      this.container = this.CONTENT.createEmptyMovieClip("container",100,{_x:0,_y:0});
   }
   function CLEAR_BACKGROUNDS()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.backgroundMCS.length)
      {
         this.backgroundMCS[_loc2_].removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.backgroundMCS = [];
   }
   function DRAW_INSTRUCTIONAL_BUTTONS(layoutType)
   {
      this.numberOfItems = 0;
      this.fullWidth = 0;
      if(layoutType == 1)
      {
         this.SET_MAX_WIDTH(0);
      }
      if(layoutType == -1)
      {
         this.SET_MAX_WIDTH(1);
         this.OVERRIDE_BUTTON_SWAP = true;
      }
      else
      {
         this.OVERRIDE_BUTTON_SWAP = false;
      }
      if(layoutType == undefined)
      {
         this.SET_MAX_WIDTH(1);
         layoutType = 0;
      }
      this.stackType = layoutType;
      if(this.itemList.length > 0)
      {
         this.lineYPosition = 1;
         this.CREATE_CONTAINER();
         this.buttonList = [];
         this.backgrounds = [];
         this.backgroundMCS = [];
         this.createLineOfButtons(0,0);
      }
      this.SET_BACKGROUND();
      return 1;
   }
   function createLineOfButtons(Xpos, startIndex)
   {
      var _loc11_ = undefined;
      var _loc3_ = startIndex;
      var _loc6_ = 0;
      var _loc9_ = 0;
      var _loc10_ = undefined;
      var _loc2_ = undefined;
      var _loc4_ = undefined;
      var _loc12_ = undefined;
      var _loc5_ = undefined;
      _loc3_ = startIndex;
      while(_loc3_ < this.itemList.length)
      {
         _loc2_ = this.createItem(this.itemList[_loc3_]);
         this.buttonList.push(_loc2_);
         if(_loc3_ > 0)
         {
            _loc4_ = this.buttonList[_loc3_ - 1];
            _loc2_._x = _loc4_._x - (_loc2_._width + this.spaceBetweenInstructions);
            _loc2_._y = _loc4_._y;
            _loc5_ = _loc2_._width + this.spaceBetweenInstructions;
            if(_loc5_ + this.fullWidth <= this._maxWidth)
            {
               this.fullWidth = this.fullWidth + (_loc2_._width + this.spaceBetweenInstructions);
            }
            else
            {
               this.backgrounds.push(this.fullWidth);
               this.fullWidth = 0;
               this.numberOfLines = this.numberOfLines + 1;
               _loc2_._y = _loc4_._y - this._leadingSize - this.iconSize;
               _loc2_._x = Xpos - _loc2_._width;
               this.fullWidth = this.fullWidth + (_loc2_._width + this.spaceBetweenInstructions);
               this.createLineOfButtons(0,_loc3_ + 1);
               return 0;
            }
         }
         else
         {
            _loc2_._x = - _loc2_._width + this.PADDING;
            this.fullWidth = this.fullWidth + _loc2_._width;
         }
         if(_loc6_ > this.maxLines)
         {
            return 0;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.backgrounds.push(this.fullWidth);
   }
   function createItem(item)
   {
      item.reverse();
      var _loc9_ = false;
      if(this.CLICKABLE)
      {
         _loc9_ = Boolean(item.shift());
      }
      var _loc4_ = [];
      var _loc5_ = [];
      var _loc8_ = this.container.createEmptyMovieClip("item" + this.numberOfItems,this.container.getNextHighestDepth());
      this.numberOfItems = this.numberOfItems + 1;
      _loc8_._y = - this.iconSize;
      var _loc7_ = undefined;
      var _loc6_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < item.length)
      {
         _loc7_ = 0;
         _loc6_ = _loc2_;
         if(typeof item[_loc2_] == "string")
         {
            _loc5_.push(true);
            _loc4_.push(this.generateTextField("TF_" + _loc2_,item[_loc2_],_loc8_));
         }
         if(typeof item[_loc2_] == "number")
         {
            _loc5_.push(false);
            _loc4_.push(this.createButtonIcon(item[_loc2_],_loc8_));
         }
         if(typeof item[_loc2_] == "object")
         {
            _loc5_.push(false);
            _loc4_.push(this.createButtonIcon(item[_loc2_].buttonID,_loc8_,item[_loc2_].buttonChar));
         }
         if(_loc2_ > 0)
         {
            _loc6_ = _loc2_ - 1;
            _loc7_ = this.getWidth(_loc4_[_loc6_],_loc5_[_loc2_ - 1]);
            _loc4_[_loc2_]._x = _loc4_[_loc6_]._x + _loc7_ + 6;
         }
         else
         {
            _loc7_ = this.getWidth(_loc4_[_loc6_],_loc5_[_loc2_ - 1]);
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc8_._x = - _loc7_;
      if(this.CLICKABLE)
      {
         item.unshift(_loc9_);
      }
      item.reverse();
      if(_loc9_)
      {
         this.drawButton(_loc8_);
      }
      return _loc8_;
   }
   function drawButton(mc)
   {
      var _loc5_ = mc.createEmptyMovieClip("clickable",mc.getNextHighestDepth());
      _loc5_.beginFill(16711935,100);
      _loc5_.moveTo(0,0);
      _loc5_.lineTo(mc._width,0);
      _loc5_.lineTo(mc._width,mc._height);
      _loc5_.lineTo(0,mc._height);
      _loc5_.lineTo(0,0);
      _loc5_.endFill();
      _loc5_._alpha = 0;
      var thisObj = this;
      _loc5_.thisObj = thisObj;
      _loc5_.onRelease = function()
      {
         var _loc2_ = -1;
         for(var _loc3_ in this._parent)
         {
            if(typeof this._parent[_loc3_] == "movieclip")
            {
               if(this._parent[_loc3_]._name != "clickable")
               {
                  _loc2_ = Number(this._parent._name.slice(4));
                  if(thisObj.is_saving)
                  {
                     _loc2_ = _loc2_ - 1;
                  }
               }
            }
         }
      };
      _loc5_.onRollOver = function()
      {
         var _loc2_ = undefined;
         for(var _loc5_ in this._parent)
         {
            if(typeof this._parent[_loc5_] == "movieclip")
            {
               if(this._parent[_loc5_]._name != "clickable")
               {
                  _loc2_ = this._parent[_loc5_].duplicateMovieClip(this._parent[_loc5_]._name + "rollOver",this._parent.getNextHighestDepth());
                  var _loc3_ = new flash.geom.Transform(_loc2_);
                  var _loc4_ = new flash.geom.ColorTransform(1,1,1,1,255,255,255,0);
                  _loc3_.colorTransform = _loc4_;
                  _loc2_._alpha = 20;
               }
            }
         }
      };
      _loc5_.onRollOut = function()
      {
         var _loc3_ = undefined;
         for(var _loc2_ in this._parent)
         {
            if(typeof this._parent[_loc2_] == "movieclip")
            {
               if(this._parent[_loc2_]._name.indexOf("rollOver") > -1)
               {
                  this._parent[_loc2_].removeMovieClip();
               }
            }
         }
      };
      _loc5_.onReleaseOutside = _loc5_.onRollOut;
   }
   function getWidth(obj, isString)
   {
      if(isString)
      {
         return obj.textWidth;
      }
      return obj._width;
   }
   function createButtonIcon(buttonID, buttonParent, key)
   {
      if(!this.OVERRIDE_BUTTON_SWAP)
      {
         if(this.DispConf.isCircleAccept)
         {
            if(buttonID == 30)
            {
               buttonID = 31;
            }
            else if(buttonID == 31)
            {
               buttonID = 30;
            }
         }
      }
      var _loc3_ = undefined;
      if(buttonID == 30 || buttonID == 31 || buttonID == 32 || buttonID == 33)
      {
         _loc3_ = buttonParent.attachMovie("face_button_" + buttonID,"button_" + buttonID,buttonID,{_width:20,_height:20,_x:2,_y:2});
      }
      else if(buttonID == 999)
      {
         _loc3_ = buttonParent.attachMovie("button_" + buttonID,"button_" + buttonParent.getNextHighestDepth(),buttonParent.getNextHighestDepth(),{_width:20,_height:20,_x:2,_y:2});
      }
      else
      {
         _loc3_ = buttonParent.attachMovie("button_" + buttonID,"button_" + buttonID,buttonID,{_width:20,_height:20,_x:2,_y:2});
      }
      if(buttonID == 44)
      {
         this.respawn_spinnerMC = _loc3_;
         this.respawn_spinnerMC.spinner.gotoAndPlay(this.respawn_spinner_frame);
      }
      if(key != undefined)
      {
         _loc3_.Char.autoTextSize = "shrink";
         _loc3_.Char.text = key;
      }
      return _loc3_;
   }
   function SET_BACKGROUND()
   {
      var _loc6_ = undefined;
      var _loc5_ = undefined;
      var _loc3_ = undefined;
      var _loc4_ = undefined;
      var _loc2_ = 0;
      while(_loc2_ < this.backgrounds.length)
      {
         _loc3_ = this.backgrounds[_loc2_];
         if(_loc2_ < 1)
         {
            _loc3_ = _loc3_ + this.PADDING * 2;
         }
         _loc6_ = this.FOUR_THREE_PADDING + (this.DispConf.safeRight * this.DispConf.screenWidth - _loc3_);
         _loc5_ = this.DispConf.safeBottom * this.DispConf.screenHeight - (this.iconSize + this._leadingSize) * _loc2_ - this.iconSize;
         _loc4_ = this.CONTENT.attachMovie("backgroundShape","background" + _loc2_,10 + _loc2_,{_width:_loc3_,_x:_loc6_,_y:_loc5_,_height:this.iconSize});
         this.backgroundMCS.push(_loc4_);
         com.rockstargames.ui.utils.Colour.Colourise(_loc4_,this.backgroundColours[0],this.backgroundColours[1],this.backgroundColours[2],this.backgroundColours[3]);
         _loc2_ = _loc2_ + 1;
      }
      _loc4_._visible = this.requiresBackground();
      this.initScreenLayout();
   }
   function generateTextField(textFieldName, textString, parentMovieClip)
   {
      var _loc3_ = parentMovieClip[textFieldName];
      if(_loc3_ == undefined)
      {
         _loc3_ = parentMovieClip.createTextField(textFieldName,parentMovieClip.getNextHighestDepth(),0,0,10,10);
      }
      _loc3_.embedFonts = true;
      _loc3_.autoSize = true;
      if(textString != undefined)
      {
         var _loc2_ = textString.split("PlayStation");
         if(_loc2_.length > 1)
         {
            var _loc5_ = textString.split("Store");
            if(_loc5_.length > 1)
            {
               textString = "";
               if(_loc2_[0] != "PlayStation")
               {
                  textString = textString + _loc2_[0];
               }
               textString = textString + ("PlayStation" + String.fromCharCode(174) + "Store");
               if(_loc2_[_loc2_.length] != "Store" && _loc2_[_loc2_.length] != undefined)
               {
                  textString = textString + _loc2_[_loc2_.length];
               }
            }
         }
         _loc3_.text = textString;
      }
      _loc3_.setTextFormat(this.instructionalTextFormat);
      _loc3_._y = _loc3_._y + _loc3_.textHeight / 5;
      return _loc3_;
   }
   function SET_PADDING(top, right, bottom, left)
   {
      this.PADDING = top;
   }
   function SET_BACKGROUND_COLOUR(r, g, b, a)
   {
      this.backgroundColours = [r,g,b,a];
      if(this.background)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.background,r,g,b,a);
      }
   }
   function OVERRIDE_RESPAWN_TEXT(id, txt)
   {
      if(this.is_saving)
      {
         id = id + 1;
      }
      var _loc2_ = this.buttonList[id].TF_0;
      _loc2_.text = txt;
      _loc2_.setTextFormat(this.instructionalTextFormat);
   }
   function FLASH_BUTTON_BY_ID(buttonID, alpha, duration)
   {
      if(this.is_saving)
      {
         buttonID = buttonID + 1;
      }
      if(duration == undefined)
      {
         duration = 0.2;
      }
      if(alpha == undefined)
      {
         alpha = 100;
      }
      var _loc3_ = undefined;
      var _loc2_ = this.buttonList[buttonID];
      var _loc4_ = undefined;
      for(var _loc5_ in _loc2_)
      {
         if(typeof _loc2_[_loc5_] == "movieclip")
         {
            _loc4_ = _loc2_[_loc5_];
         }
      }
      var _loc6_ = _loc4_._name + "clone";
      _loc3_ = _loc4_[_loc6_];
      if(typeof _loc3_ == "movieclip")
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc3_);
         _loc3_.removeMovieClip();
      }
      _loc3_ = _loc4_.duplicateMovieClip(_loc6_,_loc2_.getNextHighestDepth());
      var _loc7_ = new flash.geom.Transform(_loc3_);
      var _loc9_ = new flash.geom.ColorTransform(1,1,1,1,255,255,255,0);
      _loc7_.colorTransform = _loc9_;
      _loc3_._alpha = alpha;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(_loc3_,duration,{onComplete:this.removeButton,onCompleteScope:this,onCompleteArgs:[_loc3_]});
   }
   function removeButton(mc)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(mc);
      mc.removeMovieClip();
   }
   function SET_MAX_WIDTH(maxWidth)
   {
      this._maxWidth = maxWidth * this.DispConf.screenWidth;
   }
   function getFourThreeSafeZoneOffset(screenWidthPixels)
   {
      var _loc2_ = 0;
      if(this.FILE_WIDTH >= screenWidthPixels)
      {
         _loc2_ = (this.FILE_WIDTH - screenWidthPixels) / 2 / 2;
      }
      return _loc2_;
   }
   function requiresBackground()
   {
      if(this.itemList.length <= 1)
      {
         if(this.itemList[0][1] == "")
         {
            if(this.itemList[0][0] == 44 || this.itemList[0][0] == 48 || this.itemList[0][0] == 49 || this.itemList[0][0] == 50)
            {
               return false;
            }
         }
      }
      return true;
   }
   function parse(incomingStr)
   {
      if(typeof incomingStr == "number")
      {
         this.addButton(incomingStr);
      }
      else
      {
         var _loc3_ = incomingStr.split(this.seperator);
         var _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            if(this.isKey(_loc3_[_loc2_]))
            {
               this.addKey(_loc3_[_loc2_]);
            }
            else
            {
               this.addButton(_loc3_[_loc2_]);
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function addKey(instructions)
   {
      var _loc2_ = new Object();
      _loc2_.buttonID = this.keyMovieClipID;
      _loc2_.buttonChar = instructions.substr(2,instructions.length);
      this.thisButtonArray.push(_loc2_);
   }
   function addButton(instructions)
   {
      if(typeof instructions == "number")
      {
         this.thisButtonArray.push(instructions);
      }
      else
      {
         this.thisButtonArray.push(Number(instructions.substr(2,instructions.length)));
      }
   }
   function isKey(str)
   {
      var _loc2_ = str.substr(0,1);
      if(_loc2_ == this.textIndicator)
      {
         return true;
      }
      return false;
   }
   function debug()
   {
      this.TOGGLE_MOUSE_BUTTONS(true);
      this.SET_DATA_SLOT(0,9999,"Transitioning to PlayStation(c)Store",0);
      this.SET_DATA_SLOT(1,"b_30","Vote",0);
      this.SET_DATA_SLOT(2,"t_D%t_S%t_A%t_W","Move",1);
      this.SET_DATA_SLOT(3,32,33,"Player List",1);
      this.SET_MAX_WIDTH(1);
      this.DRAW_INSTRUCTIONAL_BUTTONS(0);
      this.SET_DISPLAY_CONFIG(1280,720,0.03,0.97,0.03,0.97,true,false,false);
      this.backgroundMCS[0]._alpha = 20;
      this.SET_SAVING_TEXT(-100,"Joining GTA Online");
      this.backgroundMCS[0]._alpha = 20;
   }
}
