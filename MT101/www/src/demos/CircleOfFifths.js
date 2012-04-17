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
 youTubeString = "XPXW7KNSMHw";
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
                            html: '<p><object frameborder="no" width="100%" height="100%"><param name="movie" value="https://www.youtube.com/v/obx2VOtx0qU?version=3&amp;hl=en_US&amp;rel=0"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="https://www.youtube.com/v/'+ youTubeString +'?version=3&amp;hl=en_US&amp;rel=0&autoplay=1&hd=1%loop=1&autohide=0&key=AI39si5uWLRT16JtcIQCTvmSvpUmTzJxqCsceL6s4_LQj0FsJXSydWB0ccFWz7fddh5hJuF3zUcI7F_gu27ds9HHoisswEKuQA" type="application/x-shockwave-flash" width="425" height="349" allowscriptaccess="never" allowfullscreen="true"></embed></object></p>',
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
 wikiString = 'Circle_of_fifths';
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
                            width: window.innerWidth - 180,
                            styleHtmlContent: true,
                            html: '<p><center><h2>Ascending</h2></center><center>'+doe+dot4+sol+dot4+re+dot4+la+dot4+mi+dot4+ti+dot4+fi+dot4+di+dot4+si+dot4+ri+dot4+li+dot4+fa+dot4+doe+'</center></br><hr/></br><center>'+doe+dot4+fa+dot4+te+dot4+me+dot4+le+dot4+ra+dot4+se+dot4+ti+dot4+mi+dot4+la+dot4+re+dot4+sol+dot4+doe+'</center><center><h2>Descending</h2></center></p>',
                            //dockedItems: [{
                            //            dock: 'top',
                            //          xtype: 'toolbar',
                            //        title: 'Overlay Title'
                            //      }],
                            scroll: 'horizontal'
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
                            scroll: 'horizontal',
                            centered: true,
                            width: window.innerWidth - 40,
                            height: window.innerHeight - 100,
                            styleHtmlContent: true,
                            html: '<p><center><span>Ascending</span></center><center>'+doe+dot4+sol+dot4+re+dot4+la+dot4+mi+dot4+ti+dot4+fi+dot4+di+dot4+si+dot4+ri+dot4+li+dot4+fa+dot4+doe+'</center></br><hr/></br><center>'+doe+dot2+fa+dot2+te+dot2+me+dot2+le+dot2+ra+dot2+se+dot2+ti+dot2+mi+dot2+la+dot2+re+dot2+sol+dot2+doe+'</center><center><span>Descending</span></center></p>',
                            //dockedItems: [{
                            //            dock: 'top',
                            //          xtype: 'toolbar',
                            //        title: 'Overlay Title'
                            //      }],
                            scroll: 'horizontal'
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
  
  if (!Ext.is.Phone) {
  
 demos.CircleOfFifths = new Ext.Panel({
                                      id: 'CircleOfFifths',
                                      draggable: false,
                                      cls: 'card card1',
                                      scroll:'',
                                      html: '<p><img class="circleOfFifths" src="resources/scaleSVGs/CircleOfFifths.svg" left="0" top="0"/></p>',
                                      dockedItems: dockedItems
                                      });
  } else {
  
  demos.CircleOfFifths = new Ext.Panel({
                                       id: 'CircleOfFifths',
                                       cls: 'card card1',
                                       scroll:'verticle',
                                       html: '<p><img class="circleOfFifths" src="resources/scaleSVGs/CircleOfFifths.svg" left="0" top="0"/></p>',
                                       dockedItems: dockedItems
                                       });
  }
  
  })();
