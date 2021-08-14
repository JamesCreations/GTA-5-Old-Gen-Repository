class com.rockstargames.gtav.web.BrowserKeyboard extends com.rockstargames.ui.core.BrowserUIComponent
{
   var standardWidth = 48;
   var doubleWidth = 100;
   var _numberOfRows = 5;
   var _offScreenY = 730;
   var previousColumn = 1;
   function BrowserKeyboard()
   {
      super();
   }
   function construct(parentContainer, keyLinkageID, params)
   {
      this.keysArray = new Array();
      this.charsArray = new Array();
      this.col = 1;
      this.row = 1;
      super.construct(parentContainer,keyLinkageID,params);
      this.key = keyLinkageID;
      if(params.inputButton)
      {
         this.__set__inputButton(params.inputButton);
      }
      if(params.numberOfColumns)
      {
         this.__set__numberOfColumns(params.numberOfColumns);
      }
      if(params.offScreenY)
      {
         this.__set__offScreenY(params.offScreenY);
      }
      this.renderContainers();
   }
   function renderContainers()
   {
      this.__set__offsetX(640 - this.__get__numberOfColumns() / 2 * (this.standardWidth + this.__get__columnSpace()));
      var _loc5_ = this.__get__offsetX();
      var _loc4_ = 0;
      var _loc3_ = 0;
      while(_loc3_ < this.dataProviderUI.length)
      {
         if(this.dataProviderUI[_loc3_] != ">")
         {
            var _loc2_ = this.col + "_" + this.row;
            if(this.container[_loc2_] != undefined)
            {
               this.container[_loc2_].removeMovieClip();
            }
            if(this.row == 5)
            {
               this.keySpacing = this.doubleWidth;
               this.key = "keyMC_double";
            }
            else
            {
               this.keySpacing = this.standardWidth;
               this.key = "keyMC";
            }
            this.container[_loc2_] = this.container.attachMovie(this.key,_loc2_,this.container.getNextHighestDepth());
            this.container[_loc2_]._name = _loc2_;
            this.container[_loc2_]._id = _loc3_;
            this.setState(this.container[_loc2_],false);
            _loc5_ = _loc5_ + (_loc4_ + this.__get__columnSpace());
            this.container[_loc2_]._x = _loc5_;
            var _loc6_ = (this.container[_loc2_]._height + this.__get__rowSpace()) * this.row + this.__get__offsetY();
            this.container[_loc2_]._y = _loc6_;
            if(this.dataProviderUI[_loc3_] == "BACKSPACE")
            {
               this.container[_loc2_].attachMovie("deleteKey","deleteKey",this.container[_loc2_].getNextHighestDepth());
            }
            else if(this.dataProviderUI[_loc3_] == "ENTER")
            {
               this.container[_loc2_].attachMovie("returnKey","returnKey",this.container[_loc2_].getNextHighestDepth());
            }
            else if(this.dataProviderUI[_loc3_] != " ")
            {
               this.container[_loc2_].char.text = this.dataProviderUI[_loc3_];
            }
            this.charsArray.push(this.dataProviderUI[_loc3_]);
            this.keysArray.push(_loc2_);
         }
         this.col = this.col + 1;
         _loc4_ = this.keySpacing;
         if(this.col > this.__get__numberOfColumns())
         {
            this.row = this.row + 1;
            _loc4_ = 0;
            _loc5_ = this.offsetX;
            this.col = 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.__set__numberOfRows(5);
      this.currentKey = this.container["1_1"];
      this.setState(this.currentKey,true);
      this.__set__currentSelection(this.currentKey._id);
      this.previousKey = this.container["1_1"];
   }
   function SHOW()
   {
   }
   function set_pc_key(key)
   {
      var _loc5_ = false;
      var _loc3_ = -1;
      var _loc2_ = 0;
      while(_loc2_ < this.keysArray.length)
      {
         if(this.charsArray[_loc2_] == key)
         {
            _loc3_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc3_ != -1)
      {
         if(this.currentKey != undefined)
         {
            this.setState(this.currentKey,false);
         }
         this.currentKey = this.container[this.keysArray[_loc3_]];
         this.previousKey = this.currentKey;
         if(this.currentKey != undefined)
         {
            this.setState(this.currentKey,true);
         }
         _loc5_ = true;
      }
      return _loc5_;
   }
   function navigate(direction)
   {
      this.setState(this.currentKey,false);
      var _loc5_ = this.currentKey._name.split("_");
      var _loc2_ = Number(_loc5_[0]);
      var _loc3_ = Number(_loc5_[1]);
      var _loc4_ = false;
      switch(direction)
      {
         case "LEFT":
            _loc4_ = true;
            this.currentKey = this.container[_loc2_ - 1 + "_" + _loc3_];
            if(this.isBlankKey(_loc2_ - 1,_loc3_) == true)
            {
               this.currentKey = this.container[_loc2_ - 2 + "_" + _loc3_];
            }
            if(this.currentKey == undefined)
            {
               this.currentKey = this.container[this.__get__numberOfColumns() + "_" + _loc3_];
               if(this.isBlankKey(this.__get__numberOfColumns(),_loc3_) == true)
               {
                  this.currentKey = this.container[this.__get__numberOfColumns() - 1 + "_" + _loc3_];
               }
            }
            break;
         case "RIGHT":
            _loc4_ = true;
            this.currentKey = this.container[_loc2_ + 1 + "_" + _loc3_];
            if(this.isBlankKey(_loc2_ + 1,_loc3_) == true)
            {
               this.currentKey = this.container[_loc2_ + 2 + "_" + _loc3_];
            }
            if(this.currentKey == undefined)
            {
               this.currentKey = this.container["1_" + _loc3_];
            }
            break;
         case "UP":
            _loc4_ = true;
            this.currentKey = this.container[_loc2_ + "_" + (_loc3_ - 1)];
            if(this.currentKey == undefined)
            {
               this.currentKey = this.container[_loc2_ + "_" + this.__get__numberOfRows()];
               if(this.isBlankKey(_loc2_,this.__get__numberOfRows()) == true)
               {
                  if(_loc2_ == 2 || _loc2_ == 4 || _loc2_ == 6 || _loc2_ == 8 || _loc2_ == 10)
                  {
                     this.currentKey = this.container[_loc2_ - 1 + "_" + this.__get__numberOfRows()];
                  }
                  else
                  {
                     this.currentKey = this.container[_loc2_ + 1 + "_" + this.__get__numberOfRows()];
                  }
                  if(this.currentKey == undefined)
                  {
                     this.currentKey = this.container["1_" + this.__get__numberOfRows()];
                  }
               }
            }
            break;
         case "DOWN":
            _loc4_ = true;
            this.currentKey = this.container[_loc2_ + "_" + (_loc3_ + 1)];
            if(this.isBlankKey(_loc2_,_loc3_ + 1) == true)
            {
               if(_loc2_ == 2 || _loc2_ == 4 || _loc2_ == 6 || _loc2_ == 8 || _loc2_ == 10)
               {
                  this.currentKey = this.container[_loc2_ - 1 + "_" + this.__get__numberOfRows()];
               }
               else
               {
                  this.currentKey = this.container[_loc2_ + 1 + "_" + (_loc3_ + 1)];
               }
               if(this.currentKey == undefined)
               {
                  this.currentKey = this.container[_loc2_ - 2 + "_" + (_loc3_ + 1)];
                  if(this.currentKey == undefined)
                  {
                     this.currentKey = this.container["1_" + this.__get__numberOfRows()];
                  }
               }
            }
            if(this.currentKey == undefined)
            {
               this.currentKey = this.container[_loc2_ + "_1"];
            }
            break;
         case "HIDE":
            this.HIDE();
      }
      this.__set__currentSelection(this.currentKey._id);
      this.setState(this.currentKey,true);
      if(_loc4_ == true)
      {
         com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"Click_Keyboard_Nav","WEB_NAVIGATION_SOUNDS_PHONE");
      }
   }
   function setState(item, isActive)
   {
      if(item != undefined && item._parent != undefined)
      {
         if(isActive)
         {
            if(item != undefined)
            {
               com.rockstargames.ui.utils.Colour.Colourise(item,this.__get__secondaryColour()[0],this.__get__secondaryColour()[1],this.__get__secondaryColour()[2]);
            }
         }
         else if(item != undefined)
         {
            com.rockstargames.ui.utils.Colour.Colourise(item,this.__get__primaryColour()[0],this.__get__primaryColour()[1],this.__get__primaryColour()[2]);
         }
      }
   }
   function isBlankKey(currentColumn, currentRow)
   {
      var _loc2_ = false;
      if(currentRow == 5)
      {
         if(currentColumn == 2 || currentColumn == 4 || currentColumn == 6 || currentColumn == 8 || currentColumn == 10)
         {
            _loc2_ = true;
         }
      }
      return _loc2_;
   }
   function __get__numberOfRows()
   {
      return this._numberOfRows;
   }
   function __set__numberOfRows(newNumberOfRows)
   {
      this._numberOfRows = newNumberOfRows;
      return this.__get__numberOfRows();
   }
   function __get__columnSpace()
   {
      return this._columnSpace;
   }
   function __set__columnSpace(newColumnSpace)
   {
      this._columnSpace = newColumnSpace;
      return this.__get__columnSpace();
   }
   function __get__offScreenY()
   {
      return this._offScreenY;
   }
   function __set__offScreenY(newOffScreenY)
   {
      this._offScreenY = newOffScreenY;
      return this.__get__offScreenY();
   }
   function __get__inputButton()
   {
      return this._inputButton;
   }
   function __set__inputButton(newInputButton)
   {
      this._inputButton = newInputButton;
      return this.__get__inputButton();
   }
}
