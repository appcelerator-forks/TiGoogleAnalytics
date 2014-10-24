/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "InfoH5y1m141TiGoogleAnalyticsModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation InfoH5y1m141TiGoogleAnalyticsModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"92666a5d-9658-4d8d-be37-ecbf93597ee5";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"info.h5y1m141.TiGoogleAnalytics";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
    
//    [GAI sharedInstance].dispatchInterval  = 20;
//    
//    [[GAI sharedInstance]trackerWithTrackingId:@"UA-55891561-1"];
//    id tracker = [[GAI sharedInstance]defaultTracker];
//    
//    [tracker set:kGAIScreenName value:@"TiGoogleAna"];
//    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
   
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}


#pragma mark Utility

-(id)proxify:(id<GAITracker>)tracker
{
    return [[TiGoogleanalyticsTracker alloc] initWithTracker:tracker];
}


#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(void)closeTracker:(id)trackingId
{
    ENSURE_SINGLE_ARG(trackingId, NSString);
    [[GAI sharedInstance] removeTrackerByName:trackingId];
    
}

-(id)defaultTracker
{
    return [self proxify:[GAI sharedInstance].defaultTracker];
}


-(id)initTracker:(id)args
{
    NSString *trackingId;
    id<GAITracker> retVal;
    ENSURE_ARG_AT_INDEX(trackingId, args, 0, NSString);
    NSLog(@"check traking id")
    NSLog(trackingId);
    retVal =  [[GAI sharedInstance]trackerWithTrackingId: trackingId];
    id tracker = [[GAI sharedInstance]defaultTracker];
    [tracker set:kGAIScreenName value:@"TiGoogleAnatics send"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
    NSLog(@"send done")
   
    
    [self proxify:retVal];
    return;
    
}

-(id)sendReport:(id)args
{
    NSString *reportData;
    ENSURE_ARG_AT_INDEX(reportData, args, 0, NSString);
    NSLog(reportData);
    
    id tracker = [[GAI sharedInstance]defaultTracker];
    
    [tracker set:kGAIScreenName value:reportData];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
     
}


-(id)example:(id)args
{
	// example method
	return @"hello world";
}

-(id)exampleProp
{
	// example property getter
	return @"hello world";
}

-(void)setExampleProp:(id)value
{
	// example property setter
}

@end
