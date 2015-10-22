//
//  ViewController.m
//  ScrollViewAutoLayoutTest
//
//  Created by hyq on 15/1/27.
//  Copyright (c) 2015年 Grey. All rights reserved.
//

#import "ViewController.h"
#import "MyCustomCell.h"

@interface ViewController ()
@property (nonatomic,strong) NSMutableArray *testArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupViews];
}

- (void)setupViews{
    _testArray = [@[] mutableCopy];
    for (int i = 0; i < 100; i++) {
        NSDictionary *dic = @{kRequestContent:[NSString stringWithFormat:@"[%d]看清了很多人，却不能随意拆穿；讨厌着很多人，却又不能轻易翻脸。有时候，生活就是要逼自己变得逆来顺受，宠辱不惊.",i],kRequestIcon:@"http://img0.bdstatic.com/img/image/shouye/sheying0128.jpg"};
        [_testArray addObject:dic];
    }
    
    _infolabel.text=@"OK，我们建立了ContainerView与mainview的equal width与 equal height后，效果果然就是我们想要的。 关于Autolayout与Scrollview相遇的故事，我们就先讲到这里，关于布局的场景总是像国际象棋一样，有数不尽的步骤与结果，连Machine都可以为之苦恼，所以这里只是通过这么一个示例，让大家对autolayout的布局理念有一个更深入的认识，不要过多的去抓鱼，而要学会如何抓鱼，抓鱼的诀窍是什么，学习一门技术，大家都会有各自的体会与理解，从根本上去掌握技术的原理，以此来应对千变万化的场景才能事半功倍。OK，我们建立了ContainerView与mainview的equal width与 equal height后，效果果然就是我们想要的。 关于Autolayout与Scrollview相遇的故事，我们就先讲到这里，关于布局的场景总是像国际象棋一样，有数不尽的步骤与结果，连Machine都可以为之苦恼，所以这里只是通过这么一个示例，让大家对autolayout的布局理念有一个更深入的认识，不要过多的去抓鱼，而要学会如何抓鱼，抓鱼的诀窍是什么，学习一门技术，大家都会有各自的体会与理解，从根本上去掌握技术的原理，以此来应对千变万化的场景才能事半功倍";
//    [_infolabel sizeToFit];
    
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
    return _testArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     static NSString *CellIdentifier = @"MyCustomCell";
     MyCustomCell *cell = (MyCustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
     if (cell == nil) {
         NSArray *array = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
         cell = [array objectAtIndex:0];
     }
     NSDictionary *dic = [_testArray objectAtIndex:indexPath.row];
     [cell updateCellContentWith:dic];
     if(_iTableView.frame.size.height != _iTableView.contentSize.height)
     {
         CGRect newFrame = _iTableView.frame;
         newFrame.size = _iTableView.contentSize;
         _iTableView.frame = newFrame;
         _iScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, _iTableView.frame.origin.y + newFrame.size.height);
         
     }
     return cell;
}
@end
