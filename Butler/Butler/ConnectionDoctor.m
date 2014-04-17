//
//  ConnectionDoctor.m
//  Butler
//
//  Created by Jackson on 4/16/14.
//  Copyright (c) 2014 Jackson. All rights reserved.
//

#import "ConnectionDoctor.h"

@implementation ConnectionDoctor




-(void) makeAPIRequest:(NSString *)msg
{
  NSURL *url = [NSURL URLWithString:
                [NSString stringWithFormat:@"https://api.sprk.io/v1/devices/%s", "NOSTRING"]];
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
  
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
-(void)connection:(NSURLConnection *)connection didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
  
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
  
}
-(void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
  
}
-(void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
  
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
  
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
  
}
-(void)connectionDidFinishDownloading:(NSURLConnection *)connection destinationURL:(NSURL *)destinationURL
{
  
}

@end
