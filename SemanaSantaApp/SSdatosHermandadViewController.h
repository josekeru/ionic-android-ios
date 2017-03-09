//
//  SSdatosHermandadViewController.h
//  SemanaSantaApp

#import <UIKit/UIKit.h>
#import "SShermandadesTableViewController.h"
#import "SSdiasTableViewController.h"

@class Dias;
@class Hermandades;

@interface SSdatosHermandadViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *numeroH;
@property (weak, nonatomic) IBOutlet UILabel *bandaH;
@property (weak, nonatomic) IBOutlet UILabel *capatazH;

@property (nonatomic, strong) Hermandades *hermandadd;
@property (weak, nonatomic) IBOutlet UIButton *verRecorrido;
@property (weak, nonatomic) IBOutlet UIImageView *imagenHermandad;


@end
