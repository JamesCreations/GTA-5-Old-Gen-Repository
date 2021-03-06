class com.rockstargames.gtav.levelDesign.securoserv.WarehousePanel
{
   function WarehousePanel(view, displayConfig)
   {
      this.view = view;
      this.isAsian = displayConfig.isAsian;
      this._controls = [];
      this.currWarehouseID = -1;
      view.name.textAutoSize = "shrink";
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.sellButton);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.smallShipment.buyButton);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.mediumShipment.buyButton);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.largeShipment.buyButton);
      this._controls = null;
      this.capacityMeter.dispose();
      this.capacityMeter = null;
      this.buyButton = null;
      this.sellButton = null;
      this.smallShipmentButton = null;
      this.mediumShipmentButton = null;
      this.largeShipmentButton = null;
      this.view.gotoAndStop("resetView");
      this.view = null;
   }
   function show(warehouse, imageManager)
   {
      if(this.currWarehouseID == warehouse.__get__id() && this.showingOwnedView == warehouse.__get__isOwned())
      {
         return undefined;
      }
      this.currWarehouseID = warehouse.id;
      this.showingOwnedView = warehouse.isOwned;
      if(this.capacityMeter)
      {
         this.capacityMeter.dispose();
         this.capacityMeter = null;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.sellButton);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.smallShipment.buyButton);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.mediumShipment.buyButton);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.largeShipment.buyButton);
      this._controls.length = 0;
      this.view.gotoAndStop("resetView");
      if(warehouse.__get__isOwned())
      {
         this.initOwnedView(warehouse);
      }
      else
      {
         this.initUnownedView(warehouse);
      }
      imageManager.addImage(warehouse.__get__txd(),warehouse.__get__txd(),this.view.image);
      this.view._visible = true;
   }
   function hide()
   {
      this.currWarehouseID = -1;
      this.view._visible = false;
      this._controls.length = 0;
      if(this.capacityMeter)
      {
         this.capacityMeter.dispose();
         this.capacityMeter = null;
      }
   }
   function __get__controls()
   {
      return this._controls;
   }
   function __get__left()
   {
      return this._left;
   }
   function __get__right()
   {
      return this._right;
   }
   function __get__top()
   {
      return this._top;
   }
   function __get__bottom()
   {
      return this._bottom;
   }
   function initOwnedView(warehouse)
   {
      this.view.gotoAndStop("owned");
      this._controls = [];
      this.view.name.text = warehouse.name;
      this.view.location.text = warehouse.location;
      this.view.shipment.text = warehouse.shipmentDescription;
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.locationLabel,"SECUROSERV_LOCATION");
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.sizeLabel,"SECUROSERV_SIZE");
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.storageLabel,"SECUROSERV_CONTRABAND");
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.currentValueLabel,"SECUROSERV_CURRENT_VALUE");
      this.view.currentValue.text = "$" + com.rockstargames.gtav.levelDesign.SECUROSERV.formatNumber(warehouse.__get__currentValue());
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.size,"SECUROSERV_SIZE_" + warehouse.__get__size());
      var _loc5_ = warehouse.__get__capacity() != 1?"SECUROSERV_UNITS":"SECUROSERV_UNIT";
      this.view.storage.text = warehouse.__get__amountStored() + " / " + warehouse.__get__capacity() + " " + com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.storage,_loc5_);
      this.setupTextFieldPair(this.view.locationLabel,this.view.location);
      this.setupTextFieldPair(this.view.sizeLabel,this.view.size);
      this.setupTextFieldPair(this.view.storageLabel,this.view.storage);
      this.setupTextFieldPair(this.view.currentValueLabel,this.view.currentValue);
      var _loc4_ = warehouse.__get__capacity() - warehouse.__get__amountStored();
      if(_loc4_ >= warehouse.__get__smallShipmentSize())
      {
         this.smallShipmentButton = this.initShipmentPanel(this.view.smallShipment,warehouse.__get__smallShipmentSize(),warehouse.__get__smallShipmentCost(),warehouse.__get__smallShipmentSaleCost(),warehouse.__get__buyCooldown(),warehouse.__get__smallShipmentIsSpecial(),com.rockstargames.gtav.levelDesign.securoserv.MapScreen.SMALL_SHIPMENT,warehouse.__get__shipmentDescription());
      }
      else
      {
         this.view.smallShipment._visible = false;
      }
      if(_loc4_ >= warehouse.__get__mediumShipmentSize())
      {
         this.mediumShipmentButton = this.initShipmentPanel(this.view.mediumShipment,warehouse.__get__mediumShipmentSize(),warehouse.__get__mediumShipmentCost(),warehouse.__get__mediumShipmentSaleCost(),warehouse.__get__buyCooldown(),false,com.rockstargames.gtav.levelDesign.securoserv.MapScreen.MEDIUM_SHIPMENT,warehouse.__get__shipmentDescription());
      }
      else
      {
         this.view.mediumShipment._visible = false;
      }
      if(_loc4_ >= warehouse.__get__largeShipmentSize())
      {
         this.largeShipmentButton = this.initShipmentPanel(this.view.largeShipment,warehouse.__get__largeShipmentSize(),warehouse.__get__largeShipmentCost(),warehouse.__get__largeShipmentSaleCost(),warehouse.__get__buyCooldown(),false,com.rockstargames.gtav.levelDesign.securoserv.MapScreen.LARGE_SHIPMENT,warehouse.__get__shipmentDescription());
      }
      else
      {
         this.view.largeShipment._visible = false;
      }
      var _loc3_ = this.view.smallShipment._y;
      if(this.view.smallShipment._visible)
      {
         _loc3_ = _loc3_ + this.view.smallShipment._height;
      }
      else
      {
         this.view.mediumShipment._y = _loc3_;
      }
      if(this.view.mediumShipment._visible)
      {
         _loc3_ = _loc3_ + this.view.mediumShipment._height;
      }
      else
      {
         this.view.largeShipment._y = _loc3_;
      }
      if(this.view.largeShipment._visible)
      {
         _loc3_ = _loc3_ + this.view.largeShipment._height;
      }
      else
      {
         this.view.sellButton._y = _loc3_;
      }
      this.view.sellButton._visible = false;
      this.capacityMeter = new com.rockstargames.gtav.levelDesign.securoserv.CapacityMeter(this.view.capacityMeter);
      this.capacityMeter.__set__percentage(100 * warehouse.__get__amountStored() / warehouse.__get__capacity());
      this.setBounds();
   }
   function initShipmentPanel(panel, size, cost, saleCost, buyCooldown, isSpecialItem, buttonID, description)
   {
      panel.size.textAutoSize = "shrink";
      if(isSpecialItem)
      {
         com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(panel.size,"SECUROSERV_SPECIAL_ITEM");
      }
      else
      {
         var _loc7_ = size != 1?"SECUROSERV_UNITS":"SECUROSERV_UNIT";
         panel.size.text = com.rockstargames.gtav.levelDesign.SECUROSERV.formatNumber(size) + " " + com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(panel.size,_loc7_) + ": " + description;
      }
      if(saleCost != undefined && saleCost >= 0)
      {
         if(this.isAsian)
         {
            var _loc4_ = panel.cost.getNewTextFormat();
            _loc4_.size = 26;
            panel.cost.setNewTextFormat(_loc4_);
         }
         panel.cost.text = "$" + com.rockstargames.gtav.levelDesign.SECUROSERV.formatNumber(saleCost);
         panel.saleCost.text = "$" + com.rockstargames.gtav.levelDesign.SECUROSERV.formatNumber(cost);
         panel.redLine._visible = true;
         panel.saleCost._x = panel.cost._x + panel.cost.textWidth + 10;
         panel.redLine._x = panel.saleCost._x + 5;
         panel.redLine._width = panel.saleCost.textWidth;
      }
      else
      {
         panel.cost.text = "$" + com.rockstargames.gtav.levelDesign.SECUROSERV.formatNumber(cost);
         panel.saleCost.text = "";
         panel.redLine._visible = false;
      }
      var _loc6_ = panel.buyButton._x + panel.buyButton._width;
      var _loc3_ = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(buttonID,panel.buyButton,"SECUROSERV_BUY");
      this._controls.push(_loc3_);
      panel.buyButton._x = _loc6_ - panel.buyButton._width;
      _loc3_.updateBounds();
      if(buyCooldown > getTimer())
      {
         panel.buyButton._alpha = 50;
         this.updateCooldown(panel.buyButton,buyCooldown,"SECUROSERV_BUY");
      }
      panel._visible = true;
      return _loc3_;
   }
   function initUnownedView(warehouse)
   {
      this.view.gotoAndStop("unowned");
      this.view.descriptionLabel.textAutoSize = "shrink";
      this.view.description.textAutoSize = "shrink";
      this.view.name.text = warehouse.name;
      this.view.location.text = warehouse.location;
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.locationLabel,"SECUROSERV_LOCATION");
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.sizeLabel,"SECUROSERV_SIZE");
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.storageLabel,"SECUROSERV_STORAGE");
      this.setupTextFieldPair(this.view.locationLabel,this.view.location);
      this.setupTextFieldPair(this.view.sizeLabel,this.view.size);
      this.setupTextFieldPair(this.view.storageLabel,this.view.storage);
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.size,"SECUROSERV_SIZE_" + warehouse.__get__size());
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.descriptionLabel,"SECUROSERV_DESCRIPTION");
      this.view.description.text = warehouse.desciption;
      var _loc3_ = warehouse.__get__capacity() != 1?"SECUROSERV_UNITS":"SECUROSERV_UNIT";
      this.view.storage.text = com.rockstargames.gtav.levelDesign.SECUROSERV.formatNumber(warehouse.__get__capacity()) + " " + com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.storage,_loc3_);
      if(warehouse.__get__purchaseSaleCost() != undefined && warehouse.__get__purchaseSaleCost() >= 0)
      {
         this.view.price.label.text = "$" + com.rockstargames.gtav.levelDesign.SECUROSERV.formatNumber(warehouse.__get__purchaseSaleCost());
         this.view.salePrice.label.text = "$" + com.rockstargames.gtav.levelDesign.SECUROSERV.formatNumber(warehouse.__get__purchaseCost());
         this.view.salePrice.redLine._x = 0.5 * (this.view.salePrice.label._width - this.view.salePrice.redLine._width) + this.view.salePrice.label._x;
         this.view.salePrice.redLine._width = this.view.salePrice.label.textWidth + 5;
         this.view.salePrice._visible = true;
      }
      else
      {
         this.view.price.label.text = "$" + com.rockstargames.gtav.levelDesign.SECUROSERV.formatNumber(warehouse.__get__purchaseCost());
         this.view.salePrice._visible = false;
      }
      this.buyButton = new com.rockstargames.gtav.levelDesign.securoserv.Button(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.BUY_WAREHOUSE,this.view.buyButton,"SECUROSERV_BUY_WAREHOUSE");
      this._controls = [this.buyButton];
      this.setBounds();
   }
   function setBounds()
   {
      this._left = this.view._x;
      this._right = this.view._x + this.view.bg._width;
      this._top = this.view._y;
      this._bottom = this.view._y + this.view._height;
   }
   function setupTextFieldPair(leftTF, rightTF)
   {
      leftTF.autoSize = "left";
      rightTF.autoSize = "right";
      var _loc6_ = leftTF._x;
      var _loc4_ = rightTF._x + rightTF._width;
      var _loc7_ = leftTF._width;
      var _loc8_ = rightTF._width;
      if(_loc7_ + _loc8_ > _loc4_ - _loc6_)
      {
         var _loc5_ = _loc4_ - _loc6_ - _loc7_;
         var _loc3_ = rightTF.text;
         var _loc1_ = _loc3_.length;
         while(_loc1_ > 0)
         {
            rightTF.text = _loc3_.substring(0,_loc1_) + "...";
            if(rightTF._width <= _loc5_)
            {
               rightTF._x = _loc4_ - rightTF._width;
               break;
            }
            _loc1_ = _loc1_ - 1;
         }
      }
   }
   function updateCooldown(button, cooldown, finalLabel)
   {
      var _loc3_ = Math.ceil(0.001 * (cooldown - getTimer()));
      if(_loc3_ <= 0)
      {
         button._alpha = 100;
         com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(button.label,finalLabel);
      }
      else
      {
         var _loc4_ = _loc3_ % 60;
         var _loc5_ = Math.floor((_loc3_ - _loc4_) / 60) % 60;
         var _loc9_ = Math.floor((_loc3_ - _loc4_ - _loc5_ * 60) / 3600);
         var _loc7_ = ("0" + _loc9_).substr(-2);
         var _loc6_ = ("0" + _loc5_).substr(-2);
         var _loc8_ = ("0" + _loc4_).substr(-2);
         button.label.text = _loc7_ + ":" + _loc6_ + ":" + _loc8_;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(button,0.25,{onCompleteScope:this,onComplete:this.updateCooldown,onCompleteArgs:[button,cooldown,finalLabel]});
      }
      if(button.bg)
      {
         button.label._x = 0.5 * (button.bg._width - button.label._width);
      }
   }
}
