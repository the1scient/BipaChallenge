import Foundation

enum APIEndpoint {
    case nodes
}

extension APIEndpoint {
    var request: URLRequest {
        var request = URLRequest(url: url)
        request.addHeaders(headers)
        return request
    }
    
    private var url: URL {
        URL(string: "https://mempool.space/api/v1/lightning")!
            .appendingPathComponent(path)
    }
    
    private var path: String {
        switch self {
        case .nodes:
            return "nodes/rankings/connectivity"
        }
    }
    
    private var headers: [String: String] {
        [
            "Content-Type": "application/json"
        ]
    }
}

fileprivate extension URLRequest {
    mutating func addHeaders(_ headers: [String: String]) {
        headers.forEach { header, value in
            addValue(value, forHTTPHeaderField: header)
        }
    }
}
