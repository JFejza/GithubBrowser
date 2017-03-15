

import Foundation
import Unbox
import Wrap
import Alamofire

struct APIManager {
    
    func execute(method: HTTPMethod, route: String, params: Parameters? = nil, success: @escaping ([String: Any]) -> (), failure: @escaping ((Error) -> ())) -> Request? {
        
        let fullRoute = apiUrl + route

        return Alamofire.request(fullRoute, method: method, parameters: params, encoding: URLEncoding.default, headers: nil)
            .responseJSON { (response) in
                switch response.result {
                case .success:
                    if let json = response.result.value as? [String: Any] {
                        success(json)
                    } else {
                        failure(response.error!)
                        
                    }
                case .failure(_):
                    failure(response.error!)
                }
        }
    }
}


