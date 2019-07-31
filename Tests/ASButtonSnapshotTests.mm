//
//  ASButtonSnapshotTests.m
//  AsyncDisplayKitTests
//
//  Created by Rahul Malik on 7/26/19.
//  Copyright © 2019 Pinterest. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "ASSnapshotTestCase.h"

@interface ASButtonSnapshotTests : ASSnapshotTestCase

@end


@implementation ASButtonSnapshotTests

- (UIImage *)testImage
{
  NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"logo-square"
                                                                    ofType:@"png"
                                                               inDirectory:@"TestResources"];
  return [UIImage imageWithContentsOfFile:path];
}


- (void)testTintColor
{
  ASButtonNode *node = [[ASButtonNode alloc] init];
  node.tintColor = UIColor.redColor;
  [node setImage:[self testImage] forState:UIControlStateNormal];
  [node setTitle:@"Press Me"
        withFont:[UIFont systemFontOfSize:48]
       withColor:nil
        forState:UIControlStateNormal];
  node.imageNode.style.width = ASDimensionMake(200);
  node.imageNode.style.height = ASDimensionMake(200);
  ASDisplayNodeSizeToFitSize(node, CGSizeMake(1000, 1000));
  ASSnapshotVerifyNode(node, nil);
}

- (void)testTintColorWithForegroundColorSet
{
  ASButtonNode *node = [[ASButtonNode alloc] init];
  node.tintColor = UIColor.redColor;
  [node setImage:[self testImage] forState:UIControlStateNormal];
  [node setTitle:@"Press Me"
        withFont:[UIFont systemFontOfSize:48]
       withColor:[UIColor blueColor]
        forState:UIControlStateNormal];
  node.imageNode.style.width = ASDimensionMake(200);
  node.imageNode.style.height = ASDimensionMake(200);
  ASDisplayNodeSizeToFitSize(node, CGSizeMake(1000, 1000));
  ASSnapshotVerifyNode(node, nil);
}

@end
