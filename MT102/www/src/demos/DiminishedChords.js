demos.DiminishedChords = new Ext.Panel({
							 
							 
							 layout: {
							 type: 'vbox',
							 pack: 'center',
							 align: 'center',
							 },
						     scroll: 'vertical',
							 
							 items: [
									 {
									 html: '<img class="circleOfFifths" src="resources/scaleSVGs/DiminishedChords.svg"left="0" top="0" /><div class="solfege">Do • La • Se • Me • Do &#166; Sol • Mi • Ra • Te • Sol &#166;</br> Re • Ti • Le • Fa • Re</div>'
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
																					  if (!this.popup) {
																					 	PhoneGap.exec("ChildBrowserCommand.showWebPage", "http://en.m.wikipedia.org/wiki/Augmented_triad" ),

																					  }
																					  this.popup.show('pop');
																					  }



																					  },								   


																						  {
																						  xtype: 'button',
																						  floating: false,
																						  text: 'YouTube',
																						  handler: function() {
																						  if (!this.popup) {
																						 	PhoneGap.exec("ChildBrowserCommand.showWebPage", "http://m.youtube.com/#/watch?xl=xl_blazer&v=MAeT3pTNjuI" ),

																						  }
																						  this.popup.show('pop');
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
								
								
								
