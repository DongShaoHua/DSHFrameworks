//
//  DSHHttpClient.m
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHHttpClient.h"
#import "DSHDevelopmentHelper.h"

static NSTimeInterval default_timeout = 15;

@interface DSHHttpClient()


#if __has_include(header_file_for_af)

- (void)setResponseSerializer:(id)item responsetype:(RESPONSE_BODY_TYPE)responsetype;

#endif

@end

@implementation DSHHttpClient

- (instancetype)init {
    self = [super init];
    if (self) {
        _timeout = default_timeout;
    }
    return self;
}

+ (instancetype)shareInstance {
    static DSHHttpClient *client = nil;
    _exec_block_only_one_time(^{
        client = DSHHttpClient.new;
    })
    return client;
}

+ (NSTimeInterval)getDefaultTimeout {
    return default_timeout;
}

+ (void)setDefaultTimeout:(NSTimeInterval)timeout {
    default_timeout = timeout;
}

#if __has_include(header_file_for_af)

- (void)setResponseSerializer:(id)item responsetype:(RESPONSE_BODY_TYPE)responsetype {
    switch (responsetype) {
        case RESPONSE_FOR_JSON:
            [item setResponseSerializer: [AFJSONResponseSerializer serializerWithReadingOptions: NSJSONReadingMutableLeaves]];
            break;
        case RESPONSE_FOR_XML:
            [item setResponseSerializer: [AFXMLParserResponseSerializer serializer]];
            break;
        default:
            break;
    }
}

#pragma mark ======= Http Get =======
- (AFHTTPRequestOperation *)GET:(NSString *)address {
    return [self GET: address responseType: RESPONSE_FOR_JSON completed: nil];
}


- (AFHTTPRequestOperation *)GET:(NSString *)address completed:(ResponseCompleted)completed {
    return [self GET: address responseType: RESPONSE_FOR_JSON completed: completed];
}

- (AFHTTPRequestOperation *)GET:(NSString *)address responseType:(RESPONSE_BODY_TYPE)responseType completed:(ResponseCompleted)completed {
    if (completed) {
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.requestSerializer.timeoutInterval = self.timeout;
        NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
        [self setResponseSerializer: manager responsetype: responseType];
        return [manager GET: address parameters: parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
            completed(operation, nil);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            completed(operation, [DSHHttpClient handleError: error]);
        }];
    } else {
        NSURL *url = [NSURL URLWithString: address];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url];
        request.timeoutInterval = self.timeout;
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest: request];
        [self setResponseSerializer: operation responsetype: responseType];
        return operation;
    }
}

#pragma mark ======= Http POST =======
- (AFHTTPRequestOperation *)POST:(NSString *)address parameters:(NSDictionary *)parameters {
    return [self POST: address parameters: parameters responseType: RESPONSE_FOR_JSON completed: nil];
}

- (AFHTTPRequestOperation *)POST:(NSString *)address parameters:(NSDictionary *)parameters completed:(ResponseCompleted)completed {
    return [self POST: address parameters: parameters responseType: RESPONSE_FOR_JSON completed: completed];
}

- (AFHTTPRequestOperation *)POST:(NSString *)address parameters:(NSDictionary *)parameters responseType:(RESPONSE_BODY_TYPE)responseType completed:(ResponseCompleted)completed {
    if (completed) {
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.requestSerializer.timeoutInterval = self.timeout;
        [self setResponseSerializer: manager responsetype: responseType];
        return [manager POST: address parameters: parameters
                     success: ^(AFHTTPRequestOperation *operation, id responseObject) {
                         completed(operation, nil);
                     } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
                         completed(operation, [DSHHttpClient handleError: error]);
                     }];
    } else {
        AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
        NSError *error = nil;
        NSMutableURLRequest *request = [serializer requestWithMethod: @"POST" URLString: address parameters: parameters error: &error];
        request.timeoutInterval = self.timeout;
        AFHTTPRequestOperation *operation = nil;
        if (request && !error) {
            operation = [[AFHTTPRequestOperation alloc] initWithRequest: request];
            [self setResponseSerializer: operation responsetype: responseType];
        }
        return operation;
    }
}

#pragma mark ======= Http POST UPLOAD FILES =======
- (AFHTTPRequestOperation *)UPLOAD:(NSString *)address parameters:(NSDictionary *)parameters uploadfiles:(UpLoadFiles)uploadfiles {
    return [self UPLOAD: address parameters: parameters uploadfiles: uploadfiles responseType: RESPONSE_FOR_JSON completed: nil];
}

- (AFHTTPRequestOperation *)UPLOAD:(NSString *)address parameters:(NSDictionary *)parameters uploadfiles:(UpLoadFiles)uploadfiles completed:(ResponseCompleted)completed {
    return [self UPLOAD: address parameters: parameters uploadfiles: uploadfiles responseType: RESPONSE_FOR_JSON completed: completed];
}

- (AFHTTPRequestOperation *)UPLOAD:(NSString *)address parameters:(NSDictionary *)parameters uploadfiles:(UpLoadFiles)uploadfiles responseType:(RESPONSE_BODY_TYPE)responseType completed:(ResponseCompleted)completed {
    if (completed) {
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.requestSerializer.timeoutInterval = self.timeout;
        [self setResponseSerializer: manager responsetype: responseType];
        return [manager POST: address parameters: parameters constructingBodyWithBlock: ^(id<AFMultipartFormData> formData) {
            if (uploadfiles) {
                uploadfiles(formData);
            }
        } success: ^(AFHTTPRequestOperation *operation, id responseObject) {
            completed(operation, nil);
        } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
            completed(operation, error.description);
        }];
    } else {
        AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
        NSError *error = nil;
        NSMutableURLRequest *request = [serializer multipartFormRequestWithMethod: @"POST" URLString: address parameters: parameters constructingBodyWithBlock: ^(id<AFMultipartFormData> formData) {
            if (uploadfiles) {
                uploadfiles(formData);
            }
        } error: &error];
        request.timeoutInterval = self.timeout;
        AFHTTPRequestOperation *operation = nil;
        if (request && !error) {
            operation = [[AFHTTPRequestOperation alloc] initWithRequest: request];
            [self setResponseSerializer: operation responsetype: responseType];
        }
        return operation;
    }
}

+ (NSString *)handleError:(NSError *)error {
    if (error) {
        switch (error.code) {
            case NSURLErrorTimedOut: {
                return @"请求超时";
            }
            case NSURLErrorBadServerResponse: {
                return @"服务器繁忙，请稍后再试";
            }
            case NSURLErrorCannotConnectToHost: {
                return @"无法连接到服务器";
            }
            case NSURLErrorNotConnectedToInternet: {
                return @"无法连接到网络，请检查网络设置";
            }
            default: {
                return error.description;
            }
        }
    } else {
        return nil;
    }
}

#endif

@end
