//
//  QiushiViewController.m
//  Qiushibaike
//
//  Created by 王龙龙 on 15/5/8.


#import "QiushiViewController.h"
#import "NetworkEngine.h"
#import "QiushiItemCell.h"
#import "LoadingCell.h"

#define kQiushiTextAPIFormat @"http://m2.qiushibaike.com/article/list/text?count=50&page=%d&AdID=14314020462881C8509990"

@interface QiushiViewController ()<NetworkEngineDelegate>//遵守协议
@property (nonatomic, retain) NSMutableArray *datasource;//保存模型对象，为表视图提供数据

//根据页码下载数据
- (void)_startLoadingDataWithPage:(int)page;
@property (nonatomic, assign) int pageNumber;

@end

@implementation QiushiViewController

-(void)_startLoadingDataWithPage:(int)page {
    NetworkEngine *engine = [NetworkEngine engineWithURL:[NSURL URLWithString:[NSString stringWithFormat:kQiushiTextAPIFormat ,page]] parameters:nil delegate:self];
    [engine start];
}


-(void)dealloc {
    [_datasource release];
    [super dealloc];
}

-(NSMutableArray *)datasource {
    if (!_datasource) {
        self.datasource = [NSMutableArray array];
    }
    return _datasource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    self.navigationItem.titleView = imageView;


    [self.tableView registerClass:[QiushiItemCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[LoadingCell class] forCellReuseIdentifier:@"loading"];

    self.refreshControl = [[[UIRefreshControl alloc] init] autorelease];      //tableviewcontroll的子类
    [self.refreshControl addTarget:self action:@selector(handleRefreshAction:) forControlEvents:UIControlEventValueChanged];
    //调用加载方法
    self.pageNumber = 1;
    [self _startLoadingDataWithPage:self.pageNumber];
    [self.refreshControl beginRefreshing];//开始刷新

 }

- (void)handleRefreshAction:(UIRefreshControl *)sender {
//    将page重置为1
    self.pageNumber = 1;
    [self _startLoadingDataWithPage:self.pageNumber];
}



- (void)networkDidFinishLoading:(NetworkEngine *)engine withInfo:(id)info {
    [self.refreshControl endRefreshing];//结束刷新
    if (self.pageNumber == 1) {
        [self.datasource removeAllObjects];//移除之前保存的糗事
    }
    //让页码自增
    self.pageNumber++;


    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:info options:NSJSONReadingMutableContainers error:nil];
    NSArray *items = dict[@"items"];
//    数组items中存储的是糗事字典
    for (NSDictionary *dict in items) {
        QiushiContentModel *model = [QiushiContentModel contentWithDictionary:dict];
        [self.datasource addObject:model];
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    if (self.datasource.count == 0) {
        return 0;
    }
    return self.datasource.count + 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == self.datasource.count) {
        return [tableView dequeueReusableCellWithIdentifier:@"loading" forIndexPath:indexPath];
    }
    QiushiItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    QiushiContentModel *model = self.datasource[indexPath.row];
    [cell configureCellWithModel:model];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
//    cell.textLabel.text = anItem.content;
//    cell.textLabel.numberOfLines = 0;
    // Configure the cell...
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.datasource.count) {
        return 40;
    }
    QiushiContentModel *model = self.datasource[indexPath.row];
    return model.rowHeight;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //表视图在滑动过程中将要显示单元格时会响应该方法，
    if([cell isKindOfClass:[LoadingCell class]] && self.datasource.count == indexPath.row)
    {
        [(LoadingCell *)cell startLoading];
        [self _startLoadingDataWithPage:self.pageNumber];
    }
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
