//
//  WorkoutData.swift
//  KardiyoApp
//

import Foundation

class WorkoutData {
    static let shared = WorkoutData()
    
    func getWeeklyProgram() -> [WorkoutDay] {
        return [
            // PAZARTESİ – Göğüs & Triceps + Yüksek Kardiyo
            WorkoutDay(
                dayName: "Pazartesi",
                color: "green",
                warmup: [
                    CardioSession(name: "Koşu Bandı", duration: 10)
                ],
                exercises: [
                    Exercise(name: "Chest Press", sets: 3, reps: 12),
                    Exercise(name: "Butterfly", sets: 3, reps: 15),
                    Exercise(name: "Triceps Pushdown", sets: 3, reps: 15)
                ],
                cardio: [
                    CardioSession(name: "Eliptik", duration: 20),
                    CardioSession(name: "Bisiklet", duration: 10)
                ]
            ),
            
            // SALI – Sırt & Biceps + Yüksek Kardiyo
            WorkoutDay(
                dayName: "Salı",
                color: "blue",
                warmup: [
                    CardioSession(name: "Bisiklet", duration: 10)
                ],
                exercises: [
                    Exercise(name: "Seated Row", sets: 3, reps: 12),
                    Exercise(name: "Lat Pulldown", sets: 3, reps: 12),
                    Exercise(name: "Biceps Machine", sets: 3, reps: 15)
                ],
                cardio: [
                    CardioSession(name: "Koşu Bandı", duration: 20),
                    CardioSession(name: "Eliptik", duration: 10)
                ]
            ),
            
            // ÇARŞAMBA – Bacak + Kardiyo
            WorkoutDay(
                dayName: "Çarşamba",
                color: "yellow",
                warmup: [
                    CardioSession(name: "Eliptik", duration: 10)
                ],
                exercises: [
                    Exercise(name: "Squat / Rack", sets: 3, reps: 10),
                    Exercise(name: "Leg Extension", sets: 3, reps: 15),
                    Exercise(name: "Leg Curl", sets: 3, reps: 15)
                ],
                cardio: [
                    CardioSession(name: "Bisiklet", duration: 20),
                    CardioSession(name: "Koşu Bandı", duration: 10)
                ]
            ),
            
            // PERŞEMBE – CORE + YAĞ YAKIM
            WorkoutDay(
                dayName: "Perşembe",
                color: "red",
                warmup: [
                    CardioSession(name: "Koşu Bandı", duration: 10)
                ],
                exercises: [
                    Exercise(name: "Plank", sets: 3, reps: 1),
                    Exercise(name: "Leg Raise", sets: 3, reps: 12),
                    Exercise(name: "Crunch", sets: 3, reps: 20)
                ],
                cardio: [
                    CardioSession(name: "Eliptik", duration: 30)
                ]
            ),
            
            // CUMA – Omuz & Hafif Göğüs + Kardiyo
            WorkoutDay(
                dayName: "Cuma",
                color: "purple",
                warmup: [
                    CardioSession(name: "Bisiklet", duration: 10)
                ],
                exercises: [
                    Exercise(name: "Shoulder Press", sets: 3, reps: 12),
                    Exercise(name: "Dumbbell Lateral Raise", sets: 3, reps: 15),
                    Exercise(name: "Chest Press (Hafif)", sets: 3, reps: 12)
                ],
                cardio: [
                    CardioSession(name: "Eliptik", duration: 20),
                    CardioSession(name: "Koşu Bandı", duration: 10)
                ]
            ),
            
            // CUMARTESİ – Sırt & Kol + Kardiyo
            WorkoutDay(
                dayName: "Cumartesi",
                color: "brown",
                warmup: [
                    CardioSession(name: "Eliptik", duration: 10)
                ],
                exercises: [
                    Exercise(name: "Seated Row", sets: 3, reps: 12),
                    Exercise(name: "Cable Curl", sets: 3, reps: 15),
                    Exercise(name: "Triceps Rope", sets: 3, reps: 15)
                ],
                cardio: [
                    CardioSession(name: "Bisiklet", duration: 20),
                    CardioSession(name: "Koşu Bandı", duration: 10)
                ]
            ),
            
            // PAZAR – FULL KARDİYO GÜNÜ
            WorkoutDay(
                dayName: "Pazar",
                color: "black",
                warmup: [],
                exercises: [],
                cardio: [
                    CardioSession(name: "Koşu Bandı / Eliptik / Bisiklet", duration: 60)
                ]
            )
        ]
    }
}

