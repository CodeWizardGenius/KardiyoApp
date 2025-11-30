//
//  ContentView.swift
//  KardiyoApp
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        // Header Card
                        headerCard
                        
                        // Progress Card
                        progressCard
                        
                        // Today's Workout
                        if let todayWorkout = workoutManager.getDayForToday() {
                            todayWorkoutCard(workout: todayWorkout)
                        }
                        
                        // Weekly Program
                        weeklyProgramSection
                    }
                    .padding()
                }
            }
            .navigationTitle("Kardiyo Programı")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                workoutManager.loadWorkouts()
            }
        }
    }
    
    private var headerCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "flame.fill")
                    .foregroundColor(.orange)
                    .font(.title2)
                Text("Yağ Yakım Programı")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            
            VStack(alignment: .leading, spacing: 6) {
                InfoRow(icon: "person.fill", text: "30 yaş | 182 cm | 107 kg")
                InfoRow(icon: "clock.fill", text: "Akşam spor | 1 saat")
                InfoRow(icon: "timer", text: "Toplam: 65-75 dakika")
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
    
    private var progressCard: some View {
        VStack(spacing: 12) {
            HStack {
                Text("Haftalık İlerleme")
                    .font(.headline)
                Spacer()
                Text("\(Int(workoutManager.getProgress() * 100))%")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }
            
            ProgressView(value: workoutManager.getProgress())
                .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                .scaleEffect(x: 1, y: 2, anchor: .center)
            
            HStack {
                Text("\(workoutManager.weeklyProgram.filter { $0.isCompleted }.count) / \(workoutManager.weeklyProgram.count) gün tamamlandı")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
                Button("Haftayı Sıfırla") {
                    workoutManager.resetWeek()
                }
                .font(.caption)
                .foregroundColor(.red)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
    
    private func todayWorkoutCard(workout: WorkoutDay) -> some View {
        NavigationLink(destination: WorkoutDetailView(workout: workout)) {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Circle()
                        .fill(colorForDay(workout.color))
                        .frame(width: 12, height: 12)
                    Text("Bugün - \(workout.dayName)")
                        .font(.headline)
                    Spacer()
                    if workout.isCompleted {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    }
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("\(workout.exercises.count) Egzersiz")
                            .font(.subheadline)
                        Text("\(workout.cardio.reduce(0) { $0 + $1.duration }) dk Kardiyo")
                            .font(.subheadline)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private var weeklyProgramSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Haftalık Program")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ForEach(workoutManager.weeklyProgram) { workout in
                NavigationLink(destination: WorkoutDetailView(workout: workout)) {
                    WorkoutDayRow(workout: workout)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
    
    private func colorForDay(_ colorName: String) -> Color {
        switch colorName.lowercased() {
        case "green": return .green
        case "blue": return .blue
        case "yellow": return .yellow
        case "red": return .red
        case "purple": return .purple
        case "brown": return .brown
        case "black": return .black
        default: return .gray
        }
    }
}

struct InfoRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 20)
            Text(text)
                .font(.subheadline)
        }
    }
}

struct WorkoutDayRow: View {
    let workout: WorkoutDay
    
    var body: some View {
        HStack {
            Circle()
                .fill(colorForDay(workout.color))
                .frame(width: 12, height: 12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(workout.dayName)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                HStack(spacing: 12) {
                    if !workout.exercises.isEmpty {
                        Label("\(workout.exercises.count) Egzersiz", systemImage: "dumbbell.fill")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    if !workout.cardio.isEmpty {
                        Label("\(workout.cardio.reduce(0) { $0 + $1.duration }) dk", systemImage: "heart.fill")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            
            Spacer()
            
            if workout.isCompleted {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                    .font(.title3)
            } else {
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 1)
    }
    
    private func colorForDay(_ colorName: String) -> Color {
        switch colorName.lowercased() {
        case "green": return .green
        case "blue": return .blue
        case "yellow": return .yellow
        case "red": return .red
        case "purple": return .purple
        case "brown": return .brown
        case "black": return .black
        default: return .gray
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(WorkoutManager())
}

