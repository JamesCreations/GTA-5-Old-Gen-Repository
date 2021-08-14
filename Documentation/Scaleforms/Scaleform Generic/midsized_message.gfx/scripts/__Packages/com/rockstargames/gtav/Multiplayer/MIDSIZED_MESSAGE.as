class com.rockstargames.gtav.Multiplayer.MIDSIZED_MESSAGE extends com.rockstargames.ui.core.BaseScreenLayout
{
   function MIDSIZED_MESSAGE()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
   }
   function SHOW_MIDSIZED_MESSAGE(title, description)
   {
      this.CONTENT.removeMovieClip();
      this.BOUNDING_BOX.removeMovieClip();
      this.INITIALISE(this.TIMELINE);
      if(title != undefined)
      {
         this.CONTENT.MASTER_SCREEN.TITLE.textAutoSize = this.CONTENT.MASTER_SCREEN.TITLE_OUTLINE.textAutoSize = "shrink";
         this.CONTENT.MASTER_SCREEN.TITLE.htmlText = this.CONTENT.MASTER_SCREEN.TITLE_OUTLINE.htmlText = title;
         this.CONTENT.MASTER_SCREEN.TITLE_OUTLINE.textColor = 0;
         this.CONTENT.MASTER_SCREEN.TITLE_OUTLINE.outline = 14;
      }
      if(description != undefined)
      {
         this.CONTENT.MASTER_SCREEN.DESCRIPTION.htmlText = description;
         this.CONTENT.MASTER_SCREEN.DESCRIPTION_BLACK.htmlText = description;
      }
      this.CONTENT._visible = true;
   }
   function SHOW_BRIDGES_KNIVES_PROGRESS(title, totalToDo, message, info, completed)
   {
      var _loc2_ = String(completed) + " / " + String(totalToDo) + " " + info;
      this.SHOW_SHARD_MIDSIZED_MESSAGE(title,_loc2_);
   }
   function SHOW_SHARD_MIDSIZED_MESSAGE(bigText, msgText)
   {
      if(this.BigMessageMaster != undefined)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageMaster);
         this.BigMessageMaster.removeMovieClip();
      }
      var _loc2_ = 100;
      this.BigMessageMaster = this.TIMELINE.attachMovie("SHARD_MESSAGE","SHARD_MESSAGE",_loc2_,{_x:640});
      this.SHARD_SET_TEXT(bigText,msgText);
      var _loc3_ = 30;
      this.BigMessageMaster.bgMC._y = this.BigMessageMaster.textHolderMC._y + this.BigMessageMaster.textHolderMC._height / 2;
      this.BigMessageMaster.bgMC._height = this.BigMessageMaster.textHolderMC._height + _loc3_ * 2;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BigMessageMaster.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
      this.CONTENT._visible = false;
   }
   function SHARD_SET_TEXT(bigText, msgText)
   {
      var _loc3_ = this.BigMessageMaster.textHolderMC.titleMC.BIG_TEXT;
      var _loc2_ = this.BigMessageMaster.textHolderMC.MESSAGE_TEXT;
      if(bigText == "")
      {
         _loc3_._visible = false;
      }
      else
      {
         _loc3_.textAutoSize = "shrink";
         _loc3_.htmlText = "<font color=\'#FFFFFF\'>" + bigText + "</font>";
         _loc3_._visible = true;
      }
      if(msgText == "" || msgText == undefined)
      {
         _loc2_._visible = false;
         _loc2_._y = 0;
      }
      else
      {
         _loc2_.htmlText = msgText;
         _loc2_.multiline = true;
         _loc2_.wordWrap = true;
         _loc2_.autoSize = true;
         if(_loc3_._visible == true)
         {
            _loc2_._y = _loc3_.textHeight;
         }
         _loc2_._visible = true;
         _loc2_._alpha = 0;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,0.35,{_alpha:100});
      }
   }
   function SHARD_ANIM_OUT(colID, animTime)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageMaster);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageMaster.textHolderMC.MESSAGE_TEXT);
      this.BigMessageMaster._y = 0;
      this.BigMessageMaster._alpha = 100;
      if(animTime == undefined)
      {
         animTime = 0.33;
      }
      if(colID == undefined)
      {
         colID = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK;
      }
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BigMessageMaster.bgMC,colID);
      var _loc3_ = - this.BigMessageMaster.textHolderMC._y;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BigMessageMaster,animTime,{ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_INOUT,_y:_loc3_,_alpha:0});
   }
}
