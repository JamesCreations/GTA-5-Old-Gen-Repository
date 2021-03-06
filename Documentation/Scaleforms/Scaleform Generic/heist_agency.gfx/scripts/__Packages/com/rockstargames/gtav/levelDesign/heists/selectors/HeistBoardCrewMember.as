class com.rockstargames.gtav.levelDesign.heists.selectors.HeistBoardCrewMember extends com.rockstargames.ui.components.GUIMenuItem
{
   var type = "";
   var bgSelected = false;
   function HeistBoardCrewMember()
   {
      super();
      this.__set__highlighted(false);
   }
   function __set__data(_d)
   {
      this._data = _d;
      var _loc4_ = com.rockstargames.gtav.constants.HeistCrewMemberLUT.lookUp(this._data[0]);
      var _loc3_ = _loc4_[1];
      if(this.picMC != undefined)
      {
         this.picMC.removeMovieClip();
      }
      if(_loc3_ != undefined)
      {
         this.picMC = this.attachMovie(_loc3_,_loc3_ + "MC",this.getNextHighestDepth(),{_x:9,_y:-55,_xscale:80,_yscale:80});
      }
      var _loc2_ = this._data[1].split(" ");
      this.type = _loc4_[2];
      this.clampText(this.nameTF,_loc2_[0].toUpperCase(),100);
      if(_loc2_[1] != "" && _loc2_[1] != undefined)
      {
         this.clampText(this.surnameTF,_loc2_[1].toUpperCase(),100);
      }
      else
      {
         this.surnameTF.text = "";
      }
      this.clampText(this.jobTF,this._data[2],110);
      this.setStats();
      return this.__get__data();
   }
   function setStats()
   {
      var _loc3_ = this.__get__data().slice(3);
      var _loc9_ = "";
      var _loc5_ = 1;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         _loc5_ = Math.floor(_loc2_ / 2) + 1;
         if(_loc2_ % 2 == 0)
         {
            var _loc7_ = this["statlabel" + _loc5_ + "TF"];
            _loc7_.textAutoSize = "shrink";
            _loc7_.text = _loc3_[_loc2_];
         }
         else
         {
            var _loc4_ = this["statbar" + _loc5_];
            var _loc6_ = this["statvalue" + _loc5_ + "TF"];
            if(_loc2_ == _loc3_.length - 1)
            {
               _loc4_._alpha = 0;
               _loc6_.text = _loc3_[_loc2_] + "%";
            }
            else
            {
               var _loc8_ = Math.max(0,Math.min(_loc3_[_loc2_],100));
               _loc4_.gotoAndStop(_loc8_);
               _loc4_._alpha = 100;
               _loc6_.text = "";
            }
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function clampText(textF, label, maxVal)
   {
      if(label != "" && label != undefined)
      {
         textF.text = label;
         textF.autoSize = true;
         textF.wordWrap = false;
         if(textF._width > maxVal)
         {
            textF._xscale = maxVal / textF._width * 100;
         }
      }
   }
   function __set__labels(l)
   {
      if(l[0] != undefined)
      {
         this.clampText(this.nametitleTF,l[0],52);
         this.nametitlebgMC._width = this.nametitleTF._width;
      }
      if(l[1] != undefined)
      {
         this.clampText(this.jobtitleTF,l[1],52);
         this.jobtitlebgMC._width = this.jobtitleTF._width;
      }
      if(l[2] != undefined)
      {
         this.clampText(this.stattitleTF,l[2],52);
         this.stattitlebgMC._width = this.stattitleTF._width;
      }
      return this.__get__labels();
   }
   function __set__highlighted(_h)
   {
      this.bgMC.frameMC.gotoAndStop(!_h?2:1);
      this._highlighted = _h;
      return this.__get__highlighted();
   }
}
