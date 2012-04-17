MediaBrowser allows the developer to add content to the [iOS Device]/![Apps](https://github.com/RandyMcMillan/MediaBrowser/raw/master/assets/jpg/app-store-icon.jpg)/AppName/AppName.app/ folder   and display it in the "ChildBrowser". This plugin can be used along side ChildBrowser (iOS) plugin for Cordova/PhoneGap and inherits the functionality that you are familiar with. The functionality of this plugin may not be available across other PhoneGap/Cordova supported platforms. 

This code is completely dependent on the [Apache Cordova](https://github.com/apache/incubator-cordova-ios) (a.k.a [PhoneGap](http://phonegap.com/)) project, hosted on [GitHub](https://github.com/).


The MIT License

Copyright (c) 2010 Jesse MacFadyen

Copyright (c) 2012 Randy McMillan

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Sample use:

<html>

function onDeviceReady() {

if (window.innerHeight > "480")

{

var loc = "local.iScrollDemo.iscroll";

} 

else

{

var loc = "local.ReadMe.html";

}

Cordova.exec("MediaBrowserCommand.showWebPage", loc);

}

<br></html>



Provides youtube shorthand syntax by calling:

                var loc = "youtube.E0UV5i5jY50";
                Cordova.exec("MediaBrowserCommand.showWebPage", loc);
                
This: youtube.E0UV5i5jY50

Gets transformed to this: http://m.youtube.com/watch?v=E0UV5i5jY50

And the string constant can be modified for preferred settings.


NSString * const kYOUTUBE_URL = @"http://m.youtube.com/watch?v=";



Provides wikipedia shorthand syntax by calling:

                var loc = "wiki.Staff_(music)";
                Cordova.exec("MediaBrowserCommand.showWebPage", loc);
                
This: wiki.Staff_(music)

Gets transformed to this: http://en.m.wikipedia.org/wiki/Staff_(music)


NSString * const kWIKI_URL = @"http://en.m.wikipedia.org/wiki/";



![image](https://github.com/RandyMcMillan/MediaBrowser/raw/master/assets/png/iPadAlert.png)


The content is bundled in the native file system located in the [iOS Device]/![Apps](https://github.com/RandyMcMillan/MediaBrowser/raw/master/assets/jpg/app-store-icon.jpg)[/AppName/AppName.app/ folder](https://github.com/RandyMcMillan/MediaBrowser/raw/master/assets/png/FileSystem.png).

The html is displayed in the webview like any other web content. The possibilies are endless.

Bundle Javascript libraries to create rich local/hybrid content for the MediaBrowser.
Examples are bundled to demonstrate usage. Currently MediaBrowser comes with iScroll. The iScroll library can be injected into an html document and displayed. [Author your html document and add the prefix local. and suffix .iscroll](https://raw.github.com/RandyMcMillan/MediaBrowser/master/assets/html/local.iScrollDemo.iscroll) to trigger MediaBrowser to inject the [iScroll](https://raw.github.com/RandyMcMillan/MediaBrowser/master/iScrollLib.m) library into your html document before it gets displayed in the webView.


![image](https://github.com/RandyMcMillan/MediaBrowser/raw/master/assets/png/iPadHybrid.png)		

Handle different file types like .svg seperately. 

Create beautiful presentations with html/css/js and display them in the MediaBrowser.

![image](https://github.com/RandyMcMillan/MediaBrowser/raw/master/assets/png/VectorPresentation.png)


Control how linked images from the web get displayed in the webView.

[Link to original](http://upload.wikimedia.org/wikipedia/commons/2/29/FakeRealLogSprial.svg)

![image](https://github.com/RandyMcMillan/MediaBrowser/raw/61728c48deb47de795d5cc0bfea87ffe68bef41b/svgScreenShot.png)

