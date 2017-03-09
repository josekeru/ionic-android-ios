//
//  Dias.h
//  SemanaSantaApp


#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Hermandades;

@interface Dias : NSManagedObject

@property (nonatomic, retain) NSString * nombreDia;
@property (nonatomic, retain) NSNumber * ordenDia;
@property (nonatomic, retain) NSSet *hermandades;
@end

@interface Dias (CoreDataGeneratedAccessors)

- (void)addHermandadesObject:(Hermandades *)value;
- (void)removeHermandadesObject:(Hermandades *)value;
- (void)addHermandades:(NSSet *)values;
- (void)removeHermandades:(NSSet *)values;

@end
