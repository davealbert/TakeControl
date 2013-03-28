//
//  ViewController.h
//  Take Control
//
//  Created by Dave Albert on 27/03/2013.
//  Copyright (c) 2013 Moodocity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>

#pragma mark - Login View
@property (strong, nonatomic) IBOutlet UITextField *emailField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)login:(id)sender;
- (IBAction)showCreateNewUser:(id)sender;


#pragma mark - Create New Account View
@property (strong, nonatomic) IBOutlet UIView *createAccountView;
@property (strong, nonatomic) IBOutlet UITextField *anewEmailField;
@property (strong, nonatomic) IBOutlet UITextField *anewPasswordField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordField;


- (IBAction)createNewUser:(id)sender;
- (IBAction)cancelNewUser:(id)sender;

@end
