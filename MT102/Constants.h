//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//
//



#define BARBUTTON(TITLE, SELECTOR) [[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR]
#define MINIMUM_SCALE 1.0f
#define MAXIMUM_SCALE 4.0f
#define ZOOM_STEP 1.5

#define kLeftMargin                 20.0
#define kTopMargin                  20.0
#define kRightMargin                20.0
#define kTweenMargin                6.0

#define kTextFieldHeight            30.0

#define KEY_COUNT                   44

#define VIEWBOUNDS                  [[UIScreen mainScreen] bounds]

#ifndef IS_IPAD
  #define IS_IPAD                   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#endif

#define BIGBOXWIDTH                 90
#define BIGBOXHEIGHT                90
#define SMALLBOXWIDTH               50
#define SMALLBOXHEIGHT              50

#define NOTEWIDTH                   25
#define NOTEHEIGHT                  50

#define WELCOMEWIDTH                512
#define WELCOMEHEIGHT               512

#define IPHONEWELCOMEWIDTH          128
#define IPHONEWELCOMEHEIGHT         128

#define GRANDSTAFFEXAMPLEWIDTH      703
#define GRANDSTAFFEXAMPLEHEIGHT     768

#define CIRCLEWIDTH                 725
#define CIRCLEHEIGHT                725

#ifndef kXOrientationAdjustiPad
  #define kXOrientationAdjustiPad   0
#endif

#ifndef kYOrientationAdjustiPad
  #define kYOrientationAdjustiPad 0
#endif

#ifndef kXOrientationAdjustiPhone
  #define kXOrientationAdjustiPhone 0
#endif

#ifndef kYOrientationAdjustiPhone
  #define kYOrientationAdjustiPhone 0
#endif

#define TWITTER_URL                 @ "http://api.twitter.com/1/"
