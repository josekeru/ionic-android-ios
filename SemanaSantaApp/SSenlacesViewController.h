//
//  SSenlacesViewController.h
//  SemanaSantaApp


#import <UIKit/UIKit.h>
#import "SSenlacesWebViewController.h"

@interface SSenlacesViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *webViewTiempo;
@property (weak, nonatomic) IBOutlet UIButton *webViewRadio;

@property (weak, nonatomic) IBOutlet UIButton *webViewCecop;

- (IBAction)playRadio:(id)sender;


@end
