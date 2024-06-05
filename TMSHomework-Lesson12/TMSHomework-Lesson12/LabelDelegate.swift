//
//  LabelDelegate.swift
//  TMSHomework-Lesson12
//
//  Created by Наталья Мазур on 4.01.24.
//

import Foundation
import UIKit

protocol LabelDelegate: AnyObject {
    func receiveLabelText(labelMessage: String)
}
