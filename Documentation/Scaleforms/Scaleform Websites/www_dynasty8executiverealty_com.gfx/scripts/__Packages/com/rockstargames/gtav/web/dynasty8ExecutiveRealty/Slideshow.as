class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Slideshow
{
   static var CROSSFADE_TIME = 0.5;
   static var PAUSE_TIME = 2;
   function Slideshow(imageManager, view)
   {
      this.imageManager = imageManager;
      this.view = view;
      view.imageBack.tf.onDisplayImage = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.delegate(this,this.onImageLoaded);
   }
   function show(txd, imageIDs, startIndex, labels)
   {
      this.txd = txd;
      this.imageIDs = imageIDs;
      this.index = startIndex != undefined?startIndex:0;
      this.labels = labels;
      this.showNextSlide();
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.imageFront);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.reveal);
      delete this.view.imageBack.tf.onDisplayImage;
      this.imageManager = null;
      this.imageIDs = null;
   }
   function showNextSlide()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.imageFront);
      this.view.imageFront.tf.htmlText = this.view.imageBack.tf.htmlText;
      this.view.imageFront.label.htmlText = this.view.imageBack.label.htmlText;
      this.view.imageFront._alpha = 100;
      this.imageManager.addImage(this.txd,this.imageIDs[this.index],this.view.imageBack.tf);
      if(this.labels != undefined && this.labels[this.index] != undefined)
      {
         this.view.imageBack.label.htmlText = this.labels[this.index];
      }
      else
      {
         this.view.imageBack.label.htmlText = "";
      }
   }
   function onImageLoaded()
   {
      if(this.imageIDs.length > 1)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.imageFront,com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Slideshow.CROSSFADE_TIME,{_alpha:0,onCompleteScope:this,onComplete:this.pauseBeforeNextSlide});
      }
      else if(this.view.imageFront._alpha == 100)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.imageFront,com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Slideshow.CROSSFADE_TIME,{_alpha:0});
      }
      if(this.view.reveal._alpha == 100)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.reveal,com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Slideshow.CROSSFADE_TIME,{_alpha:0});
      }
   }
   function pauseBeforeNextSlide()
   {
      this.index = (this.index + 1) % this.imageIDs.length;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view.imageFront,com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Slideshow.PAUSE_TIME,{onCompleteScope:this,onComplete:this.showNextSlide});
   }
}
