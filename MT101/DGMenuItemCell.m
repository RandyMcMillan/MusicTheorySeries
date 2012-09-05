//

//  DGMenuItemCell.m
//  Newsfeed
//
//  Created by Daniel on 12/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DGMenuItemCell.h"

#define TITLE_LABEL_ORIGIN_X            40
#define TITLE_LABEL_ORIGIN_Y            0
#define TITLE_LABEL_SIZE_WIDTH          200
#define TITLE_LABEL_SIZE_HEIGHT         20

#define IMAGE_ICON_ORIGIN_X             10
#define IMAGE_ICON_ORIGIN_Y             10
#define IMAGE_ICON_SIZE_WIDTH           40
#define IMAGE_ICON_SIZE_HEIGHT          40

#define IMAGE_BADGE_ORIGIN_X            250
#define IMAGE_BADGE_ORIGIN_Y            10
#define IMAGE_BADGE_SIZE_WIDTH          25
#define IMAGE_BADGE_SIZE_HEIGHT         29

#define SELECTED_CELL_INDICATOR_WIDTH   5

@interface DGMenuItemCell ()

@property (nonatomic, retain) UILabel       *cellTitleLabel;
@property (nonatomic, retain) UIImageView   *cellImageView;
@property (nonatomic, retain) UIImageView   *cellBadgeImageView;
@property (nonatomic, retain) UILabel       *cellBadgeTitle;
@property (nonatomic,
    retain) UIImageView                 *cellSeperatorImageView;
@property (nonatomic, retain) UIView    *selectedColoredView;

// - (void)postSetSubject;
// - (void)triggerBalloonAnimation;
@end

@implementation DGMenuItemCell
@synthesize cellTitleLabel;
@synthesize cellImageView;
@synthesize cellBadgeImageView;
@synthesize cellBadgeTitle;
@synthesize cellSeperatorImageView;
@synthesize subject;
@synthesize selectedColoredView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(
    NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        self.cellTitleLabel =
            [[UILabel alloc] initWithFrame:CGRectMake(TITLE_LABEL_ORIGIN_X,
                TITLE_LABEL_ORIGIN_Y, TITLE_LABEL_SIZE_WIDTH,
                TITLE_LABEL_SIZE_HEIGHT)];
        cellTitleLabel.textColor    = [UIColor blackColor];
        cellTitleLabel.font         =
            [UIFont fontWithName:@"Helvetica" size:18.0];
        cellTitleLabel.shadowColor      = [UIColor whiteColor];
        cellTitleLabel.shadowOffset     = CGSizeMake(1, 1);
        cellTitleLabel.backgroundColor  = [UIColor clearColor];
        [self.contentView addSubview:cellTitleLabel];
        [cellTitleLabel release];

        self.cellImageView =
            [[UIImageView alloc] initWithFrame:CGRectMake(IMAGE_ICON_ORIGIN_X,
                IMAGE_ICON_ORIGIN_Y, IMAGE_ICON_SIZE_WIDTH,
                IMAGE_ICON_SIZE_HEIGHT)];
        [self.contentView addSubview:cellImageView];
        [cellImageView release];

        self.cellBadgeImageView =
            [[UIImageView alloc] initWithFrame:CGRectMake(
                IMAGE_BADGE_ORIGIN_X,
                0, IMAGE_BADGE_SIZE_WIDTH, IMAGE_BADGE_SIZE_HEIGHT)];

        NSLog(
            @"Configure the badge icon here or remove everything associated with badge");

        //        cellBadgeImageView.image = [UIImage
        // imageNamed:@"NotificationICON"];
        cellBadgeImageView.hidden = YES;
        [self.contentView addSubview:cellBadgeImageView];
        [cellBadgeImageView release];

        self.cellBadgeTitle =
            [[UILabel alloc] initWithFrame:CGRectMake(IMAGE_BADGE_ORIGIN_X -
                1,
                6, IMAGE_BADGE_SIZE_WIDTH, 12.0)];
        cellBadgeTitle.textColor        = [UIColor whiteColor];
        cellBadgeTitle.backgroundColor  = [UIColor clearColor];
        cellBadgeTitle.textAlignment    = UITextAlignmentCenter;
        cellBadgeTitle.font             =
            [UIFont fontWithName:@"Helvetica-Bold" size:12.0];
        [self.contentView addSubview:cellBadgeTitle];
        [cellBadgeTitle release];

        //        UIImageView *selectedBGImageView = [[UIImageView alloc]
        // initWithImage:[UIImage imageNamed:@"menu_selected_cell"]];
        //        selectedBGImageView.frame = self.frame;
        //        self.selectedBackgroundView = selectedBGImageView;
        //        [selectedBGImageView autorelease];

        self.selectedColoredView =
            [[UIView alloc] initWithFrame:CGRectMake(280 -
                SELECTED_CELL_INDICATOR_WIDTH, 0, SELECTED_CELL_INDICATOR_WIDTH,
                self.frame.size.height)];
        selectedColoredView.hidden = YES;
        [self.contentView addSubview:selectedColoredView];
        [selectedColoredView release];
    }

    return self;
}   /* initWithStyle */

/*
 *   - (void)setSubject:(DGMenuViewItem *)aSubject {
 *    if (aSubject != subject) {
 *        [aSubject retain];
 *        [subject release];
 *        subject = aSubject;
 *    }
 *    if (subject) {
 *        [self postSetSubject];
 *    }
 *   }
 */

/*
 *   - (void)postSetSubject {
 *    self.cellTitleLabel.text = self.subject.title;
 *    [cellTitleLabel sizeToFit];
 *    cellTitleLabel.frame = CGRectMake(TITLE_LABEL_ORIGIN_X, self.contentView.frame.size.height / 2 - cellTitleLabel.frame.size.height / 2, cellTitleLabel.frame.size.width, cellTitleLabel.frame.size.height);
 *
 *    cellBadgeTitle.text = [NSString stringWithFormat:@"%d", self.subject.notificationsBadgeCount];
 *    cellBadgeTitle.hidden = self.subject.notificationsBadgeCount ? NO : YES;
 *    if (self.subject.notificationsBadgeCount && cellBadgeImageView.hidden) {
 *        cellBadgeImageView.frame = CGRectMake(cellTitleLabel.frame.origin.x + cellTitleLabel.frame.size.width - 5, 0, IMAGE_BADGE_SIZE_WIDTH, IMAGE_BADGE_SIZE_HEIGHT);
 *        cellBadgeTitle.frame = CGRectMake(cellTitleLabel.frame.origin.x + cellTitleLabel.frame.size.width - 5 - 2, 6, cellBadgeTitle.frame.size.width, 11.0);
 *
 *        [self triggerBalloonAnimation];
 *    }
 *
 *    cellBadgeImageView.hidden = self.subject.notificationsBadgeCount ? NO : YES;
 *    selectedColoredView.backgroundColor = self.subject.selectedColor;
 *   }
 */

- (void)dealloc
{
    self.cellTitleLabel         = nil;
    self.cellImageView          = nil;
    self.cellBadgeImageView     = nil;
    self.cellBadgeTitle         = nil;
    self.cellSeperatorImageView = nil;
    self.subject                = nil;
    self.selectedColoredView    = nil;
    [super dealloc];
}

/*
 *   - (void)setSelected:(BOOL)selected animated:(BOOL)animated {
 *    [super setSelected:selected animated:animated];
 *    if (selected) {
 *        self.contentView.backgroundColor = [UIColor blueColor]; // CUSTOMIZE SELECTED STATE HERE
 *        selectedColoredView.hidden = NO;
 *        cellImageView.image = subject.selectedImage;
 *        CGSize imageSize = subject.selectedImage.size;
 *        cellImageView.frame = CGRectMake(IMAGE_ICON_ORIGIN_X, self.contentView.frame.size.height / 2 - imageSize.height / 2, imageSize.width, imageSize.height);
 *    }
 *    else {
 *        self.contentView.backgroundColor = [UIColor clearColor]; // CUSTOMIZE UNSELECTED STATE HERE
 *        selectedColoredView.hidden = YES;
 *        cellImageView.image = subject.image;
 *        CGSize imageSize = subject.image.size;
 *        cellImageView.frame = CGRectMake(IMAGE_ICON_ORIGIN_X, self.contentView.frame.size.height / 2 - imageSize.height / 2, imageSize.width, imageSize.height);
 *    }
 *   }
 */

- (void)triggerBalloonAnimation
{
    cellBadgeImageView.transform = CGAffineTransformScale(
        CGAffineTransformIdentity, 0.001, 0.001);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3 / 1.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(bounce1AnimationStopped)
    ];
    cellBadgeImageView.transform = CGAffineTransformScale(
        CGAffineTransformIdentity, 1.1, 1.1);
    [UIView commitAnimations];
}

- (void)bounce1AnimationStopped
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3 / 2];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(bounce2AnimationStopped)
    ];
    cellBadgeImageView.transform = CGAffineTransformScale(
        CGAffineTransformIdentity, 0.9, 0.9);
    [UIView commitAnimations];
}

- (void)bounce2AnimationStopped
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3 / 2];
    cellBadgeImageView.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];
}

@end
