/*
 *     File: Constants.h
 *   Abstract: Common constants across source files (screen coordinate consts, etc.)
 *   Version: 2.10
 *
 *   Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple
 *   Inc. ("Apple") in consideration of your agreement to the following
 *   terms, and your use, installation, modification or redistribution of
 *   this Apple software constitutes acceptance of these terms.  If you do
 *   not agree with these terms, please do not use, install, modify or
 *   redistribute this Apple software.
 *
 *   In consideration of your agreement to abide by the following terms, and
 *   subject to these terms, Apple grants you a personal, non-exclusive
 *   license, under Apple's copyrights in this original Apple software (the
 *   "Apple Software"), to use, reproduce, modify and redistribute the Apple
 *   Software, with or without modifications, in source and/or binary forms;
 *   provided that if you redistribute the Apple Software in its entirety and
 *   without modifications, you must retain this notice and the following
 *   text and disclaimers in all such redistributions of the Apple Software.
 *   Neither the name, trademarks, service marks or logos of Apple Inc. may
 *   be used to endorse or promote products derived from the Apple Software
 *   without specific prior written permission from Apple.  Except as
 *   expressly stated in this notice, no other rights or licenses, express or
 *   implied, are granted by Apple herein, including but not limited to any
 *   patent rights that may be infringed by your derivative works or by other
 *   works in which the Apple Software may be incorporated.
 *
 *   The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
 *   MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 *   THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 *   FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 *   OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 *
 *   IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 *   OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 *   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 *   INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 *   MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 *   AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 *   STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 *   POSSIBILITY OF SUCH DAMAGE.
 *
 *   Copyright (C) 2011 Apple Inc. All Rights Reserved.
 *
 */

// these are the various screen placement constants used across most the
// UIViewControllers

// padding for margins

// for general screen
#define kLeftMargin					20.0
#define kTopMargin					20.0
#define kRightMargin				20.0
#define kTweenMargin				6.0

#define kTextFieldHeight			30.0

#define KEY_COUNT					26

#define VIEWBOUNDS					[[UIScreen mainScreen] bounds]

#ifndef IS_IPAD
  #define IS_IPAD					(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#endif

#define BIGBOXWIDTH					90
#define BIGBOXHEIGHT				90
#define SMALLBOXWIDTH				50
#define SMALLBOXHEIGHT				50

#ifndef kXOrientationAdjustiPad
  #define kXOrientationAdjustiPad	0
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

#define DO							[UIColor colorWithRed : 1.000 green : 1.000 blue : 0.043 \
		alpha : 1.000]
#define DI							[UIColor colorWithRed : 0.408 green : 0.792 blue : 0.075 \
		alpha : 1.000]
#define RE							[UIColor colorWithRed : 0.094 green : 0.518 blue : 0.039 \
		alpha : 1.000]
#define RI							[UIColor colorWithRed : 0.286 green : 1.000 blue : 0.902 \
		alpha : 1.000]
#define MI							[UIColor colorWithRed : 0.000 green : 0.000 blue : 1.000 \
		alpha : 1.000]
#define FA							[UIColor colorWithRed : 0.188 green : 0.000 blue : 0.596 \
		alpha : 1.000]
#define FI							[UIColor colorWithRed : 0.278 green : 0.000 blue : 0.596 \
		alpha : 1.000]
#define SOL							[UIColor colorWithRed : 0.459 green : 0.000 blue : 0.749 \
		alpha : 1.000]
#define SI							[UIColor colorWithRed : 0.635 green : 0.000 blue : 0.412 \
		alpha : 1.000]
#define LA							[UIColor colorWithRed : 0.733 green : 0.000 blue : 0.082 \
		alpha : 1.000]
#define LI							[UIColor colorWithRed : 0.831 green : 0.247 blue : 0.059 \
		alpha : 1.000]
#define TI							[UIColor colorWithRed : 0.992 green : 0.518 blue : 0.129 \
		alpha : 1.000]
