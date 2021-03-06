#import "AppDelegate.h"
#import "ViewController.h"
#import "DDLog.h"
#import "DDTTYLogger.h"

// Log levels: off, error, warn, info, verbose
static const int ddLogLevel = LOG_LEVEL_VERBOSE;


@implementation AppDelegate

@synthesize window;
@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// Standard lumberjack initialization
	
	[DDLog addLogger:[DDTTYLogger sharedInstance]];
	
	// And we're going to enable colors
	
	[[DDTTYLogger sharedInstance] setColorsEnabled:YES];
	
	// Check out default colors:
	// Error : Red
	// Warn  : Orange
	
	DDLogError(@"Paper jam");
	DDLogWarn(@"Toner is low");
	DDLogInfo(@"Warming up printer (pre-customization)");
	DDLogVerbose(@"Intializing protcol x26");
	
	// Now let's do some customization:
	// Info  : Pink
	
	UIColor *pink = [UIColor colorWithRed:(255/255.0) green:(58/255.0) blue:(159/255.0) alpha:1.0];
	
	[[DDTTYLogger sharedInstance] setForegroundColor:pink backgroundColor:nil forFlag:LOG_FLAG_INFO];
	
	DDLogInfo(@"Warming up printer (post-customization)");
	
	// Normal iOS UI stuff
	
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
	self.window.rootViewController = self.viewController;
	[self.window makeKeyAndVisible];
	return YES;
}

@end
