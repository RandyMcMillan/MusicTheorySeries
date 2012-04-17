Ext.ns('sink', 'demos', 'Ext.ux');

Ext.ux.UniversalUI = Ext.extend(Ext.Panel, {
								fullscreen: true,
								layout: 'card',
								items: [{
										cls: 'launchscreen',
										html: '<div><img src="resources/img/sencha.png" width="210" height="210" /><h1>Welcome to Music Theory 102</h1><p>This is a comprehensive collection of our examples in an <br /> easy-to-navigate format. Each sample has a “view source” button which dynamically displays its associated code.<br /><br /><span>Sencha Touch (' + Ext.version +')</span></p></div>'
										
										}],
								backText: 'Back',
								useTitleAsBackText: true,
								initComponent : function() {
								this.navigationButton = new Ext.Button({
																	   hidden: Ext.is.Phone || Ext.orientation == 'landscape',
																	   text: 'Navigation',
																	   handler: this.onNavButtonTap,
																	   scope: this
																	   });
								
								this.backButton = new Ext.Button({
																 text: this.backText,
																 ui: 'back',
																 handler: this.onUiBack,
																 hidden: true,
																 scope: this
																 });
								
								
								
								this.supportButton = new Ext.Button({
																	text: '?',
																	ui: 'info',
																	handler: this.onSupportButton,
																	hidden: false,
																	scope: this
																	});
								
								
								this.youtubeButton = new Ext.Button({
																	text: 'YouTube',
																	ui: 'info',
																	handler: this.onYouTubeButton,
																	hidden: false,
																	scope: this
																	});
								
								this.accidentalCalculator = new Ext.Button({
																		   text: 'Accidental',
																		   ui: 'info',
																		   handler: this.onAccidentalCalculator,
																		   hidden: false,
																		   scope: this
																		   });
								
								this.intervalCalculator = new Ext.Button({
																		 text: 'Interval',
																		 ui: 'info',
																		 handler: this.onIntervalCalculator,
																		 hidden: false,
																		 scope: this
																		 });
								
								this.chordCalculator = new Ext.Button({
																	  text: 'Chord',
																	  ui: 'info',
																	  handler: this.onChordCalculator,
																	  hidden: false,
																	  scope: this
																	  });
								
								this.tempoTapper = new Ext.Button({
																  text: 'Tap',
																  ui: 'info',
																  handler: this.onTempoTapper,
																  hidden: true,
																  scope: this
																  });
								
								this.analysisCalculator = new Ext.Button({
																		 text: 'π',
																		 ui: 'info',
																		 handler: this.onAnalysisCalculator,
																		 hidden: false,
																		 scope: this
																		 });
								
								this.matrixCalculator = new Ext.Button({
																	   text: '¥',
																	   ui: 'info',
																	   handler: this.onMatrixCalculator,
																	   hidden: false,
																	   scope: this
																	   });
								
								
								
								
								
								
								var btns = [this.navigationButton];
								if (Ext.is.Phone) {
								
								//btns.unshift(this.analysisCalculator);
								//btns.unshift(this.matrixCalculator);
								btns.unshift(this.accidentalCalculator);
								//btns.unshift(this.intervalCalculator);
								btns.unshift(this.chordCalculator);
								//btns.unshift({xtype: 'spacer'});
								btns.unshift({xtype: 'spacer'});
								btns.unshift({xtype: 'spacer'});
								btns.unshift(this.tempoTapper);
								btns.unshift(this.youtubeButton);
								btns.unshift(this.supportButton);
								btns.unshift(this.backButton);
								
								}
								
								else {
								
								btns.unshift(this.analysisCalculator);
								btns.unshift(this.matrixCalculator);
								btns.unshift(this.accidentalCalculator);
								btns.unshift(this.intervalCalculator);
								btns.unshift({xtype: 'spacer'});
								btns.unshift({xtype: 'spacer'});
								btns.unshift(this.chordCalculator);
								btns.unshift(this.tempoTapper);
								//btns.unshift({xtype: 'spacer'});
								btns.unshift(this.youtubeButton);
								btns.unshift(this.supportButton);
								
								}
								
								this.navigationBar = new Ext.Toolbar({
																	 ui: 'dark',
																	 dock: 'top',
																	 title: this.title,
																	 items: btns.concat(this.buttons || [])
																	 });
								
								this.navigationPanel = new Ext.NestedList({
																		  store: sink.StructureStore,
																		  useToolbar: Ext.is.Phone ? false : true,
																		  updateTitleText: false,
																		  dock: 'left',
																		  hidden: !Ext.is.Phone && Ext.orientation == 'portrait',
																		  toolbar: Ext.is.Phone ? this.navigationBar : null,
																		  listeners: {
																		  itemtap: this.onNavPanelItemTap,
																		  scope: this
																		  }
																		  });
								
								this.navigationPanel.on('back', this.onNavBack, this);
								
								if (!Ext.is.Phone) {
								this.navigationPanel.setWidth(250);
								}
								
								this.dockedItems = this.dockedItems || [];
								this.dockedItems.unshift(this.navigationBar);
								
								if (!Ext.is.Phone && Ext.orientation == 'landscape') {
								this.dockedItems.unshift(this.navigationPanel);
								}
								else if (Ext.is.Phone) {
								this.items = this.items || [];
								this.items.unshift(this.navigationPanel);
								}
								
								this.addEvents('navigate');
								
								Ext.ux.UniversalUI.superclass.initComponent.call(this);
								},
								
								toggleUiBackButton: function() {
								var navPnl = this.navigationPanel;
								
								if (Ext.is.Phone) {
								if (this.getActiveItem() === navPnl) {
								
								var currList      = navPnl.getActiveItem(),
								currIdx       = navPnl.items.indexOf(currList),
								recordNode    = currList.recordNode,
								title         = navPnl.renderTitleText(recordNode),
								parentNode    = recordNode ? recordNode.parentNode : null,
								backTxt       = (parentNode && !parentNode.isRoot) ? navPnl.renderTitleText(parentNode) : this.title || '';
								
								
								if (currIdx <= 0) {
								this.navigationBar.setTitle(this.title || '');
								this.backButton.hide();
								this.supportButton.show();
								this.youtubeButton.show();
								
								} else {
								this.navigationBar.setTitle(title);
								if (this.useTitleAsBackText) {
								this.backButton.setText(backTxt);
								this.youtubeButton.hide();
								this.accidentalCalculator.hide();

								}
								
								this.backButton.show();
								this.supportButton.hide();
								this.youtubeButton.hide();
								this.accidentalCalculator.hide();

								}
								// on a demo
								} else {
								var activeItem = navPnl.getActiveItem(),
								recordNode = activeItem.recordNode,
								backTxt    = (recordNode && !recordNode.isRoot) ? navPnl.renderTitleText(recordNode) : this.title || '';
								
								if (this.useTitleAsBackText) {
								this.backButton.setText(backTxt);
								}
								this.backButton.show();
								this.youtubeButton.hide();
								this.accidentalCalculator.hide();

								}
								this.navigationBar.doLayout();
								}
								
								},
								
								onUiBack: function() {
								
								
								var navPnl = this.navigationPanel;
								
								// if we already in the nested list
								if (this.getActiveItem() === navPnl) {
								navPnl.onBackTap();
								// we were on a demo, slide back into
								// navigation
								} else {
								this.setCard(navPnl, {
											 type: 'slide',
											 reverse: true
											 });
								}
								this.toggleUiBackButton();
								this.fireEvent('navigate', this, {});
								},
								
								
								onSupportButton: function() {
								
								///window.plugins.iAdPlugin.showAd(true);
								
								PhoneGap.exec("ChildBrowserCommand.showWebPage", "http://mt101app.com" );
								},
								
								onYouTubeButton: function() {
								///window.plugins.iAdPlugin.showAd(true);
								
								PhoneGap.exec("ChildBrowserCommand.showWebPage", "http://m.youtube.com/#/results?desktop_uri=http%3A%2F%2Fwww.youtube.com%2Fresults%3Fsearch_query%3Dmt101app%26aq%3Df&aq=f&search_query=mt101app&gl=US" );
								},
								
								
								
								onAccidentalCalculator: function() {
								///window.plugins.iAdPlugin.showAd(true);
								
								PhoneGap.exec("ChildBrowserCommand.showWebPage", "http://www.musictheory.net/calculators/accidental" );
								},
								
								onIntervalCalculator: function() {
								///window.plugins.iAdPlugin.showAd(true);
								
								PhoneGap.exec("ChildBrowserCommand.showWebPage", "http://www.musictheory.net/calculators/interval" );
								},
								
								onChordCalculator: function() {
								///window.plugins.iAdPlugin.showAd(true);
								
								PhoneGap.exec("ChildBrowserCommand.showWebPage", "http://www.musictheory.net/calculators/chord" );
								},
								
								onAnalysisCalculator: function() {
								///window.plugins.iAdPlugin.showAd(true);
								
								PhoneGap.exec("ChildBrowserCommand.showWebPage", "http://www.musictheory.net/calculators/analysis" );
								},
								
								
								onMatrixCalculator: function() {
								///window.plugins.iAdPlugin.showAd(true);
								
								PhoneGap.exec("ChildBrowserCommand.showWebPage", "http://www.musictheory.net/calculators/matrix" );
								},
								
								onTempoTapper: function() {
								///window.plugins.iAdPlugin.showAd(true);
								
								PhoneGap.exec("ChildBrowserCommand.showWebPage", "http://www.musictheory.net/tools/tapper");
								},							
								
								
								
								
								
								onNavPanelItemTap: function(subList, subIdx, el, e) {
								
								///window.plugins.iAdPlugin.showAd(false);
								
								
								
								var store      = subList.getStore(),
								record     = store.getAt(subIdx),
								recordNode = record.node,
								nestedList = this.navigationPanel,
								title      = nestedList.renderTitleText(recordNode),
								card, preventHide, anim;
								
								if (record) {
								card        = record.get('card');
								anim        = record.get('animation');
								preventHide = record.get('preventHide');
								}
								
								if (Ext.orientation == 'portrait' && !Ext.is.Phone && !recordNode.childNodes.length && !preventHide) {
								this.navigationPanel.hide();
								}
								
								if (card) {
								this.setCard(card, anim || 'slide');
								this.currentCard = card;
								}
								
								if (title) {
								this.navigationBar.setTitle(title);
								}
								this.toggleUiBackButton();
								this.fireEvent('navigate', this, record);
								},
								
								onNavButtonTap : function() {
								this.navigationPanel.showBy(this.navigationButton, 'fade');
								},
								
								layoutOrientation : function(orientation, w, h) {
								if (!Ext.is.Phone) {
								if (orientation == 'portrait') {
								this.navigationPanel.hide(false);
								this.removeDocked(this.navigationPanel, false);
								if (this.navigationPanel.rendered) {
								this.navigationPanel.el.appendTo(document.body);
								}
								this.navigationPanel.setFloating(true);
								this.navigationPanel.setHeight(400);
								this.navigationButton.show(false);
								}
								else {
								this.navigationPanel.setFloating(false);
								this.navigationPanel.show(false);
								this.navigationButton.hide(false);
								this.insertDocked(0, this.navigationPanel);
								}
								this.navigationBar.doComponentLayout();
								}
								
								Ext.ux.UniversalUI.superclass.layoutOrientation.call(this, orientation, w, h);
								}
								});

sink.Main = {
    init : function() {
        this.sourceButton = new Ext.Button({
										   text: 'Wiki',
										   ui: 'action',
										   hidden: true,
										   handler: this.onSourceButtonTap,
										   scope: this
										   });
		
        this.codeBox = new Ext.ux.CodeBox({scroll: false});
		
        var sourceConfig = {
		items: [this.codeBox],
		scroll: 'both'
        };
		
        if (!Ext.is.Phone) {
            Ext.apply(sourceConfig, {
					  width: 500,
					  height: 500,
					  floating: true
					  });
        }
		
        this.sourcePanel = new Ext.Panel(sourceConfig);
		
        this.ui = new Ext.ux.UniversalUI({
										 title: Ext.is.Phone ? 'MT102' : 'MT102',
										 useTitleAsBackText: false,
										 navigationItems: sink.Structure,
										 //buttons: [{xtype: 'spacer'}, this.sourceButton],
										 listeners: {
										 navigate : this.onNavigate,
										 scope: this
										 }
										 });
    },
	
	
		//Create logic to hide supportButton on navigate...
	onNavigate : function() {/*Leave in Code*/},
	
	
	/* Original CodeBox code Ripped out to create logic to hide suppportButton 
	 onNavigate : function(ui, record) {
	 if (record.data && record.data.source) {
	 var source = record.get('source');
	 if (this.sourceButton.hidden) {
	 this.sourceButton.hidden();
	 ui.navigationBar.doComponentLayout();
	 }
	 
	 Ext.Ajax.request({
	 url: source,
	 success: function(response) {
	 this.codeBox.update((response.responseText));                   
	 },
	 scope: this
	 });
	 }
	 else {
	 this.codeBox.setValue('Please connect to the internet.');
	 this.sourceButton.hide();
	 this.sourceActive = false;
	 this.sourceButton.setText('Wiki');
	 ui.navigationBar.doComponentLayout();
	 }
	 },
	 
	 Original CodeBox code Ripped out to create logig to hide suppportButton  */
	
	
    onSourceButtonTap : function() {
        if (!Ext.is.Phone) {
            this.sourcePanel.showBy(this.sourceButton.el, 'fade');
        }
        else {
            if (this.sourceActive) {
                this.ui.setCard(this.ui.currentCard, Ext.is.Android ? false : 'flip');
                this.sourceActive = false;
                this.ui.navigationBar.setTitle(this.currentTitle);
                this.sourceButton.setText('Wiki');
            }
            else {
                this.ui.setCard(this.sourcePanel, Ext.is.Android ? false : 'flip');
                this.sourceActive = true;
                this.currentTitle = this.ui.navigationBar.title;
                this.ui.navigationBar.setTitle('Wiki');
                this.sourceButton.setText('Content');
            }
            this.ui.navigationBar.doLayout();
        }
        this.sourcePanel.scroller.scrollTo({x: 0, y: 0});
    }
};


Ext.setup({
		  
		  onReady: function() {
		  sink.Main.init();
		  }
		  });