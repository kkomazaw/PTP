//
//  PTPViewController.h
//
//  Created by 松井 圭司 on 10/05/08.
//  Copyright 2010 大船中央病院. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

double	pre,sens,spec,posres,negres,PLR,NLR;

@interface PTPViewController : UIViewController <UIActionSheetDelegate>{
    IBOutlet id RUN;
    IBOutlet id decimal;
	IBOutlet id clearButton;
    IBOutlet UILabel *negativeLR;
    IBOutlet UILabel *negativeresult;
    IBOutlet UILabel *positiveLR;
    IBOutlet UILabel *positiveresult;
    IBOutlet UITextField *pretest;
    IBOutlet UITextField *sensitivity;
    IBOutlet UITextField *specificity;
}
- (IBAction)myActionDecimal:(id)sender;
- (IBAction)myActionRUN:(id)sender;
- (IBAction)myActionclear:(id)sender;
@end
