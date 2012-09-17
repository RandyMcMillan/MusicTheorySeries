//

#import <UIKit/UIKit.h>
#import "MixerHostAudio.h"

#define KEY_COUNT 6

@interface AppleXylophoneViewController : UIViewController <UISplitViewControllerDelegate>{
    int     lastKeyIndex;
    CGRect  keyRects[KEY_COUNT];
}

@property (nonatomic, assign) MixerHostAudio *mixerHost;

- (int)keyIndexForTouch:(UITouch *)touch;
- (IBAction)mixerOutputGainChanged:(UISlider *)sender;

@end
