//
//  ViewController.m
//  GogoCheap
//
//  Created by Wayne Hartman on 7/30/14.
//  Copyright (c) 2014 Wayne Hartman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *forwardButton;
@property (strong, nonatomic) IBOutlet UIView *activityView;

@end

#define USER_AGENT @"Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8B117 Safari/6531.22.7"

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.scrollView.contentInset = UIEdgeInsetsMake([UIApplication sharedApplication].statusBarFrame.size.height, 0.0f, 0.0f, 0.0f);
    [self.webView loadRequest:[self request]];
}

- (NSURLRequest *)request {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://gogoinflight.com"]];
    [request setValue:USER_AGENT forHTTPHeaderField:@"User-Agent"];
    return request;
}

#pragma mark - Other Instance Methods

- (void)updateButtonState {
    self.backButton.enabled = self.webView.canGoBack;
    self.forwardButton.enabled = self.webView.canGoForward;
}

#pragma mark - Actions


- (IBAction)didSelectBackButton:(id)sender {
    [self.webView goBack];
}

- (IBAction)didSelectForwardButton:(id)sender {
    [self.webView goForward];
}

#pragma mark - UIWebViewDelegate

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    if (error.code != NSURLErrorCancelled) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil) message:error.description delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
        [alert show];
    }

    [self updateButtonState];
    self.activityView.hidden = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self updateButtonState];
    self.activityView.hidden = YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    self.activityView.hidden = NO;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}
@end
