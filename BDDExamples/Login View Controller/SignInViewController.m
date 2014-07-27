//
//  Copyright (c) 2014 Pawel Dudek. All rights reserved.
//


#import "SignInViewController.h"
#import "SignInManager.h"


@implementation SignInViewController

- (instancetype)initWithSignInManager:(SignInManager *)signInManager {
    self = [super initWithNibName:@"SignInViewController" bundle:nil];
    if (self) {
        _signInManager = signInManager;
    }

    return self;
}

#pragma mark -

- (IBAction)didTapSignInButton:(UIButton *)signInButton {
    [[self signInManager] signInWithUsername:self.usernameTextField.text password:self.passwordTextField.text];
}

@end
