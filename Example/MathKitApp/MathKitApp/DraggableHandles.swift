//
//  DraggableHandles.swift
//  MathKitApp
//
//  Created by Vitali Kurlovich on 1.01.26.
//

import SwiftUI

struct DraggableHandles: View {
    enum DragState {
        case inactive
        case pressing
        case dragging(DragGesture.Value)

        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case let .dragging(value):
                return value.translation
            }
        }
    }

    @Binding
    var location: CGPoint

    @GestureState private var dragState = DragState.inactive

    init(_ location: Binding<CGPoint>) {
        _location = location
    }

    var body: some View {
        let dragGesture = DragGesture()
            .updating($dragState) { value, _, _ in
                var newLocation = location
                newLocation.x += value.translation.width
                newLocation.y += value.translation.height
                location = newLocation
            }
            .onEnded { drag in
                var newLocation = location
                newLocation.x += drag.translation.width
                newLocation.y += drag.translation.height

                location = newLocation
            }

        return Image(systemName: "circlebadge.fill")
            .foregroundStyle(Color.accentColor.gradient)
            .gesture(dragGesture)
    }
}
