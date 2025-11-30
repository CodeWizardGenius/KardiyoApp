//
//  WorkoutModels.swift
//  KardiyoApp
//

import Foundation

struct Exercise: Identifiable, Codable {
    let id: UUID
    let name: String
    let sets: Int
    let reps: Int
    var isCompleted: Bool
    
    init(name: String, sets: Int, reps: Int, isCompleted: Bool = false) {
        self.id = UUID()
        self.name = name
        self.sets = sets
        self.reps = reps
        self.isCompleted = isCompleted
    }
}

struct CardioSession: Identifiable, Codable {
    let id: UUID
    let name: String
    let duration: Int // dakika
    var isCompleted: Bool
    
    init(name: String, duration: Int, isCompleted: Bool = false) {
        self.id = UUID()
        self.name = name
        self.duration = duration
        self.isCompleted = isCompleted
    }
}

struct WorkoutDay: Identifiable, Codable {
    let id: UUID
    let dayName: String
    let color: String
    var warmup: [CardioSession]
    var exercises: [Exercise]
    var cardio: [CardioSession]
    var isCompleted: Bool
    let date: Date?
    
    init(dayName: String, color: String, warmup: [CardioSession], exercises: [Exercise], cardio: [CardioSession], isCompleted: Bool = false, date: Date? = nil) {
        self.id = UUID()
        self.dayName = dayName
        self.color = color
        self.warmup = warmup
        self.exercises = exercises
        self.cardio = cardio
        self.isCompleted = isCompleted
        self.date = date
    }
}

enum DayOfWeek: String, CaseIterable {
    case monday = "Pazartesi"
    case tuesday = "Salı"
    case wednesday = "Çarşamba"
    case thursday = "Perşembe"
    case friday = "Cuma"
    case saturday = "Cumartesi"
    case sunday = "Pazar"
}

