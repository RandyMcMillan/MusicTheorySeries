/* MIT licensed */
// (c) 2010 Jesse MacFadyen, Nitobi

/*global PhoneGap */

function MediaBrowser()
{
	// Does nothing
}
// Callback when the location of the page changes
// called from native
MediaBrowser._onLocationChange = function(newLoc)
{
	window.plugins.mediaBrowser.onLocationChange(newLoc);
};
// Callback when the user chooses the 'Done' button
// called from native
MediaBrowser._onClose = function()
{
	window.plugins.mediaBrowser.onClose();
};
// Callback when the user chooses the 'open in Safari' button
// called from native
MediaBrowser._onOpenExternal = function()
{
	window.plugins.mediaBrowser.onOpenExternal();
};
// Pages loaded into the ChildBrowser can execute callback scripts, so be careful to
// check location, and make sure it is a location you trust.
// Warning ... don't exec arbitrary code, it's risky and could fuck up your app.
// called from native
MediaBrowser._onJSCallback = function(js,loc)
{
	// Not Implemented
	//window.plugins.childBrowser.onJSCallback(js,loc);
};
/* The interface that you will use to access functionality */

// Show a webpage, will result in a callback to onLocationChange
MediaBrowser.prototype.showWebPage = function(loc)
{
	Cordova.exec("MediaBrowserCommand.showWebPage", loc);
};
// close the browser, will NOT result in close callback
MediaBrowser.prototype.close = function()
{
	Cordova.exec("MediaBrowserCommand.close");
};
// Not Implemented
MediaBrowser.prototype.jsExec = function(jsString)
{
// Not Implemented!!
//PhoneGap.exec("ChildBrowserCommand.jsExec",jsString);
};
// Note: this plugin does NOT install itself, call this method some time after deviceready to install it
// it will be returned, and also available globally from window.plugins.childBrowser
MediaBrowser.install = function()
{
	if(!window.plugins)
	{
		window.plugins = {
		};
	}
	window.plugins.mediaBrowser = new MediaBrowser();
	return window.plugins.mediaBrowser;
};
