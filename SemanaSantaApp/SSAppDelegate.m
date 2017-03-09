//
//  SSAppDelegate.m
//  SemanaSantaApp

#import "SSAppDelegate.h"
#import "Dias.h"
#import "SSdiasTableViewController.h"
#import "Hermandades.h"

#import <CoreData/CoreData.h>

@implementation SSAppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self iniciarDatos];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSPersistentStore *store = [self.persistentStoreCoordinator.persistentStores lastObject];
    NSError *error = nil;
    NSURL *storeURL = store.URL;
    [self.persistentStoreCoordinator removePersistentStore:store error:&error];
    [[NSFileManager defaultManager] removeItemAtURL:storeURL error:&error];
    
    //[self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"SemanaSantaApp" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}


- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"SemanaSantaApp.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {

        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory


- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

-(void)iniciarDatos{
  
    NSManagedObjectContext *context = [self managedObjectContext];
    
    
    NSError * error;
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[NSEntityDescription entityForName:@"Dias"
                                        inManagedObjectContext:context]];
    [fetchRequest setFetchLimit:1];
    
    // check whether the entity exists or not
    // set predicate as you want, here just use |companyName| as an example
    NSString *diaName = @"Viernes de Dolores";
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"nombreDia == %@", diaName]];

    // if get a entity, that means exists, so fetch it.
    if (![context countForFetchRequest:fetchRequest error:&error])
    {
    
    Dias *viernesDolores = [NSEntityDescription
                            insertNewObjectForEntityForName:@"Dias"
                            inManagedObjectContext:context];
    viernesDolores.nombreDia = @"Viernes de Dolores";
    viernesDolores.ordenDia = [NSNumber numberWithInt:0];
    
    Dias *sabadoPasion = [NSEntityDescription
                          insertNewObjectForEntityForName:@"Dias"
                          inManagedObjectContext:context];
    sabadoPasion.nombreDia = @"Sabado de Pasión";
    sabadoPasion.ordenDia = [NSNumber numberWithInt:1];
    
    Dias *domingoRamos = [NSEntityDescription
                          insertNewObjectForEntityForName:@"Dias"
                          inManagedObjectContext:context];
    domingoRamos.nombreDia = @"Domingo de Ramos";
    domingoRamos.ordenDia = [NSNumber numberWithInt:3];
    
    Dias *lunesSanto = [NSEntityDescription
                        insertNewObjectForEntityForName:@"Dias"
                        inManagedObjectContext:context];
    lunesSanto.nombreDia = @"Lunes Santo";
    lunesSanto.ordenDia = [NSNumber numberWithInt:4];
    
    Dias *martesSanto = [NSEntityDescription
                         insertNewObjectForEntityForName:@"Dias"
                         inManagedObjectContext:context];
    martesSanto.nombreDia = @"Martes Santo";
    martesSanto.ordenDia = [NSNumber numberWithInt:5];
    
    Dias *miercolesSanto = [NSEntityDescription
                            insertNewObjectForEntityForName:@"Dias"
                            inManagedObjectContext:context];
    miercolesSanto.nombreDia = @"Miercoles Santo";
    miercolesSanto.ordenDia = [NSNumber numberWithInt:6];
    
    Dias *juevesSanto = [NSEntityDescription
                         insertNewObjectForEntityForName:@"Dias"
                         inManagedObjectContext:context];
    juevesSanto.nombreDia = @"Jueves Santo";
    juevesSanto.ordenDia = [NSNumber numberWithInt:7];
    
    Dias *madruga = [NSEntityDescription
                     insertNewObjectForEntityForName:@"Dias"
                     inManagedObjectContext:context];
    madruga.nombreDia = @"Madrugá";
    madruga.ordenDia = [NSNumber numberWithInt:8];
    
    Dias *viernesSanto = [NSEntityDescription
                          insertNewObjectForEntityForName:@"Dias"
                          inManagedObjectContext:context];
    viernesSanto.nombreDia = @"Viernes Santo";
    viernesSanto.ordenDia = [NSNumber numberWithInt:9];
    
    Dias *sabadoSanto = [NSEntityDescription
                         insertNewObjectForEntityForName:@"Dias"
                         inManagedObjectContext:context];
    sabadoSanto.nombreDia = @"Sabado Santo";
    sabadoSanto.ordenDia = [NSNumber numberWithInt:10];
    
    Dias *domingoR = [NSEntityDescription
                      insertNewObjectForEntityForName:@"Dias"
                      inManagedObjectContext:context];
    domingoR.nombreDia = @"Domingo de Resurrección";
    domingoR.ordenDia = [NSNumber numberWithInt:11];
    
    Hermandades *laMision = [NSEntityDescription
                             insertNewObjectForEntityForName:@"Hermandades"
                             inManagedObjectContext:context];
    laMision.nombreH = @"La Misión";
    laMision.numeroH = [NSNumber numberWithInt:500];
    
    
    Hermandades *laCorona = [NSEntityDescription
                             insertNewObjectForEntityForName:@"Hermandades"
                             inManagedObjectContext:context];
    laCorona.nombreH = @"La Corona";
    laCorona.numeroH = [NSNumber numberWithInt:200];
    laCorona.bandaH  =  @"No lleva";
    laCorona.capatazH = @"Pepito";
    
    
    
    laMision.dias = viernesDolores;
    laCorona.dias = viernesDolores;
    
    [viernesDolores addHermandadesObject:laMision];
    [viernesDolores addHermandadesObject:laCorona];
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Dias"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (Dias *info in fetchedObjects) {
        NSLog(@"Dia: %@", info.nombreDia);
        
        for (Hermandades *hermandad in info.hermandades){
            NSLog(@" %@ número de hermanos %@", hermandad.nombreH, hermandad.numeroH);
            NSLog(@" Verificar dia: %@", hermandad.dias.nombreDia);
        }
        
    }
}

}

@end
