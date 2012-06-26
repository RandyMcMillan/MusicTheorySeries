/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */


//Define Root url that will be used throughout app
//Add  #import "Constants.h" to each .m file as needed 

#define kRootUrl    @"http://wpcordovaios.dev/"
#define kContactUrl @"http://wpcordovaios.dev/contact/"
#define kSample1Url @"http://wpcordovaios.dev/sample-1/"
#define kSample2Url @"http://wpcordovaios.dev/sample-2/"
#define kSample3Url @"http://wpcordovaios.dev/sample-3/"


#define kStartPage1 @"page1.html"
#define kStartPage2 @"page2.html"
//#define kStartPage3 @"page3.html"
//#define kStartPage4 @"page4.html"

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define TOOLBAR_COLOR [UIColor colorWithRed:0.608 green:0.608 blue:0.635 alpha:1.000]  
#define BKGRNDCOLOR [UIColor colorWithRed:0.894 green:0.890 blue:0.918 alpha:1.000]

#define BARBUTTON(TITLE, SELECTOR)  [[UIBarButtonItem alloc] initWithTitle : TITLE style : UIBarButtonItemStylePlain target : self action : SELECTOR]
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define  NUMBEROFSECTIONS 15