//
//  ViewController.m
//  WFWebImage
//
//  Created by feiwu on 15/8/29.
//  Copyright (c) 2015年 feiwu. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WFWebImage.h"
#import "WFImageViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *images;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.rowHeight = 100;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSMutableArray *)images
{
    if (_images == nil) {
        _images = [NSMutableArray array];
        [_images addObject:@"http://f7.topit.me/7/05/da/1149485505634da057o.jpg"];
        [_images addObject:@"http://p3.music.126.net/grmLALHdD9rjO3UA4M0RCg==/5934064255447351.jpg"];
        [_images addObject:@"http://fe.topit.me/e/ba/e2/114762979779be2bael.jpg"];
        [_images addObject:@"http://ff.topit.me/f/67/2e/11494852070ed2e67fl.jpg"];
        [_images addObject:@"http://ia.topit.me/a/34/d4/1147448176e12d434ao.jpg"];
        [_images addObject:@"http://i7.topit.me/7/0a/1d/1149485471b231d0a7o.jpg"];
        [_images addObject:@"http://www.n63.com/zutu/n63/?N=X2hiJTI2LiU0MGFFSzAtMCUyOS0lMkIlMkMlMjglMkMlMjklMjctLTElMjk%3D&v=.jpg"];
        [_images addObject:@"http://fe.topit.me/e/60/9d/11494852702559d60eo.jpg"];
        [_images addObject:@"http://c.hiphotos.baidu.com/zhidao/pic/item/730e0cf3d7ca7bcb50d614f3bc096b63f724a8b9.jpg"];
        [_images addObject:@"http://b.hiphotos.baidu.com/zhidao/pic/item/1f178a82b9014a90f7e78cf4ad773912b21bee9a.jpg"];
        [_images addObject:@"http://d.hiphotos.baidu.com/zhidao/pic/item/a08b87d6277f9e2f24afdac91d30e924b999f35d.jpg"];
        [_images addObject:@"http://e.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=8b1e6216211f95caa6a09ab2fc275308/b3b7d0a20cf431add7fb24514f36acaf2edd98a8.jpg"];
        [_images addObject:@"http://imgsrc.baidu.com/forum/w%3D580/sign=5db490367fec54e741ec1a1689399bfd/066fd182d158ccbf100aa8321dd8bc3eb03541b1.jpg"];
        [_images addObject:@"http://s2.sinaimg.cn/mw690/002SgtrJzy6K9Aj8Ya511&690"];
        [_images addObject:@"http://imgsrc.baidu.com/forum/w%3D580/sign=60fcff01b2003af34dbadc68052ac619/9a9ff4389b504fc2834daf0de1dde71191ef6ddd.jpg"];
        [_images addObject:@"http://i3.hoopchina.com.cn/blogfile/201412/19/BbsImg141898002757435_540*360.jpg"];
        [_images addObject:@"http://imgsrc.baidu.com/forum/w%3D580/sign=3472b6359c22720e7bcee2f24bca0a3a/cf8425cf3bc79f3dc559f767bea1cd11738b2961.jpg"];
        [_images addObject:@"http://imgsrc.baidu.com/forum/w%3D580/sign=d108457f6f600c33f079dec02a4d5134/07069da20cf431ad7184c5524f36acaf2fdd98bd.jpg"];
        [_images addObject:@"http://b.hiphotos.baidu.com/zhidao/pic/item/a71ea8d3fd1f4134aeaa4701211f95cad1c85e2b.jpg"];
        [_images addObject:@"http://imgsrc.baidu.com/forum/w%3D580/sign=d32007c75adf8db1bc2e7c6c3922dddb/0f108011728b47103652fb93c7cec3fdfd0323a5.jpg"];
        [_images addObject:@"http://d.hiphotos.baidu.com/zhidao/pic/item/e61190ef76c6a7efad51b85df9faaf51f3de6651.jpg"];
        [_images addObject:@"http://f7.topit.me/7/c8/75/114744822905a75c87l.jpg"];
        [_images addObject:@"http://www.taiwan.cn/xwzx/gj/201405/W020140515350468247992.jpg"];
        [_images addObject:@"http://a.hiphotos.baidu.com/zhidao/pic/item/1e30e924b899a901649d9fdc19950a7b0308f5b4.jpg"];
        [_images addObject:@"http://imgsrc.baidu.com/forum/w%3D580/sign=7cc249fd4310b912bfc1f6f6f3fcfcb5/f09d3e600c3387445a2b213a550fd9f9d52aa0c7.jpg"];
        [_images addObject:@"http://ww1.sinaimg.cn/large/a2bb4323gw1eody3cs7ssj20jg0oe0tn.jpg"];
        [_images addObject:@"http://ent.taiwan.cn/list/201407/W020140710386349251352.jpg"];
        [_images addObject:@"http://www.taiwan.cn/xwzx/gj/201405/W020140515350468116760.jpg"];
        [_images addObject:@"http://imgsrc.baidu.com/forum/w%3D580/sign=7ab0cc75958fa0ec7fc764051696594a/b78c66fa828ba61eb0b3c6694534970a314e594b.jpg"];
        [_images addObject:@"http://imgsrc.baidu.com/forum/w%3D580/sign=b13c4e7808f3d7ca0cf63f7ec21ebe3c/3d7eca3df8dcd10093bff167768b4710b8122f89.jpg"];
        [_images addObject:@"http://s11.sinaimg.cn/mw690/9d0164cbhcfff22f5074a&690"];
        [_images addObject:@"http://np29.yule.com.cn/html/UploadPic/2012-11/201211149282031335.jpg"];
        [_images addObject:@"http://imgsrc.baidu.com/forum/w%3D580/sign=38a1ff6d3e292df597c3ac1d8c305ce2/21c6cb2f07082838b37fe656bc99a9014d08f1bf.jpg"];
        [_images addObject:@"http://imgsrc.baidu.com/forum/w%3D580/sign=15819cc6c911728b302d8c2af8fdc3b3/b8b03e63f6246b60c8b2a123eff81a4c500fa266.jpg"];
        [_images addObject:@"http://imgsrc.baidu.com/forum/w%3D580/sign=6f78bce2a0c27d1ea5263bcc2bd4adaf/2394812a2834349bb87c60c3cdea15ce37d3beb3.jpg"];
        [_images addObject:@"http://imgsrc.baidu.com/forum/w%3D580/sign=974c1873d488d43ff0a991fa4d1ed2aa/df40822a6059252dbf65a202369b033b5ab5b9fb.jpg"];
    }
    return _images;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.images.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"ImageViewCell";
    WFImageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    [cell.webImageView setWebImage:self.images[indexPath.row] placeholderImage:[UIImage imageNamed:@"mao.jpeg"]];
    
    return cell;
}

@end
