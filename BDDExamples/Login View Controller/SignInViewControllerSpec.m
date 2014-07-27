#import "Specs.h"

#import "SignInViewController.h"
#import "UIView+Specs.h"
#import "UIButton+Specs.h"
#import "SignInManager.h"

SPEC_BEGIN(LoginViewControllerSpec)

describe(@"SignInViewController", ^{
    __block SignInViewController *loginViewController;
    __block id mockSignInManager;

    beforeEach(^{
        mockSignInManager = mock([SignInManager class]);
        loginViewController = [[SignInViewController alloc] initWithSignInManager:mockSignInManager];
    });

    afterEach(^{
        loginViewController = nil;
    });

    // Non-BDD

    describe(@"view", ^{
        beforeEach(^{
            [loginViewController view];
        });

        it(@"should have a placeholder on user name text field", ^{
            expect(loginViewController.usernameTextField.placeholder).to.equal(@"Username");
        });

        it(@"should have a placeholder on user name text field", ^{
             expect(loginViewController.passwordTextField.placeholder).to.equal(@"Password");
         });

        describe(@"sign in button", ^{

            __block UIButton *button;

            beforeEach(^{
                button = loginViewController.signInButton;
            });

            it(@"should have a title", ^{
                expect(button.currentTitle).to.equal(@"Sign In");
            });

            it(@"should login view controller as only target", ^{
                expect(button.allTargets).to.equal([NSSet setWithObject:loginViewController]);
            });

            it(@"should have the sign in action as action for login view controller target", ^{
                NSString *selectorString = NSStringFromSelector(@selector(didTapSignInButton:));
                expect([button actionsForTarget:loginViewController forControlEvent:UIControlEventTouchUpInside]).to.equal(@[selectorString]);
            });
        });

        describe(@"tapping the logging button", ^{

            context(@"when login and password are present", ^{

                beforeEach(^{
                    loginViewController.usernameTextField.text = @"Fixture Username";
                    loginViewController.passwordTextField.text = @"Fixture Password";

                    [loginViewController didTapSignInButton:nil];
                });

                it(@"should tell the sign in manager to sign in with given username and password", ^{
                    [verify(mockSignInManager) signInWithUsername:@"Fixture Username" password:@"Fixture Password"];
                });
            });

            context(@"when login or password are not present", ^{
                beforeEach(^{
                    loginViewController.usernameTextField.text = @"Fixture Username";
                    loginViewController.passwordTextField.text = nil;

                    [loginViewController didTapSignInButton:nil];
                });

                it(@"should tell the sign in manager to sign in with given username and password", ^{
                    [verifyCount(mockSignInManager, never()) signInWithUsername:anything() password:anything()];
                });
            });

            context(@"when neither login or password are present", ^{
                beforeEach(^{
                    loginViewController.usernameTextField.text = nil;
                    loginViewController.passwordTextField.text = nil;

                    [loginViewController didTapSignInButton:nil];
                });

                it(@"should tell the sign in manager to sign in with given username and password", ^{
                    [verifyCount(mockSignInManager, never()) signInWithUsername:anything() password:anything()];
                });
            });
        });
    });

    // BDD

    describe(@"view", ^{

        __block UIView *view;
        
        beforeEach(^{
            view = [loginViewController view];
        });

        describe(@"login button", ^{

            __block UITextField *usernameTextField;
            __block UITextField *passwordTextField;
            __block UIButton *signInButton;

            beforeEach(^{
                signInButton = [view specsFindButtonWithTitle:@"Sign In"];
                usernameTextField = [view specsFindTextFieldWithPlaceholder:@"Username"];
                passwordTextField = [view specsFindTextFieldWithPlaceholder:@"Password"];
            });

            context(@"when login and password are present", ^{
                beforeEach(^{
                    usernameTextField.text = @"Fixture Username";
                    passwordTextField.text = @"Fixture Password";

                    [signInButton specsSimulateTap];
                });

                it(@"should tell the sign in manager to sign in with given username and password", ^{
                    [verify(mockSignInManager) signInWithUsername:@"Fixture Username" password:@"Fixture Password"];
                });
            });

            context(@"when login or password are not present", ^{
                beforeEach(^{
                    usernameTextField.text = @"Fixture Username";
                    passwordTextField.text = nil;

                    [signInButton specsSimulateTap];
                });

                it(@"should tell the sign in manager to sign in with given username and password", ^{
                    [verifyCount(mockSignInManager, never()) signInWithUsername:anything() password:anything()];
                });
            });

            context(@"when neither login or password are present", ^{
                beforeEach(^{
                    usernameTextField.text = nil;
                    passwordTextField.text = nil;

                    [signInButton specsSimulateTap];
                });

                it(@"should tell the sign in manager to sign in with given username and password", ^{
                    [verifyCount(mockSignInManager, never()) signInWithUsername:anything() password:anything()];
                });
            });
        });
    });
});

SPEC_END
