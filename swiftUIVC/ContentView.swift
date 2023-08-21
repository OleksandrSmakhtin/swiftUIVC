//
//  ContentView.swift
//  swiftUIVC
//
//  Created by Oleksandr Smakhtin on 13/08/2023.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        MyViewControllerWrapper()
            .edgesIgnoringSafeArea(.all) // cover the entire screen
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MyViewControllerWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = FirstVC // Replace with the actual UIViewController subclass you want to use

    func makeUIViewController(context: Context) -> FirstVC {
        return FirstVC() // Instantiate Controller here
    }

    func updateUIViewController(_ uiViewController: FirstVC, context: Context) {
        //update your UIViewController if needed
    }
}
