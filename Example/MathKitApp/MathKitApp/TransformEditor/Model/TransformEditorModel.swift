//
//  TransformEditorModel.swift
//  MathKitApp
//
//  Created by Vitali Kurlovich on 8.01.26.
//

import Observation
import SwiftUI

@Observable
class TransformEditorModel {
    var p0: CGPoint = .zero
    var p1: CGPoint = .zero
    var p2: CGPoint = .zero
    var p3: CGPoint = .zero

    var contentFrame: CGRect = .zero

    func update(with frame: CGRect) {
        p0 = .init(x: frame.minX, y: frame.minY)
        p1 = .init(x: frame.maxX, y: frame.minY)
        p2 = .init(x: frame.maxX, y: frame.maxY)
        p3 = .init(x: frame.minX, y: frame.maxY)

        contentFrame = frame
    }

    func reset() {
        update(with: contentFrame)
    }
}
