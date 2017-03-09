//
//  SShermandadesTableViewController.m
//  SemanaSantaApp


#import "SShermandadesTableViewController.h"
#import "SSAppDelegate.h"
#import "SSdiasTableViewController.h"
#import "Hermandades.h"
#import "Dias.h"
#import "SSdatosHermandadViewController.h"

@interface SShermandadesTableViewController ()

@end

@implementation SShermandadesTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    self.title = self.dia.nombreDia;
    
    self.navigationController.navigationBar.topItem.title = @"Días";
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self loadData];
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"hermandad"]) {
        UITableViewCell *cell = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        Hermandades *hermandad = self.hermandadess[indexPath.row];
        
        SSdatosHermandadViewController *hermandadesDelDia = segue.destinationViewController;
        hermandadesDelDia.hermandadd = hermandad;
    }
}

- (void)loadData {
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hermandades"];
    request.predicate = [NSPredicate predicateWithFormat:@"ANY dias.nombreDia =[cd] %@", self.dia.nombreDia];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"nombreH" ascending:YES]];
    
    
    SSAppDelegate *appDelegate = (SSAppDelegate *) [UIApplication sharedApplication].delegate;
    self.hermandadess = [appDelegate.managedObjectContext executeFetchRequest:request error:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    
    return [self.hermandadess count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    
    Hermandades *emp = self.hermandadess[indexPath.row];
    cell.textLabel.text = emp.nombreH;
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    Hermandades *hermandades = self.hermandadess[indexPath.row];
    
    SSAppDelegate *appDelegate = (SSAppDelegate *) [UIApplication sharedApplication].delegate;
    [appDelegate.managedObjectContext deleteObject:hermandades];
    [appDelegate saveContext];
    
    [self loadData];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
