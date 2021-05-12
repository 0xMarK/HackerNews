//
//  API.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 11.05.2021.
//

import Foundation

class API {
    
    let baseURL: String = "https://hacker-news.firebaseio.com/v0"
    
    func item(id: Int, _ completion: @escaping (Result<Item, Error>) -> Void) {
        get(url: baseURL + "/item/\(id).json", completion)
    }
    
    func topStories(_ completion: @escaping (Result<[Int], Error>) -> Void) {
        get(url: baseURL + "/topstories.json", completion)
    }
    
    func newStories(_ completion: @escaping (Result<[Int], Error>) -> Void) {
        get(url: baseURL + "/newstories.json", completion)
    }
    
    func bestStories(_ completion: @escaping (Result<[Int], Error>) -> Void) {
        get(url: baseURL + "/beststories.json", completion)
    }
    
    func user(id: String, _ completion: @escaping (Result<User, Error>) -> Void) {
        get(url: baseURL + "/user/\(id).json", completion)
    }
    
    private func get<T: Decodable>(url urlString: String, _ completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else { fatalError() }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                let err = error ?? NSError(domain: NSURLErrorDomain, code: 0, userInfo: [NSLocalizedDescriptionKey: "No data in response"])
                DispatchQueue.main.async {
                    completion(.failure(err))
                }
                return
            }
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decoded))
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
}
