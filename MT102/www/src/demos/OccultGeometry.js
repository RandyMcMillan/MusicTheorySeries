demos.OccultGeometry = new Ext.Panel({
								 
								  
								  layout: {
								  type: 'vbox',
								  pack: 'center',
								  align: 'center',
										   },
								 scroll: 'vertical',

								  items: [
										  
										 
										  
										  {
										  html: '<img class="circleOfFifths" src="resources/scaleSVGs/OccultGeometry.svg" 	left="0" top="0"/>'
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
																						 	PhoneGap.exec("ChildBrowserCommand.showWebPage", "http://en.wikipedia.org/wiki/Dodecagram" ),

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
																							 	PhoneGap.exec("ChildBrowserCommand.showWebPage", "http://m.youtube.com/index?desktop_uri=%2F&gl=US#/watch?xl=xl_blazer&v=obx2VOtx0qU" ),

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