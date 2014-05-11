//
//  AppDelegate.h
//  YoutuBar
//
//  Created by Eric Martins on 5/4/14.
//  Copyright (c) 2014 Eric Martins. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NSEWindow.h"


@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSStatusItem *statusItem;
    IBOutlet NSSearchField *searchField;
}

@property (assign) IBOutlet NSEWindow *window;

@end
