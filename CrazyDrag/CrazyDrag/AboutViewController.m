//
//  AboutViewController.m
//  CrazyDrag
//
//  Created by 李智奕 on 14-10-9.
//  Copyright (c) 2014年 ioslearning. All rights reserved.
//

#import "AboutViewController.h"


@interface AboutViewController ()
- (IBAction)back:(id)sender;

@end

@implementation AboutViewController
- (IBAction)back:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    
    webView.delegate = self;
    
    webView.scalesPageToFit = YES;
    
    [self.view addSubview:webView];
    
    activityIndicatorView = [[UIActivityIndicatorView alloc]
                             
                             initWithFrame : CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)] ;
    
    [activityIndicatorView setCenter: self.view.center] ;
    
    [activityIndicatorView setActivityIndicatorViewStyle: UIActivityIndicatorViewStyleGray] ;
    
    [self.view addSubview : activityIndicatorView] ;
    
    NSURL *url =[NSURL URLWithString:@"http://m.baidu.com"];
    
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
}
- (void)webViewDidStartLoad:(UIWebView *)webView

{
    
    [activityIndicatorView startAnimating] ;
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView

{
    
    [activityIndicatorView stopAnimating];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error

{
    
    UIAlertView *alterview = [[UIAlertView alloc] initWithTitle:@"" message:[error localizedDescription]  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    
    [alterview show];
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
