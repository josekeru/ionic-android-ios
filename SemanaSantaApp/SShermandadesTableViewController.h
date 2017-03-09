//
//  SShermandadesTableViewController.h
//  SemanaSantaApp


#import <UIKit/UIKit.h>
#import "SSdiasTableViewController.h"

@class Dias;
@class Hermandades;

@interface SShermandadesTableViewController : UITableViewController

@property (nonatomic, strong) Dias *dia;

//@property (nonatomic, strong) Hermandades *hermandad;

@property (nonatomic, strong) NSArray *hermandadess;

@end
