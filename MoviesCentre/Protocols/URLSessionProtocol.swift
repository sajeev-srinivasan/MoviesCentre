//
//  URLSessionProtocol.swift
//  MoviesCentre
//
//  Created by Sajeev S on 14/09/22.
//

import Foundation

typealias DataTaskCompletionHandler = (Data?, URLResponse?, Error?) -> Void

protocol URLSessionProtocol {
  func dataTask(
    with request: URLRequest,
    completionHandler: @escaping DataTaskCompletionHandler
  ) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol { }
