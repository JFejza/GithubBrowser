

import UIKit
import SVProgressHUD
import Unbox

protocol CommonViewInterface: class {
    func showLoading()
    func showLoading(_ message:String?)
    func showFailure(_ message:String?)
    func hideLoading()
}

extension CommonViewInterface where Self:UIViewController {
    
    func showLoading() {
        SVProgressHUD.show()
    }
    
    func showLoading(_ message:String?) {
        SVProgressHUD.show(withStatus: message)
    }
    
    func showFailure(_ message:String?) {
        SVProgressHUD.showError(withStatus: message)
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
    
}

protocol CoordinatorInterface {
    var navigationController: UINavigationController {get}
    func start()
    func pop()
    func dismiss()
}

extension CoordinatorInterface {
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    func dismiss() {
        navigationController.dismiss(animated: true, completion: nil)
    }
    
}

protocol ExternalNavigatable {
    func openExternal(url: URL)
}

extension ExternalNavigatable {
    func openExternal(url: URL) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

protocol Mockable {
    static var mock: Self {get}
}
