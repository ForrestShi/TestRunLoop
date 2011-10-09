//
//  ViewController.m
//  TestRunLoop
//
//  Created by Forrest Shi on 09/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // This can not work ( show the activity view ) 
    
     activityIndicator = [[UIActivityIndicatorView alloc]
                          initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    [self.view addSubview:activityIndicator];
    
    [activityIndicator startAnimating];
    NSLog(@"started animation..");

    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.twitter.com"]];
    NSURLResponse *response;
    NSError *error;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error) {
        NSLog(@"error is %@",error);
    }else{
        NSLog(@"No error with response %@", response);
    }
    NSLog(@"stop animation..");
    [activityIndicator stopAnimating];
    
    //HOW TO FIX ?
    
    //SOLUTION 1
    
//    activityIndicator = [[UIActivityIndicatorView alloc]
//                                                  initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    
//    [self.view addSubview:activityIndicator];
//    [activityIndicator startAnimating];
//    
//    //[self performSelector:@selector(sendRequest:) withObject:nil];
//    [self performSelector:@selector(sendRequest:) withObject:nil afterDelay:5];

}

- (void) sendRequest:(id)sender{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com"]];
    NSURLResponse *response;
    NSError *error;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error) {
        NSLog(@"error is %@",error);
    }else{
        NSLog(@"No error with response %@", response);
    }
    NSLog(@"stop animation..");
    [activityIndicator stopAnimating];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
