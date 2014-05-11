//
//  AppDelegate.m
//  YoutuBar
//
//  Created by Eric Martins on 5/4/14.
//  Copyright (c) 2014 Eric Martins. All rights reserved.
//

#import "AppDelegate.h"
#import "JFHotkeyManager.h"

@implementation AppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification{
    [NSApp activateIgnoringOtherApps:YES];
    JFHotkeyManager *hkm = [[JFHotkeyManager alloc] init];
    [hkm bind:@"command shift space" target:self action:@selector(openWindow)];
}

-(void)awakeFromNib{
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [statusItem setAction:@selector(openWindow)];
    [statusItem setHighlightMode:YES];
    [statusItem setImage:[NSImage imageNamed:@"image"]];
    [statusItem setAlternateImage:[NSImage imageNamed:@"alternate_image"]];
}

- (IBAction)goToYoutube:(id)sender {
    if(![[searchField stringValue]length] == 0){
        NSString *url = @"http://www.youtube.com/results?q=";
        url = [url stringByAppendingString:[searchField stringValue]];
        url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [window close];
        [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:url]];
    }
}


-(void)openWindow{
    [NSApp activateIgnoringOtherApps:YES];
    [window makeKeyAndOrderFront:nil];
    [searchField selectText:self];
    [[searchField currentEditor] setSelectedRange:NSMakeRange([[searchField stringValue] length], 0)];
}

-(IBAction)quit:(id)sender{
    [NSApp terminate:nil];
}


@end
