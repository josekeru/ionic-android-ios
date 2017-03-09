//
//  SSdiasTableViewController.h
//  SemanaSantaApp


#import <UIKit/UIKit.h>

@interface SSdiasTableViewController : UITableViewController

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic,strong) NSArray* diitas;


@end
