class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.ProgressPanel
{
   function ProgressPanel(view, website)
   {
      this.view = view;
      this.website = website;
      this.init();
   }
   function dispose()
   {
      this.website = null;
      this.office = null;
      this.displayConfig = null;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.image);
      delete this.view.image.txt.onDisplayImage;
   }
   function init()
   {
      var _loc3_ = this.view.getBounds(_root);
      this.left = _loc3_.xMin;
      this.right = _loc3_.xMax;
      this.top = _loc3_.yMin;
      this.bottom = _loc3_.yMax;
      this.displayConfig = this.website.browser.getConfig();
      this.view.image.txt.onDisplayImage = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.delegate(this,this.onDisplayImage);
      this.hide();
   }
   function initOverview()
   {
      this.view.gotoAndStop("overview");
      this.view.nextButton.onColour = 16777215;
      this.view.nextButton.offColour = 16777215;
      this.view.nextButton.disabled = true;
      this.website.dataTextScope.push(this.view.nextButton.btnTxt);
      this.hide();
   }
   function showOverview(office, showImmediately)
   {
      this.office = office;
      this.truncate(this.view.officeName,office.__get__name(),this.view.officeName._width - 5);
      var _loc10_ = !office.__get__isOwned()?"DYN8_EXEC_BUY_FROM":"DYN8_EXEC_RENOVATE";
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.nextButton.btnTxt,_loc10_,false);
      if(!office.__get__isOwned())
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.nextButton.btnTxt,this.view.nextButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(office.getBaseBestCost()),true);
      }
      var _loc9_ = 0;
      if(office.__get__isOwned())
      {
         var _loc6_ = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_ORGANIZATION_NAME");
         var _loc3_ = "<font color=\'#000000\'>" + _loc6_ + ":</font> <font color=\'#333333\'>" + this.website.__get__purchasedSignage() + "</font>";
         this.view.description.htmlText = _loc3_;
         if(this.view.description.bottomScroll > 1)
         {
            var _loc2_ = this.website.__get__purchasedSignage().length;
            while(_loc2_ >= 0)
            {
               _loc3_ = "<font color=\'#000000\'>" + _loc6_ + ":</font> <font color=\'#333333\'>" + this.website.__get__purchasedSignage().substring(0,_loc2_) + "...</font>";
               this.view.description.htmlText = _loc3_;
               if(this.view.description.bottomScroll == 1)
               {
                  break;
               }
               _loc2_ = _loc2_ - 1;
            }
         }
         var _loc5_ = "";
         _loc5_ = _loc5_ + ("<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_STYLE") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_STYLE_" + this.website.__get__purchasedStyle()) + "</font><br>");
         _loc5_ = _loc5_ + ("<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_PERSONNEL") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_PERSONNEL_" + this.website.__get__purchasedPersonnel()) + "</font><br>");
         _loc5_ = _loc5_ + (_loc3_ + "<br>");
         _loc5_ = _loc5_ + ("<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_GUN_LOCKER") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,!this.website.__get__purchasedGunLocker()?"DYN8_EXEC_NO":"DYN8_EXEC_YES") + "</font><br>");
         _loc5_ = _loc5_ + ("<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_VAULT") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,!this.website.__get__purchasedVault()?"DYN8_EXEC_NO":"DYN8_EXEC_YES") + "</font><br>");
         _loc5_ = _loc5_ + ("<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_ACCOMMODATION") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,!this.website.__get__purchasedBed()?"DYN8_EXEC_NO":"DYN8_EXEC_YES") + "</font>");
         this.view.description.htmlText = _loc5_;
         _loc9_ = 8;
      }
      else
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.description,office.__get__description(),true);
      }
      var _loc8_ = this.view.description.getTextFormat();
      _loc8_.leading = _loc9_;
      this.view.description.setTextFormat(_loc8_);
      var _loc7_ = this.view.description._y + this.view.description.textHeight + 10;
      if(office.getBaseCost() != office.getBaseBestCost() && !office.__get__isOwned())
      {
         this.view.originalCost.autoSize = "left";
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.originalCost,"$" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(office.getBaseCost()),true);
         this.view.strikethrough._visible = true;
         this.view.originalCost._y = _loc7_;
         this.view.strikethrough._width = this.view.originalCost._width;
         this.view.strikethrough._y = _loc7_ + 12;
         _loc7_ = _loc7_ + 25;
      }
      else
      {
         this.view.originalCost.text = "";
         this.view.strikethrough._visible = false;
         _loc7_ = _loc7_ + 15;
      }
      this.view.nextButton._y = _loc7_;
      this.view.nextButton.disabled = false;
      this.view.nextButton._visible = true;
      this.view.bg._height = this.view.nextButton._y + this.view.nextButton._height + 20;
      this.bottom = this.top + this.view.bg._height;
      this.showImage("");
      this.view.marker.gotoAndStop(!office.__get__isOwned()?"unownedInactive":"ownedInactive");
      if(showImmediately)
      {
         this.view._alpha = 100;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      }
      else if(!this.view._visible)
      {
         this.view._alpha = 0;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,0.25,{_alpha:100});
      }
   }
   function showGarageOverview(office, showImmediately)
   {
      this.showImage("");
      if(office.__get__isOwned())
      {
         var _loc4_ = !office.__get__garageIsOwned()?"DYN8_EXEC_BUY_FROM":"DYN8_EXEC_RENOVATE";
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.nextButton.btnTxt,_loc4_,false);
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.description,office.__get__garageDescription(),true);
         this.view.nextButton._visible = true;
         this.view.nextButton.disabled = false;
         var _loc3_ = this.view.description._y + this.view.description.textHeight + 10;
         if(office.getBaseGarageCost() != office.getBaseGarageBestCost())
         {
            this.view.originalCost.autoSize = "left";
            com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.originalCost,"$" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(office.getBaseGarageCost()),true);
            if(!office.__get__garageIsOwned())
            {
               com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.nextButton.btnTxt,this.view.nextButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(office.getBaseGarageBestCost()),true);
            }
            this.view.strikethrough._visible = true;
            this.view.originalCost._y = _loc3_;
            this.view.strikethrough._width = this.view.originalCost._width;
            this.view.strikethrough._y = _loc3_ + 12;
            _loc3_ = _loc3_ + 25;
         }
         else
         {
            if(!office.__get__garageIsOwned())
            {
               com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.nextButton.btnTxt,this.view.nextButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(office.getBaseGarageBestCost()),true);
            }
            this.view.originalCost.text = "";
            this.view.strikethrough._visible = false;
            _loc3_ = _loc3_ + 15;
         }
         this.view.nextButton._y = _loc3_;
         this.view.nextButton.disabled = false;
         this.view.nextButton._visible = true;
         this.view.bg._height = this.view.nextButton._y + this.view.nextButton._height + 20;
         this.bottom = this.top + this.view.bg._height;
      }
      else
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.description,office.__get__garageDescription(),true);
         this.view.nextButton._visible = false;
         this.view.nextButton.disabled = true;
         this.view.originalCost.text = "";
         this.view.strikethrough._visible = false;
         this.view.bg._height = this.view.description._y + this.view.description.textHeight + 25;
         this.bottom = this.top + this.view.bg._height;
      }
      if(showImmediately)
      {
         this.view._alpha = 100;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      }
      else if(!this.view._visible)
      {
         this.view._alpha = 0;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,0.25,{_alpha:100});
      }
   }
   function initProgress(numCompleteSteps)
   {
      this.view.gotoAndStop("progress");
      this.office = this.website.getSelectedOffice();
      this.showImage("");
      this.showPurchaseButton();
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"DYN8_EXEC_BUY",false);
      if(!this.office.__get__isOwned())
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,this.view.purchaseButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(this.office.getBaseBestCost()),true);
      }
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      this.truncate(this.view.officeName,this.office.__get__name(),this.view.officeName._width - 5);
      this.website.dataTextScope.push(this.view.DECOR.btnTxt);
      this.website.dataTextScope.push(this.view.PERSONNEL.btnTxt);
      this.website.dataTextScope.push(this.view.ORGANIZATION_D_NAME.btnTxt);
      this.website.dataTextScope.push(this.view.GUN_D_LOCKER.btnTxt);
      this.website.dataTextScope.push(this.view.SAFE.btnTxt);
      this.website.dataTextScope.push(this.view.ACCOMMODATION.btnTxt);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.DECOR.btnTxt,"DYN8_EXEC_STYLE",false);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.PERSONNEL.btnTxt,"DYN8_EXEC_PERSONNEL",false);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.ORGANIZATION_D_NAME.btnTxt,"DYN8_EXEC_ORGANIZATION_NAME",false);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.GUN_D_LOCKER.btnTxt,"DYN8_EXEC_GUN_LOCKER",false);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.SAFE.btnTxt,"DYN8_EXEC_VAULT",false);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.ACCOMMODATION.btnTxt,"DYN8_EXEC_ACCOMMODATION",false);
      this.setProgressDots(numCompleteSteps);
      if(this.office.__get__isOwned() && this.website.__get__purchasedGunLocker() == 1)
      {
         this.view.GUN_D_LOCKER.disabled = true;
         this.view.GUN_D_LOCKER.btnTxt._alpha = 30;
         this.view.stepDot3.tick._visible = true;
      }
      else
      {
         this.view.GUN_D_LOCKER.disabled = false;
         this.view.GUN_D_LOCKER.btnTxt._alpha = 100;
         this.view.stepDot3.tick._visible = false;
      }
      if(this.office.__get__isOwned() && this.website.__get__purchasedVault() == 1)
      {
         this.view.SAFE.disabled = true;
         this.view.SAFE.btnTxt._alpha = 30;
         this.view.stepDot4.tick._visible = true;
      }
      else
      {
         this.view.SAFE.disabled = false;
         this.view.SAFE.btnTxt._alpha = 100;
         this.view.stepDot4.tick._visible = false;
      }
      if(this.office.__get__isOwned() && this.website.__get__purchasedBed() == 1)
      {
         this.view.ACCOMMODATION.disabled = true;
         this.view.ACCOMMODATION.btnTxt._alpha = 30;
         this.view.stepDot5.tick._visible = true;
      }
      else
      {
         this.view.ACCOMMODATION.disabled = false;
         this.view.ACCOMMODATION.btnTxt._alpha = 100;
         this.view.stepDot5.tick._visible = false;
      }
      this.updateCosts();
      this.view.bg._yscale = 100;
   }
   function initGarageProgress(numCompleteSteps)
   {
      this.view.gotoAndStop("garageProgress");
      this.office = this.website.getSelectedOffice();
      this.showImage("");
      this.showPurchaseButton();
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"DYN8_EXEC_BUY",false);
      if(!this.office.__get__isOwned())
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,this.view.purchaseButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(this.office.getBaseGarageBestCost()),true);
      }
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      this.truncate(this.view.officeName,this.office.__get__name(),this.view.officeName._width - 5);
      this.website.dataTextScope.push(this.view.GARAGE_D_LEVEL_D_1.btnTxt);
      this.website.dataTextScope.push(this.view.GARAGE_D_LEVEL_D_2.btnTxt);
      this.website.dataTextScope.push(this.view.GARAGE_D_LEVEL_D_3.btnTxt);
      this.website.dataTextScope.push(this.view.MOD_D_SHOP.btnTxt);
      if(numCompleteSteps == 1)
      {
         this.view.GARAGE_D_LEVEL_D_1.disabled = true;
      }
      else if(numCompleteSteps == 2)
      {
         this.view.GARAGE_D_LEVEL_D_2.disabled = true;
      }
      else if(numCompleteSteps == 3)
      {
         this.view.GARAGE_D_LEVEL_D_3.disabled = true;
      }
      else if(numCompleteSteps == 4)
      {
         this.view.MOD_D_SHOP.disabled = true;
      }
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.GARAGE_D_LEVEL_D_1.btnTxt,"DYN8_EXEC_FLOOR_1",false);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.GARAGE_D_LEVEL_D_2.btnTxt,"DYN8_EXEC_FLOOR_2",false);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.GARAGE_D_LEVEL_D_3.btnTxt,"DYN8_EXEC_FLOOR_3",false);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.MOD_D_SHOP.btnTxt,"DYN8_EXEC_MOD_SHOP",false);
      this.setProgressDots(numCompleteSteps);
      this.updateGarageCosts();
      this.view.bg._height = this.view.purchaseButton._y + this.view.purchaseButton._height + 20;
   }
   function setProgressDots(numCompleteSteps)
   {
      var _loc2_ = 0;
      while(_loc2_ < 7)
      {
         this.view["stepDot" + _loc2_].gotoAndStop(_loc2_ >= numCompleteSteps?"incomplete":"complete");
         this.view["stepDot" + _loc2_].tick._visible = false;
         this.view["stepDot" + _loc2_].exclamation._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   function hide()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.view._visible = false;
      this.view.nextButton.disabled = true;
   }
   function show()
   {
      this.view._visible = true;
      this.view.nextButton.disabled = false;
   }
   function hidePurchaseButton()
   {
      this.view.purchaseButton._visible = false;
      this.view.purchaseButton.disabled = true;
   }
   function showPurchaseButton()
   {
      this.view.purchaseButton._visible = true;
      this.view.purchaseButton.disabled = false;
   }
   function hideSignageExclamation()
   {
      this.view.stepDot2.exclamation._visible = false;
   }
   function showSignageExclamation()
   {
      this.view.stepDot2.exclamation._visible = true;
   }
   function hideGarage3Exclamation()
   {
      this.view.stepDot2.exclamation._visible = false;
   }
   function showGarage3Exclamation()
   {
      this.view.stepDot2.exclamation._visible = true;
   }
   function __get__isHidden()
   {
      return !this.view._visible;
   }
   function truncate(tf, text, availableWidth)
   {
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(tf,text,true);
      var _loc4_ = tf.getTextFormat();
      tf.letterSpacing = 1;
      if(tf.textWidth > availableWidth)
      {
         var _loc1_ = text.length;
         while(_loc1_ > 0)
         {
            tf.text = text.substring(0,_loc1_) + "...";
            tf.setTextFormat(_loc4_);
            if(tf.textWidth <= availableWidth)
            {
               break;
            }
            _loc1_ = _loc1_ - 1;
         }
      }
   }
   function updateCosts()
   {
      var _loc5_ = !this.office.__get__isOwned()?this.office.getBaseBestCost():0;
      var _loc3_ = undefined;
      var _loc4_ = undefined;
      var _loc2_ = undefined;
      _loc3_ = this.office.getStyleBestCost(this.website.style,this.website.__get__purchasedStyle());
      _loc4_ = this.office.getStyleCost(this.website.style,this.website.__get__purchasedStyle());
      _loc2_ = this.office.getStyleSaleCost(this.website.style,this.website.__get__purchasedStyle());
      _loc5_ = _loc5_ + this.updateCostStep(0,_loc3_,_loc4_,_loc2_,"+");
      _loc3_ = this.office.getPersonnelBestCost(this.website.personnel,this.website.__get__purchasedPersonnel());
      _loc4_ = this.office.getPersonnelCost(this.website.personnel,this.website.__get__purchasedPersonnel());
      _loc2_ = this.office.getPersonnelSaleCost(this.website.personnel,this.website.__get__purchasedPersonnel());
      _loc5_ = _loc5_ + this.updateCostStep(1,_loc3_,_loc4_,_loc2_,"+");
      var _loc13_ = this.office.getFontBestCost(this.website.font,this.website.__get__purchasedFont());
      var _loc10_ = this.office.getFontCost(this.website.font,this.website.__get__purchasedFont());
      var _loc6_ = this.office.getFontSaleCost(this.website.font,this.website.__get__purchasedFont());
      var _loc11_ = this.office.getSignageBestCost(this.website.__get__signage(),this.website.__get__purchasedSignage());
      var _loc9_ = this.office.getSignageCost(this.website.__get__signage(),this.website.__get__purchasedSignage());
      var _loc7_ = this.office.getSignageSaleCost(this.website.__get__signage(),this.website.__get__purchasedSignage());
      _loc3_ = _loc13_ + _loc11_;
      _loc4_ = _loc10_ + _loc9_;
      if(_loc6_ == 0 && _loc7_ != 0)
      {
         _loc2_ = _loc10_ + _loc7_;
      }
      else if(_loc6_ != 0 && _loc7_ == 0)
      {
         _loc2_ = _loc6_ + _loc9_;
      }
      else
      {
         _loc2_ = _loc6_ + _loc7_;
      }
      _loc5_ = _loc5_ + this.updateCostStep(2,_loc3_,_loc4_,_loc2_,"+");
      _loc3_ = this.office.getGunLockerBestCost(this.website.gunLocker,this.website.__get__purchasedGunLocker());
      _loc4_ = this.office.getGunLockerCost(this.website.gunLocker,this.website.__get__purchasedGunLocker());
      _loc2_ = this.office.getGunLockerSaleCost(this.website.gunLocker,this.website.__get__purchasedGunLocker());
      _loc5_ = _loc5_ + this.updateCostStep(3,_loc3_,_loc4_,_loc2_,"+");
      _loc3_ = this.office.getVaultBestCost(this.website.vault,this.website.__get__purchasedVault());
      _loc4_ = this.office.getVaultCost(this.website.vault,this.website.__get__purchasedVault());
      _loc2_ = this.office.getVaultSaleCost(this.website.vault,this.website.__get__purchasedVault());
      _loc5_ = _loc5_ + this.updateCostStep(4,_loc3_,_loc4_,_loc2_,"+");
      _loc3_ = this.office.getBedBestCost(this.website.bed,this.website.__get__purchasedBed());
      _loc4_ = this.office.getBedCost(this.website.bed,this.website.__get__purchasedBed());
      _loc2_ = this.office.getBedSaleCost(this.website.bed,this.website.__get__purchasedBed());
      _loc5_ = _loc5_ + this.updateCostStep(5,_loc3_,_loc4_,_loc2_,"+");
      var _loc12_ = !this.office.__get__isOwned()?"DYN8_EXEC_BUY":"DYN8_EXEC_RENOVATE";
      var _loc8_ = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.purchaseButton.btnTxt,_loc12_);
      if(_loc5_ > 0)
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc8_ + ": $" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(_loc5_),true);
      }
      else
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc8_,true);
      }
   }
   function updateGarageCosts()
   {
      var _loc6_ = 0;
      var _loc10_ = undefined;
      var _loc12_ = undefined;
      var _loc11_ = undefined;
      var _loc3_ = undefined;
      var _loc13_ = undefined;
      var _loc14_ = undefined;
      var _loc15_ = undefined;
      var _loc9_ = undefined;
      var _loc7_ = undefined;
      var _loc8_ = undefined;
      var _loc5_ = undefined;
      var _loc2_ = undefined;
      var _loc4_ = undefined;
      if(this.website.garage1Equipped)
      {
         _loc13_ = this.office.getGarage1StyleBestCost(this.website.garage1Style,this.website.__get__purchasedGarage1Style());
         _loc9_ = this.office.getGarage1StyleCost(this.website.garage1Style,this.website.__get__purchasedGarage1Style());
         _loc5_ = this.office.getGarage1StyleSaleCost(this.website.garage1Style,this.website.__get__purchasedGarage1Style());
         _loc14_ = this.office.getGarage1LightingBestCost(this.website.garage1Lighting,this.website.__get__purchasedGarage1Lighting());
         _loc7_ = this.office.getGarage1LightingCost(this.website.garage1Lighting,this.website.__get__purchasedGarage1Lighting());
         _loc2_ = this.office.getGarage1LightingSaleCost(this.website.garage1Lighting,this.website.__get__purchasedGarage1Lighting());
         _loc15_ = this.office.getGarage1NumberBestCost(this.website.garage1Number,this.website.__get__purchasedGarage1Number());
         _loc8_ = this.office.getGarage1NumberCost(this.website.garage1Number,this.website.__get__purchasedGarage1Number());
         _loc4_ = this.office.getGarage1NumberSaleCost(this.website.garage1Number,this.website.__get__purchasedGarage1Number());
         _loc10_ = _loc13_ + _loc14_ + _loc15_;
         _loc12_ = _loc9_ + _loc7_ + _loc8_;
         _loc11_ = _loc5_ + _loc2_ + _loc4_;
         _loc3_ = _loc5_ != 0?_loc5_:_loc9_;
         _loc3_ = _loc3_ + (_loc2_ != 0?_loc2_:_loc7_);
         _loc3_ = _loc3_ + (_loc4_ != 0?_loc4_:_loc8_);
         _loc6_ = _loc6_ + this.updateCostStep(0,_loc10_,_loc12_,_loc11_,"+",_loc3_);
      }
      else
      {
         _loc6_ = _loc6_ + this.updateCostStep(0,0,0,0,"+");
      }
      if(this.website.garage2Equipped)
      {
         _loc13_ = this.office.getGarage2StyleBestCost(this.website.garage2Style,this.website.__get__purchasedGarage2Style());
         _loc9_ = this.office.getGarage2StyleCost(this.website.garage2Style,this.website.__get__purchasedGarage2Style());
         _loc5_ = this.office.getGarage2StyleSaleCost(this.website.garage2Style,this.website.__get__purchasedGarage2Style());
         _loc14_ = this.office.getGarage2LightingBestCost(this.website.garage2Lighting,this.website.__get__purchasedGarage2Lighting());
         _loc7_ = this.office.getGarage2LightingCost(this.website.garage2Lighting,this.website.__get__purchasedGarage2Lighting());
         _loc2_ = this.office.getGarage2LightingSaleCost(this.website.garage2Lighting,this.website.__get__purchasedGarage2Lighting());
         _loc15_ = this.office.getGarage2NumberBestCost(this.website.garage2Number,this.website.__get__purchasedGarage2Number());
         _loc8_ = this.office.getGarage2NumberCost(this.website.garage2Number,this.website.__get__purchasedGarage2Number());
         _loc4_ = this.office.getGarage2NumberSaleCost(this.website.garage2Number,this.website.__get__purchasedGarage2Number());
         _loc10_ = _loc13_ + _loc14_ + _loc15_;
         _loc12_ = _loc9_ + _loc7_ + _loc8_;
         _loc11_ = _loc5_ + _loc2_ + _loc4_;
         _loc3_ = _loc5_ != 0?_loc5_:_loc9_;
         _loc3_ = _loc3_ + (_loc2_ != 0?_loc2_:_loc7_);
         _loc3_ = _loc3_ + (_loc4_ != 0?_loc4_:_loc8_);
         _loc6_ = _loc6_ + this.updateCostStep(1,_loc10_,_loc12_,_loc11_,"+",_loc3_);
      }
      else
      {
         _loc6_ = _loc6_ + this.updateCostStep(1,0,0,0,"+");
      }
      if(this.website.garage3Equipped)
      {
         _loc13_ = this.office.getGarage3StyleBestCost(this.website.garage3Style,this.website.__get__purchasedGarage3Style());
         _loc9_ = this.office.getGarage3StyleCost(this.website.garage3Style,this.website.__get__purchasedGarage3Style());
         _loc5_ = this.office.getGarage3StyleSaleCost(this.website.garage3Style,this.website.__get__purchasedGarage3Style());
         _loc14_ = this.office.getGarage3LightingBestCost(this.website.garage3Lighting,this.website.__get__purchasedGarage3Lighting());
         _loc7_ = this.office.getGarage3LightingCost(this.website.garage3Lighting,this.website.__get__purchasedGarage3Lighting());
         _loc2_ = this.office.getGarage3LightingSaleCost(this.website.garage3Lighting,this.website.__get__purchasedGarage3Lighting());
         _loc15_ = this.office.getGarage3NumberBestCost(this.website.garage3Number,this.website.__get__purchasedGarage3Number());
         _loc8_ = this.office.getGarage3NumberCost(this.website.garage3Number,this.website.__get__purchasedGarage3Number());
         _loc4_ = this.office.getGarage3NumberSaleCost(this.website.garage3Number,this.website.__get__purchasedGarage3Number());
         _loc10_ = _loc13_ + _loc14_ + _loc15_;
         _loc12_ = _loc9_ + _loc7_ + _loc8_;
         _loc11_ = _loc5_ + _loc2_ + _loc4_;
         _loc3_ = _loc5_ != 0?_loc5_:_loc9_;
         _loc3_ = _loc3_ + (_loc2_ != 0?_loc2_:_loc7_);
         _loc3_ = _loc3_ + (_loc4_ != 0?_loc4_:_loc8_);
         _loc6_ = _loc6_ + this.updateCostStep(2,_loc10_,_loc12_,_loc11_,"+",_loc3_);
      }
      else
      {
         _loc6_ = _loc6_ + this.updateCostStep(2,0,0,0,"+");
      }
      if(this.website.modShopEquipped)
      {
         _loc10_ = this.office.getModShopBestCost(this.website.modShop,this.website.__get__purchasedModShop());
         _loc12_ = this.office.getModShopCost(this.website.modShop,this.website.__get__purchasedModShop());
         _loc11_ = this.office.getModShopSaleCost(this.website.modShop,this.website.__get__purchasedModShop());
         _loc6_ = _loc6_ + this.updateCostStep(3,_loc10_,_loc12_,_loc11_,"+");
      }
      else
      {
         _loc6_ = _loc6_ + this.updateCostStep(3,0,0,0,"+");
      }
      var _loc18_ = !this.office.__get__garageIsOwned()?"DYN8_EXEC_BUY":"DYN8_EXEC_RENOVATE";
      var _loc17_ = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.purchaseButton.btnTxt,_loc18_);
      if(_loc6_ > 0)
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc17_ + ": $" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(_loc6_),true);
      }
      else
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc17_,true);
      }
      var _loc16_ = 0;
      if(this.website.__get__purchasedGarage1Equipped() || this.website.garage1Equipped)
      {
         _loc16_ = _loc16_ + 20;
      }
      if(this.website.__get__purchasedGarage2Equipped() || this.website.garage2Equipped)
      {
         _loc16_ = _loc16_ + 20;
      }
      if(this.website.__get__purchasedGarage3Equipped() || this.website.garage3Equipped)
      {
         _loc16_ = _loc16_ + 20;
      }
      this.view.garageCounter.text = _loc16_.toString();
   }
   function updateCostStep(step, actualPrice, normalPrice, salePrice, prefix, saleSumCost)
   {
      if(salePrice > 0)
      {
         this.view["cost" + step].text = "";
         if(saleSumCost != undefined)
         {
            this.view["saleCost" + step].text = "$" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(saleSumCost);
         }
         else
         {
            this.view["saleCost" + step].text = "$" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(salePrice);
         }
         this.view["originalCost" + step].autoSize = "left";
         this.view["originalCost" + step].text = prefix + " $" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(normalPrice);
         this.view["strikethrough" + step]._width = this.view["originalCost" + step]._width;
         this.view["strikethrough" + step]._visible = true;
      }
      else
      {
         this.view["cost" + step].text = normalPrice <= 0?"":prefix + " $" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(normalPrice);
         this.view["saleCost" + step].text = "";
         this.view["originalCost" + step].text = "";
         this.view["strikethrough" + step]._visible = false;
      }
      if(this.displayConfig.isAsian)
      {
         var _loc3_ = undefined;
         _loc3_ = this.view["saleCost" + step].getNewTextFormat();
         _loc3_.size = 14;
         this.view["saleCost" + step].setNewTextFormat(_loc3_);
         _loc3_ = this.view["cost" + step].getNewTextFormat();
         _loc3_.size = 14;
         this.view["cost" + step].setNewTextFormat(_loc3_);
      }
      return actualPrice;
   }
   function showImage(suffix)
   {
      var _loc2_ = this.office.__get__txd() + suffix;
      if(this.currImageId != _loc2_)
      {
         this.currImageId = _loc2_;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.image);
         this.view.image._alpha = 0;
         this.website.imageManager.addImage(this.office.__get__txd(),_loc2_,this.view.image.txt);
      }
   }
   function onDisplayImage()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.image,0.25,{_alpha:100});
   }
}
