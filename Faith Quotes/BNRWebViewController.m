//
//  BNRWebViewController.m
//  Faith Quotes
//
//  Created by Mike Camara on 27/09/2014.
//  Copyright (c) 2014 org.mikecamara. All rights reserved.
//

#import "BNRWebViewController.h"


@interface BNRWebViewController ()

@end

@implementation BNRWebViewController

- (void)loadView
{
    UIWebView *webView = [[UIWebView alloc] init];
    webView.scalesPageToFit = YES;
    self.view = webView;
}

- (void)setURL:(NSURL *)URL
{
    _URL = URL;
    if (_URL) {
        NSURLRequest *req = [NSURLRequest requestWithURL:_URL];
        [(UIWebView *)self.view loadRequest:req];
    }
}




@end
