class com.rockstargames.gtav.levelDesign.ShopModel extends com.rockstargames.ui.components.GUIModel
{
   function ShopModel()
   {
      super();
   }
   function createView(_viewIndex, _params)
   {
      var _loc2_ = this.viewList[_viewIndex];
      if(_loc2_ == undefined)
      {
         _loc2_ = new com.rockstargames.gtav.levelDesign.ShopView();
      }
      _loc2_.viewIndex = _viewIndex;
      _loc2_.__set__params(_params);
      this.viewList[_viewIndex] = _loc2_;
   }
   function removeDataFromSlot(_viewIndex, _slotIndex)
   {
      var _loc3_ = this.viewList[_viewIndex];
      _loc3_.destroy();
      this.viewIndex = 0;
      var _loc2_ = (com.rockstargames.gtav.levelDesign.ShopView)this.getCurrentView();
      _loc2_.__set__index(0);
   }
   function setItem(_currentView, _itemIndex)
   {
      _currentView.__set__index(_itemIndex);
      if(this.__get__scrollBar() != undefined)
      {
         if(_itemIndex < _currentView.__get__maxitems() - _currentView.visibleItems + 1)
         {
            this.__get__scrollBar().__set__scrollpercent(100 * (_itemIndex / _currentView.__get__maxitems()));
         }
         else
         {
            this.__get__scrollBar().__set__scrollpercent(100 * ((_currentView.__get__maxitems() - _currentView.visibleItems) / _currentView.__get__maxitems()));
         }
      }
   }
   function __set__arrows(a)
   {
      this._arrows = a;
      return this.__get__arrows();
   }
   function __get__arrows()
   {
      return this._arrows;
   }
}
