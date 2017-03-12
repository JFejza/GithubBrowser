

import UIKit
import SVProgressHUD

protocol CommonViewInterface: class {
    func showLoading()
    func showLoading(_ message:String?)
    func showSuccess(_ message:String?)
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
    
    func showSuccess(_ message:String?) {
        if message != nil {
            self.present(Alerter.alert(for: message!), animated: true, completion: nil)
        } else {
            SVProgressHUD.showSuccess(withStatus: "")
        }
    }
    
    func showFailure(_ message:String?) {
        SVProgressHUD.dismiss()
        if message != nil {
            self.present(Alerter.alert(for: message!), animated: true, completion: nil)
        } else {
            SVProgressHUD.showError(withStatus: "")
        }
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
