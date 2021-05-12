//
//  APIType.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 12.05.2021.
//

import Foundation

protocol APIType {
    
    func item(id: Int, _ completion: @escaping (Result<Item, Error>) -> Void)
    
    func topStories(_ completion: @escaping (Result<[Int], Error>) -> Void)
    
    func newStories(_ completion: @escaping (Result<[Int], Error>) -> Void)
    
    func bestStories(_ completion: @escaping (Result<[Int], Error>) -> Void)
    
    func user(id: String, _ completion: @escaping (Result<User, Error>) -> Void)
    
}
