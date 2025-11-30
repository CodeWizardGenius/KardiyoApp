//
//  WorkoutManager.swift
//  KardiyoApp
//

import Foundation
import SwiftUI

class WorkoutManager: ObservableObject {
    @Published var weeklyProgram: [WorkoutDay] = []
    @Published var currentWeekStart: Date = Date()
    
    private let userDefaults = UserDefaults.standard
    private let workoutKey = "savedWorkouts"
    private let weekStartKey = "currentWeekStart"
    
    init() {
        loadWorkouts()
    }
    
    func loadWorkouts() {
        // Haftanın başlangıcını kontrol et (Pazartesi)
        let calendar = Calendar.current
        let today = Date()
        let weekday = calendar.component(.weekday, from: today)
        let daysFromMonday = (weekday + 5) % 7 // Pazartesi = 0
        
        if let savedWeekStart = userDefaults.object(forKey: weekStartKey) as? Date {
            let daysSince = calendar.dateComponents([.day], from: savedWeekStart, to: today).day ?? 0
            if daysSince >= 7 {
                // Yeni hafta başladı, programı sıfırla
                resetWeek()
            } else {
                currentWeekStart = savedWeekStart
            }
        } else {
            // İlk açılış
            if let monday = calendar.date(byAdding: .day, value: -daysFromMonday, to: today) {
                currentWeekStart = calendar.startOfDay(for: monday)
                userDefaults.set(currentWeekStart, forKey: weekStartKey)
            }
        }
        
        // Programı yükle veya oluştur
        if let data = userDefaults.data(forKey: workoutKey),
           let decoded = try? JSONDecoder().decode([WorkoutDay].self, from: data) {
            weeklyProgram = decoded
        } else {
            weeklyProgram = WorkoutData.shared.getWeeklyProgram()
            saveWorkouts()
        }
    }
    
    func resetWeek() {
        weeklyProgram = WorkoutData.shared.getWeeklyProgram()
        let calendar = Calendar.current
        let today = Date()
        let weekday = calendar.component(.weekday, from: today)
        let daysFromMonday = (weekday + 5) % 7
        if let monday = calendar.date(byAdding: .day, value: -daysFromMonday, to: today) {
            currentWeekStart = calendar.startOfDay(for: monday)
            userDefaults.set(currentWeekStart, forKey: weekStartKey)
        }
        saveWorkouts()
    }
    
    func toggleExercise(dayId: UUID, exerciseId: UUID) {
        if let dayIndex = weeklyProgram.firstIndex(where: { $0.id == dayId }),
           let exerciseIndex = weeklyProgram[dayIndex].exercises.firstIndex(where: { $0.id == exerciseId }) {
            weeklyProgram[dayIndex].exercises[exerciseIndex].isCompleted.toggle()
            checkDayCompletion(dayIndex: dayIndex)
            saveWorkouts()
        }
    }
    
    func toggleCardio(dayId: UUID, cardioId: UUID) {
        if let dayIndex = weeklyProgram.firstIndex(where: { $0.id == dayId }) {
            if let warmupIndex = weeklyProgram[dayIndex].warmup.firstIndex(where: { $0.id == cardioId }) {
                weeklyProgram[dayIndex].warmup[warmupIndex].isCompleted.toggle()
            } else if let cardioIndex = weeklyProgram[dayIndex].cardio.firstIndex(where: { $0.id == cardioId }) {
                weeklyProgram[dayIndex].cardio[cardioIndex].isCompleted.toggle()
            }
            checkDayCompletion(dayIndex: dayIndex)
            saveWorkouts()
        }
    }
    
    private func checkDayCompletion(dayIndex: Int) {
        let day = weeklyProgram[dayIndex]
        let allExercisesDone = day.exercises.allSatisfy { $0.isCompleted }
        let allWarmupDone = day.warmup.allSatisfy { $0.isCompleted }
        let allCardioDone = day.cardio.allSatisfy { $0.isCompleted }
        
        weeklyProgram[dayIndex].isCompleted = allExercisesDone && allWarmupDone && allCardioDone
    }
    
    func getProgress() -> Double {
        let totalDays = weeklyProgram.count
        let completedDays = weeklyProgram.filter { $0.isCompleted }.count
        return totalDays > 0 ? Double(completedDays) / Double(totalDays) : 0.0
    }
    
    private func saveWorkouts() {
        if let encoded = try? JSONEncoder().encode(weeklyProgram) {
            userDefaults.set(encoded, forKey: workoutKey)
        }
    }
    
    func getDayForToday() -> WorkoutDay? {
        let calendar = Calendar.current
        let today = Date()
        let weekday = calendar.component(.weekday, from: today)
        let dayIndex = (weekday + 5) % 7 // Pazartesi = 0
        
        if dayIndex < weeklyProgram.count {
            return weeklyProgram[dayIndex]
        }
        return nil
    }
}

