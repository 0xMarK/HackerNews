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
        guard let url = URL(string: baseURL + "/item/\(id).json") else { fatalError() }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                let err = error ?? NSError(domain: NSURLErrorDomain, code: 0, userInfo: [NSLocalizedDescriptionKey: "No data in response"])
                DispatchQueue.main.async {
                    completion(.failure(err))
                }
                return
            }
            do {
                let item = try JSONDecoder().decode(Item.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(item))
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    func topStories(_ completion: @escaping (Result<[Int], Error>) -> Void) {
        guard let url = URL(string: baseURL + "/topstories.json") else { fatalError() }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                let err = error ?? NSError(domain: NSURLErrorDomain, code: 0, userInfo: [NSLocalizedDescriptionKey: "No data in response"])
                DispatchQueue.main.async {
                    completion(.failure(err))
                }
                return
            }
            do {
                let ids = try JSONDecoder().decode([Int].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(ids))
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    func newStories(_ completion: @escaping (Result<[Int], Error>) -> Void) {
        guard let url = URL(string: baseURL + "/newstories.json") else { fatalError() }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                let err = error ?? NSError(domain: NSURLErrorDomain, code: 0, userInfo: [NSLocalizedDescriptionKey: "No data in response"])
                DispatchQueue.main.async {
                    completion(.failure(err))
                }
                return
            }
            do {
                let ids = try JSONDecoder().decode([Int].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(ids))
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    func bestStories(_ completion: @escaping (Result<[Int], Error>) -> Void) {
        guard let url = URL(string: baseURL + "/beststories.json") else { fatalError() }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                let err = error ?? NSError(domain: NSURLErrorDomain, code: 0, userInfo: [NSLocalizedDescriptionKey: "No data in response"])
                DispatchQueue.main.async {
                    completion(.failure(err))
                }
                return
            }
            do {
                let ids = try JSONDecoder().decode([Int].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(ids))
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }

}
