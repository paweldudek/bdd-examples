//
//  Copyright (c) 2014 Pawel Dudek. All rights reserved.
//


#import "SignInViewController.h"
#import "SignInManager.h"


@implementation SignInViewController

- (instancetype)initWithSignInManager:(SignInManager *)signInManager {
    self = [super init];
    if (self) {
        _signInManager = signInManager;
    }

    return self;
}

#pragma mark -

- (IBAction)didTapSignInButton:(UIButton *)signInButton {
    if (self.usernameTextField.text.length > 0 && self.passwordTextField.text.length > 0) {
        [[self signInManager] signInWithUsername:self.usernameTextField.text password:self.passwordTextField.text];
    }
}

@end
