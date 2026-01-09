//
//  TransformEditorConfiguration.swift
//  MathKitApp
//
//  Created by Vitali Kurlovich on 8.01.26.
//

import Observation

@Observable
class TransformEditorConfiguration {
    var showControlPoints = true
    var isEditing = true

    var showOutline = true
    var showOrigin = false
    var showGrid = true
}
