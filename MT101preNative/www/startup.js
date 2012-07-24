/**
 * TODO
 * 
 * author SNM
 * 
 * License MIT
 */

/**
* Currently supports the hiding of the start screen (and showing the web view) through javascript call.
* @constructor
*/
function Startup() {
}

/**
* Hide load indicator
*/
Startup.prototype.hideLoadIndicator = function() {
    PhoneGap.exec("Startup.hideActivityView");
};

/**
* Hide startup screen and bring web view to front.
*/
Startup.prototype.hideStartupScreen = function() {
    PhoneGap.exec("Startup.hideImageView");
    PhoneGap.exec("Startup.bringWebViewToFront");
};


PhoneGap.addConstructor(function()
{
	if(!window.plugins)
	{
		window.plugins = {};
	}
    window.plugins.startup = new Startup();
});

