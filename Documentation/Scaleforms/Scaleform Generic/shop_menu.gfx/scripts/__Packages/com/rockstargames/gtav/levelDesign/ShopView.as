class com.rockstargames.gtav.levelDesign.ShopView extends com.rockstargames.ui.components.GUIView
{
   var selectableList = new Array();
   function ShopView()
   {
      super();
   }
   function reorderHighlightStyle(targetIndex)
   {
      var _loc5_ = this.direction(targetIndex);
      if(_loc5_ != 0)
      {
         var _loc3_ = targetIndex;
         if(_loc3_ > this.dataList.length - this.itemList.length)
         {
            targetIndex = this.dataList.length - this.itemList.length;
         }
         _loc3_ = _loc3_ - targetIndex;
         var _loc2_ = 0;
         _loc2_ = 0;
         while(_loc2_ < this.itemList.length)
         {
            this.itemList[_loc2_].data = this.dataList[_loc2_ + targetIndex];
            this.itemList[_loc2_].highlighted = _loc3_ == _loc2_;
            _loc2_ = _loc2_ + 1;
         }
         this.highlightedItem = _loc3_;
      }
   }
   function addDisplayItem(i, _dataArray)
   {
      if(this.viewLinkageList[i] == undefined)
      {
         this.viewLinkageList[i] = this.viewLinkageList[i - 1];
      }
      var _loc4_ = this.viewLinkageList[i];
      var _loc3_ = this.viewContainer.attachMovie(_loc4_,_loc4_ + i + "MC",i);
      _loc3_._y = this.itemY;
      var _loc5_ = (com.rockstargames.ui.components.GUIMenuItem)_loc3_;
      _loc5_.__set__data(_dataArray);
      this.itemList[i] = _loc5_;
      this.itemY = this.itemY + (22 + this.rowSpacing);
   }
   function __set__highlighted(_h)
   {
      this._highlighted = _h;
      var _loc2_ = 0;
      while(_loc2_ < this.itemList.length)
      {
         this.itemList[_loc2_].highlighted = _loc2_ == this.__get__index();
         _loc2_ = _loc2_ + 1;
      }
      return this.__get__highlighted();
   }
   function destroy()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.itemList.length)
      {
         this.itemList[_loc2_].removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.itemList = [];
      this.dataList = [];
   }
}
