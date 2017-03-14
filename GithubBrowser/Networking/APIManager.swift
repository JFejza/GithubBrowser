

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
        
        let fullRoute = apiUrl + route

        return Alamofire.request(fullRoute, method: method, parameters: params, encoding: URLEncoding.default, headers: nil)
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


