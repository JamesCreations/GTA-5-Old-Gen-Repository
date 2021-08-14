class com.rockstargames.gtav.Multiplayer.MP_NEXT_JOB_SELECTION extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var SELECTION_ITEM_WIDTH = 290;
   var GRID_ITEM_PADDING = 2;
   var HEADER_HEIGHT = 64;
   var NUM_DETAILS_ITEMS = 5;
   function MP_NEXT_JOB_SELECTION()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      if(mc != undefined)
      {
         super.INITIALISE(mc);
         this.CONTENT._x = 206;
         this.CONTENT._y = 54;
      }
      var _loc3_ = 0;
      while(_loc3_ < this.NUM_DETAILS_ITEMS)
      {
         var _loc5_ = _loc3_ * 27 + this.CONTENT.bgMC.descBGMC._y;
         var _loc4_ = this.CONTENT.attachMovie("missiondetailsItem","detailsItemMC" + _loc3_,this.CONTENT.getNextHighestDepth(),{_x:580,_y:_loc5_});
         _loc4_._visible = false;
         _loc3_ = _loc3_ + 1;
      }
      this.CONTENT.titleTF.textAutoSize = "shrink";
      this.CONTENT.votesTF.textAutoSize = "shrink";
      this.CONTENT.attachMovie("selectionHighlight","highlightMC",this.CONTENT.getNextHighestDepth());
      this.CONTENT.highlightMC._visible = false;
      this.CONTENT.attachMovie("mpFriendsList","lobbyListMC",this.CONTENT.getNextHighestDepth(),{_x:580,_y:this.HEADER_HEIGHT + this.GRID_ITEM_PADDING});
      this.CONTENT.lobbyListMC.INITIALISE();
      this.CONTENT.verifiedbgMC._visible = false;
      this.CONTENT.verifiedMC._visible = false;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
   }
   function SET_TITLE(sTitle, sVotes)
   {
      com.rockstargames.ui.utils.Debug.log("SET_TITLE: " + arguments);
      this.CONTENT.titleTF.text = sTitle;
      this.CONTENT.titleTF.textAutoSize = "shrink";
      this.CONTENT.votesTF.text = !sVotes?"":sVotes;
      this.CONTENT.votesTF.textAutoSize = "shrink";
   }
   function SHOW_PLAYER_VOTE(i, sGamerName, r, g, b)
   {
      com.rockstargames.ui.utils.Debug.log("SHOW_PLAYER_VOTE: " + arguments);
      var _loc4_ = this.CONTENT["itemMC" + i];
      var _loc3_ = 0;
      while(this.CONTENT["itemMC" + _loc3_])
      {
         _loc4_ = this.CONTENT["itemMC" + _loc3_];
         _loc4_.findAndRemoveGamerName(sGamerName);
         _loc3_ = _loc3_ + 1;
      }
      (com.rockstargames.gtav.Multiplayer.MPNextJobSelectionItem)this.CONTENT["itemMC" + i].queueGamerNameFlash(sGamerName,com.rockstargames.ui.utils.Colour.RGBToHex(r,g,b));
   }
   function SET_GRID_ITEM(i, sTitle, sTXD, sTXN, textureLoadType, verifiedType, eIcon, bCheck, rpMult, cashMult, bDisabled, iconCol)
   {
      com.rockstargames.ui.utils.Debug.log("SET_GRID_ITEM: " + arguments);
      var _loc3_ = this.CONTENT["itemMC" + i];
      if(!_loc3_)
      {
         var _loc4_ = this.CONTENT["itemMC" + (i - 3)];
         var _loc7_ = i % 3 * this.SELECTION_ITEM_WIDTH;
         var _loc6_ = (!_loc4_?this.HEADER_HEIGHT:_loc4_._y + _loc4_.getHeight()) + this.GRID_ITEM_PADDING;
         _loc3_ = (com.rockstargames.gtav.Multiplayer.MPNextJobSelectionItem)this.CONTENT.attachMovie("selectionPanelItem","itemMC" + i,this.CONTENT.getNextHighestDepth(),{_x:_loc7_,_y:_loc6_});
         _loc3_.swapDepths(this.CONTENT.highlightMC);
      }
      _loc3_.setData(sTitle,sTXD,sTXN,textureLoadType,verifiedType,eIcon,bCheck,rpMult,cashMult,bDisabled,iconCol);
   }
   function SET_GRID_ITEM_VOTE(i, iNumVotes, voteBGColour, bShowCheckMark, bFlashBG)
   {
      com.rockstargames.ui.utils.Debug.log("SET_GRID_ITEM_VOTE: " + arguments);
      (com.rockstargames.gtav.Multiplayer.MPNextJobSelectionItem)this.CONTENT["itemMC" + i].setVotes(iNumVotes,voteBGColour,bShowCheckMark,bFlashBG);
   }
   function SET_SELECTION(i, sTitle, sDetails, bHideHighlight)
   {
      com.rockstargames.ui.utils.Debug.log("SET_SELECTION: " + arguments);
      var _loc5_ = this.CONTENT["itemMC" + i];
      this.CONTENT.highlightMC._visible = !bHideHighlight;
      this.CONTENT.highlightMC._x = _loc5_._x;
      this.CONTENT.highlightMC._y = _loc5_._y;
      this.CONTENT.highlightMC._height = _loc5_.getHeight();
      this.CONTENT.missionNameTF.text = sTitle;
      sDetails = com.rockstargames.gtav.utils.GTAVUIUtils.trimTextToFit(sDetails,this.CONTENT.missionDetailsTF);
      this.CONTENT.missionDetailsTF.text = sDetails;
      var _loc7_ = sTitle != "" || sDetails != "";
      this.CONTENT.bgMC.descBGMC._visible = _loc7_;
      i = 0;
      while(i < this.NUM_DETAILS_ITEMS)
      {
         var _loc4_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeDetailsItem)this.CONTENT["detailsItemMC" + i];
         _loc4_._visible = _loc4_._wasVisible = false;
         i = i + 1;
      }
   }
   function SET_DETAILS_ITEM(detailIndex)
   {
      com.rockstargames.ui.utils.Debug.log("SET_DETAILS_ITEM: " + arguments);
      var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeDetailsItem)this.CONTENT["detailsItemMC" + detailIndex];
      _loc3_._visible = _loc3_._wasVisible = true;
      _loc3_.__set__data(arguments);
      _loc3_.bgMC._y = 0;
      _loc3_.bgMC._height = 28;
   }
   function TXD_HAS_LOADED(sTXD, success, uID)
   {
      com.rockstargames.ui.utils.Debug.log("TXD_HAS_LOADED sTXD: " + sTXD + " success: " + success + " uID: " + uID);
      if(success)
      {
         (com.rockstargames.ui.media.ImageLoaderMC)eval(uID).displayTxdResponse(sTXD);
      }
   }
   function TXD_ALREADY_LOADED(sTXD, uID)
   {
      com.rockstargames.ui.utils.Debug.log("TXD_ALREADY_LOADED sTXD: " + sTXD + " uID: " + uID);
      (com.rockstargames.ui.media.ImageLoaderMC)eval(uID).displayTxdResponse(sTXD);
   }
   function ADD_TXD_REF_RESPONSE(sTXD, uID, success)
   {
      com.rockstargames.ui.utils.Debug.log("ADD_TXD_REF_RESPONSE sTXD: " + sTXD + " success: " + success + " uID: " + uID);
      if(success)
      {
         (com.rockstargames.ui.media.ImageLoaderMC)eval(uID).displayTxdResponse(sTXD);
      }
   }
   function SET_LOBBY_LIST_VISIBILITY(bShowList)
   {
      com.rockstargames.ui.utils.Debug.log("SET_LOBBY_LIST_VISIBILITY: " + arguments);
      this.CONTENT.lobbyListMC._visible = bShowList;
      this.CONTENT.itemMC2._visible = !bShowList;
      this.CONTENT.itemMC5._visible = !bShowList;
      this.CONTENT.itemMC8._visible = !bShowList;
      this.CONTENT.bgMC.bg8MC._visible = !bShowList;
      this.CONTENT.bgMC.detailsMC._visible = !bShowList;
      var _loc3_ = 0;
      while(_loc3_ < this.NUM_DETAILS_ITEMS)
      {
         var _loc4_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeDetailsItem)this.CONTENT["detailsItemMC" + _loc3_];
         _loc4_._visible = !bShowList && _loc4_._wasVisible;
         _loc3_ = _loc3_ + 1;
      }
   }
   function SET_LOBBY_LIST_DATA_SLOT()
   {
      com.rockstargames.ui.utils.Debug.log("SET_LOBBY_LIST_DATA_SLOT: " + arguments);
      this.CONTENT.lobbyListMC.SET_DATA_SLOT.apply(this.CONTENT.lobbyListMC,arguments);
   }
   function UPDATE_LOBBY_LIST_DATA_SLOT()
   {
      com.rockstargames.ui.utils.Debug.log("UPDATE_LOBBY_LIST_DATA_SLOT: " + arguments);
      this.CONTENT.lobbyListMC.UPDATE_SLOT.apply(this.CONTENT.lobbyListMC,arguments);
   }
   function DISPLAY_LOBBY_LIST_VIEW()
   {
      com.rockstargames.ui.utils.Debug.log("DISPLAY_LOBBY_LIST_VIEW: " + arguments);
      this.CONTENT.lobbyListMC.DISPLAY_VIEW.apply(this.CONTENT.lobbyListMC,arguments);
   }
   function SET_LOBBY_LIST_HIGHLIGHT()
   {
      com.rockstargames.ui.utils.Debug.log("SET_LOBBY_LIST_HIGHLIGHT: " + arguments);
      this.CONTENT.lobbyListMC.SET_HIGHLIGHT.apply(this.CONTENT.lobbyListMC,arguments);
   }
   function SET_LOBBY_LIST_DATA_SLOT_EMPTY()
   {
      com.rockstargames.ui.utils.Debug.log("SET_LOBBY_LIST_DATA_SLOT_EMPTY: " + arguments);
      this.CONTENT.lobbyListMC.SET_DATA_SLOT_EMPTY.apply(this.CONTENT.lobbyListMC,arguments);
   }
   function INIT_LOBBY_LIST_SCROLL()
   {
      com.rockstargames.ui.utils.Debug.log("INIT_LOBBY_LIST_SCROLL: " + arguments);
      this.CONTENT.lobbyListMC.INIT_SCROLL_BAR.apply(this.CONTENT.lobbyListMC,arguments);
   }
   function SET_LOBBY_LIST_SCROLL()
   {
      com.rockstargames.ui.utils.Debug.log("SET_LOBBY_LIST_SCROLL: " + arguments);
      this.CONTENT.lobbyListMC.SET_SCROLL_BAR.apply(this.CONTENT.lobbyListMC,arguments);
   }
   function CLEANUP_MOVIE()
   {
      var _loc3_ = 0;
      var _loc2_ = this.CONTENT["itemMC" + _loc3_];
      while(_loc2_)
      {
         _loc2_.onCleanup();
         _loc2_ = this.CONTENT["itemMC" + _loc3_];
         _loc3_ = _loc3_ + 1;
      }
   }
}
