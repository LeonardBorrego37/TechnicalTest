//
//  OrientationModifier.swift
//  TechnicalTest
//
//  Created by leonard Borrego on 21/07/22.
//

import Foundation
import SwiftUI

struct OrientationDetector: ViewModifier {
  @Binding var orientation: UIDeviceOrientation

  func body(content: Content) -> some View {
    content
      .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
        orientation = UIDevice.current.orientation
      }
  }
}

extension View {
  func detectOrientation(_ binding: Binding<UIDeviceOrientation>) -> some View {
    self.modifier(OrientationDetector(orientation: binding))
  }
}
