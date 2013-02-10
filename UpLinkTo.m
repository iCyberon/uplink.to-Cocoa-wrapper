//
//  UpLinkTo.m
//  UpLinkTo
//
//  Created by Mark S. Morris on 2/9/13.
//  http://uplink.to/home
//
//  Subject to acceptable use conditions and hosting provider terms of service
//

#import "UpLinkTo.h"

@implementation UpLinkTo

-(NSString*)shortenURL:(NSString*)url
{
    CFStringRef legalStr = CFSTR("!@#$%^&()<>?{},;'[]");
    NSString *escUrl = (NSString*)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                          (CFStringRef)url, NULL, legalStr, kCFStringEncodingUTF8);
    NSString *apiEndpoint = [NSString stringWithFormat:@"http://uplink.to/uplinkto.php?longurl=%@",escUrl];
    NSError* error;
    NSString* shortURL = [NSString stringWithContentsOfURL:[NSURL URLWithString:apiEndpoint]
                                                  encoding:NSASCIIStringEncoding error:&error];
    if (shortURL)
        return shortURL;
    else
        return [error localizedDescription];
}

@end
