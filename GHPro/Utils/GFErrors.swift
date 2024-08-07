//
//  Errors.swift
//  GHPro
//
//  Created by Swayam Rustagi on 06/08/24.
//

import Foundation

enum GFError : String, Error{
    case invalidUsername = " Invalid username. Please try again."
    case unableToComplete = "Unable to process request, Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again"
    case invalidData = "Unable to fetch data from the server, Please try again."
}
