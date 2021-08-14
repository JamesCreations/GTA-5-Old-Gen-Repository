class com.rockstargames.gtav.cellphone.apps.JOB_LIST extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingList
{
   var defaultRowHeight = 80;
   function JOB_LIST()
   {
      super();
   }
   function construct()
   {
      this.dataProviderUI = _level0.TIMELINE.jobListDataProviderUI;
      this.linkageID = "jobList";
      this.numberOfVisibleRows = 3;
      super.construct(this.CONTENT,this.linkageID,this.dataProviderUI);
      switch(this.gfxFileName)
      {
         case "CELLPHONE_FACADE":
            com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.bg,0,0,0,100);
            break;
         case "CELLPHONE_IFRUIT":
            com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.bg,228,223,169,100);
            com.rockstargames.ui.utils.Colour.Colourise(_level0.TIMELINE.infoBar.headerBackground,136,118,104,100);
            break;
         default:
            com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.bg,this.currentStyle[4][0],this.currentStyle[4][1],this.currentStyle[4][2],100);
      }
   }
   function populateContent()
   {
      this.dataProviderUI = _level0.TIMELINE.jobListDataProviderUI;
      this.row = 1;
      if(this.numberOfVisibleRows > 0)
      {
         var _loc4_ = 0;
         while(_loc4_ < this.numberOfVisibleRows)
         {
            var _loc2_ = "listItem" + this.row;
            var _loc3_ = _loc4_ + this.arrayStartPoint;
            if(this.dataProviderUI[_loc3_][0] != undefined)
            {
               this.container[_loc2_].jobLabel.autoTextSize = "shrink";
               var _loc6_ = this.dataProviderUI[_loc3_][0].split("<FONT COLOR=\'#F0F0F0\'>").join("");
               this.container[_loc2_].jobLabel.text = _loc6_;
               var _loc8_ = new com.rockstargames.ui.utils.Text();
               if(this.container[_loc2_].blipLayerMC)
               {
                  this.container[_loc2_].blipLayerMC.removeMovieClip();
               }
               this.container[_loc2_].createEmptyMovieClip("blipLayerMC",1000);
               var _loc7_ = this.container[_loc2_].jobDescription.textColor;
               _loc8_.setTextWithIcons(this.dataProviderUI[_loc3_][1],this.container[_loc2_].blipLayerMC,this.container[_loc2_].jobDescription,0,15.5,1,false);
               this.container[_loc2_].jobDescription.textColor = _loc7_;
               if(this.dataProviderUI[_loc3_][2] != undefined)
               {
                  if(this.dataProviderUI[_loc3_][2] > 0)
                  {
                     var _loc5_ = "BLIP_" + this.dataProviderUI[_loc3_][2].toString();
                     this.container[_loc2_].BLIPS.gotoAndStop(_loc5_);
                  }
               }
            }
            this.row = this.row + 1;
            _loc4_ = _loc4_ + 1;
         }
      }
   }
   function setState(item, isActive)
   {
      if(this.numberOfVisibleRows > 0)
      {
         if(this.gfxFileName == "CELLPHONE_IFRUIT")
         {
            if(isActive)
            {
               com.rockstargames.ui.utils.Colour.Colourise(item.background,136,118,104,100);
               item.jobLabel.textColor = this.TextWhiteHex;
               item.jobDescription.textColor = this.TextWhiteHex;
               item.BLIPS._alpha = 100;
            }
            else
            {
               com.rockstargames.ui.utils.Colour.Colourise(item.background,238,233,176,100);
               item.jobLabel.textColor = 5457729;
               item.jobDescription.textColor = 5457729;
               item.BLIPS._alpha = 50;
            }
         }
         else if(isActive)
         {
            com.rockstargames.ui.utils.Colour.Colourise(item.background,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2],100);
            item.jobLabel.textColor = this.TextWhiteHex;
            item.jobDescription.textColor = this.TextWhiteHex;
         }
         else
         {
            com.rockstargames.ui.utils.Colour.Colourise(item.background,this.offWhiteRGB[0],this.offWhiteRGB[1],this.offWhiteRGB[2],100);
            item.jobLabel.textColor = this.TextBlackHex;
            item.jobDescription.textColor = this.TextBlackHex;
         }
      }
   }
}
