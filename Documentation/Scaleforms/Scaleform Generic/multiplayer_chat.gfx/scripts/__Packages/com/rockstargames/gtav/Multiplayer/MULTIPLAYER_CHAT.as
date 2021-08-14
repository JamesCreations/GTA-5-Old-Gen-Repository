class com.rockstargames.gtav.Multiplayer.MULTIPLAYER_CHAT extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var eTypeMode_None = 0;
   var eTypeMode_Team = 1;
   var eTypeMode_All = 2;
   var eTypeMode_Clan = 3;
   var eVisibleState_Hidden = 0;
   var eVisibleState_Default = 1;
   var eVisibleState_Typing = 2;
   function MULTIPLAYER_CHAT()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.MessageBoxTF = this.CONTENT.ChatBoxMC.MessageBoxTF;
      this.MessageBoxTF.html = false;
      this.MessageBoxTF.text = "test";
      this.TextEntryTF = this.CONTENT.ChatBoxMC.TextEntryTF;
      this.TextEntryTF.html = false;
      this.TextEntryTF.text = "";
      this.UpArrowMC = this.CONTENT.ChatBoxMC.UpArrowMC;
      this.DownArrowMC = this.CONTENT.ChatBoxMC.DownArrowMC;
      this.BackgroundMC = this.CONTENT.ChatBoxMC.bgMC;
      this.TextBackgroundMC = this.CONTENT.ChatBoxMC.TextEntryBackgroundBG;
      this.TextBorderMC = this.CONTENT.ChatBoxMC.TextBorderMC;
      this.TextEntryBorderMC = this.CONTENT.ChatBoxMC.TextBorderMC;
      this.SET_FOCUS(this.eVisibleState_Hidden,0,"");
   }
   function PAGE_UP()
   {
      this.MessageBoxTF.scroll = this.MessageBoxTF.scroll - 1;
   }
   function PAGE_DOWN()
   {
      this.MessageBoxTF.scroll = this.MessageBoxTF.scroll + 1;
   }
   function ADD_TEXT(text)
   {
      if(text == "ENTER")
      {
         this.SET_TYPING_DONE();
      }
      else if(text == "ESCAPE")
      {
         this.TextEntryTF.text = "";
      }
      else if(text == "BACKSPACE")
      {
         this.TextEntryTF.text = this.TextEntryTF.text.substr(0,this.TextEntryTF.length - 1);
      }
      else
      {
         this.TextEntryTF.text = this.TextEntryTF.text + text;
      }
   }
   function SET_FOCUS(eVisibleState, eType, text)
   {
      trace("SET_FOCUS");
      if(eVisibleState == this.eVisibleState_Typing)
      {
         this.SetTypingState();
      }
      else if(eVisibleState == this.eVisibleState_Default)
      {
         this.SetDefaultState();
      }
      else
      {
         trace("");
         this.SetHiddenState();
      }
      if(eType == this.eTypeMode_Team)
      {
         this.ChannelTypeString = "(Team)";
      }
      else if(eType == this.eTypeMode_Clan)
      {
         this.ChannelTypeString = "(Clan)";
      }
      else if(eType == this.eTypeMode_All || eType == this.eTypeMode_None)
      {
         this.ChannelTypeString = "";
      }
      this.PlayerNameString = text;
   }
   function SET_TYPING_DONE()
   {
      this.MessageBoxTF.text = this.MessageBoxTF.text + (this.PlayerNameString + " : " + this.ChannelTypeString + " " + this.TextEntryTF.text);
      this.MessageBoxTF.text = this.MessageBoxTF.text + "\n";
      this.TextEntryTF.text = "";
      this.PAGE_DOWN();
   }
   function ADD_MESSAGE(player, msg)
   {
      this.MessageBoxTF.text = this.MessageBoxTF.text + ("[" + player + "] " + msg);
      this.MessageBoxTF.text = this.MessageBoxTF.text + "\n";
      this.TextEntryTF.text = "";
   }
   function SetTypingState()
   {
      this.MessageBoxTF._visible = true;
      this.TextEntryTF._visible = true;
      this.UpArrowMC._visible = true;
      this.DownArrowMC._visible = true;
      this.BackgroundMC._visible = true;
      this.TextBackgroundMC._visible = true;
      this.TextBorderMC._visible = true;
      this.BackgroundMC._alpha = 50;
      this.TextBackgroundMC._alpha = 50;
   }
   function SetDefaultState()
   {
      this.MessageBoxTF._visible = true;
      this.TextEntryTF._visible = false;
      this.UpArrowMC._visible = false;
      this.DownArrowMC._visible = false;
      this.BackgroundMC._visible = false;
      this.TextBackgroundMC._visible = false;
      this.TextBorderMC._visible = false;
   }
   function SetHiddenState()
   {
      this.MessageBoxTF._visible = false;
      this.TextEntryTF._visible = false;
      this.TextEntryBorderMC._visible = false;
      this.UpArrowMC._visible = false;
      this.DownArrowMC._visible = false;
      this.BackgroundMC._visible = false;
      this.TextBackgroundMC._visible = false;
      this.TextBorderMC._visible = false;
   }
}
