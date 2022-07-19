//
//  NetworkServiceContract.swift
//  TechnicalTestData


import Foundation

public enum APIContentType: String {
    case json = "application/json"
    case formURLencoded = "application/x-www-form-urlencoded"
    case jpeg = "image/jpeg"
    case png = "image/png"
    case anyImage = "image/*"
    case pdf = "application/pdf"
    case anyDocument = "application/*"
    case any = "*/*"
}
