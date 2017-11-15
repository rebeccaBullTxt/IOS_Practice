//
//  ViewController.m
//  KeychainDemo
//
//  Created by xuhaoran on 16/5/17.
//  Copyright © 2016年 house365. All rights reserved.
/*
 1.
 keychain，中文翻译成钥匙串，可以算作是Apple一切从用户需求出发的一个例子吧。目前手机和电脑早已经不仅仅是打电话和上网这些功能了，个人电脑或者智能手机可以看作是一个人的特征的标识，手机或者电脑中保存了大量用户所独有的数据信息，每个人都应当关注自己信息的保密问题。去年CSDN网站被报到出用明文保存密码，并且被黑客获取，这也提醒着大家需要注意对密码的管理。
 
 Apple应该很早就意识到了这样的问题，不过keychain项目也是几经波折才发展成现在这个样子。目前keychain的主要功能就是帮助用户安全地记住他的密码，keychain保存的密码文件都是经过加密的，其它人不能直接通过打开keychain的文件获得保存在keychain中的密码。在mac上可以安装钥匙串应用，一般情况下只有用户正确输入了mac系统的用户名和密码才能查看到用户保存在keychain中的密码。
 
 Apple还提供了使用keychain保存密码的API，如果应用程序使用了keychain API来保存密码，保存密码的结果都可以在钥匙串应用中查看到。Apple自带的浏览器Safari就是用的keychain来保存密码的，当用户在一个网页中输入了用户名和密码之后，Safari会询问用户是否需要记住密码。如果用户选择记住Safari则会采用keychain进行密码的保存，在下次用户再次访问同一个网站的时候，系统会自动进行用户名和密码的填充。同时在钥匙串程序中，可以看到Safari保存的针对特定网页的用户名，在输入了系统登录密码之后可以查看到对应的密码明文。
 
 2.
 iOS中使用keychain和userdefaults保存数据的对比
 
 userdefault适合保存一些轻量级的数据，使用userdefault保存的数据加载的时候要快一些，数据以明文的形式保存在.plist文件中，不适合用来保存密码信息。文件的位置是Library/Application Support/iPhone Simulator/模拟器版本/Applications/应用对应的数字/Library/Preference/.plist文件
 
 keychain采用的是将数据加密之后再保存到本地的，这样对数据而言有更高的安全性，适合保存密码之类的数据。数据保存的目录是Library/Application Support/iPhone Simulator/模拟器版本/Library/Keychains/
 
 3.
 对SSKeyChain中的password，service，account的理解和使用
 
 既然说到要用SSKeyChain来保存用户名和密码，那么需要使用到的SSKeyChain的功能应该就包括添加用户名和密码、删除用户名和密码、查询用户名和密码。
 
 SSKeyChain的方法中涉及到的变量主要有三个，分别如这一小节的标题所示，是password、service、account。password、account分别保存的是密码和用户名信息。service保存的是服务的类型，就是用户名和密码是为什么应用保存的一个标志。比如一个用户可以再不同的论坛中使用相同的用户名和密码，那么service保存的信息分别标识不同的论坛。由于包名通常具有一定的唯一性，通常在程序中可以用包的名称来作为service的标识。
 
 下面两张图分别展示了测试代码和测试结果。setPassword的功能是保存account、service、password的，accoutsForService是提取对应于特定service的所有accouts，从返回结果可以看出是返回结果是Array类型的，并且Array的每一个元素是以key-value格式保存的数据。如果需要找出特定的用户名的话，需要使用valueForKey@“acct”来定位用户名。（由于在这之前keychain已经保存了一个数据，所以lastObject对应的下标是2.）
 
 在具体的使用过程中，根据需求，可以用在同一个service中保存多个用户名和密码，在需要提取的时候提取最后一个，或者根据用户名来提取特定密码。也可以在同一个service中只保存一个用户名和密码，在需要保存新的用户名和密码的时候将原来保存的密码删除。
 
 */


#import "ViewController.h"
#import "SSKeychain.h"

static NSString *kKeychainService = @"com.xuhaoran.keychaindemo";
static NSString *kKeychainDeviceId    = @"KeychainDeviceId";

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UILabel *uuidLabel;
@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.uuidLabel.text = [NSString stringWithFormat:@"设备号:\n%@", [self getDeviceId]];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.accountTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.accountTextField) {
        self.accountTextField.text = nil;
        self.passwordTextField.text = nil;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.accountTextField) {
        [self.passwordTextField becomeFirstResponder];
    }
    else if (textField == self.passwordTextField) {
        [self loginAction:nil];
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField == self.accountTextField) {
        // 提取本地对一个账户密码
        NSString *localPassword = [SSKeychain passwordForService:kKeychainService account:textField.text];
        if (localPassword) {
            self.passwordTextField.text = localPassword;
        }
    }
}

#pragma mark - responce action
- (IBAction)loginAction:(id)sender {
    if (!self.accountTextField.text || !self.passwordTextField.text) {
        [self showMsg:@"输入账号和密码!"];
        return;
    }
    [self showMsg:[NSString stringWithFormat:@"账户名:%@\n密码:%@", self.accountTextField.text, self.passwordTextField.text]];
    
    // 保存对应账号密码
    [SSKeychain setPassword:self.passwordTextField.text forService:kKeychainService account:self.accountTextField.text];
}

- (IBAction)clearAction:(id)sender {
    if (!self.accountTextField.text) {
        return;
    }
    //删除对应账户下密码
    if ([SSKeychain deletePasswordForService:kKeychainService account:self.accountTextField.text]) {
        [self showMsg:[NSString stringWithFormat:@"账户%@的密码已清空!", self.accountTextField.text]];
        self.passwordTextField.text = nil;
    }
    else {
        [self showMsg:@"删除失败了"];
    }
}

- (IBAction)searchAllAction:(id)sender {
    //获取App下所有的账号
    NSArray *accounts = [SSKeychain accountsForService:kKeychainService];
    NSLog(@"accounts:\n%@", accounts);
    [self showMsg:@"看下控制台输出"];
}

#pragma mark - private method
- (NSString *)getDeviceId {
    // 读取设备号
    NSString *localDeviceId = [SSKeychain passwordForService:kKeychainService account:kKeychainDeviceId];
    if (!localDeviceId) {
        // 保存设备号
        CFUUIDRef deviceId = CFUUIDCreate(NULL);
        assert(deviceId != NULL);
        CFStringRef deviceIdStr = CFUUIDCreateString(NULL, deviceId);
        [SSKeychain setPassword:[NSString stringWithFormat:@"%@", deviceIdStr] forService:kKeychainService account:kKeychainDeviceId];
        localDeviceId = [NSString stringWithFormat:@"%@", deviceIdStr];
    }
    return localDeviceId;
}

- (void)showMsg:(NSString *)msg {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Tip" message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [self showViewController:alert sender:nil];
}

@end
