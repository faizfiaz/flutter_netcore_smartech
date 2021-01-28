//
//  ModelEvent.m
//  flutter_netcore_smartech
//
//  Created by M Dimas Faizin on 28/01/21.
//
@interface ModelEvent: NSObject
@property (nonatomic, strong) NSString *eventName;
@property (nonatomic, strong) NSMutableDictionary *payloadData;

- (instancetype)initWithJSONString:(NSString *)JSONString;
@end
