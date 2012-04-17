demos.Pythagoras = new Ext.Panel({
								 
								  
								  layout: {
								  type: 'vbox',
								  pack: 'center',
								  align: 'center',
										   },
								 scroll: 'vertical',

								  items: [
										  
										 
										  
										  {  
										  html: '<img class="example" src="resources/scaleSVGs/Pythagoras.svg" left="0" top="0">',
										  },
											
												
								
								
											
											
											
											
												{
												        text: 'a &#178; + b &#178; = c &#178;',
													  	xtype: 'button',
													  	cls: 'demobtn',
														align: 'center',
														handler: function() {
												            if (!this.popup) {
												                this.popup = new Ext.Panel({
												                    floating: true,
												                    modal: true,
												                    centered: true,
												                    width: 295,
												                    height: 295,
												                    //styleHtmlContent: true,
												                    html:'<img class="pythgif" src="resources/img/Proof.gif"/>',
												                    scroll: 'vertical',
												                });
												            }
												            this.popup.show('pop');
												        }
												    },
										
											
											

											  {
											  text: 'More',
											  xtype: 'button',
											  cls: 'demobtn',
											  align: 'center',
											  handler: function() {
											  if (!this.actions) {
											  this.actions = new Ext.ActionSheet({
																				 items : [
																				
																				

																							  {
																							  xtype: 'button',
																							  floating: false,
																							  text: 'Wikipedia.com',
																							  handler: function() {
																							 	PhoneGap.exec("ChildBrowserCommand.showWebPage", "http://en.m.wikipedia.org/wiki/Pythagorus" ),
																							  }
																							  },								   

																						  { 
																						  text : 'Cancel',
																						  ui: 'action',
																						  scope : this,
																						  handler : function(){
																						  this.actions.hide();
																						  }
																						  }
																						  ]
																				 });
											  }
											  this.actions.show();
											  }
											  }, 






											  ]
									  });