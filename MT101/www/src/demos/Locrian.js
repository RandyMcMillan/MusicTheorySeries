(function() {
 

 
 var tapHandler = function(button, event) { var txt = "User tapped the '" + button.text + "' button."; Ext.getCmp('GrandStaff').body.dom.innerHTML = txt; };
 
 var onContact = function(button, event) {
 if (!Ext.is.Desktop) {
 Cordova.exec("ChildBrowserCommand.showWebPage", "http://randymcmillan.net/contactme" ); } 
 else {
 if (!this.popup) {
 this.popup = new Ext.Panel({html:''});
 this.popup = new Ext.Panel({
                            floating: true,
                            modal: true,
                            centered: true,
                            width: wikiPanelWidth,
                            height: wikiPanelHeight,
                            scroll:'verticle',
                            styleHtmlContent: true,
                            html: '<p><iframe frameborder="0" SRC="http://randymcmillan.net/contactme" width=" ' + wikiWidth + ' " height=" ' + wikiHeight + ' "></iframe></p>',
                            //dockedItems: [{
                            //            dock: 'top',
                            //          xtype: 'toolbar',
                            //        title: 'Overlay Title'
                            //      }],
                            //scroll: 'vertical'
                            });
 }
 this.popup.show('pop');  
 }
 };
 
 var onYouTube = function(button, event) {
 youTubeString = "obx2VOtx0qU";
 if (!Ext.is.Desktop) {
 Cordova.exec("ChildBrowserCommand.showWebPage", "http://m.youtube.com/index?desktop_uri=%2F&gl=US#/watch?v=" + youTubeString );
 }
 else {
 if (!this.popup) {
 this.popup = new Ext.Panel({html:''});
 this.popup = new Ext.Panel({
                            floating: true,
                            modal: true,
                            centered: true,
                            width: youTubePanelWidth,
                            height: youTubePanelHeight,
                            styleHtmlContent: true,
                            html: '<p><object frameborder="no" width="100%" height="100%"><param name="movie" value="https://www.youtube.com/v/obx2VOtx0qU?version=3&amp;hl=en_US&amp;rel=0"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="https://www.youtube.com/v/obx2VOtx0qU?version=3&amp;hl=en_US&amp;rel=0&autoplay=1&hd=1%loop=1&autohide=0&key=AI39si5uWLRT16JtcIQCTvmSvpUmTzJxqCsceL6s4_LQj0FsJXSydWB0ccFWz7fddh5hJuF3zUcI7F_gu27ds9HHoisswEKuQA" type="application/x-shockwave-flash" width="425" height="349" allowscriptaccess="never" allowfullscreen="true"></embed></object></p>',
                            //dockedItems: [{
                            //            dock: 'top',
                            //          xtype: 'toolbar',
                            //        title: 'Overlay Title'
                            //      }],
                            scroll: 'vertical'
                            });
 }
 this.popup.show('pop');  
 }
 };
 
 var onWiki = function(button, event) {
 wikiString = "Locrian_mode";
 if (!Ext.is.Desktop) {
 Cordova.exec("ChildBrowserCommand.showWebPage", "http://en.m.wikipedia.org/wiki?search=" + wikiString );
 }
 else {
 if (!this.popup) {
 this.popup = new Ext.Panel({html:''});
 this.popup = new Ext.Panel({
                            floating: true,
                            modal: true,
                            centered: true,
                            width: wikiPanelWidth,
                            height: wikiPanelHeight,
                            scroll:'verticle',
                            //cls:'Wiki',
                            styleHtmlContent: true,
                            html: '<p><iframe frameborder="0" SRC="http://en.wikipedia.org/wiki/' + wikiString + '" width="'+ wikiWidth +'" height="'+ wikiHeight +'"></iframe></p>',
                            //dockedItems: [{
                            //            dock: 'top',
                            //          xtype: 'toolbar',
                            //        title: 'Overlay Title'
                            //      }],
                            //scroll: 'vertical'
                            });
 }
 this.popup.show('pop');  
 }
 };
 
 var onSolfege = function(button, event) {
 if (!Ext.is.Phone) {
 if (!this.popup) {
 this.popup = new Ext.Panel({html:''});
 this.popup = new Ext.Panel({
                            floating: true,
                            modal: true,
                            centered: true,
                            width: window.innerWidth - 300,
                            styleHtmlContent: true,
                            html: '<p><center>'+ti+dot+doe+dot+re+dot+mi+dot+fa+dot+sol+dot+la+dot+ti+'</center></br><center>'+message3+'</center></br><center>'+ti+dot+la+dot+sol+dot+fa+dot+mi+dot+re+dot+doe+dot+ti+'</center></p>',
                            //dockedItems: [{
                            //            dock: 'top',
                            //          xtype: 'toolbar',
                            //        title: 'Overlay Title'
                            //      }],
                            scroll: 'vertical'
                            });
 }
 this.popup.show('pop');
 } 
 else { 
 if (!this.popup) {
 this.popup = new Ext.Panel({html:''});
 this.popup = new Ext.Panel({
                            floating: true,
                            modal: true,
                            centered: true,
                            width: window.innerWidth - 20,
                            styleHtmlContent: true,
                            html: '<p><center>'+ti+dot+doe+dot+re+dot+mi+dot+fa+dot+sol+dot+la+dot+ti+'</center></br><center>'+message3+'</center></br><center>'+ti+dot+la+dot+sol+dot+fa+dot+mi+dot+re+dot+doe+dot+ti+'</center></p>',
                            //dockedItems: [{
                            //            dock: 'top',
                            //          xtype: 'toolbar',
                            //        title: 'Overlay Title'
                            //      }],
                            scroll: 'vertical'
                            });
 }
 this.popup.show('pop');
 }
 };
 
 var onInteractive = function(button, event) {
 if (!Ext.is.Desktop) {
 Cordova.exec("ChildBrowserCommand.showWebPage", "http://www.musictheory.net/calculators/accidental/" );
 }       
 else {
 if (!this.popup) {
 this.popup = new Ext.Panel({html:''});
 this.popup = new Ext.Panel({
                            floating: true,
                            modal: true,
                            centered: true,
                            width: 768,
                            height: 560,
                            styleHtmlContent: true,
                            html: '<p><iframe frameborder="1" SRC="http://www.musictheory.net/calculators/accidental/"  width="730" height="530"></iframe></p>',
                            //dockedItems: [{
                            //            dock: 'top',
                            //          xtype: 'toolbar',
                            //        title: 'Overlay Title'
                            //      }],
                            //scroll: 'vertical'
                            });
 }
 this.popup.show('pop');  
 }
 };
 
 
 var buttonsGroup1 = [{
                      text: 'Contact',
                      ui: 'action',
                      hidden: true,
                      handler: onContact,allowDepress: false,
                      }, {
                      text: 'Default',
                      hidden: true,
                      badgeText: '2',
                      handler: tapHandler
                      }, {
                      text: 'Round',
                      hidden: true,
                      ui: 'round',
                      handler: tapHandler
                      }];
 
 var buttonsGroup2 = [{
                      xtype: 'segmentedbutton',
                      items: [{
                              text: 'Wiki',
                              handler: onWiki,allowDepress: false,
                              },{
                              text: 'YouTube',
                              hidden:false,
                              handler: onYouTube,allowDepress: false,
                              },{
                              text: 'Solfege',
                              handler: onSolfege,allowDepress: false,
                              },
                              {
                              text: 'Interactive',
                              handler: onInteractive
                              }]
                      }];
 
 var buttonsGroup3 = [{
                      text: 'Action',
                      hidden: true,
                      ui: 'action',
                      handler: tapHandler
                      }, {
                      text: 'Forward',
                      hidden: true,
                      ui: 'forward',
                      handler: tapHandler
                      }];
 
 if (!Ext.is.Phone) {
 buttonsGroup1.push({xtype: 'spacer'});
 buttonsGroup2.push({xtype: 'spacer'});
 
 var dockedItems = [new Ext.Toolbar({
                                    ui: 'light',
                                    dock: 'bottom',
                                    items: buttonsGroup1.concat(buttonsGroup2).concat(buttonsGroup3)
                                    })];
 }
 else {
 
 var dockedItems = [new Ext.Toolbar({
                                    ui: 'light',
                                    dock: 'bottom',
                                    items: buttonsGroup1.concat(buttonsGroup2).concat(buttonsGroup3)
                                    })];/* var dockedItems = [{
                                         xtype: 'toolbar',
                                         ui: 'light',
                                         items: buttonsGroup1,
                                         dock: 'bottom'
                                         }, {
                                         xtype: 'toolbar',
                                         ui: 'dark',
                                         items: buttonsGroup2,
                                         dock: 'bottom'
                                         }, {
                                         xtype: 'toolbar',
                                         ui: 'light',
                                         items: buttonsGroup3,
                                         dock: 'bottom'
                                         }];
                                         */
 }
  
  demos.Locrian = new Ext.Panel({
      id:'Locrian',

								   cls: 'card card1',
								   scroll: '',
								   html: '<p><img class="example" src="resources/scaleSVGs/Locrian.svg" left="0" top="0"/></p>',
								   dockedItems: dockedItems
								   });
  })();
  
