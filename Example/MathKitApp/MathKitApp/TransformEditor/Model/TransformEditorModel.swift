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

    var offset: CGSize = .zero

    var image: Image?

    func update(local frame: CGRect, global: CGRect) {
        p0 = .init(x: frame.minX, y: frame.minY)
        p1 = .init(x: frame.maxX, y: frame.minY)
        p2 = .init(x: frame.maxX, y: frame.maxY)
        p3 = .init(x: frame.minX, y: frame.maxY)

        let width = global.minX - frame.minX
        let height = global.minY - frame.minY

        offset = .init(width: width, height: height)

        contentFrame = frame
    }

    func reset() {
        p0 = .init(x: contentFrame.minX, y: contentFrame.minY)
        p1 = .init(x: contentFrame.maxX, y: contentFrame.minY)
        p2 = .init(x: contentFrame.maxX, y: contentFrame.maxY)
        p3 = .init(x: contentFrame.minX, y: contentFrame.maxY)
    }
}
