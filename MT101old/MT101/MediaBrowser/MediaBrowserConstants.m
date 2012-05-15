//
//  MediaBrowserConstants.m
//  mb3
//
//  Created by Randy McMillan on 3/16/12.
//  Copyright (c) 2012 OpenOSX.org. All rights reserved.
//

#import "MediaBrowserConstants.h"

@implementation MediaBrowserConstants

///Remove line breaks/returns to use as one constant string!

NSString * const kJSLIB_ALERT = @"<script type='text/javascript'>function onBodyLoad(){alert('Alert called from MediaBrowserConstants.m on your '+navigator.platform);}</script>";
NSString * const kVANILLA_HOME_PAGE = @"local.vanillaHomePage.html";

/* 

Setting up for custom var loc = youtube.videoid; ie youtube.E0UV5i5jY50

*/

/*

///another way to call your youtube video other than below

var loc = "http://o-o.preferred.atl14s01.v24.lscache1.c.youtube.com/videoplayback?el=watch&begin=0&yms=w74Hvrs1dlk&dnc=1&itag=18&ip=72.0.0.0&app=youtube_mobile&signature=6101C15438D118869F6F34D6F7DAE28BE1005372.3437322AB7CAEE9DF6FCA91B0203F01CC31551FA&sparams=begin%2Ccp%2Cid%2Cip%2Cipbits%2Citag%2Clen%2Cratebypass%2Csource%2Cexpire&len=202000&ratebypass=yes&source=youtube&expire=1332120251&sver=3&key=yt1&ipbits=8&cp=U0hSR1FNTl9KS0NOMl9JR1JDOnQ2NUd0b3E5Ym1o&id=134515e62e63639d";
Cordova.exec("MediaBrowserCommand.showWebPage", loc);

*/

//Add you own variables here!
NSString * const kYOUTUBE_URL = @"http://m.youtube.com/watch?v=";
NSString * const kWIKI_URL = @"http://en.m.wikipedia.org/wiki/";

@end


