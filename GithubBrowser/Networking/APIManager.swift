

import Foundation
import Unbox
import Wrap
import Alamofire

struct APIManager {
    
    let reachability = Reachability.networkReachabilityForInternetConnection()
    
    func execute(method: HTTPMethod, route: String, params: Parameters? = nil, success: @escaping ([String: Any]) -> (), failure: @escaping ((String) -> ())) -> Request? {
        
        if let reachy = reachability {
            if !reachy.isReachable {
                failure(UIStrings.noInternetNoCache)
                return nil
            }
        }

        return Alamofire.request(route, method: method, parameters: params, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { (response) in
                switch response.result {
                case .success:
                    if let json = response.result.value as? [String: Any] {
                        success(json)
                    } else {
                        failure(UIStrings.requestFailed)
                        
                    }
                case .failure(_):
                    failure(UIStrings.requestFailed)
                }
        }
    }
}


