// Autogenerated from Pigeon (v13.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import "messages.g.h"

#if TARGET_OS_OSX
#import <FlutterMacOS/FlutterMacOS.h>
#else
#import <Flutter/Flutter.h>
#endif

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

@implementation PGNCodeBox
- (instancetype)initWithValue:(PGNCode)value {
  self = [super init];
  if (self) {
    _value = value;
  }
  return self;
}
@end

@implementation PGNTikTokLoginStatusBox
- (instancetype)initWithValue:(PGNTikTokLoginStatus)value {
  self = [super init];
  if (self) {
    _value = value;
  }
  return self;
}
@end

/// https://developers.tiktok.com/doc/tiktok-api-scopes/
@implementation PGNTikTokPermissionTypeBox
- (instancetype)initWithValue:(PGNTikTokPermissionType)value {
  self = [super init];
  if (self) {
    _value = value;
  }
  return self;
}
@end

static NSArray *wrapResult(id result, FlutterError *error) {
  if (error) {
    return @[
      error.code ?: [NSNull null], error.message ?: [NSNull null], error.details ?: [NSNull null]
    ];
  }
  return @[ result ?: [NSNull null] ];
}
static id GetNullableObjectAtIndex(NSArray *array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}

@interface PGNMessageData ()
+ (PGNMessageData *)fromList:(NSArray *)list;
+ (nullable PGNMessageData *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface PGNPermission ()
+ (PGNPermission *)fromList:(NSArray *)list;
+ (nullable PGNPermission *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface PGNTikTokLoginResult ()
+ (PGNTikTokLoginResult *)fromList:(NSArray *)list;
+ (nullable PGNTikTokLoginResult *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@implementation PGNMessageData
+ (instancetype)makeWithName:(nullable NSString *)name
    description:(nullable NSString *)description
    code:(PGNCode)code
    data:(NSDictionary<NSString *, NSString *> *)data {
  PGNMessageData* pigeonResult = [[PGNMessageData alloc] init];
  pigeonResult.name = name;
  pigeonResult.description = description;
  pigeonResult.code = code;
  pigeonResult.data = data;
  return pigeonResult;
}
+ (PGNMessageData *)fromList:(NSArray *)list {
  PGNMessageData *pigeonResult = [[PGNMessageData alloc] init];
  pigeonResult.name = GetNullableObjectAtIndex(list, 0);
  pigeonResult.description = GetNullableObjectAtIndex(list, 1);
  pigeonResult.code = [GetNullableObjectAtIndex(list, 2) integerValue];
  pigeonResult.data = GetNullableObjectAtIndex(list, 3);
  return pigeonResult;
}
+ (nullable PGNMessageData *)nullableFromList:(NSArray *)list {
  return (list) ? [PGNMessageData fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    self.name ?: [NSNull null],
    self.description ?: [NSNull null],
    @(self.code),
    self.data ?: [NSNull null],
  ];
}
@end

@implementation PGNPermission
+ (instancetype)makeWithName:(NSString *)name {
  PGNPermission* pigeonResult = [[PGNPermission alloc] init];
  pigeonResult.name = name;
  return pigeonResult;
}
+ (PGNPermission *)fromList:(NSArray *)list {
  PGNPermission *pigeonResult = [[PGNPermission alloc] init];
  pigeonResult.name = GetNullableObjectAtIndex(list, 0);
  return pigeonResult;
}
+ (nullable PGNPermission *)nullableFromList:(NSArray *)list {
  return (list) ? [PGNPermission fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    self.name ?: [NSNull null],
  ];
}
@end

@implementation PGNTikTokLoginResult
+ (instancetype)makeWithStatus:(PGNTikTokLoginStatus)status
    authCode:(nullable NSString *)authCode
    state:(nullable NSString *)state
    codeVerifier:(nullable NSString *)codeVerifier
    grantedPermissions:(NSArray<PGNPermission *> *)grantedPermissions
    errorCode:(nullable NSString *)errorCode
    errorMessage:(nullable NSString *)errorMessage
    scopeName:(NSString *)scopeName {
  PGNTikTokLoginResult* pigeonResult = [[PGNTikTokLoginResult alloc] init];
  pigeonResult.status = status;
  pigeonResult.authCode = authCode;
  pigeonResult.state = state;
  pigeonResult.codeVerifier = codeVerifier;
  pigeonResult.grantedPermissions = grantedPermissions;
  pigeonResult.errorCode = errorCode;
  pigeonResult.errorMessage = errorMessage;
  pigeonResult.scopeName = scopeName;
  return pigeonResult;
}
+ (PGNTikTokLoginResult *)fromList:(NSArray *)list {
  PGNTikTokLoginResult *pigeonResult = [[PGNTikTokLoginResult alloc] init];
  pigeonResult.status = [GetNullableObjectAtIndex(list, 0) integerValue];
  pigeonResult.authCode = GetNullableObjectAtIndex(list, 1);
  pigeonResult.state = GetNullableObjectAtIndex(list, 2);
  pigeonResult.codeVerifier = GetNullableObjectAtIndex(list, 3);
  pigeonResult.grantedPermissions = GetNullableObjectAtIndex(list, 4);
  pigeonResult.errorCode = GetNullableObjectAtIndex(list, 5);
  pigeonResult.errorMessage = GetNullableObjectAtIndex(list, 6);
  pigeonResult.scopeName = GetNullableObjectAtIndex(list, 7);
  return pigeonResult;
}
+ (nullable PGNTikTokLoginResult *)nullableFromList:(NSArray *)list {
  return (list) ? [PGNTikTokLoginResult fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    @(self.status),
    self.authCode ?: [NSNull null],
    self.state ?: [NSNull null],
    self.codeVerifier ?: [NSNull null],
    self.grantedPermissions ?: [NSNull null],
    self.errorCode ?: [NSNull null],
    self.errorMessage ?: [NSNull null],
    self.scopeName ?: [NSNull null],
  ];
}
@end

@interface PGNExampleHostApiCodecReader : FlutterStandardReader
@end
@implementation PGNExampleHostApiCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128: 
      return [PGNMessageData fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface PGNExampleHostApiCodecWriter : FlutterStandardWriter
@end
@implementation PGNExampleHostApiCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[PGNMessageData class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface PGNExampleHostApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation PGNExampleHostApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[PGNExampleHostApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[PGNExampleHostApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *PGNExampleHostApiGetCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    PGNExampleHostApiCodecReaderWriter *readerWriter = [[PGNExampleHostApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void SetUpPGNExampleHostApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<PGNExampleHostApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.instagram_connect.ExampleHostApi.getHostLanguage"
        binaryMessenger:binaryMessenger
        codec:PGNExampleHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getHostLanguageWithError:)], @"PGNExampleHostApi api (%@) doesn't respond to @selector(getHostLanguageWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        NSString *output = [api getHostLanguageWithError:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.instagram_connect.ExampleHostApi.add"
        binaryMessenger:binaryMessenger
        codec:PGNExampleHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(addNumber:toNumber:error:)], @"PGNExampleHostApi api (%@) doesn't respond to @selector(addNumber:toNumber:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSInteger arg_a = [GetNullableObjectAtIndex(args, 0) integerValue];
        NSInteger arg_b = [GetNullableObjectAtIndex(args, 1) integerValue];
        FlutterError *error;
        NSNumber *output = [api addNumber:arg_a toNumber:arg_b error:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.instagram_connect.ExampleHostApi.sendMessage"
        binaryMessenger:binaryMessenger
        codec:PGNExampleHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(sendMessageMessage:completion:)], @"PGNExampleHostApi api (%@) doesn't respond to @selector(sendMessageMessage:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        PGNMessageData *arg_message = GetNullableObjectAtIndex(args, 0);
        [api sendMessageMessage:arg_message completion:^(NSNumber *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}
@interface PGNTiktokSDKApiCodecReader : FlutterStandardReader
@end
@implementation PGNTiktokSDKApiCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128: 
      return [PGNPermission fromList:[self readValue]];
    case 129: 
      return [PGNTikTokLoginResult fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface PGNTiktokSDKApiCodecWriter : FlutterStandardWriter
@end
@implementation PGNTiktokSDKApiCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[PGNPermission class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[PGNTikTokLoginResult class]]) {
    [self writeByte:129];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface PGNTiktokSDKApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation PGNTiktokSDKApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[PGNTiktokSDKApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[PGNTiktokSDKApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *PGNTiktokSDKApiGetCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    PGNTiktokSDKApiCodecReaderWriter *readerWriter = [[PGNTiktokSDKApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void SetUpPGNTiktokSDKApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<PGNTiktokSDKApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.instagram_connect.TiktokSDKApi.setup"
        binaryMessenger:binaryMessenger
        codec:PGNTiktokSDKApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setupClientKey:completion:)], @"PGNTiktokSDKApi api (%@) doesn't respond to @selector(setupClientKey:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_clientKey = GetNullableObjectAtIndex(args, 0);
        [api setupClientKey:arg_clientKey completion:^(FlutterError *_Nullable error) {
          callback(wrapResult(nil, error));
        }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.instagram_connect.TiktokSDKApi.login"
        binaryMessenger:binaryMessenger
        codec:PGNTiktokSDKApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(loginPermissions:redirectUri:browserAuthEnabled:completion:)], @"PGNTiktokSDKApi api (%@) doesn't respond to @selector(loginPermissions:redirectUri:browserAuthEnabled:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSArray<NSString *> *arg_permissions = GetNullableObjectAtIndex(args, 0);
        NSString *arg_redirectUri = GetNullableObjectAtIndex(args, 1);
        NSNumber *arg_browserAuthEnabled = GetNullableObjectAtIndex(args, 2);
        [api loginPermissions:arg_permissions redirectUri:arg_redirectUri browserAuthEnabled:arg_browserAuthEnabled completion:^(PGNTikTokLoginResult *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}
