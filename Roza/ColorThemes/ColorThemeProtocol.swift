//
//  ColorThemeProtocol.swift
//  Roza
//
//  Created by Luka Vujnovac on 07.01.2022..
//

import Foundation
import SwiftUI

protocol ColorThemeProtocol {
    var background: Color { get }
    var primary: Color { get }
    var secondary: Color { get }
    var tertiary: Color { get }
}
