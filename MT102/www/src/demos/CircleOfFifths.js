demos.CircleOfFifths = new Ext.Panel({
							 
							 
							 layout: {
							 type: 'vbox',
							 pack: 'center',
							 align: 'center',
							 },
						     scroll: 'vertical',
							 
							 items: [
									 {
									 html: '<img class="circleOfFifths" src="resources/scaleSVGs/CircleOfFifths.svg"left="0" top="0" /><div class="solfege">Do • Sol • Re • La • Mi • Ti • Fi • Di/Ra • Si/Le • Ri/Me • Li/Te • Fa • Do </div>'
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
																			  text: 'Interactive',
																			  handler: function() {
																			  if (!this.popup) {
																			 	PhoneGap.exec("ChildBrowserCommand.showWebPage", "http://randscullard.com/CircleOfFifths/" ),

																			  }
																			  this.popup.show('pop');
																			  }



																			  },
																			
																			


																					  {
																					  xtype: 'button',
																					  floating: false,
																					  text: 'Wikipedia.com',
																					  handler: function() {
																					  if (!this.popup) {
																					 	PhoneGap.exec("ChildBrowserCommand.showWebPage", "http://en.m.wikipedia.org/wiki/Circle_of_fifths" ),

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
																						 	PhoneGap.exec("ChildBrowserCommand.showWebPage", "http://m.youtube.com/#/watch?xl=xl_blazer&v=XPXW7KNSMHw" ),

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
								
								
								
