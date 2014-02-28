//
//  NetworkAccessClass.m
//  OCTestTemplate
//
//  Created by Hiroyuki Onishi on 2/28/14.
//  Copyright (c) 2014 Hiroyuki Onishi. All rights reserved.
//

#import "NetworkAccessClass.h"

static NSString *const kTwitCastingApiUrl = @"http://api.twitcasting.tv";
static NSString *const kTwitCastingApiPathLiveStatus = @"/api/livestatus";

typedef void (^asyncRequestCompletionBlock)(NSURLResponse *response, NSData *data, NSError *error);

@implementation NetworkAccessClass

- (void)requestLiveStatusWithCompletion:(requestLiveStatusCompletionBlock)completion
{
    NSString *targetUser = @"twitcastest";
    NSString *urlString = [NSString stringWithFormat:@"%@%@?type=json&user=%@", kTwitCastingApiUrl, kTwitCastingApiPathLiveStatus, targetUser];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];

    asyncRequestCompletionBlock requestCompletion = ^(NSURLResponse *response, NSData *data, NSError *error) {
        if (error) {
            return;
        }

        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (httpResponse.statusCode != 200) {
            return;
        }

        NSError *jsonParseError = nil;
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonParseError];

        // NSLog(@"json: %@", jsonObject);
        NSNumber *isLive = jsonObject[@"islive"];

        if (completion) {
            completion(0 < [isLive integerValue], nil);
        }
    };

    [NSURLConnection sendAsynchronousRequest:request queue:NSOperationQueue.mainQueue completionHandler:requestCompletion];
}

@end
