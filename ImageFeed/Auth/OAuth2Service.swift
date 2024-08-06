//
//  OAuth2Service.swift
//  ImageFeed
//
//  Created by Mark Balikoti on 31.07.2024.
//

import Foundation

final class OAuth2Service {
    
    // MARK: - Public Properties
    
    static let shared = OAuth2Service()
    weak var delegate: AuthViewControllerDelegate?
    
    // MARK: - Initializers
    
    private init() {}
    
    // MARK: - Public Methods
    
    func make0AuthTokenRequest(with code: String) -> URLRequest? {
        let baseURL = URL(string: "https:/unsplash.com")
        guard let url = URL(string: "\(Constants.baseURL)"
                            + "?client_id=\(Constants.accessKey)"
                            + "&&client_secret=\(Constants.secretKey)"
                            + "&&redirect_uri=\(Constants.redirectURI)"
                            + "&&code=\(code)"
                            + "&&grant_type=authorization_code",
                            relativeTo: baseURL
        ) else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        return request
    }
    
    func fetchOAuthToken(code: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let request = make0AuthTokenRequest(with: code) else {
            completion(.failure(NetworkError.invalidURL))
            print("Invalid fetch token request")
            return
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let task = URLSession.shared.data(for: request) { result in
            switch result {
            case .success(let data):
                do {
                    let response = try decoder.decode(OAuthTokenResponseBody.self, from: data)
                    let tokenStorage = OAuth2TokenStorage()
                    tokenStorage.bearerToken = response.access_token
                    completion(.success("\(response.access_token)"))
                } catch {
                    print("Error decoding OAuthTokenResponseBody: \(error)")
                    completion(.failure(NetworkError.invalidJSON))
                }
            case .failure(let error):
                print("Network error occurred: \(error)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
