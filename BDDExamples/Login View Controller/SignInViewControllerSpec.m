#import "Specs.h"

#import "SignInViewController.h"
#import "UIView+Specs.h"

SPEC_BEGIN(LoginViewControllerSpec)

describe(@"SignInViewController", ^{
    __block SignInViewController *loginViewController;

    beforeEach(^{
        loginViewController = [[SignInViewController alloc] init];
    });

    afterEach(^{
        loginViewController = nil;
    });

    // Non-BDD

    describe(@"view", ^{
        beforeEach(^{
            [loginViewController view];
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
            beforeEach(^{
                [loginViewController didTapSignInButton:nil];
            });

            context(@"when login and password are present", ^{

            });

            context(@"when login or password are not present", ^{

            });

            context(@"when neither login or password are present", ^{

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
            beforeEach(^{
                [view specsFindButtonWithTitle:@"Sign In"];
            });

            context(@"when login and password are present", ^{

            });

            context(@"when login or password are not present", ^{

            });

            context(@"when neither login or password are present", ^{

            });
        });
    });
});

SPEC_END
