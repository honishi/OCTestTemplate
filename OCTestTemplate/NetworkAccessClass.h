//
//  NetworkAccessClass.h
//  OCTestTemplate
//
//  Created by Hiroyuki Onishi on 2/28/14.
//  Copyright (c) 2014 Hiroyuki Onishi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^requestLiveStatusCompletionBlock)(BOOL isLive, NSError *error);

@interface NetworkAccessClass : NSObject

- (void)requestLiveStatusWithCompletion:(requestLiveStatusCompletionBlock)completion;

@end
