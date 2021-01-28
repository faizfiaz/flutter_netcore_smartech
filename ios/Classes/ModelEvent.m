//
//  ModelEvent.m
//  flutter_netcore_smartech
//
//  Created by M Dimas Faizin on 28/01/21.
//

#import "ModelEvent.h"

@implementation ModelEvent

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

- (instancetype)initWithJSONString:(NSString *)JSONString
{
    self = [super init];
    if (self) {

        NSError *error = nil;
        NSData *JSONData = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:JSONData options:0 error:&error];

        if (!error && JSONDictionary) {
            for (NSString* key in JSONDictionary) {
                [self setValue:[JSONDictionary valueForKey:key] forKey:key];
            }
        }
    }
    return self;
}

@end
