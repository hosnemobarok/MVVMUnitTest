//
//  NetworkResult.swift
//  NewsExplorer
//
//  Created by Md Hosne Mobarok on 1/1/26.
//


import Foundation

enum NetworkResult<DataType, ErrorType: Error> {
    case success(DataType)
    case failure(ErrorType)
}
