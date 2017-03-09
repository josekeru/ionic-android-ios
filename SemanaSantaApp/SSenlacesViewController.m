//
//  SSenlacesViewController.m
//  SemanaSantaApp


#import "SSenlacesViewController.h"
#import "SSenlacesWebViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface SSenlacesViewController ()

@end

@implementation SSenlacesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    SSenlacesWebViewController *webController = [[SSenlacesWebViewController alloc] init];
    
    if ([[segue identifier] isEqualToString:@"tiempo"]) {
        NSString *urlstr=@"http://espanol.weather.com/weather/10day-SPXX0074:1:SP";
        webController = [segue destinationViewController];
        webController.urlstr = urlstr;
        
    } else if ([[segue identifier] isEqualToString:@"cecop"]) {
        NSString *urlstr=@"http://www.cecop112.com/";
        webController = [segue destinationViewController];
        webController.urlstr = urlstr;
    }
}

- (IBAction)playRadio:(id)sender {
    
    MPMoviePlayerController *player = [[MPMoviePlayerController alloc] initWithContentURL:    [NSURL URLWithString:@"http://canalsurradio.rtva.stream.flumotion.com/rtva/canalsurradio_master.mp3.m3u"]];
    player.movieSourceType = MPMovieSourceTypeStreaming;
    player.view.hidden = NO;
    [self.view addSubview:player.view];

    [player prepareToPlay];
    [player play];
    
}
@end
