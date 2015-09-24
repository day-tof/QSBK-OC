//
//  QiushiItemCell.m
//  Qiushibaike
//
//  Created by 王龙龙 on 15/5/13.


#import "QiushiItemCell.h"
#import "ControlPad.h"
#import "UIImageView+WebCache.h"
@interface QiushiItemCell ()

@property (nonatomic, retain) UIImageView *userAvatar;//用户头像
@property (nonatomic, retain) UILabel *userLable; //用户名
@property (nonatomic, retain) UILabel *contentLable;//糗事内容
@property (nonatomic, retain) UILabel *pDateLable;//发布时间
@property (nonatomic, retain) ControlPad *controlPad;//控制面板

@end

@implementation QiushiItemCell
-(void)dealloc {
    [_userAvatar release];
    [_userLable release];
    [_contentLable release];
    [_pDateLable release];
    [_controlPad release];
    [super dealloc];
}

-(UIImageView *)userAvatar {
    if (!_userAvatar) {
        self.userAvatar = [[[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 45, 45)] autorelease];
        _userAvatar.image = [UIImage imageNamed:@"default_avatar"];
        _userAvatar.layer.cornerRadius = 22.5;
        _userAvatar.layer.masksToBounds = YES;
        [self.contentView addSubview:self.userAvatar];
    }
    return _userAvatar;
}

- (UILabel *)userLable {
    if (!_userLable) {
        self.userLable = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 300, 45)];
        _userLable.textAlignment = NSTextAlignmentLeft;
        _userLable.textColor = [UIColor orangeColor];
        _userLable.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.userLable];
    }
    return _userLable;
}

- (UILabel *)contentLable {
    if (!_contentLable) {
        self.contentLable = [[[UILabel alloc] initWithFrame:CGRectMake(10, 65, [UIScreen mainScreen].bounds.size.width - 20, 0)] autorelease];
        _contentLable.font = [UIFont systemFontOfSize:15];
        _contentLable.numberOfLines = 0;//不限制行数
        _contentLable.textColor = [UIColor darkGrayColor];
        [self.contentView addSubview:_contentLable];
    }
    return _contentLable;
}

- (UILabel *)pDateLable {
    if (!_pDateLable) {
        self.pDateLable = [[[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 20)] autorelease];
        _pDateLable.font = [UIFont systemFontOfSize:13];
        _pDateLable.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_pDateLable];
    }
    return _pDateLable;
}

- (ControlPad *)controlPad {
    if (!_controlPad) {
        self.controlPad = [[[ControlPad alloc] initWithFrame:CGRectZero] autorelease];
        [self.contentView addSubview:_controlPad];
    }
    return _controlPad;
}
-(void)configureCellWithModel:(QiushiContentModel *)model{

    if (model.item.user) {
        self.userLable.text = model.item.user.login;
        self.userLable.textColor = [UIColor orangeColor];
        [self.userAvatar sd_setImageWithURL:[NSURL URLWithString:model.item.user.icon] placeholderImage:[UIImage imageNamed:@"default_avatar"]];
    } else {
        self.userLable.text = @"匿名人士";
        self.userLable.textColor = [UIColor grayColor];
        self.userAvatar.image = [UIImage imageNamed:@"user_icon_anonymous"];
    }
    self.contentLable.text = model.item.content;
    CGRect frame = self.contentLable.frame;
    frame.size.height = model.contentRect.size.height;
    self.contentLable.frame = frame;
    self.pDateLable.text = [NSString stringWithFormat:@"发布:%@ • 评论:%@",model.item.published_at,model.item.comments_count];

    CGRect pDateFrame = self.pDateLable.frame;
    pDateFrame.origin.y = model.pDateOriginY;
    self.pDateLable.frame = pDateFrame;

    CGRect controlPadFrame = self.controlPad.frame;
    controlPadFrame.origin.y = model.controlPadOriginY;
    self.controlPad.frame = controlPadFrame;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
