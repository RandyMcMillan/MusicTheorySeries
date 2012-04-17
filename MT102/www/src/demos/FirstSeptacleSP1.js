demos.FirstSeptacleSP1 = new Ext.Panel({
									 
									 
									 layout: {
									 type: 'vbox',
									 pack: 'center',
									 align: 'center',
									 },
									 scroll: 'vertical',
									 
									 items: [
											 
											 
											 
											 {
											 html: '<img class="circleOfFifths" src="resources/scaleSVGs/FirstSeptacleSP1.svg" 	left="0" top="0"/><div class="solfege">Do • Re • Me • Fa • Sol • La • Te • Do</div>'
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
																						 PhoneGap.exec("ChildBrowserCommand.showWebPage", "http://m.youtube.com/#/watch?v=NoNbhcmzXL4" ),
																						 
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