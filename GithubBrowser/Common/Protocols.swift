

import UIKit
import SVProgressHUD

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
