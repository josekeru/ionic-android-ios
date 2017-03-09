//
//  SSdiasTableViewController.m
//  SemanaSantaApp

#import "SSdiasTableViewController.h"
#import "SShermandadesTableViewController.h"
#import "Dias.h"
#import "Hermandades.h"
#import "SSAppDelegate.h"

#import <CoreData/CoreData.h>

@interface SSdiasTableViewController ()

@end

@implementation SSdiasTableViewController

@synthesize managedObjectContext;

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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self.diitas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    Dias *info = [self.diitas objectAtIndex:indexPath.row];
    cell.textLabel.text = info.nombreDia;

    return cell;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self loadData];
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"hermandadesDelDia"]) {
        UITableViewCell *cell = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        Dias *dia = self.diitas[indexPath.row];
        
        SShermandadesTableViewController *hermandadesDelDia = segue.destinationViewController;
        hermandadesDelDia.dia = dia;
    }
}

- (void)loadData {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Dias"];
    
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"ordenDia" ascending:YES]];
    
    SSAppDelegate *appDelegate = (SSAppDelegate *) [UIApplication sharedApplication].delegate;
    self.diitas = [appDelegate.managedObjectContext executeFetchRequest:request error:nil];
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    Dias *dias = self.diitas[indexPath.row];
    
    SSAppDelegate *appDelegate = (SSAppDelegate *) [UIApplication sharedApplication].delegate;
    [appDelegate.managedObjectContext deleteObject:dias];
    [appDelegate saveContext];
    
    [self loadData];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
