class com.rockstargames.gtav.ng.Replay.PlaybackPanelButton extends MovieClip
{
   var SF_BASE_CLASS_MOUSE = 10;
   function PlaybackPanelButton()
   {
      super();
      this.myBtnType = com.rockstargames.gtav.ng.Replay.VIDEO_BUTTON_TYPES.BUTTON_TYPE_PLAYBACK_BUTTON;
      this.MOUSE_EVT = new com.rockstargames.ui.mouse.MOUSE_EVENTS();
      this.MOUSE_EVT.__set__UI_MOVIE(com.rockstargames.ui.mouse.MOUSE_EVENTS.UI_MOVIE_VIDEO_EDITOR);
      this.MOUSE_EVT.__set__INTERFACE_TYPE(this.SF_BASE_CLASS_MOUSE);
      this._initialPosX = this._x;
   }
   function __get__initialPosX()
   {
      return this._initialPosX;
   }
   function onPress()
   {
      this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_PRESS);
   }
   function onRollOver()
   {
      this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OVER);
   }
   function onRollOut()
   {
      this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OUT);
   }
   function onRelease()
   {
      this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_RELEASE);
   }
   function onReleaseOutside()
   {
      this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_RELEASE_OUTSIDE);
   }
   function sendMouseEvent(evt)
   {
      this.MOUSE_EVT.triggerEvent([this.myBtnType,evt,this._name]);
   }
}
