class com.rockstargames.gtav.web.WWW_EYEFIND_INFO extends com.rockstargames.ui.core.BaseWebsite
{
   var maxNumberOfResults = 6;
   var wantedLevel = 0;
   var isMP = false;
   var inboxStr = "";
   var composeStr = "";
   var replyStr = "";
   var deleteStr = "";
   var cancelStr = "";
   var sendStr = "";
   var olderStr = "";
   var newerStr = "";
   var numEmails = 0;
   var numContacts = 0;
   var lastEmailClicked = 0;
   function WWW_EYEFIND_INFO()
   {
      super();
      this._name = "WWW_EYEFIND_INFO";
      this.IS_SITE_DYNAMIC = 1;
      this.browser = _level0.TIMELINE;
      com.rockstargames.ui.utils.Debug.log("WWW_EYEFIND_INFO::CONSTRUCTOR SEED: [" + Math.random() + "]");
      if(this.browser.player == 1)
      {
         this.isMP = true;
      }
      else
      {
         this.isMP = false;
      }
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "";
      this.PAGE_NAMES[3] = "ERROR";
      this.PAGE_NAMES[4] = "SEARCH";
      this.PAGE_NAMES[5] = "NEWS";
      this.PAGE_NAMES[6] = "WARNING";
      this.PAGE_NAMES[7] = "INBOX";
      this.PAGE_NAMES[8] = "COMPOSE";
      this.PAGE_NAMES[9] = "EMAILSTATUS";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = true;
      this.CAN_STORE_PAGE[4] = true;
      this.CAN_STORE_PAGE[5] = true;
      this.CAN_STORE_PAGE[6] = true;
      this.CAN_STORE_PAGE[7] = true;
      this.CAN_STORE_PAGE[8] = false;
      this.CAN_STORE_PAGE[9] = false;
      this.browser.DebugTextContent = true;
      this.weatherUpdated = false;
      this.dontUpdateSearch = true;
      this.prevPage = undefined;
      this.prevSearchArgs = undefined;
      this.TXDarray = new Array();
      this.searchResults = new Array();
      this.weatherDataArray = new Array();
      this.newsOrgArray = new Array("news_dailyglobe","news_dailyrag","news_libertytree","news_lossantosmeteor","news_lossantosshepherd","news_ls24","news_ludendorffweekly","news_PLO","news_prattle","news_senorabeacon","news_starstalk","news_talkinballs","news_weazelnews","news_wnka");
      this.excludeMPwebsites = new Array("EYEFIND_INFO","ELITASTRAVEL_COM","LEGENDARYMOTORSPORT_NET","WARSTOCK_D_CACHE_D_AND_D_CARRY_COM","DOCKTEASE_COM","SOUTHERNSANANDREASSUPERAUTOS_COM","DYNASTY8REALESTATE_COM","FORECLOSURES_MAZE_D_BANK_COM","BENNYSORIGINALMOTORWORKS_COM","DYNASTY8EXECUTIVEREALTY_COM");
      this.offerMPWebsites = ["DOCKTEASE_COM","DYNASTY8REALESTATE_COM","ELITASTRAVEL_COM","LEGENDARYMOTORSPORT_NET","BENNYSORIGINALMOTORWORKS_COM","PANDMCYCLES_COM","SOUTHERNSANANDREASSUPERAUTOS_COM","WARSTOCK_D_CACHE_D_AND_D_CARRY_COM","DYNASTY8EXECUTIVEREALTY_COM","FORECLOSURES_MAZE_D_BANK_COM","ELITASTRAVEL_COM","WARSTOCK_D_CACHE_D_AND_D_CARRY_COM"];
      this.randomWebsites = new Array();
      com.rockstargames.gtav.web.allWebsites.makeWebsitesList(this.browser.isJapanese);
      this.generateRandomWebsites();
   }
   function READY()
   {
   }
   function updateWeatherWidget()
   {
      var _loc3_ = new Array("EXTRASUNNY","SUNNY","SUNNY_WINDY","CLOUDY","DRIZZLE","FOGGY","LIGHTNING","SNOW");
      var _loc2_ = 0;
      if(this.weatherDataArray[0] != undefined)
      {
         this.mcScope.weatherMC.weatherIconMC.gotoAndStop(_loc3_[this.weatherDataArray[0]]);
         _loc2_ = 100;
      }
      if(this.weatherDataArray[2] != undefined)
      {
         this.mcScope.weatherMC.areaTF.text = this.weatherDataArray[2];
      }
      if(this.weatherDataArray[3] != undefined)
      {
         this.mcScope.weatherMC.dayTF.text = this.weatherDataArray[3];
      }
      this.mcScope.weatherMC._alpha = _loc2_;
   }
   function generateRandomWebsites()
   {
      var _loc7_ = [];
      var _loc6_ = undefined;
      var _loc5_ = undefined;
      var _loc3_ = undefined;
      var _loc8_ = undefined;
      var _loc2_ = undefined;
      var _loc4_ = undefined;
      _loc3_ = 0;
      _loc8_ = com.rockstargames.gtav.web.allWebsites.websitesArray.length;
      while(_loc3_ < _loc8_)
      {
         _loc6_ = com.rockstargames.gtav.web.allWebsites.websitesArray[_loc3_][0];
         if(_loc6_ != "EYEFIND_INFO")
         {
            _loc5_ = false;
            _loc2_ = 0;
            _loc4_ = this.excludeMPwebsites.length;
            while(_loc2_ < _loc4_)
            {
               if(_loc6_ == this.excludeMPwebsites[_loc2_])
               {
                  _loc5_ = true;
                  break;
               }
               _loc2_ = _loc2_ + 1;
            }
            if(!_loc5_)
            {
               _loc7_.push(_loc3_);
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < 6)
      {
         _loc2_ = Math.floor(Math.random() * _loc7_.length);
         this.randomWebsites[_loc3_] = _loc7_.splice(_loc2_,1)[0];
         _loc3_ = _loc3_ + 1;
      }
      this.womURL = com.rockstargames.gtav.web.allWebsites.websitesArray[this.randomWebsites[0]][0];
      if(!this.urlHasSubdomain(this.womURL))
      {
         this.womURL = "WWW_" + this.womURL;
      }
      if(this.isMP)
      {
         this.randomWebsites[1] = 16;
      }
      if(this.browser.player == 1)
      {
         this.sponsoredAdNum = 0;
      }
      else
      {
         this.sponsoredAdNum = this.randRange(1,7);
      }
   }
   function urlHasSubdomain(url)
   {
      url = url.split("_S_").join("/");
      url = url.split("_D_").join("-");
      return url.indexOf("_") != url.lastIndexOf("_");
   }
   function goToAnchor(AnchorLinkString)
   {
      var _loc11_ = new Array();
      _loc11_ = AnchorLinkString.split("_");
      var _loc17_ = undefined;
      var _loc13_ = undefined;
      if(_loc11_[0] == "contact")
      {
         var _loc12_ = parseInt(_loc11_[1]);
         var _loc14_ = _loc12_ + 10;
         var _loc8_ = 0;
         while(_loc8_ < this.dataProviderUI.length - 10)
         {
            var _loc4_ = this.mcScope.contactsContainer["contact_" + _loc8_];
            if(_loc8_ != _loc12_)
            {
               _loc4_.highlight._visible = false;
               _loc4_.background._visible = false;
               _loc4_.playernameTF.textColor = 5214662;
            }
            else
            {
               _loc4_.highlight._visible = false;
               _loc4_.background._visible = true;
               _loc4_.playernameTF.textColor = 16777215;
            }
            _loc8_ = _loc8_ + 1;
         }
      }
      else if(_loc11_[0] == "email")
      {
         var _loc10_ = parseInt(_loc11_[1]);
         _loc14_ = _loc10_ + 10;
         var _loc2_ = this.mcScope.emailContainer["email_" + _loc10_];
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.playerNameTF,"EF_SENDER",0,true);
         this.mcScope.playerNameTF.htmlText = this.mcScope.playerNameTF.htmlText + (" " + this.dataProviderUI[_loc14_][0]);
         this.mcScope.playerNameTF.textAutoSize = "shrink";
         this.mcScope.dateTF.htmlText = this.dataProviderUI[_loc14_][1];
         this.mcScope.dateTF.textAutoSize = "shrink";
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.subjectTF,"EF_SUBJECT",0,true);
         this.mcScope.subjectTF.htmlText = this.mcScope.subjectTF.htmlText + (" " + this.dataProviderUI[_loc14_][2]);
         this.mcScope.subjectTF.autoSize = "left";
         this.mcScope.dividerHorizontal._y = this.mcScope.subjectTF._y + this.mcScope.subjectTF._height + 6;
         this.mcScope.bodyTF._y = this.mcScope.dividerHorizontal._y + 6;
         this.mcScope.bodyTF.htmlText = this.dataProviderUI[_loc14_][3];
         this.mcScope.bodyTF.autoSize = "left";
         _loc8_ = 0;
         while(_loc8_ < this.dataProviderUI.length - 10)
         {
            _loc2_ = this.mcScope.emailContainer["email_" + _loc8_];
            if(_loc8_ != _loc10_)
            {
               _loc2_.highlight._visible = false;
               _loc2_.background._visible = false;
               _loc2_.playernameTF.textColor = 5214662;
               _loc2_.dateTF.textColor = 6710886;
               _loc2_.subjectTF.textColor = 3355443;
            }
            else
            {
               _loc2_.highlight._visible = false;
               _loc2_.background._visible = true;
               _loc2_.playernameTF.textColor = 16777215;
               _loc2_.dateTF.textColor = 16777215;
               _loc2_.subjectTF.textColor = 16777215;
               this.lastEmailClicked = _loc8_;
            }
            _loc8_ = _loc8_ + 1;
         }
      }
      else if(_loc11_[0] == "offer")
      {
         var _loc15_ = this.dataProviderUI[9][_loc11_[1] * 2];
         if(this.urlHasSubdomain(this.offerMPWebsites[_loc15_]))
         {
            this.browser.GO_TO_WEBPAGE(this.offerMPWebsites[_loc15_]);
         }
         else
         {
            this.browser.GO_TO_WEBPAGE("WWW_" + this.offerMPWebsites[_loc15_]);
         }
      }
      else if(AnchorLinkString == "BLEETER")
      {
         this.browser.GO_TO_WEBPAGE("WWW_BLEETER_BIZ");
      }
      else if(AnchorLinkString == "WOMtextLink")
      {
         this.browser.GO_TO_WEBPAGE(this.womURL);
      }
      else if(AnchorLinkString == "sponsoredAdMC")
      {
         switch(this.sponsoredAdNum)
         {
            case 0:
               this.browser.GO_TO_WEBPAGE("WWW_DYNASTY8REALESTATE_COM");
               break;
            case 1:
               this.browser.GO_TO_WEBPAGE("WWW_LEGENDARYMOTORSPORT_NET");
               break;
            case 2:
               this.browser.GO_TO_WEBPAGE("WWW_ELITASTRAVEL_COM");
               break;
            case 3:
               this.browser.GO_TO_WEBPAGE("WWW_DOCKTEASE_COM");
               break;
            case 4:
               this.browser.GO_TO_WEBPAGE("WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM");
               break;
            case 5:
               this.browser.GO_TO_WEBPAGE("WWW_PANDMCYCLES_COM");
               break;
            case 6:
               this.browser.GO_TO_WEBPAGE("WWW_SOUTHERNSANANDREASSUPERAUTOS_COM");
               break;
            case 7:
               this.browser.GO_TO_WEBPAGE("WWW_LENNYAVERY_D_REALTY_COM");
         }
      }
      else
      {
         this.searchResults = new Array();
         switch(AnchorLinkString)
         {
            case "search_random":
               _loc13_ = "EF_RANDOM";
               var _loc5_ = new Array();
               _loc5_[0] = this.getRandomWebsite();
               _loc8_ = 1;
               var _loc9_ = 0;
               while(_loc8_ < this.maxNumberOfResults)
               {
                  var _loc6_ = this.getRandomWebsite();
                  var _loc7_ = false;
                  var _loc3_ = 0;
                  while(_loc3_ < _loc8_)
                  {
                     if(_loc5_[_loc3_] == _loc6_)
                     {
                        _loc7_ = true;
                        _loc9_ = _loc9_ + 1;
                     }
                     _loc3_ = _loc3_ + 1;
                  }
                  if(_loc7_ == false)
                  {
                     _loc5_[_loc8_] = _loc6_;
                     _loc8_ = _loc8_ + 1;
                  }
                  if(_loc9_ > 10)
                  {
                     break;
                  }
               }
               _loc8_ = 0;
               while(_loc8_ < _loc5_.length)
               {
                  this.searchResults.push(com.rockstargames.gtav.web.allWebsites.websitesArray[_loc5_[_loc8_]][0]);
                  _loc8_ = _loc8_ + 1;
               }
               break;
            case "search_media":
               _loc13_ = "EF_MEDIAANDENT";
               this.searchResults = ["LIFEINVADER_COM","CLASSICVINEWOOD_COM","FAMEORSHAME_NET","KUNGFURAINBOWLAZERFORCE_COM","PRINCESSROBOTBUBBLEGUM_COM","REPUBLICANSPACERANGERS_COM","RIGHTEOUSSLAUGHTER7_COM"];
               break;
            case "search_food":
               _loc13_ = "EF_FOODANDDRINK";
               this.searchResults = ["LOSSANTOSFREEGANS_COM","EGOCHASERENERGYBAR_COM","TACO_D_BOMB_COM","GRAINOFTRUTH_NET"];
               break;
            case "search_money":
               _loc13_ = "EF_MONEYANDSERV";
               if(this.isMP == true)
               {
                  this.searchResults = ["FORECLOSURES_MAZE_D_BANK_COM","BAWSAQ_COM","DYNASTY8REALESTATE_COM","MAZE_D_BANK_COM"];
               }
               else
               {
                  this.searchResults = ["LCN_D_EXCHANGE_COM","BAWSAQ_COM","DYNASTY8REALESTATE_COM","MAZE_D_BANK_COM","FLEECA_COM","THEBANKOFLIBERTY_COM"];
               }
               break;
            case "search_travel":
               _loc13_ = "EF_TRAVELANDTRANS";
               this.searchResults = ["ELITASTRAVEL_COM","LEGENDARYMOTORSPORT_NET","WARSTOCK_D_CACHE_D_AND_D_CARRY_COM","DOCKTEASE_COM","PANDMCYCLES_COM","SOUTHERNSANANDREASSUPERAUTOS_COM"];
               if(this.isMP)
               {
                  this.searchResults.unshift("BENNYSORIGINALMOTORWORKS_COM");
               }
               break;
            case "search_fashion":
               _loc13_ = "EF_FASHIONANDHEALTH";
               this.searchResults = ["SWALLOWCO_COM","UNIVERSALUNIFORM_NET","TOESHOESUSA_COM","PRESERVEXSKINCREAM_COM","ABSTINENTAMERICA_COM","FABIENLAROUCHEYOGA_COM"];
         }
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,_loc13_,this.CONTENT.localisationTF,false);
         this.browser.userTextEntry = this.CONTENT.localisationTF.text.split("<BR>").join(" ");
         this.browser.GO_TO_WEBPAGE("SEARCH");
      }
   }
   function POPULATE_TEXT(_pageName, searchArgs, newPage)
   {
      this.pageName = _pageName;
      if(newPage == true)
      {
         this.CLEANUP();
      }
      var _loc37_ = this.isMP && this.dataProviderUI[9];
      if(this.pageName != "COMPOSE")
      {
         this.composeSubjectStr = undefined;
         this.composeBodyStr = undefined;
      }
      switch(this.pageName)
      {
         case "PAGE1":
            this.mcScope = this.CONTENT.PAGE1;
            if(this.isMP == true)
            {
               this.CONTENT.PAGE1.gotoAndStop(!_loc37_?"MP":"MPOffers");
               this.mcScope.FeaturedWebsitesBG.BG._height = 198;
            }
            this.mcScope.search_random.onColour = 16777215;
            this.mcScope.search_random.offColour = 16777215;
            this.dataTextScope = new Array();
            this.set_localised_text(1,this.mcScope.TEXT_search_box.btnTxt,"EF_ENTERSEARCH",true);
            this.set_localised_text(3,this.mcScope.search_random.btnTxt,"EF_RANDOM",true);
            this.mcScope.search_random.btnTxt.onColour = 16777215;
            this.mcScope.search_random.btnTxt.offColour = 16777215;
            this.set_localised_text(4,this.mcScope.search_media.btnTxt,"EF_MEDIAANDENT",true);
            this.set_localised_text(5,this.mcScope.search_food.btnTxt,"EF_FOODANDDRINK",true);
            this.set_localised_text(6,this.mcScope.search_money.btnTxt,"EF_MONEYANDSERV",true);
            this.set_localised_text(7,this.mcScope.search_travel.btnTxt,"EF_TRAVELANDTRANS",true);
            this.set_localised_text(8,this.mcScope.search_fashion.btnTxt,"EF_FASHIONANDHEALTH",true);
            this.formatSearchButtons(this.mcScope);
            if(_loc37_)
            {
               var _loc8_ = 0;
               while(_loc8_ < 3)
               {
                  var _loc6_ = this.mcScope["offer_" + _loc8_];
                  _loc6_.onColour = 16777215;
                  _loc6_.offColour = 16777215;
                  var _loc12_ = this.dataProviderUI[9][2 * _loc8_ + 1];
                  _loc6_.btnTxt.textAutoSize = "shrink";
                  _loc6_.btnTxt.text = _loc12_;
                  _loc6_.image.gotoAndStop(this.dataProviderUI[9][2 * _loc8_] + 1);
                  this.dataTextScope[_loc8_ + 16] = _loc6_.btnTxt;
                  _loc8_ = _loc8_ + 1;
               }
               this.mcScope.WOTD._visible = false;
               if(this.womURL)
               {
                  this.mcScope[this.womURL]._visible = false;
               }
            }
            else if(!newPage)
            {
               this.set_localised_text(-1,this.mcScope.EF_WEBSITEOFTHEMINUTE,"EF_WEBSITEOFTHEMINUTE");
               var _loc16_ = this.randomWebsites[0];
               var _loc28_ = com.rockstargames.gtav.web.allWebsites.websitesArray[_loc16_][0];
               var _loc42_ = "DESC_" + _loc28_;
               if(!this.urlHasSubdomain(_loc28_))
               {
                  _loc28_ = "WWW_" + _loc28_;
               }
               this.loadButtonThumbnail(_loc28_,this.mcScope.WOTD,10);
               this.womURL = _loc28_;
               this.mcScope.websiteMinuteDescTF.autoSize = "true";
               this.set_localised_text(-1,this.mcScope.websiteMinuteDescTF,_loc42_);
               this.mcScope.WOMtextLink.btnTxt.autoSize = "true";
               this.mcScope.WOMtextLink.btnTxt.text = this.browser.PARSE_FILENAME_TO_TEXT(_loc28_);
               this.dataTextScope[0] = this.mcScope.WOMtextLink.btnTxt;
               this.mcScope.websiteOfTheMinuteBG.gotoAndStop(2);
               if(this.mcScope.websiteMinuteDescTF._height + 66 > this.mcScope.websiteOfTheMinuteBG._height)
               {
                  this.mcScope.websiteOfTheMinuteBG._height = this.mcScope.websiteMinuteDescTF._height + 66;
               }
               this.setUpSponsoredAd(16);
            }
            this.set_localised_text(-1,this.mcScope.FeaturedWebsitesBG.EF_FEATUREDWEBSITES,"EF_FEATUREDWEBSITES");
            _loc8_ = 0;
            while(_loc8_ < 5)
            {
               _loc16_ = this.randomWebsites[_loc8_ + 1];
               var _loc7_ = com.rockstargames.gtav.web.allWebsites.websitesArray[_loc16_][0];
               if(!this.urlHasSubdomain(_loc7_))
               {
                  _loc7_ = "WWW_" + _loc7_;
               }
               this.loadButtonThumbnail(_loc7_,this.mcScope["WOTW_" + _loc8_],_loc8_ + 11);
               _loc8_ = _loc8_ + 1;
            }
            if(this.isMP == false)
            {
               this.mcScope.EF_NEWSOFTHEDAY.textAutoSize = "shrink";
               this.set_localised_text(-1,this.mcScope.EF_NEWSOFTHEDAY,"EF_NEWSOFTHEDAY");
               this.set_localised_text(2,this.mcScope.BLEETER.btnTxt,"EF_RECENTBLEETS",true);
            }
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"EF_EYETUBES",this.CONTENT.localisationTF);
            this.browser.SET_TITLEBAR_TEXT(this.CONTENT.localisationTF.text);
            if(this.dataProviderUI[0] != undefined)
            {
               this.weatherDataArray[0] = this.dataProviderUI[0];
            }
            if(this.dataProviderUI[1] != undefined)
            {
               this.weatherDataArray[1] = this.dataProviderUI[1];
            }
            if(this.dataProviderUI[2] != undefined)
            {
               this.weatherDataArray[2] = this.dataProviderUI[2];
            }
            if(this.dataProviderUI[3] != undefined)
            {
               this.weatherDataArray[3] = this.dataProviderUI[3];
            }
            this.updateWeatherWidget();
            if(newPage == false)
            {
               if(this.isMP == false)
               {
                  this.mcScope.FeaturedWebsitesBG.BG._height = 126;
                  if(this.dataProviderUI[4] != undefined && this.dataProviderUI[4] != "")
                  {
                     if(this.dataProviderUI[5] != undefined)
                     {
                        if(this.dataProviderUI[5] >= 0 && this.dataProviderUI[5] <= 13)
                        {
                           this.loadNewsTexture(this.newsOrgArray[this.dataProviderUI[5]],this.mcScope.newsImage);
                        }
                     }
                     this.mcScope.newsTitleTF.autoSize = true;
                     this.mcScope.newsTitleTF.htmlText = this.dataProviderUI[4];
                     if(this.mcScope.newsTitleTF._height < 24)
                     {
                        this.mcScope.newsTitleTF._y = 277;
                     }
                     else if(this.mcScope.newsTitleTF._height > 24 && this.mcScope.newsTitleTF._height < 44)
                     {
                        this.mcScope.newsTitleTF._y = 267;
                     }
                     else if(this.mcScope.newsTitleTF._height > 44)
                     {
                        this.mcScope.newsTitleTF._y = 257;
                     }
                     if(this.dataProviderUI[6] != undefined)
                     {
                        this.mcScope.newsArticleTF.htmlText = this.dataProviderUI[6];
                     }
                     else
                     {
                        this.mcScope.newsArticleTF.htmlText = "";
                     }
                     this.mcScope.NEWS.btnTxt.autoSize = true;
                     this.set_localised_text(9,this.mcScope.NEWS.btnTxt,"EF_READMORENEWS",true);
                     this.mcScope.noNewsTF.text = "";
                  }
                  else
                  {
                     this.set_localised_text(9,this.mcScope.noNewsTF,"EF_NONEWS",true);
                     this.mcScope.newsTitleTF.htmlText = "";
                     this.mcScope.newsArticleTF.htmlText = "";
                  }
               }
               else
               {
                  this.mcScope.FeaturedWebsitesBG.BG._height = 198;
               }
            }
            if(this.isMP)
            {
               this.dataTextScope[this.dataTextScope.length] = this.mcScope.WWW_DYNASTY8EXECUTIVEREALTY_COM.btnTxt;
               this.dataTextScope[this.dataTextScope.length] = this.mcScope.WWW_LEGENDARYMOTORSPORT_NET.btnTxt;
               this.dataTextScope[this.dataTextScope.length] = this.mcScope.WWW_BENNYSORIGINALMOTORWORKS_COM.btnTxt;
               this.dataTextScope[this.dataTextScope.length] = this.mcScope.WWW_DOCKTEASE_COM.btnTxt;
               this.dataTextScope[this.dataTextScope.length] = this.mcScope.WWW_SOUTHERNSANANDREASSUPERAUTOS_COM.btnTxt;
            }
            if(this.isMP == true)
            {
               this.dataTextScope[this.dataTextScope.length] = this.mcScope.INBOX.btnTxt;
               this.mcScope.INBOX.offColour = 16777215;
               this.dataTextScope[this.dataTextScope.length] = this.mcScope.COMPOSE.btnTxt;
               this.mcScope.COMPOSE.offColour = 16777215;
               if(this.dataProviderUI[10] != undefined)
               {
                  this.numEmails = this.dataProviderUI[10];
               }
               if(this.numEmails > 0)
               {
                  this.mcScope.INBOX.btnTxt.htmlText = this.mcScope.INBOX.btnTxt.htmlText + (" (" + this.numEmails + ")");
               }
               if(this.inboxStr == "")
               {
                  com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.INBOX.btnTxt,"EF_INBOX",0,true);
                  this.inboxStr = this.mcScope.INBOX.btnTxt.htmlText;
               }
               this.mcScope.INBOX.btnTxt.htmlText = this.inboxStr;
               this.mcScope.INBOX.btnTxt.autoSize = "left";
               this.mcScope.INBOX.background._width = this.mcScope.INBOX.btnTxt._x + this.mcScope.INBOX.btnTxt.textWidth + 8;
               this.mcScope.email_divider._x = this.mcScope.INBOX._x + this.mcScope.INBOX._width + 16;
               this.mcScope.COMPOSE._x = this.mcScope.email_divider._x + 17;
               if(this.composeStr == "")
               {
                  com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.COMPOSE.btnTxt,"EF_COMPOSE",0,true);
                  this.composeStr = this.mcScope.COMPOSE.btnTxt.htmlText;
               }
               this.mcScope.COMPOSE.btnTxt.htmlText = this.composeStr;
               this.mcScope.COMPOSE.btnTxt.autoSize = "left";
               this.mcScope.COMPOSE.background._width = this.mcScope.COMPOSE.btnTxt._x + this.mcScope.COMPOSE.btnTxt.textWidth + 8;
            }
            this.CONTENT.BOUNDING_BOX._height = 820;
            this.updateBleets();
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.lastEmailClicked = 0;
            break;
         case "PAGE2":
            break;
         case "ERROR":
            this.mcScope = this.CONTENT.ERROR;
            if(newPage == true)
            {
               var _loc40_ = this.randRange(2,20);
               this.mcScope.errorPicMC.gotoAndStop(_loc40_);
               this.mcScope.gotoAndPlay(2);
               this.dataTextScope = new Array();
               this.dataTextScope[0] = this.mcScope.WWW_EYEFIND_INFO.btnTxt;
               this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
               this.CONTENT.BOUNDING_BOX._height = 627;
            }
            this.lastEmailClicked = 0;
            break;
         case "SEARCH":
            this.mcScope = this.CONTENT.SEARCH;
            if(this.isMP == true)
            {
               this.mcScope.INBOX._visible = true;
               this.mcScope.email_divider._visible = true;
               this.mcScope.COMPOSE._visible = true;
            }
            else
            {
               this.mcScope.INBOX._visible = false;
               this.mcScope.email_divider._visible = false;
               this.mcScope.COMPOSE._visible = false;
            }
            if(this.dataProviderUI[0] != undefined)
            {
               this.weatherDataArray[0] = this.dataProviderUI[0];
            }
            if(this.dataProviderUI[1] != undefined)
            {
               this.weatherDataArray[1] = this.dataProviderUI[1];
            }
            if(this.dataProviderUI[2] != undefined)
            {
               this.weatherDataArray[2] = this.dataProviderUI[2];
            }
            if(this.dataProviderUI[3] != undefined)
            {
               this.weatherDataArray[3] = this.dataProviderUI[3];
            }
            this.updateWeatherWidget();
            var _loc32_ = false;
            if(newPage == true)
            {
               if(searchArgs != "" && searchArgs != undefined)
               {
                  this.searchResults = searchArgs.split("&");
                  var _loc43_ = this.searchResults.shift();
                  this.browser.userTextEntry = _loc43_.toString();
                  _loc32_ = true;
               }
               if(this.mcScope.resultsContainer != undefined)
               {
                  this.mcScope.resultsContainer.removeMovieClip();
               }
               this.resultsContainer = this.mcScope.createEmptyMovieClip("resultsContainer",this.mcScope.getNextHighestDepth());
               this.mcScope.search_random.onColour = 16777215;
               this.mcScope.search_random.offColour = 16777215;
               this.mcScope.searchKeywordsTF.multiline = true;
               this.mcScope.searchKeywordsTF.autoSize = true;
               this.mcScope.searchKeywordsTF.htmlText = "";
               this.CONTENT._y = 0;
               this.mcScope.BACKGROUND._height = 627;
               this.CONTENT.BOUNDING_BOX._height = 627;
               this.dataTextScope = new Array();
               this.dataTextScope[0] = this.mcScope.WWW_EYEFIND_INFO.btnTxt;
               this.set_localised_text(1,this.mcScope.TEXT_search_box.btnTxt,"EF_ENTERSEARCH",true);
               this.set_localised_text(3,this.mcScope.search_random.btnTxt,"EF_RANDOM",true);
               this.mcScope.search_random.btnTxt.onColour = 16777215;
               this.mcScope.search_random.btnTxt.offColour = 16777215;
               this.set_localised_text(4,this.mcScope.search_media.btnTxt,"EF_MEDIAANDENT",true);
               this.set_localised_text(5,this.mcScope.search_food.btnTxt,"EF_FOODANDDRINK",true);
               this.set_localised_text(6,this.mcScope.search_money.btnTxt,"EF_MONEYANDSERV",true);
               this.set_localised_text(7,this.mcScope.search_travel.btnTxt,"EF_TRAVELANDTRANS",true);
               this.set_localised_text(8,this.mcScope.search_fashion.btnTxt,"EF_FASHIONANDHEALTH",true);
               this.formatSearchButtons(this.mcScope);
               if(this.searchResults.length == 0)
               {
                  this.searchResults = this.doSearch(this.browser.userTextEntry);
               }
               var _loc11_ = 284;
               var _loc19_ = 10;
               com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"EF_CLOSESTMATCH",this.CONTENT.localisationTF);
               this.mcScope.searchKeywordsTF.text = this.CONTENT.localisationTF.text + " " + this.browser.userTextEntry.toUpperCase();
               this.mcScope.searchResultsBG._height = 72;
               if(this.searchResults.length == 0)
               {
                  this.set_localised_text(-1,this.mcScope.searchKeywordsTF,"EF_CANTFIND");
                  com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"EF_EYETUBES",this.CONTENT.localisationTF);
                  this.browser.SET_TITLEBAR_TEXT(this.CONTENT.localisationTF.text);
               }
               else
               {
                  _loc8_ = 0;
                  while(_loc8_ < this.searchResults.length)
                  {
                     var _loc15_ = "thumbnail_" + this.searchResults[_loc8_];
                     if(this.urlHasSubdomain(this.searchResults[_loc8_]))
                     {
                        var _loc4_ = this.searchResults[_loc8_];
                     }
                     else
                     {
                        _loc4_ = "WWW_" + this.searchResults[_loc8_];
                     }
                     var _loc5_ = this.resultsContainer.attachMovie("button_searchResultMC",_loc4_,this.resultsContainer.getNextHighestDepth(),{_x:228,_y:_loc11_});
                     _loc5_.btnTxt.text = this.browser.PARSE_FILENAME_TO_TEXT(_loc4_);
                     var _loc14_ = this.mcScope.attachMovie("thumbnailMC","result_" + _loc4_,this.mcScope.getNextHighestDepth(),{_x:_loc5_._x,_y:_loc5_._y});
                     _loc14_.DISPLAY_THUMBNAIL(_loc15_,"result_" + _loc4_);
                     this.dataTextScope[_loc8_ + 9] = _loc5_.btnTxt;
                     var _loc13_ = "DESC_" + this.searchResults[_loc8_];
                     this.mcScope.resultsContainer[_loc4_].descriptionTF.autoSize = "left";
                     this.set_localised_text(-1,this.mcScope.resultsContainer[_loc4_].descriptionTF,_loc13_);
                     if(this.mcScope.resultsContainer[_loc4_].descriptionTF._height > 54)
                     {
                        this.mcScope.resultsContainer[_loc4_].BG._height = this.mcScope.resultsContainer[_loc4_].descriptionTF._height + 34;
                     }
                     this.mcScope.searchResultsBG._height = _loc11_ + _loc5_._height + _loc19_ - this.mcScope.searchResultsBG._y;
                     _loc11_ = _loc11_ + (_loc5_._height + _loc19_);
                     _loc8_ = _loc8_ + 1;
                  }
                  com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"EF_EYEFOUND",this.CONTENT.localisationTF);
                  this.browser.SET_TITLEBAR_TEXT(this.CONTENT.localisationTF.text);
               }
               if(_loc32_ == false)
               {
                  var _loc38_ = this.searchResults;
                  _loc38_.unshift(this.browser.userTextEntry.toUpperCase());
                  this.browser.ADD_URL_ARGS_TO_HISTORY(_loc38_);
               }
               if(this.isMP == true)
               {
                  this.dataTextScope[this.dataTextScope.length] = this.mcScope.INBOX.btnTxt;
                  this.mcScope.INBOX.offColour = 16777215;
                  this.dataTextScope[this.dataTextScope.length] = this.mcScope.COMPOSE.btnTxt;
                  this.mcScope.COMPOSE.offColour = 16777215;
                  if(this.dataProviderUI[10] != undefined)
                  {
                     this.numEmails = this.dataProviderUI[10];
                  }
                  if(this.numEmails > 0)
                  {
                     this.mcScope.INBOX.btnTxt.htmlText = this.mcScope.INBOX.btnTxt.htmlText + (" (" + this.numEmails + ")");
                  }
                  if(this.inboxStr == "")
                  {
                     com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.INBOX.btnTxt,"EF_INBOX",0,true);
                     this.inboxStr = this.mcScope.INBOX.btnTxt.htmlText;
                  }
                  this.mcScope.INBOX.btnTxt.htmlText = this.inboxStr;
                  this.mcScope.INBOX.btnTxt.autoSize = "left";
                  this.mcScope.INBOX.background._width = this.mcScope.INBOX.btnTxt._x + this.mcScope.INBOX.btnTxt.textWidth + 8;
                  this.mcScope.email_divider._x = this.mcScope.INBOX._x + this.mcScope.INBOX._width + 16;
                  this.mcScope.COMPOSE._x = this.mcScope.email_divider._x + 17;
                  if(this.composeStr == "")
                  {
                     com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.COMPOSE.btnTxt,"EF_COMPOSE",0,true);
                     this.composeStr = this.mcScope.COMPOSE.btnTxt.htmlText;
                  }
                  this.mcScope.COMPOSE.btnTxt.htmlText = this.composeStr;
                  this.mcScope.COMPOSE.btnTxt.autoSize = "left";
                  this.mcScope.COMPOSE.background._width = this.mcScope.COMPOSE.btnTxt._x + this.mcScope.COMPOSE.btnTxt.textWidth + 8;
               }
               this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
               var _loc24_ = this.mcScope.searchResultsBG._y + this.mcScope.searchResultsBG._height + 40;
               if(_loc24_ > 627)
               {
                  this.mcScope.BACKGROUND._height = _loc24_;
                  this.CONTENT.BOUNDING_BOX._height = _loc24_;
               }
               clearInterval(this.intervalID);
               this.intervalID = setInterval(this,"clearSearchResults",500);
            }
            this.lastEmailClicked = 0;
            break;
         case "NEWS":
            this.mcScope = this.CONTENT.NEWS;
            if(this.isMP == true)
            {
               this.mcScope.INBOX._visible = true;
               this.mcScope.email_divider._visible = true;
               this.mcScope.COMPOSE._visible = true;
            }
            else
            {
               this.mcScope.INBOX._visible = false;
               this.mcScope.email_divider._visible = false;
               this.mcScope.COMPOSE._visible = false;
            }
            this.dontUpdateSearch = true;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_EYEFIND_INFO.btnTxt;
            this.set_localised_text(1,this.mcScope.TEXT_search_box.btnTxt,"EF_ENTERSEARCH",true);
            this.set_localised_text(3,this.mcScope.search_random.btnTxt,"EF_RANDOM",true);
            this.mcScope.search_random.onColour = 16777215;
            this.mcScope.search_random.offColour = 16777215;
            this.set_localised_text(10,this.mcScope.search_media.btnTxt,"EF_MEDIAANDENT",true);
            this.set_localised_text(11,this.mcScope.search_food.btnTxt,"EF_FOODANDDRINK",true);
            this.set_localised_text(12,this.mcScope.search_money.btnTxt,"EF_MONEYANDSERV",true);
            this.set_localised_text(13,this.mcScope.search_travel.btnTxt,"EF_TRAVELANDTRANS",true);
            this.set_localised_text(14,this.mcScope.search_fashion.btnTxt,"EF_FASHIONANDHEALTH",true);
            this.formatSearchButtons(this.mcScope);
            if(this.dataProviderUI[0] != undefined)
            {
               this.weatherDataArray[0] = this.dataProviderUI[0];
            }
            if(this.dataProviderUI[1] != undefined)
            {
               this.weatherDataArray[1] = this.dataProviderUI[1];
            }
            if(this.dataProviderUI[2] != undefined)
            {
               this.weatherDataArray[2] = this.dataProviderUI[2];
            }
            if(this.dataProviderUI[3] != undefined)
            {
               this.weatherDataArray[3] = this.dataProviderUI[3];
            }
            this.updateWeatherWidget();
            if(this.dataProviderUI[4] != undefined && this.dataProviderUI[4] != "")
            {
               if(this.dataProviderUI[5] != undefined)
               {
                  if(this.dataProviderUI[5] >= 0 && this.dataProviderUI[5] <= 13)
                  {
                     this.loadNewsTexture(this.newsOrgArray[this.dataProviderUI[5]],this.mcScope.newsImage);
                  }
               }
               this.mcScope.newsTitleTF.htmlText = this.dataProviderUI[4];
               this.mcScope.newsArticleTF.autoSize = "left";
               this.mcScope.newsArticleTF.multiline = true;
               if(this.dataProviderUI[6] != undefined)
               {
                  this.mcScope.newsArticleTF.htmlText = this.dataProviderUI[6];
               }
            }
            this.mcScope.newsArticleBG._height = this.mcScope.newsArticleTF._y + this.mcScope.newsArticleTF._height + 9 - this.mcScope.newsArticleBG._y;
            this.set_localised_text(2,this.mcScope.BLEETER.btnTxt,"EF_RECENTBLEETS",true);
            this.updateBleets();
            this.setUpSponsoredAd(9);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 667;
            if(this.mcScope.newsArticleBG._y + this.mcScope.newsArticleBG._height > 667)
            {
               this.CONTENT.BOUNDING_BOX._height = this.mcScope.newsArticleBG._y + this.mcScope.newsArticleBG._height;
            }
            this.CONTENT.BOUNDING_BOX._height = this.CONTENT.BOUNDING_BOX._height + 40;
            this.lastEmailClicked = 0;
            break;
         case "INBOX":
            this.mcScope = this.CONTENT.INBOX;
            _loc24_ = 627;
            this.dataTextScope = new Array();
            if(newPage == true)
            {
               this.browser.SET_DATA_SLOT_EMPTY();
            }
            this.dataTextScope[0] = this.mcScope.WWW_EYEFIND_INFO.btnTxt;
            this.set_localised_text(1,this.mcScope.TEXT_search_box.btnTxt,"EF_ENTERSEARCH",true);
            this.set_localised_text(2,this.mcScope.search_random.btnTxt,"EF_RANDOM",true);
            this.mcScope.search_random.onColour = 16777215;
            this.mcScope.search_random.offColour = 16777215;
            this.updateWeatherWidget();
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.inboxTF,"EF_INBOX",0,true);
            this.mcScope.inboxTF.textAutoSize = "shrink";
            if(this.composeStr == "")
            {
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.COMPOSE.btnTxt,"EF_COMPOSE",0,true);
               this.composeStr = this.mcScope.COMPOSE.btnTxt.htmlText;
            }
            this.mcScope.COMPOSE.btnTxt.htmlText = this.composeStr;
            this.mcScope.COMPOSE.btnTxt.autoSize = "center";
            this.mcScope.COMPOSE.icon._x = this.mcScope.COMPOSE.btnTxt._x - (this.mcScope.COMPOSE.icon._width + 8);
            this.dataTextScope[3] = this.mcScope.COMPOSE.btnTxt;
            this.mcScope.COMPOSE.onColour = 16777215;
            this.mcScope.COMPOSE.offColour = 16777215;
            this.mcScope.receivedTF.textAutoSize = "shrink";
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.receivedTF,"EF_RECEIVED",0,true);
            if(this.olderStr == "")
            {
               this.mcScope.emailolder.btnTxt.htmlText = "Older";
               this.olderStr = this.mcScope.emailolder.btnTxt.htmlText;
            }
            this.mcScope.emailolder.btnTxt.htmlText = this.olderStr;
            this.mcScope.emailolder.btnTxt._alpha = 0;
            this.dataTextScope[6] = this.mcScope.emailolder.btnTxt;
            if(this.newerStr == "")
            {
               this.mcScope.emailnewer.btnTxt.htmlText = "Newer";
               this.newerStr = this.mcScope.emailnewer.btnTxt.htmlText;
            }
            this.mcScope.emailnewer.btnTxt.htmlText = this.newerStr;
            this.mcScope.emailnewer.btnTxt._alpha = 0;
            this.dataTextScope[7] = this.mcScope.emailnewer.btnTxt;
            if(this.replyStr == "")
            {
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.emailreply.btnTxt,"EF_REPLYMAIL",0,true);
               this.replyStr = this.mcScope.emailreply.btnTxt.htmlText;
            }
            this.mcScope.emailreply.btnTxt.htmlText = this.replyStr;
            this.mcScope.emailreply.btnTxt.autoSize = "left";
            this.mcScope.emailreply.background._width = this.mcScope.emailreply.btnTxt._x + this.mcScope.emailreply.btnTxt.textWidth + 8;
            this.mcScope.replyDivider._x = this.mcScope.emailreply._x + this.mcScope.emailreply._width + 16;
            this.dataTextScope[8] = this.mcScope.emailreply.btnTxt;
            this.mcScope.emaildelete._x = this.mcScope.emailreply._x + this.mcScope.emailreply._width + 32;
            if(this.deleteStr == "")
            {
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.emaildelete.btnTxt,"EF_DELMAIL",0,true);
               this.deleteStr = this.mcScope.emaildelete.btnTxt.htmlText;
            }
            this.mcScope.emaildelete.btnTxt.htmlText = this.deleteStr;
            this.mcScope.emaildelete.btnTxt.autoSize = "left";
            this.mcScope.emaildelete.background._width = this.mcScope.emaildelete.btnTxt._x + this.mcScope.emaildelete.btnTxt.textWidth + 8;
            this.mcScope.deleteDivider._x = this.mcScope.replyDivider._x + this.mcScope.emaildelete._width + 2 * (this.mcScope.emaildelete._x - this.mcScope.replyDivider._x) + 3;
            this.dataTextScope[9] = this.mcScope.emaildelete.btnTxt;
            var _loc25_ = 0;
            if(newPage == false)
            {
               var _loc18_ = undefined;
               if(this.mcScope.emailContainer != undefined)
               {
                  this.mcScope.emailContainer.removeMovieClip();
               }
               this.mcScope.playerNameTF.htmlText = "";
               this.mcScope.dateTF.htmlText = "";
               this.mcScope.subjectTF.htmlText = "";
               this.mcScope.bodyTF.htmlText = "";
               if(this.dataProviderUI[10] != undefined)
               {
                  _loc18_ = this.mcScope.createEmptyMovieClip("emailContainer",this.mcScope.getNextHighestDepth());
                  var _loc29_ = 218;
                  var _loc10_ = 282;
                  var _loc20_ = undefined;
                  _loc25_ = 0;
                  _loc8_ = 0;
                  while(_loc8_ < this.dataProviderUI.length - 10)
                  {
                     var _loc9_ = _loc8_ + 10;
                     if(this.dataProviderUI[_loc9_][0] != undefined)
                     {
                        _loc20_ = "email_" + _loc8_;
                        var _loc2_ = _loc18_.attachMovie("button_email",_loc20_,_loc18_.getNextHighestDepth(),{_x:_loc29_,_y:_loc10_});
                        _loc2_.playernameTF.htmlText = this.dataProviderUI[_loc9_][0];
                        _loc2_.dateTF.htmlText = this.dataProviderUI[_loc9_][1];
                        _loc2_.subjectTF.htmlText = this.dataProviderUI[_loc9_][2];
                        _loc2_.subjectTF.autoSize = "left";
                        _loc2_.background._height = _loc2_.subjectTF._y + _loc2_.subjectTF._height + 8;
                        _loc2_.background._visible = false;
                        _loc2_.highlight._height = _loc2_.background._height;
                        _loc2_.divider._y = _loc2_.highlight._height - 1;
                        this.dataTextScope[_loc9_] = _loc2_.btnTxt;
                        _loc10_ = _loc10_ + Math.ceil(_loc2_._height);
                        _loc24_ = _loc10_ + 40;
                        _loc25_ = _loc25_ + 1;
                        if(_loc8_ == this.lastEmailClicked)
                        {
                           this.setDelayedText(this.mcScope.statusTF);
                           this.mcScope.statusTF.text = "";
                           com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.playerNameTF,"EF_SENDER",0,true);
                           this.mcScope.playerNameTF.htmlText = this.mcScope.playerNameTF.htmlText + (" " + this.dataProviderUI[_loc9_][0]);
                           this.mcScope.playerNameTF.textAutoSize = "shrink";
                           this.mcScope.dateTF.htmlText = this.dataProviderUI[_loc9_][1];
                           this.mcScope.dateTF.textAutoSize = "shrink";
                           com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.subjectTF,"EF_SUBJECT",0,true);
                           this.mcScope.subjectTF.htmlText = this.mcScope.subjectTF.htmlText + (" " + this.dataProviderUI[_loc9_][2]);
                           this.mcScope.subjectTF.autoSize = "left";
                           this.mcScope.dividerHorizontal._y = Math.ceil(this.mcScope.subjectTF._y + this.mcScope.subjectTF._height + 6);
                           this.mcScope.bodyTF._y = this.mcScope.dividerHorizontal._y + 6;
                           this.mcScope.bodyTF.htmlText = this.dataProviderUI[_loc9_][3];
                           this.mcScope.bodyTF.autoSize = "left";
                           _loc2_.highlight._visible = false;
                           _loc2_.background._visible = true;
                           _loc2_.playernameTF.textColor = 16777215;
                           _loc2_.dateTF.textColor = 16777215;
                           _loc2_.subjectTF.textColor = 16777215;
                           this.browser.SET_CURSOR_STATE("ARROW");
                           this.browser.DISABLE_BUTTON(6,false);
                           this.browser.DISABLE_BUTTON(7,false);
                           this.browser.DISABLE_BUTTON(8,false);
                           this.browser.DISABLE_BUTTON(9,false);
                        }
                     }
                     _loc8_ = _loc8_ + 1;
                  }
               }
               this.numEmails = _loc25_;
               if(this.dataProviderUI[10] == undefined)
               {
                  this.setDelayedText(this.mcScope.statusTF,"EF_NOMAIL",2);
                  this.mcScope.statusTF.autoSize = "left";
                  this.browser.SET_CURSOR_STATE("ARROW");
               }
            }
            else
            {
               this.browser.setCursorBusy();
               if(this.dataProviderUI[10] == undefined || this.dataProviderUI.length == 0)
               {
                  com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.statusTF,"EF_GETMAIL",0,true);
                  this.mcScope.statusTF.autoSize = "left";
                  this.browser.DISABLE_BUTTON(6,true);
                  this.browser.DISABLE_BUTTON(7,true);
                  this.browser.DISABLE_BUTTON(8,true);
                  this.browser.DISABLE_BUTTON(9,true);
               }
            }
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            if(_loc24_ < 627)
            {
               _loc24_ = 627;
            }
            this.mcScope.BACKGROUND._height = _loc24_;
            this.mcScope.dividerVertical._height = _loc24_ - this.mcScope.dividerVertical._y;
            this.CONTENT.BOUNDING_BOX._height = _loc24_;
            break;
         case "COMPOSE":
            this.mcScope = this.CONTENT.COMPOSE;
            _loc24_ = 627;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_EYEFIND_INFO.btnTxt;
            this.set_localised_text(1,this.mcScope.TEXT_search_box.btnTxt,"EF_ENTERSEARCH",true);
            this.set_localised_text(2,this.mcScope.search_random.btnTxt,"EF_RANDOM",true);
            this.mcScope.search_random.onColour = 16777215;
            this.mcScope.search_random.offColour = 16777215;
            this.updateWeatherWidget();
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.recipientTF,"EF_SELSENDEE",0,true);
            this.mcScope.recipientTF.textAutoSize = "shrink";
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.toTF,"EF_SENDEE",0,true);
            this.mcScope.toTF.autoSize = "left";
            this.mcScope.playerNameTF._x = this.mcScope.toTF._x + this.mcScope.toTF.textWidth + 10;
            if(this.dataProviderUI[9][0] != undefined && this.dataProviderUI[9][0] != "")
            {
               this.mcScope.playerNameTF.htmlText = this.dataProviderUI[9][0];
               this.mcScope.playerNameTF.textAutoSize = "shrink";
            }
            else
            {
               this.mcScope.playerNameTF.text = "";
            }
            if(!newPage)
            {
               if(this.dataProviderUI[9][1] != undefined && this.dataProviderUI[9][1] != "")
               {
                  this.composeSubjectStr = this.dataProviderUI[9][1];
               }
               if(this.composeSubjectStr == undefined || this.composeSubjectStr == "")
               {
                  this.mcScope.subjectTF.text = " ";
                  com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.subject_Button.btnTxt,"EF_TYPESUBJECT",0,true);
               }
               else
               {
                  this.mcScope.subjectTF.htmlText = this.composeSubjectStr;
                  this.mcScope.subject_Button.btnTxt.text = "";
               }
            }
            this.mcScope.subjectTF.autoSize = "left";
            this.mcScope.subject_Button.btnTxt.textColor = 0;
            this.mcScope.subject_Button.background._height = this.mcScope.subjectTF._height + 5;
            this.mcScope.subject_Button.background._visible = false;
            this.dataTextScope[6] = this.mcScope.subject_Button.btnTxt;
            this.mcScope.dividerHorizontal._y = Math.ceil(this.mcScope.subject_Button._y + this.mcScope.subject_Button._height + 6);
            this.mcScope.bodyTF._y = this.mcScope.dividerHorizontal._y + 12;
            this.mcScope.body_Button._y = this.mcScope.bodyTF._y - 3;
            this.mcScope.body_Button.background._visible = false;
            this.mcScope.body_Button.btnTxt.textColor = 0;
            if(!newPage)
            {
               if(this.dataProviderUI[9][2] != undefined && this.dataProviderUI[9][2] != "")
               {
                  this.composeBodyStr = this.dataProviderUI[9][2];
               }
               if(this.composeBodyStr == undefined || this.composeBodyStr == "")
               {
                  this.mcScope.bodyTF.htmlText = " ";
                  com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.body_Button.btnTxt,"EF_TYPEMAIL",0,true);
               }
               else
               {
                  this.mcScope.bodyTF.htmlText = this.composeBodyStr;
                  this.mcScope.body_Button.btnTxt.text = "";
               }
            }
            this.mcScope.bodyTF.autoSize = "left";
            this.mcScope.body_Button.background._height = this.mcScope.bodyTF._height + 5;
            this.dataTextScope[7] = this.mcScope.body_Button.btnTxt;
            this.mcScope.INBOX._y = Math.ceil(this.mcScope.bodyTF._y + this.mcScope.bodyTF._height + 10);
            if(this.cancelStr == "")
            {
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.INBOX.btnTxt,"EF_CANCELMAIL",0,true);
               this.cancelStr = this.mcScope.INBOX.btnTxt.htmlText;
            }
            this.mcScope.INBOX.btnTxt.htmlText = this.cancelStr;
            this.mcScope.INBOX.background._width = this.mcScope.INBOX.btnTxt._x + this.mcScope.INBOX.btnTxt.textWidth + 8;
            this.mcScope.INBOX.onColour = 16777215;
            this.mcScope.INBOX.offColour = 16777215;
            this.dataTextScope[5] = this.mcScope.INBOX.btnTxt;
            this.mcScope.emailsend._y = Math.ceil(this.mcScope.bodyTF._y + this.mcScope.bodyTF._height + 10);
            if(this.sendStr == "")
            {
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.emailsend.btnTxt,"EF_SENDMAIL",0,true);
               this.sendStr = this.mcScope.emailsend.btnTxt.htmlText;
            }
            this.mcScope.emailsend.btnTxt.htmlText = this.sendStr;
            this.mcScope.emailsend.background._width = this.mcScope.emailsend.btnTxt._x + this.mcScope.emailsend.btnTxt.textWidth + 8;
            this.mcScope.emailsend._x = 1059 - this.mcScope.emailsend._width;
            this.mcScope.emailsend.onColour = 16777215;
            this.mcScope.emailsend.offColour = 16777215;
            this.dataTextScope[8] = this.mcScope.emailsend.btnTxt;
            var _loc23_ = 0;
            var _loc27_ = 0;
            if(newPage == false)
            {
               this.mcScope.statusTF.text = "";
               var _loc17_ = undefined;
               if(this.mcScope.contactsContainer != undefined)
               {
                  this.mcScope.contactsContainer.removeMovieClip();
               }
               _loc17_ = this.mcScope.createEmptyMovieClip("contactsContainer",this.mcScope.getNextHighestDepth());
               _loc29_ = 218;
               _loc10_ = 201;
               _loc23_ = 0;
               _loc8_ = 0;
               while(_loc8_ < this.dataProviderUI.length - 10)
               {
                  _loc9_ = _loc8_ + 10;
                  if(this.dataProviderUI[_loc9_][0] != undefined)
                  {
                     _loc20_ = "contact_" + _loc8_;
                     var _loc3_ = _loc17_.attachMovie("button_contact",_loc20_,_loc17_.getNextHighestDepth(),{_x:_loc29_,_y:_loc10_});
                     _loc3_.playernameTF.htmlText = this.dataProviderUI[_loc9_][0];
                     _loc3_.background._height = _loc3_.playernameTF._y + _loc3_.playernameTF._height + 8;
                     _loc3_.background._visible = false;
                     _loc3_.highlight._height = _loc3_.background._height;
                     _loc3_.divider._y = _loc3_.highlight._height - 1;
                     this.dataTextScope[_loc9_] = _loc3_.btnTxt;
                     _loc10_ = _loc10_ + Math.ceil(_loc3_._height);
                     _loc27_ = _loc10_ + 40;
                     _loc23_ = _loc23_ + 1;
                  }
                  _loc8_ = _loc8_ + 1;
               }
               if(_loc23_ == 0)
               {
                  com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.statusTF,"EF_NOCONTACT",0,true);
                  this.mcScope.statusTF.textAutoSize = "shrink";
               }
               else
               {
                  this.mcScope.statusTF.text = "";
               }
               this.browser.SET_CURSOR_STATE("ARROW");
            }
            else
            {
               this.browser.SET_CURSOR_STATE("BUSY");
               if(_loc17_.contact_0 == undefined)
               {
                  com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.statusTF,"EF_GETCONTACT",0,true);
                  this.mcScope.statusTF.textAutoSize = "shrink";
               }
            }
            this.numContacts = _loc23_;
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            var _loc39_ = true;
            if(this.dataProviderUI[9][0] != undefined && this.dataProviderUI[9][0] != "")
            {
               if(this.composeSubjectStr != undefined && this.composeSubjectStr != "")
               {
                  if(this.composeBodyStr != undefined && this.composeBodyStr != "")
                  {
                     _loc39_ = false;
                  }
               }
            }
            this.browser.DISABLE_BUTTON(8,_loc39_);
            if(this.dataProviderUI[9][0] != undefined && this.dataProviderUI[9][0] != "")
            {
               this.mcScope.subject_Button.disabled = false;
               this.mcScope.subject_Button._alpha = 100;
               this.mcScope.body_Button.disabled = false;
               this.mcScope.body_Button._alpha = 100;
            }
            else
            {
               this.mcScope.subject_Button.disabled = true;
               this.mcScope.subject_Button._alpha = 40;
               this.mcScope.body_Button.disabled = true;
               this.mcScope.body_Button._alpha = 40;
            }
            var _loc35_ = {x:this.mcScope.emailsend._x,y:this.mcScope.emailsend._y};
            this.mcScope.localToGlobal(_loc35_);
            _loc24_ = _loc35_.y + this.mcScope.emailsend._height;
            if(_loc24_ < _loc27_)
            {
               _loc24_ = _loc27_;
            }
            if(_loc24_ < 627)
            {
               _loc24_ = 627;
            }
            this.mcScope.BACKGROUND._height = _loc24_;
            this.mcScope.dividerVertical._height = _loc24_ - this.mcScope.dividerVertical._y;
            this.CONTENT.BOUNDING_BOX._height = _loc24_;
            this.lastEmailClicked = 0;
            break;
         case "EMAILSTATUS":
            this.mcScope = this.CONTENT.EMAILSTATUS;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_EYEFIND_INFO.btnTxt;
            this.set_localised_text(1,this.mcScope.TEXT_search_box.btnTxt,"EF_ENTERSEARCH",true);
            this.set_localised_text(2,this.mcScope.search_random.btnTxt,"EF_RANDOM",true);
            this.mcScope.search_random.onColour = 16777215;
            this.mcScope.search_random.offColour = 16777215;
            this.updateWeatherWidget();
            if(this.dataProviderUI[10] != undefined && this.dataProviderUI[10] != "")
            {
               var _loc31_ = this.dataProviderUI[10].toString();
               var _loc30_ = _loc31_.indexOf("<C>");
               var _loc36_ = _loc31_.indexOf("</C>",_loc30_) - 3;
               this.mcScope.statusTF.htmlText = _loc31_;
               if(!isNaN(_loc30_))
               {
                  var _loc34_ = new TextFormat("$Font2",18);
                  var _loc41_ = new TextFormat("$Font2_cond",20);
                  this.mcScope.statusTF.setTextFormat(0,_loc30_,_loc34_);
                  this.mcScope.statusTF.setTextFormat(_loc30_,_loc36_,_loc41_);
                  this.mcScope.statusTF.setTextFormat(_loc36_,this.mcScope.statusTF.text.length,_loc34_);
               }
               this.mcScope.statusTF.autoSize = "center";
               this.mcScope.statusBackground._height = 20 + this.mcScope.statusTF._height;
            }
            if(this.inboxStr == "")
            {
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.INBOX.btnTxt,"EF_INBOX",0,true);
               this.inboxStr = this.mcScope.INBOX.btnTxt.htmlText;
            }
            this.mcScope.INBOX.btnTxt.htmlText = this.inboxStr;
            this.mcScope.INBOX.btnTxt.autoSize = "left";
            this.mcScope.INBOX.background._width = this.mcScope.INBOX.btnTxt._x + this.mcScope.INBOX.btnTxt.textWidth + 8;
            this.mcScope.INBOX._x = 640 - this.mcScope.INBOX.background._width / 2;
            this.dataTextScope[3] = this.mcScope.INBOX.btnTxt;
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.mcScope.BACKGROUND._height = 627;
            this.CONTENT.BOUNDING_BOX._height = 627;
            this.lastEmailClicked = 0;
      }
      this.prevPage = this.pageName;
      this.prevSearchArgs = searchArgs;
   }
   function formatSearchButtons(container)
   {
      container.search_media.btnTxt.autoSize = "center";
      container.search_food.btnTxt.autoSize = "center";
      container.search_money.btnTxt.autoSize = "center";
      container.search_travel.btnTxt.autoSize = "center";
      container.search_fashion.btnTxt.autoSize = "center";
   }
   function setDelayedText(TF, textStr, duration)
   {
      if(TF != undefined)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(TF);
         if(textStr != undefined)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(TF,0,{delay:duration,onComplete:this.showDelayedText,onCompleteScope:this,onCompleteArgs:[TF,textStr]});
         }
      }
   }
   function showDelayedText(TF, textStr)
   {
      if(TF instanceof TextField)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(TF,textStr,0,true);
      }
   }
   function clearSearchResults()
   {
      clearInterval(this.intervalID);
      this.searchResults = new Array();
   }
   function setUpSponsoredAd(buttonID)
   {
      this.mcScope.sponsoredAdMC.sponsoredAd.gotoAndStop(this.sponsoredAdNum + 2);
      this.dataTextScope[buttonID] = this.mcScope.sponsoredAdMC.btnTxt;
      this.set_localised_text(-1,this.mcScope.sponsoredAdMC.EF_SPONSOREDADVERT,"EF_SPONSOREDADVERT");
   }
   function doSearch(userSearchKeywords)
   {
      var _loc16_ = userSearchKeywords.split("www.").join("").split(".com").join("").split(".org").join("").split(".info").join("").split(".net").join("").split(".biz").join("").split(".us").join("");
      userSearchKeywords = _loc16_;
      var _loc11_ = new Array();
      if(userSearchKeywords.length == 0)
      {
         this.browser.GO_TO_WEBPAGE("PAGE1");
      }
      var _loc3_ = userSearchKeywords.toLowerCase().split(" ");
      var _loc7_ = 0;
      while(_loc7_ < com.rockstargames.gtav.web.allWebsites.websitesArray.length)
      {
         var _loc4_ = 0;
         var _loc10_ = com.rockstargames.gtav.web.allWebsites.websitesArray[_loc7_][0];
         var _loc9_ = undefined;
         _loc9_ = com.rockstargames.gtav.web.allWebsites.websitesArray[_loc7_][1].toLowerCase();
         _loc9_.split(", ").join(" ");
         var _loc8_ = this.browser.PARSE_FILENAME_TO_TEXT(_loc10_.substr(0,_loc10_.lastIndexOf("_")));
         var _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            var _loc5_ = _loc9_.split(_loc3_[_loc2_]);
            if(_loc5_.length > 1)
            {
               _loc4_ = _loc4_ + 1;
               if(_loc5_.indexOf(_loc3_[_loc2_] + " ") > -1)
               {
                  _loc4_ = _loc4_ + _loc3_[_loc2_].length;
                  _loc4_ = _loc4_ + (_loc3_.length - _loc2_);
               }
            }
            var _loc6_ = _loc8_.indexOf(_loc3_[_loc2_]);
            if(_loc6_ > -1)
            {
               _loc4_ = _loc4_ + (_loc8_.length - _loc6_);
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc11_.push({RELEVANCE:_loc4_,WEBSITE:_loc10_});
         _loc7_ = _loc7_ + 1;
      }
      _loc11_.sortOn("RELEVANCE",Array.DESCENDING | Array.NUMERIC);
      var _loc14_ = new Array();
      _loc7_ = 0;
      while(_loc7_ < this.maxNumberOfResults)
      {
         if(_loc11_[_loc7_].RELEVANCE > 0)
         {
            _loc14_.push(_loc11_[_loc7_].WEBSITE);
         }
         _loc7_ = _loc7_ + 1;
      }
      return _loc14_;
   }
   function loadButtonThumbnail(urlName, placeholder, textScopeSlot)
   {
      if(this.mcScope[urlName] == undefined)
      {
         var _loc3_ = this.mcScope.attachMovie("thumbnailMC",urlName,this.mcScope.getNextHighestDepth(),{_x:placeholder._x,_y:placeholder._y});
         var _loc4_ = urlName.indexOf("WWW_") != 0?urlName:urlName.slice(4);
         _loc3_.DISPLAY_THUMBNAIL("thumbnail_" + _loc4_,urlName);
      }
      this.dataTextScope[textScopeSlot] = this.mcScope[urlName].btnTxt;
   }
   function loadNewsTexture(txd, placeholder)
   {
      var _loc2_ = this.mcScope.attachMovie("newsImageMC","newsImageMC",this.mcScope.getNextHighestDepth(),{_x:placeholder._x,_y:placeholder._y});
      _loc2_._width = placeholder._width + 4;
      _loc2_._height = placeholder._height + 4;
      _loc2_.DISPLAY_THUMBNAIL(txd,"newsImageMC");
   }
   function set_localised_text(slotID, TF, TextLabel, setDataSlot)
   {
      if(TF != undefined)
      {
         if(setDataSlot)
         {
            this.dataTextScope[slotID] = TF;
         }
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,TextLabel,TF,true);
      }
   }
   function getRandomWebsite()
   {
      var _loc3_ = this.randRange(0,com.rockstargames.gtav.web.allWebsites.websitesArray.length - 1);
      while(com.rockstargames.gtav.web.allWebsites.websitesArray[_loc3_][0] == "EYEFIND_INFO")
      {
         _loc3_ = this.randRange(0,com.rockstargames.gtav.web.allWebsites.websitesArray.length - 1);
      }
      if(this.mcScope == this.CONTENT.PAGE1 && this.isMP == true)
      {
         var _loc2_ = 0;
         while(_loc2_ < this.excludeMPwebsites.length)
         {
            if(com.rockstargames.gtav.web.allWebsites.websitesArray[_loc3_][0] == this.excludeMPwebsites[_loc2_])
            {
               _loc3_ = _loc3_ + 1;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      return _loc3_;
   }
   function randRange(min, max)
   {
      var _loc1_ = Math.floor(Math.random() * (max - min + 1)) + min;
      return _loc1_;
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      if(success == true)
      {
         if(this.mcScope[uniqueID].txd == undefined)
         {
            this.TXDarray.push(new Array(textureDict,uniqueID));
            this.mcScope[uniqueID].TXD_HAS_LOADED(textureDict,success,uniqueID);
         }
      }
   }
   function updateBleets()
   {
      if(this.isMP == false)
      {
         var _loc3_ = 7;
         while(_loc3_ < 9)
         {
            if(this.dataProviderUI[_loc3_] != undefined)
            {
               var _loc2_ = "";
               var _loc4_ = "";
               var _loc9_ = "bleet" + (_loc3_ - 6) + "NameTF";
               var _loc6_ = "bleet" + (_loc3_ - 6) + "TF";
               this.CONTENT.localisationTF.text = this.dataProviderUI[_loc3_];
               _loc2_ = this.CONTENT.localisationTF.text;
               var _loc5_ = _loc2_.indexOf("*");
               if(_loc5_ != -1)
               {
                  var _loc7_ = _loc2_.substr(_loc5_ + 1).indexOf(" ");
                  var _loc8_ = _loc2_.substr(_loc7_ + 2,_loc2_.length);
                  _loc2_ = _loc8_;
               }
               _loc5_ = _loc2_.indexOf("@");
               if(_loc5_ != -1)
               {
                  _loc7_ = _loc2_.substr(_loc5_ + 1).indexOf(" ");
                  _loc4_ = _loc2_.slice(_loc5_,_loc7_ + 1);
                  _loc8_ = _loc2_.substr(_loc7_ + 2,_loc2_.length);
                  _loc2_ = _loc8_;
               }
               if(_loc4_ != undefined)
               {
                  this.mcScope.BLEETER[_loc9_].text = _loc4_;
               }
               this.mcScope.BLEETER[_loc6_].autoSize = true;
               if(_loc2_ != undefined)
               {
                  this.mcScope.BLEETER[_loc6_].text = _loc2_;
               }
            }
            _loc3_ = _loc3_ + 1;
         }
         this.mcScope.BLEETER.bleetDivider._y = this.mcScope.BLEETER.bleet1TF._y + this.mcScope.BLEETER.bleet1TF._height + 2;
         this.mcScope.BLEETER.bleet2NameTF._y = this.mcScope.BLEETER.bleetDivider._y + 2;
         this.mcScope.BLEETER.bleet2TF._y = this.mcScope.BLEETER.bleet2NameTF._y + 15;
         this.mcScope.BLEETER.bleeterBG._height = this.mcScope.BLEETER.bleet2TF._y + this.mcScope.BLEETER.bleet2TF._height + 4;
      }
      this.moveFeaturedWebsites();
   }
   function moveFeaturedWebsites()
   {
      switch(this.mcScope)
      {
         case this.CONTENT.PAGE1:
            var _loc9_ = undefined;
            if(this.isMP == false)
            {
               _loc9_ = this.mcScope.BLEETER._y + this.mcScope.BLEETER._height + 9;
            }
            else
            {
               _loc9_ = this.mcScope.sponsoredAdMC._y + this.mcScope.sponsoredAdMC._height + 9;
            }
            var _loc8_ = this.mcScope.websiteOfTheMinuteBG._y + this.mcScope.websiteOfTheMinuteBG._height + 9;
            var _loc4_ = Math.max(_loc9_,_loc8_);
            this.mcScope.FeaturedWebsitesBG._y = _loc4_;
            var _loc6_ = 37;
            if(this.isMP == true)
            {
               _loc6_ = 110;
               this.mcScope.WWW_DYNASTY8EXECUTIVEREALTY_COM._y = _loc4_ + 37;
               this.mcScope.WWW_LEGENDARYMOTORSPORT_NET._y = _loc4_ + 37;
               this.mcScope.WWW_BENNYSORIGINALMOTORWORKS_COM._y = _loc4_ + 37;
               this.mcScope.WWW_DOCKTEASE_COM._y = _loc4_ + 37;
               this.mcScope.WWW_SOUTHERNSANANDREASSUPERAUTOS_COM._y = _loc4_ + 37;
            }
            var _loc3_ = 0;
            while(_loc3_ < 5)
            {
               var _loc5_ = this.randomWebsites[_loc3_ + 1];
               var _loc2_ = com.rockstargames.gtav.web.allWebsites.websitesArray[_loc5_][0];
               if(!this.urlHasSubdomain(_loc2_))
               {
                  _loc2_ = "WWW_" + _loc2_;
               }
               this.mcScope["WOTW_" + _loc3_]._y = _loc4_ + _loc6_;
               if(this.mcScope[_loc2_] != undefined)
               {
                  this.mcScope[_loc2_]._y = _loc4_ + _loc6_;
               }
               _loc3_ = _loc3_ + 1;
            }
            var _loc7_ = _loc4_ + this.mcScope.FeaturedWebsitesBG._height + 40;
            if(isNaN(_loc7_))
            {
               _loc7_ = 646;
            }
            if(_loc7_ > 627)
            {
               this.CONTENT.BOUNDING_BOX._height = _loc7_;
            }
            else
            {
               this.CONTENT.BOUNDING_BOX._height = 627;
            }
            break;
         case this.CONTENT.NEWS:
            _loc9_ = this.mcScope.BLEETER._y + this.mcScope.BLEETER._height;
            _loc8_ = this.mcScope.newsArticleBG._y + this.mcScope.newsArticleBG._height;
            _loc7_ = Math.max(_loc9_,_loc8_) + 40;
            if(_loc7_ > 627)
            {
               this.CONTENT.BOUNDING_BOX._height = _loc7_;
            }
            else
            {
               this.CONTENT.BOUNDING_BOX._height = 627;
            }
      }
   }
   function UPDATE_TICKERTAPE(speed)
   {
      var _loc6_ = new String();
      var _loc3_ = " ";
      var _loc12_ = "<font color=\'#636363\'>";
      var _loc10_ = "<font color=\'#008100\'>";
      var _loc11_ = "<font color=\'#BB0000\'>";
      var _loc7_ = "<\font>";
      var _loc13_ = "   ";
      var _loc2_ = 0;
      while(_loc2_ < this.dataProviderUI.length)
      {
         if(this.dataProviderUI[_loc2_][0] != undefined)
         {
            var _loc8_ = this.dataProviderUI[_loc2_][3];
            var _loc9_ = this.dataProviderUI[_loc2_][0];
            var _loc4_ = this.dataProviderUI[_loc2_][1];
            var _loc5_ = this.dataProviderUI[_loc2_][2];
            _loc6_ = _loc6_ + (_loc13_ + _loc3_ + _loc12_ + _loc8_ + _loc3_ + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(_loc9_,2) + _loc7_ + _loc3_);
            if(_loc4_ < 0)
            {
               _loc6_ = _loc6_ + (_loc11_ + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(Math.abs(_loc4_),2) + "<img src=\'down_arrow\' height=\'14\' width=\'14\'>" + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(Math.abs(_loc5_),2) + "%" + _loc7_ + _loc3_);
            }
            else
            {
               _loc6_ = _loc6_ + (_loc10_ + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(Math.abs(_loc4_),2) + "<img src=\'up_arrow\' height=\'14\' width=\'14\'>" + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(Math.abs(_loc5_),2) + "%" + _loc7_ + _loc3_);
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      this.CONTENT.TICKER_STOCK.SET_TICKER_TEXT(speed,_loc6_);
   }
   function CLEANUP()
   {
      if(this.TXDarray.length > 0)
      {
         var _loc2_ = 0;
         while(_loc2_ < this.TXDarray.length)
         {
            if(this.TXDarray[_loc2_] != undefined)
            {
               var _loc3_ = this.mcScope[this.TXDarray[_loc2_][1]];
               if(_loc3_ != undefined)
               {
                  _loc3_.REMOVE_THUMBNAIL();
                  _loc3_.removeMovieClip();
               }
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      this.TXDarray = new Array();
      return true;
   }
}
