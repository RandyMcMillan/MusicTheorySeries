//  ViewController.m
//  
//

#import "ViewController.h"
#define IS_IPAD        (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#include <math.h>
static inline double radians (double degrees) {
        return degrees * M_PI/180;
}

@interface ViewController ()
- (void)showMenu;
- (void)configureMenuButton;
@end

@implementation ViewController

- (UIImage *)captureScreen {
        UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
        CGRect rect = [keyWindow bounds];

        int w = rect.size.width;
        int h = rect.size.height;
        NSLog(@"Width = %i Height = %i",w,h);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();


        UIInterfaceOrientation orientation = [[UIDevice currentDevice] orientation];
        UIDeviceOrientation curDevOrientation = [[UIDevice currentDevice] orientation];
        UIDeviceOrientation sbDevOrientation =[[UIApplication sharedApplication] statusBarOrientation];
        NSLog(@"orientation = %i", orientation);
        NSLog(@"curDevOrientation = %i", curDevOrientation);
        NSLog(@"sbDevOrientation = %i", sbDevOrientation);


        if (orientation < 5) {//always true for now
                //
                if (sbDevOrientation == ( UIDeviceOrientationPortrait)) {


                        NSLog(@"UIDeviceOrientationPortrait"); // only works after a rotation, not on loading app
                        CGContextTranslateCTM (context, 0, 0);
                        CGContextRotateCTM (context, radians(0.));


                }

                if (sbDevOrientation == ( UIDeviceOrientationPortraitUpsideDown)) {


                        NSLog(@"UIDeviceOrientationPortraitUpsideDown"); // only works after a rotation, not on loading app
                        CGContextTranslateCTM (context, w, h);
                        CGContextRotateCTM (context, radians(180.));
                        //CGContextTranslateCTM (context, w*2, h*2);
                        //CGContextRotateCTM (context, radians(56.));


                }


                if (sbDevOrientation == ( UIDeviceOrientationLandscapeLeft)) {


                        NSLog(@"UIDeviceOrientationLandscapeLeft"); // only works after a rotation, not on loading app
                        CGContextTranslateCTM (context, 0, w);
                        CGContextRotateCTM (context, radians(-90.));
                        //CGContextRotateCTM (context, radians(56.));


                }


                if (sbDevOrientation == ( UIDeviceOrientationLandscapeRight)) {


                        NSLog(@"UIDeviceOrientationLandscapeRight"); // only works after a rotation, not on loading app
                        CGContextTranslateCTM (context, h, 0);
                        CGContextRotateCTM (context, radians(90.));
                        //CGContextRotateCTM (context, radians(56.));


                }




                else {

                        CGContextTranslateCTM (context, 0, 0);
                        CGContextRotateCTM (context, radians(0.));
                        NSLog(@"end swith else");
                }

        }

        else {

                CGContextTranslateCTM (context, 0, 0);
                CGContextRotateCTM (context, radians(0.));
                NSLog(@"end swith !=");

        }


        [keyWindow.layer renderInContext:context];
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return img;
}

- (void)viewDidLoad {
        [super viewDidLoad];
        [self configureMenuButton];

        self.view.backgroundColor = [UIColor colorWithRed:0.110 green:0.129 blue:0.165 alpha:1.000]; //[UIColor redColor];
        self.navigationItem.title =
                [[[NSBundle mainBundle] infoDictionary]
                 objectForKey:(NSString*)kCFBundleNameKey]; //The name of the app
        ;
}

- (void)configureMenuButton {


        self.navigationController.view.alpha = 0.99;
        [self.navigationController.view addSubview:[MenuView sharedMenuView]];

        if (!isPushedViewController) {
                //CUSTOMIZE YOUR MENU ICON UI
                menuButton = [[UIButton alloc] init];
                menuButton = [UIButton buttonWithType:UIButtonTypeCustom];



                //#define IS_IPAD        (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

                if ([[UIApplication sharedApplication] statusBarOrientation] < 3) { //portrait

                        if (IS_IPAD) {

                                [menuButton setBackgroundImage:[UIImage imageNamed:@"menuButton.png"] forState:UIControlStateNormal];
                                menuButton.frame = CGRectMake(0, 3, 34, 29);

                        } else {

                                [menuButton setBackgroundImage:[UIImage imageNamed:@"menuButton.png"] forState:UIControlStateNormal];
                                menuButton.frame = CGRectMake(0, 3, 29, 29);

                        } //end else


                } else { //landscape

                        if (IS_IPAD) {

                                [menuButton setBackgroundImage:[UIImage imageNamed:@"menuButton.png"] forState:UIControlStateNormal];
                                menuButton.frame = CGRectMake(0, 3, 34, 29);

                        } else {

                                [menuButton setBackgroundImage:[UIImage imageNamed:@"menuButton.png"] forState:UIControlStateNormal];
                                menuButton.frame = CGRectMake(0, 3, 20, 20);


                        } //end else

                }

                if (IS_IPAD) {
                } else { //end if
                } //end else


//            [menuButton setBackgroundImage:[UIImage imageNamed:@"menuButton.png"] forState:UIControlStateNormal];
//              menuButton.frame = CGRectMake(0, 3, 34, 29);


                [menuButton addTarget:self action:@selector(wasDraggedInside:withEvent:) forControlEvents:UIControlEventTouchDragInside];
                [menuButton addTarget:self action:@selector(wasDraggedOutside:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
                [menuButton addTarget:self action:@selector(didFinishDragging:withEvent:) forControlEvents:UIControlEventTouchUpInside];
                [menuButton addTarget:self action:@selector(touchDown:withEvent:) forControlEvents:UIControlEventTouchDown];
                [menuButton addTarget:self action:@selector(touchUp:withEvent:) forControlEvents:UIControlEventTouchUpOutside];





                screenShotButton = [[UIButton alloc] initWithFrame:self.navigationController.view.frame];





                [screenShotButton addTarget:self action:@selector(SSButtonWasDraggedInside:withEvent:) forControlEvents:UIControlEventTouchDragInside];
                [screenShotButton addTarget:self action:@selector(SSButtonWasDraggedOutside:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
                [screenShotButton addTarget:self action:@selector(SSButtonDidFinishDragging:withEvent:) forControlEvents:UIControlEventTouchUpInside];
                [screenShotButton addTarget:self action:@selector(SSButtonTouchUp:withEvent:) forControlEvents:UIControlEventTouchUpOutside];

                UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
                self.navigationItem.leftBarButtonItem = barButton;
                [barButton release];
        }
}

- (void)wasDraggedInside:(UIButton *)button withEvent:(UIEvent *)event {
        didDrag = YES;
        // get the touch
        UITouch *touch = [[event touchesForView:button] anyObject];
        CGPoint location = [touch locationInView:self.navigationController.view];

        MenuView *menu = [MenuView sharedMenuView];
        if (menu.frame.origin.x <= 0) {
                [MenuView sharedMenuView].frame = CGRectMake(location.x - button.frame.size.width / 2 - 5 - menu.frame.size.width, menu.frame.origin.y, menu.frame.size.width, menu.frame.size.height);

                // move button
                button.center = CGPointMake(location.x, button.center.y);
                screenShotButton.frame = CGRectMake(location.x - button.frame.size.width / 2 - 5, screenShotButton.frame.origin.y, screenShotButton.frame.size.width, screenShotButton.frame.size.height);
        }
}

- (void)wasDraggedOutside:(UIButton *)button withEvent:(UIEvent *)event {
        didDrag = YES;
        // get the touch
        UITouch *touch = [[event touchesForView:button] anyObject];
        CGPoint location = [touch locationInView:self.navigationController.view];

        MenuView *menu = [MenuView sharedMenuView];
        if (menu.frame.origin.x <= 0) {
                [MenuView sharedMenuView].frame = CGRectMake(location.x - button.frame.size.width / 2 - 5 - menu.frame.size.width, menu.frame.origin.y, menu.frame.size.width, menu.frame.size.height);

                // move button
                button.center = CGPointMake(location.x, button.center.y);
                screenShotButton.frame = CGRectMake(location.x - button.frame.size.width / 2 - 5, screenShotButton.frame.origin.y, screenShotButton.frame.size.width, screenShotButton.frame.size.height);
        }
}

- (void)touchDown:(UIButton *)button withEvent:(UIEvent *)event {
        UIImage *screenShotImage = [self captureScreen];
        [screenShotButton setImage:screenShotImage forState:UIControlStateNormal];
        [screenShotButton setImage:screenShotImage forState:UIControlStateHighlighted];
        [self.navigationController.view addSubview:screenShotButton];

        [self.navigationController.view bringSubviewToFront:button];
}

- (void)didFinishDragging:(UIButton *)button withEvent:(UIEvent *)event {
        if (didDrag) {
                // get the touch
                UITouch *touch = [[event touchesForView:button] anyObject];

                CGPoint location = [touch locationInView:self.navigationController.view];
                MenuView *menu = [MenuView sharedMenuView];
                if (location.x > menu.frame.size.width / 2) {
                        [[MenuView sharedMenuView] showMenu];
                }
                else {
                        [[MenuView sharedMenuView] hideMenu];
                }
        }
        else {
                [self showMenu];
        }
        didDrag = NO;
}

- (void)touchUp:(UIButton *)button withEvent:(UIEvent *)event {
        if (didDrag) {
                // get the touch
                UITouch *touch = [[event touchesForView:button] anyObject];

                CGPoint location = [touch locationInView:self.navigationController.view];
                MenuView *menu = [MenuView sharedMenuView];
                if (location.x > menu.frame.size.width / 2) {
                        [[MenuView sharedMenuView] showMenu];
                }
                else {
                        [[MenuView sharedMenuView] hideMenu];
                }
        }
        else {
                [self showMenu];
        }
        didDrag = NO;
}

//IMAGE VIEW ACTIONS
- (void)SSButtonWasDraggedInside:(UIButton *)button withEvent:(UIEvent *)event {
        didDrag = YES;
        // get the touch
        UITouch *touch = [[event touchesForView:button] anyObject];
        CGPoint location = [touch locationInView:self.navigationController.view];

        MenuView *menu = [MenuView sharedMenuView];
        if (location.x - 20 - menu.menuView.frame.size.width <= 0) {
                // move button
                button.frame = CGRectMake(location.x - 20, button.frame.origin.y, button.frame.size.width, button.frame.size.height);
                [MenuView sharedMenuView].frame = CGRectMake(button.frame.origin.x - menu.menuView.frame.size.width, menu.frame.origin.y, menu.frame.size.width, menu.frame.size.height);
        }
}

- (void)SSButtonWasDraggedOutside:(UIButton *)button withEvent:(UIEvent *)event {
        didDrag = YES;
        // get the touch
        UITouch *touch = [[event touchesForView:button] anyObject];
        CGPoint location = [touch locationInView:self.navigationController.view];

        MenuView *menu = [MenuView sharedMenuView];
        if (location.x - 20 - menu.menuView.frame.size.width <= 0) {
                // move button
                button.frame = CGRectMake(location.x - 20, button.frame.origin.y, button.frame.size.width, button.frame.size.height);
                [MenuView sharedMenuView].frame = CGRectMake(button.frame.origin.x - menu.menuView.frame.size.width, menu.frame.origin.y, menu.frame.size.width, menu.frame.size.height);
        }
}

- (void)SSButtonDidFinishDragging:(UIButton *)button withEvent:(UIEvent *)event {
        if (didDrag) {
                // get the touch
                UITouch *touch = [[event touchesForView:button] anyObject];

                CGPoint location = [touch locationInView:self.navigationController.view];
                MenuView *menu = [MenuView sharedMenuView];
                if (location.x > menu.frame.size.width / 2) {
                        [[MenuView sharedMenuView] showMenu];
                }
                else {
                        [[MenuView sharedMenuView] hideMenu];
                }
        }
        else {
                [[MenuView sharedMenuView] hideMenu];
        }
        didDrag = NO;
}

- (void)SSButtonTouchUp:(UIButton *)button withEvent:(UIEvent *)event {
        if (didDrag) {
                // get the touch
                UITouch *touch = [[event touchesForView:button] anyObject];

                CGPoint location = [touch locationInView:self.navigationController.view];
                MenuView *menu = [MenuView sharedMenuView];
                if (location.x > menu.frame.size.width / 2) {
                        [[MenuView sharedMenuView] showMenu];
                }
                else {
                        [[MenuView sharedMenuView] hideMenu];
                }
        }
        else {
                [[MenuView sharedMenuView] hideMenu];
        }
        didDrag = NO;
}

- (void)viewDidAppear:(BOOL)animated {
        [super viewDidAppear:animated];
        [MenuView sharedMenuView].delegate = self;
        [MenuView sharedMenuView].parentViewController = self;
}

- (void)showMenu {
        [[MenuView sharedMenuView] showMenu];
}

- (void)menuViewDidStartShowingAnimation:(UIView *)menuView {
        CGRect rect = self.navigationController.view.frame;
        [UIView beginAnimations:@"RemoveFakeScreen" context:nil];
        [UIView setAnimationDuration:0.5];


        if ([[UIApplication sharedApplication] statusBarOrientation] > 2) {

                if (IS_IPAD) {

                        screenShotButton.frame = CGRectMake(280, rect.origin.y, rect.size.width, rect.size.height);

                } else { //end if

                        screenShotButton.frame = CGRectMake(280, rect.origin.y, rect.size.width, rect.size.height);
                        menuButton.frame = CGRectMake(10, 13, 20, 20);


                } //end else

        } else { //end if

                if (IS_IPAD) {

                        screenShotButton.frame = CGRectMake(280, rect.origin.y, rect.size.width, rect.size.height);

                } else { //end if

                        screenShotButton.frame = CGRectMake(280, rect.origin.y, rect.size.width, rect.size.height);
                        //  menuButton.frame = CGRectMake(10, 13, 10, 10);


                } //end else

        }


        if (IS_IPAD) {
        } else { //end if
        } //end else


        // screenShotButton.frame = CGRectMake(280, rect.origin.y, rect.size.width, rect.size.height);
        [UIView commitAnimations];
}

- (void)menuViewDidStartHidingAnimation:(UIView *)menuView {
        CGRect rect = self.navigationController.view.frame;
        [UIView beginAnimations:@"ShowFakeScreen" context:nil];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(menuViewDidStopHidingAnimation:)];


        if ([[UIApplication sharedApplication] statusBarOrientation] > 2) {

                if (IS_IPAD) {

                        screenShotButton.frame = CGRectMake(0, rect.origin.y, rect.size.width, rect.size.height);

                } else { //end if

                        screenShotButton.frame = CGRectMake(0, rect.origin.y, rect.size.width, rect.size.height);
                        menuButton.frame = CGRectMake(0, 3, 20, 20);


                } //end else


        } else { //end if

                if (IS_IPAD) {

                        screenShotButton.frame = CGRectMake(0, rect.origin.y, rect.size.width, rect.size.height);

                } else { //end if

                        screenShotButton.frame = CGRectMake(0, rect.origin.y, rect.size.width, rect.size.height);
                        menuButton.frame = CGRectMake(0, 3, 34, 29);


                } //end else

        }

        if (IS_IPAD) {
        } else { //end if
        } //end else

        //screenShotButton.frame = CGRectMake(0, rect.origin.y, rect.size.width, rect.size.height);
        [UIView commitAnimations];
}

- (void)menuViewDidStopHidingAnimation:(UIView *)menuView {
        [screenShotButton removeFromSuperview];
        menuButton.frame = CGRectMake(5, 7, menuButton.frame.size.width, menuButton.frame.size.height);
}

- (void)didPushViewController {
        isPushedViewController = YES;
}

- (void)didSelectSearchBar {}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{

        //menuButton.frame = CGRectMake(0, 13, 20, 20);
    // [[MenuView sharedMenuView] menuViewDidStartHidingAnimation];
       // [[MenuView sharedMenuView] initMenuFunctionality];
        // Return YES for supported orientations
        return YES; //[super shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

@end
