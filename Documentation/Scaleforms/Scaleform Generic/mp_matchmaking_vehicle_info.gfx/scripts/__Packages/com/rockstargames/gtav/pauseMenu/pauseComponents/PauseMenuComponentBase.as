class com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase extends com.rockstargames.ui.components.GUIController
{
   var titleHeight = 27;
   var preloadTxds = false;
   var dbgID = "";
   var dbgOn = false;
   var canJump = true;
   function PauseMenuComponentBase()
   {
      super();
   }
   function dbg(dbgStr)
   {
      if(this.dbgOn)
      {
         com.rockstargames.ui.utils.Debug.log("*** SCALEFORM | " + this.dbgID + " : " + dbgStr);
      }
   }
   function SET_DATA_SLOT(_viewIndex, _slotIndex)
   {
      this.model.addDataToView(0,_viewIndex,arguments);
      if(this.scrollBase != undefined)
      {
         this.scrollBase.updateScroll();
      }
   }
   function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
   {
      super.SET_DATA_SLOT_EMPTY(viewIndex,itemIndex);
      this.model.getCurrentView().topEdge = 0;
      if(this.scrollBase != undefined)
      {
         this.scrollBase.updateScroll();
      }
   }
   function ADD_SLOT(_viewIndex, _slotIndex)
   {
      this.model.addSlot(0,_viewIndex,arguments);
      if(this.scrollBase != undefined)
      {
         this.scrollBase.updateScroll();
      }
   }
   function UPDATE_SLOT(_viewIndex, _slotIndex)
   {
      this.model.updateSlot(0,_viewIndex,arguments);
      if(this.scrollBase != undefined)
      {
         this.scrollBase.updateScroll();
      }
   }
   function CLEAR_HIGHLIGHT()
   {
      this.model.getCurrentView().highlightedItem = 0;
      this.model.getCurrentView().topEdge = 0;
      this.model.getCurrentView().__set__index(0);
   }
   function SHOW_COLUMN(bool)
   {
      this.CONTENT._visible = bool;
      if(this.scrollBase != undefined)
      {
         this.scrollBase.updateScroll();
      }
   }
   function SET_COLUMN_CAN_JUMP(b)
   {
      this.canJump = b;
   }
   function SET_TITLE(str)
   {
   }
   function SET_DESCRIPTION()
   {
   }
   function SET_HIGHLIGHT(i)
   {
   }
   function SET_STATE(i)
   {
   }
   function SET_FOCUS(isFocused)
   {
      var _loc3_ = this.model.getCurrentView().itemList;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         _loc3_[_loc2_].highlighted = !isFocused?false:this.model.getCurrentView().highlightedItem == _loc2_;
         _loc2_ = _loc2_ + 1;
      }
      if(this.scrollBase != undefined)
      {
         this.scrollBase.updateScroll();
         this.scrollBase._visible = isFocused && this.scrollBase.displayEnabled();
      }
   }
   function INIT_SCROLL_BAR(visible, columns, scrollType, arrowPosition, override, xColOffset)
   {
      if(this.scrollBase == undefined)
      {
         this.scrollBase = (com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase)this.CONTENT.attachMovie("PM_ScrollBase","scrollBase",this.CONTENT.getNextHighestDepth());
      }
      if(!override)
      {
         this.scrollBase.setComponent(this);
      }
      this.scrollBase.INIT_SCROLL_BAR(visible,columns,scrollType,arrowPosition,override,xColOffset);
   }
   function SET_SCROLL_BAR(currentPosition, maxPosition, maxVisible, caption)
   {
      if(this.scrollBase != undefined)
      {
         this.scrollBase.SET_SCROLL_BAR.apply(this.scrollBase,arguments);
      }
   }
   function getTxdData()
   {
      var _loc1_ = undefined;
      return _loc1_;
   }
   function SET_INPUT_EVENT(direction)
   {
      super.SET_INPUT_EVENT(direction);
      if(this.scrollBase != undefined)
      {
         this.scrollBase.updateScroll();
      }
   }
   function ON_DESTROY()
   {
   }
}
