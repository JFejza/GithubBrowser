platform :ios, '10.0'
inhibit_all_warnings!
use_frameworks!

def shared_pods
  pod 'RxSwift', '~> 3.2'
  pod 'RxCocoa', '~> 3.2'
  pod 'SVProgressHUD', '~> 2.1'
  pod 'Wrap', '~> 2.0'
  pod 'Unbox', '~> 2.3'
  pod 'Alamofire', '~> 4.3'
  pod 'SDWebImage', '~> 4.0'
  pod 'DZNEmptyDataSet', '~> 1.8'
end

target 'GithubBrowser' do
    shared_pods

    target 'GithubBrowserTests' do
        inherit! :search_paths
        pod 'FBSnapshotTestCase'
    end

end
