//
//  KardiyoApp.swift
//  KardiyoApp
//
//  Created for Fat Burning Workout Program
//

import SwiftUI

@main
struct KardiyoApp: App {
    @StateObject private var workoutManager = WorkoutManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(workoutManager)
        }
    }
}

