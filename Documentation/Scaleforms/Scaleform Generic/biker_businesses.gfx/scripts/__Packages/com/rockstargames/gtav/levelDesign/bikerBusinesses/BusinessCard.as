class com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessCard extends com.rockstargames.gtav.levelDesign.bikerBusinesses.Button
{
   function BusinessCard(view, boundsMaxTop)
   {
      super(-1,view);
      this.boundsMaxTop = boundsMaxTop;
   }
   function initOwnedView(business, imageManager, index, slideshowPreDelay)
   {
      this.view.gotoAndStop("owned");
      this.init(business,imageManager,index,slideshowPreDelay);
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.stock.label,"BIKEBIZ_STOCK_LEVEL");
      this.view.stock.meter._xscale = Math.min(100,Math.max(0,business.__get__stockLevel()));
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.supplies.label,"BIKEBIZ_SUPPLIES_LEVEL");
      this.view.supplies.meter._xscale = Math.min(100,Math.max(0,business.__get__suppliesLevel()));
   }
   function initForSaleView(business, imageManager, index, slideshowPreDelay)
   {
      this.view.gotoAndStop("unowned");
      this.init(business,imageManager,index,slideshowPreDelay);
      this.view.price.label.text = "$" + com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.formatNumber(business.__get__price());
      if(business.__get__salePrice() > -1)
      {
         this.view.price.originalPrice.text = "$" + com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.formatNumber(business.__get__originalPrice());
         this.view.price.reductionLine._x = this.view.price.originalPrice._x + this.view.price.originalPrice._width - this.view.price.originalPrice.textWidth;
         this.view.price.reductionLine._width = this.view.price.originalPrice.textWidth;
         this.view.price.reductionLine._visible = true;
      }
      else
      {
         this.view.price.originalPrice.text = "";
         this.view.price.reductionLine._visible = false;
      }
   }
   function init(business, imageManager, index, slideshowPreDelay)
   {
      this.id = this.depth = business.id;
      this.type = business.type;
      this._price = business.price;
      this.view.type.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.type,com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.DESCS[business.__get__type()]);
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.locationLabel,"BIKEBIZ_LOCATION");
      this.view.location.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.location,business.__get__location());
      this.slideshow = new com.rockstargames.gtav.levelDesign.bikerBusinesses.Slideshow(imageManager,this.view.slideshow);
      this.slideshow.show([business.__get__txd()],[business.__get__txd() + "_EXT_S"],index % 2,undefined,slideshowPreDelay);
   }
   function filter(filterBits)
   {
      if((1 << this.type & filterBits) != 0)
      {
         this.view._visible = true;
      }
      else
      {
         this.view._visible = false;
         this.view._x = 0;
         this.view._y = 0;
      }
      this.updateBounds();
   }
   function __get__isVisible()
   {
      return this.view._visible;
   }
   function __get__price()
   {
      return this._price;
   }
   function updateBounds()
   {
      if(this.__get__isVisible())
      {
         super.updateBounds();
         if(this.top < this.boundsMaxTop)
         {
            this.top = this.boundsMaxTop;
         }
      }
      else
      {
         this.left = -10;
         this.right = -10;
         this.top = -10;
         this.bottom = -10;
      }
   }
   function dispose()
   {
      this.slideshow.dispose();
   }
}
