//
//  ViewController.m
//  Take Control
//
//  Created by Dave Albert on 27/03/2013.
//  Copyright (c) 2013 Moodocity Ltd. All rights reserved.
//

#define VERTICAL_ANIMATION_SPEED 0.5f


#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

  [self verticalHide:self.createAccountView];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - User Interaction Methods

- (IBAction)login:(id)sender {
  NSLog(@"email: %@, password: %@",self.emailField.text, self.passwordField.text);
}

- (IBAction)showCreateNewUser:(id)sender {
  // Set fields
  [self.anewEmailField setText:self.emailField.text];
  [self.anewPasswordField setText:self.passwordField.text];
  [self.confirmPasswordField setText:@""];
  
  // Show new user view
  [self.view addSubview:self.createAccountView];
  [self verticalShow:self.createAccountView];
}

- (IBAction)createNewUser:(id)sender {
  if (![self.anewPasswordField.text isEqual:self.confirmPasswordField.text]) {
    // Passwords do not match
    [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Passwords do not match." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
  } else {
    // Create account
    // TODO
  }
}

- (IBAction)cancelNewUser:(id)sender {
  [self verticalHide:self.createAccountView];
}

#pragma mark - Supporting  Methods

- (void)verticalShow:(UIView *)view {
  [UIView animateWithDuration:VERTICAL_ANIMATION_SPEED animations:^{
    [view setFrame:CGRectMake(0.0f, 0.0f, view.frame.size.width, view.frame.size.height)];
  }];
}
- (void)verticalHide:(UIView *)view {
  [UIView animateWithDuration:VERTICAL_ANIMATION_SPEED animations:^{
    [view setFrame:CGRectMake(0.0f, view.frame.size.height + 10.0f,view.frame.size.width, view.frame.size.height)];
  }];
}

#pragma mark - Delegate Methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField becomeFirstResponder];
  [textField resignFirstResponder];
  return YES;
}

@end
