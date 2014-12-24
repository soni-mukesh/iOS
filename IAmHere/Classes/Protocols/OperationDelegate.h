@protocol OperationDelegate <NSObject>

@optional

- (void) webServiceRequestSucceed:(NSInteger)inResponse forRequestClass:(Class)inRequestClass;
- (void) webServiceRequestFailed:(NSError*)inError forRequestClass:(Class)inRequestClass;

@end
