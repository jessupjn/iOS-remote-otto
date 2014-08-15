//
//  ConnectionDoctor.m
//  Butler
//
//  Created by Jackson on 4/16/14.
//  Copyright (c) 2014 Jackson. All rights reserved.
//

#import "ConnectionDoctor.h"


#define CHIVESCORE1 @"53ff73065075535137281087"
#define API_KEY @"408807d68df1c7551ea6bf4858444642e19ce641"


@interface ConnectionDoctor ()
{
    NSMutableData *receivedData;
}

@end

@implementation ConnectionDoctor


-(void) makeAPIRequest:(NSString *)msg
{
    NSLog(@"MakeRequest: %@", msg);
    
    NSURL *url = [NSURL URLWithString:
                  [NSString stringWithFormat:@"https://api.sprk.io/v1/devices/%@/brew", CHIVESCORE1]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    NSData *body = [NSData dataWithBytes:[msg cStringUsingEncoding:NSASCIIStringEncoding]
                                  length:[msg length]];
    [request setHTTPBody:body];
    
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (conn) {
        receivedData = [NSMutableData data];
    } else {
        NSLog(@"no connection");
    }
  
}


// =============================================================================
//                          NSURLConnection Delegate Methods
// =============================================================================
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // debug
    if (false) {
        NSLog(@"Succeeded! Received %d bytes of data", [receivedData length]);
        char data[80];
        memset(data, 0, 80);
        [receivedData getBytes:data length:79];
        NSLog(@"%s", data);
    }
}

@end
