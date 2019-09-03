//
//  BBHtmlController.m
//  BestBuyApp
//
//  Created by Alexcai on 2019/6/8.
//  Copyright © 2019 com.liangwu.bestbuy. All rights reserved.
//

#import <Masonry.h>
#import <WebKit/WebKit.h>
#import "BBHtmlController.h"



@interface BBHtmlController ()<WKNavigationDelegate>
/** UI */
@property (weak, nonatomic)  WKWebView *webView;    /** web view */
@property (weak, nonatomic,) UIProgressView *progressView;  /**  web progress view */

@end

@implementation BBHtmlController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc]init];
    WKWebView *web = [[WKWebView alloc]initWithFrame:self.view.bounds configuration:config];
    [self.view addSubview:web];
    self.webView = web;
    [web mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        
    }];

    self.webView.navigationDelegate = self;
    if (self.scrollDelegate) {  /** 设置scroll view 外部代理 */
        self.webView.scrollView.delegate = self.scrollDelegate;
    }
    /** load html url */
    if (self.htmlURL != nil) {  [self loadHtml:self.htmlURL];}
    /** setup nav bar back item */
    if (self.navigationController != nil) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_back_white"] style:UIBarButtonItemStylePlain target:self action:@selector(goback)];
    }
    /** add web load progress observer */
    [self progressView];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}
- (void)loadHtml:(NSString *)url{
    /** load html url */
    NSURL *htmlUrl = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:htmlUrl];
    [self.webView loadRequest:request];
}
#pragma mark - KVO event
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"estimatedProgress"] && object == self.webView) {
        [self.progressView setAlpha:1.0f];
        [self.progressView setProgress:self.webView.estimatedProgress animated:YES];
        if (self.webView.estimatedProgress  >= 1.0f) {
            [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                [self.progressView setAlpha:0.0f];
            } completion:^(BOOL finished) {
                [self.progressView setProgress:0.0f animated:YES];
            }];
        }
    }
}
#pragma mark - navigation
- (void)goback{
    if (self.webView.canGoBack) {[self.webView goBack];return;}
    if (self.navigationController) {[self.navigationController popViewControllerAnimated:YES];return;}
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - WKNavigationDelegate
/** 拦截url 进行判断是否加载 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(nonnull WKNavigationAction *)navigationAction decisionHandler:(nonnull void (^)(WKNavigationActionPolicy))decisionHandler{
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    self.title = self.webView.title;
}
#pragma mark - lazy Getter method
- (UIProgressView *)progressView{
    
    if (_progressView == nil) {
        CGSize screenSize = UIScreen.mainScreen.bounds.size;
        CGFloat navBarHeight = 44;
        CGFloat y = self.navigationController ? navBarHeight : 0;
        CGRect frame = CGRectMake(0,y,screenSize.width, 2);
        UIProgressView *pv = [[UIProgressView alloc]initWithFrame:frame];
        pv.trackTintColor = UIColor.whiteColor;
        pv.tintColor = UIColor.redColor;
        [self.view addSubview:pv];
        _progressView = pv;
    }
    return _progressView;
}

- (void)dealloc{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

@end
