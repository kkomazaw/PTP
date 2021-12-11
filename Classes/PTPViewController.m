//
//  PTPViewController.m
//
//  Created by 松井 圭司 on 10/05/08.
//  Copyright 2010 大船中央病院. All rights reserved.
//

#import "PTPViewController.h"
#import <math.h>

@implementation PTPViewController

-(void)viewDidLoad{
	[pretest becomeFirstResponder];
	[super viewDidLoad];
}

- (IBAction)myActionDecimal:(id)sender {
	if (pretest.editing) {
		if ([pretest.text length] == 0) {
			pretest.text = @"0.";
		}
		if ([pretest.text rangeOfString:@"." options:NSBackwardsSearch].length == 0) {
			pretest.text = [pretest.text stringByAppendingFormat:@"."];
		}
		
	}
	if (sensitivity.editing) {
		if ([sensitivity.text length] == 0) {
			sensitivity.text = @"0.";
		}
		if ([sensitivity.text rangeOfString:@"." options:NSBackwardsSearch].length == 0) {
			sensitivity.text = [sensitivity.text stringByAppendingFormat:@"."];
		}
		
	}
	if (specificity.editing) {
		if ([specificity.text length] == 0) {
			specificity.text = @"0.";
		}
		if ([specificity.text rangeOfString:@"." options:NSBackwardsSearch].length == 0) {
			specificity.text = [specificity.text stringByAppendingFormat:@"."];
		}
		
	}
}

- (IBAction)myActionRUN:(id)sender {
    pre = [pretest.text doubleValue];
	sens = [sensitivity.text doubleValue];
	spec = [specificity.text doubleValue];
	pre=pre/100.0;
	sens=sens/100.0;
	spec=spec/100.0;
	if (pre>1.0 || sens>1.0 || spec>1.0) {
		UIActionSheet *actionSheet = [[UIActionSheet alloc] 
									  initWithTitle:@"The values should range from 0 to 100." 
									  delegate:self cancelButtonTitle:nil 
									  destructiveButtonTitle:@"OK" otherButtonTitles:nil];
		[actionSheet showInView:self.view];
		[actionSheet release];
	}
	else {
		[self.view endEditing:YES];
		posres=100.0*sens*pre/(sens*pre+(1.0-spec)*(1.0-pre));
		negres=100.0*(1.0-spec*(1.0-pre)/(spec*(1.0-pre)+(1.0-sens)*pre));
		PLR=sens/(1.0-spec);
		NLR=(1.0-sens)/spec;
		if (posres<10.0) {
			[positiveresult setText:[NSString stringWithFormat:@"%0.2lf", posres]];
		}
		else {
			[positiveresult setText:[NSString stringWithFormat:@"%0.1lf", posres]];
		}
		if (negres<10.0) {
			[negativeresult setText:[NSString stringWithFormat:@"%0.2lf", negres]];
		}
		else {
			[negativeresult setText:[NSString stringWithFormat:@"%0.1lf", negres]];
		}
		if (PLR<10.0) {
			[positiveLR setText:[NSString stringWithFormat:@"%0.2lf", PLR]];
		}
		else {
			[positiveLR setText:[NSString stringWithFormat:@"%0.1lf", PLR]];
		}
		[negativeLR setText:[NSString stringWithFormat:@"%0.3lf", NLR]];
	}

}

- (IBAction)myActionclear:(id)sender {
	pretest.text=@"";
	sensitivity.text=@"";
	specificity.text=@"";
	positiveresult.text=@"";
	negativeresult.text=@"";
	positiveLR.text=@"";
	negativeLR.text=@"";
	[pretest becomeFirstResponder];
}//- (IBAction)myActionclear:(id)sender
@end
