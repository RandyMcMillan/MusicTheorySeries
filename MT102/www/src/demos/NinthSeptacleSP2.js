demos.NinthSeptacleSP2 = new Ext.Panel({
									 
									 
									 layout: {
									 type: 'vbox',
									 pack: 'center',
									 align: 'center',
									 },
									 scroll: 'vertical',
									 
									 items: [
											 
											 
											 
											 {
											 html: '<img class="circleOfFifths" src="resources/scaleSVGs/NinthSeptacleSP2.svg" 	left="0" top="0"/><div class="solfege">Do • Ti • Te • Mi • Le • Re • Ra • Do</div>'
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
																						 text: 'YouTube',
																						 handler: function() {
																						 if (!this.popup) {
																						 PhoneGap.exec("ChildBrowserCommand.showWebPage", "http://m.youtube.com/#/watch?v=_5-SfeUA9OY" ),
																						 
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