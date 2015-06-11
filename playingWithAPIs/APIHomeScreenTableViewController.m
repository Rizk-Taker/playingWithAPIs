//
//  APIHomeScreenTableViewController.m
//  
//
//  Created by Cooper Veysey on 6/6/15.
//
//

#import "APIHomeScreenTableViewController.h"
#import "API.h"
#import "APIHomeScreenTableViewCell.h"

@interface APIHomeScreenTableViewController ()

@end

@implementation APIHomeScreenTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden: YES];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
//    [self.tabBarController]
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.APIs count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    APIHomeScreenTableViewCell *cell = (APIHomeScreenTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"APIHomeScreenTableViewCell"];
//    
//    PlayerCell *cell = (PlayerCell *)[tableView dequeueReusableCellWithIdentifier:@"PlayerCell"];
    
    
    API *api = (self.APIs)[indexPath.row];
    cell.APILogo.image = [UIImage imageNamed:api.fileNameOfLogo];
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([api.fileNameOfLogo isEqualToString:@"SpotifyLogox2.png"])
    {
        cell.backgroundColor = [UIColor blackColor];
    }
    if ([api.fileNameOfLogo isEqualToString:@"TwilioLogox2.png"])
    {
        cell.backgroundColor = [UIColor blackColor];
    }
    if ([api.fileNameOfLogo isEqualToString:@"GoogleMapsLogoTransBack.png"])
    {
        cell.backgroundColor = [UIColor whiteColor];
    }
    if ([api.fileNameOfLogo isEqualToString:@"VenmoLogox2.png"])
    {
        cell.backgroundColor = [UIColor colorWithRed:86.0/255.0 green:152.0/255.0 blue:204.0/255.0 alpha:1.0];
    }

    if (indexPath.row == 1) {
        tableView.separatorColor = [UIColor blackColor];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//     Navigation logic may go here, for example:
    
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:@"SpotifyStoryboardSegueIdentifier" sender:nil];
    }
    if (indexPath.row == 1) {
        [self performSegueWithIdentifier:@"TwilioStoryboardSegueIdentifier" sender:nil];
    }
    if (indexPath.row == 2) {
        [self performSegueWithIdentifier:@"GoogleMapsStoryboardSegueIdentifier" sender:nil];
    }
    if (indexPath.row == 3) {
        [self performSegueWithIdentifier:@"VenmoStoryboardSegueIdentifier" sender:nil];
    }
}

//     Create the next view controller.
//    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
//    
//     Pass the selected object to the new view controller.
//    
//     Push the view controller.
//    [self.navigationController pushViewController:detailViewController animated:YES];
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
