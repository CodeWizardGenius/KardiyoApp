//
//  WorkoutDetailView.swift
//  KardiyoApp
//

import SwiftUI

struct WorkoutDetailView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    let workout: WorkoutDay
    
    private var currentWorkout: WorkoutDay? {
        workoutManager.weeklyProgram.first(where: { $0.id == workout.id })
    }
    
    var body: some View {
        ScrollView {
            if let workout = currentWorkout {
                VStack(spacing: 24) {
                    // Header
                    headerSection(workout: workout)
                    
                    // Warmup
                    if !workout.warmup.isEmpty {
                        sectionView(title: "Isınma", icon: "flame.fill", color: .orange) {
                            ForEach(workout.warmup) { cardio in
                                CardioRow(cardio: cardio, dayId: workout.id)
                            }
                        }
                    }
                    
                    // Exercises
                    if !workout.exercises.isEmpty {
                        sectionView(title: "Ağırlık", icon: "dumbbell.fill", color: .blue) {
                            ForEach(workout.exercises) { exercise in
                                ExerciseRow(exercise: exercise, dayId: workout.id)
                            }
                        }
                    }
                    
                    // Cardio
                    if !workout.cardio.isEmpty {
                        sectionView(title: "Kardiyo", icon: "heart.fill", color: .red) {
                            ForEach(workout.cardio) { cardio in
                                CardioRow(cardio: cardio, dayId: workout.id)
                            }
                        }
                    }
                    
                    // Tips
                    tipsSection
                }
                .padding()
            }
        }
        .navigationTitle(workout.dayName)
        .navigationBarTitleDisplayMode(.large)
        .background(Color(.systemGroupedBackground))
    }
    
    private func headerSection(workout: WorkoutDay) -> some View {
        VStack(spacing: 12) {
            HStack {
                Circle()
                    .fill(colorForDay(workout.color))
                    .frame(width: 16, height: 16)
                Text(workout.dayName)
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                if workout.isCompleted {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                        .font(.title2)
                }
            }
            
            if workout.isCompleted {
                Text("Tebrikler! Bu günü tamamladınız 🎉")
                    .font(.subheadline)
                    .foregroundColor(.green)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(8)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
    
    private func sectionView<Content: View>(title: String, icon: String, color: Color, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            .padding(.bottom, 4)
            
            content()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
    
    private var tipsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.yellow)
                Text("Önemli Notlar")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                TipRow(icon: "heart.circle.fill", text: "Nabız: Konuşma zor ama mümkün seviyede")
                TipRow(icon: "drop.fill", text: "Günlük su: 3.5-4 litre")
                TipRow(icon: "exclamationmark.triangle.fill", text: "Ağırlık + kardiyo beraber şart!")
                TipRow(icon: "flame.fill", text: "Terleme zorunlu - yağ yakım bandında kal")
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
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

struct ExerciseRow: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    let exercise: Exercise
    let dayId: UUID
    
    private var currentExercise: Exercise? {
        workoutManager.weeklyProgram
            .first(where: { $0.id == dayId })?
            .exercises.first(where: { $0.id == exercise.id })
    }
    
    var body: some View {
        let exercise = currentExercise ?? self.exercise
        HStack {
            Button(action: {
                workoutManager.toggleExercise(dayId: dayId, exerciseId: exercise.id)
            }) {
                Image(systemName: exercise.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(exercise.isCompleted ? .green : .gray)
                    .font(.title3)
            }
            .buttonStyle(PlainButtonStyle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(exercise.name)
                    .font(.body)
                    .fontWeight(.medium)
                    .strikethrough(exercise.isCompleted)
                    .foregroundColor(exercise.isCompleted ? .secondary : .primary)
                
                Text("\(exercise.sets) set x \(exercise.reps) tekrar")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(exercise.isCompleted ? Color.green.opacity(0.1) : Color.clear)
        .cornerRadius(8)
    }
}

struct CardioRow: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    let cardio: CardioSession
    let dayId: UUID
    
    private var currentCardio: CardioSession? {
        if let day = workoutManager.weeklyProgram.first(where: { $0.id == dayId }) {
            return day.warmup.first(where: { $0.id == cardio.id }) ?? 
                   day.cardio.first(where: { $0.id == cardio.id })
        }
        return nil
    }
    
    var body: some View {
        let cardio = currentCardio ?? self.cardio
        HStack {
            Button(action: {
                workoutManager.toggleCardio(dayId: dayId, cardioId: cardio.id)
            }) {
                Image(systemName: cardio.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(cardio.isCompleted ? .green : .gray)
                    .font(.title3)
            }
            .buttonStyle(PlainButtonStyle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(cardio.name)
                    .font(.body)
                    .fontWeight(.medium)
                    .strikethrough(cardio.isCompleted)
                    .foregroundColor(cardio.isCompleted ? .secondary : .primary)
                
                Text("\(cardio.duration) dakika")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(cardio.isCompleted ? Color.green.opacity(0.1) : Color.clear)
        .cornerRadius(8)
    }
}

struct TipRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 20)
            Text(text)
                .font(.subheadline)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

#Preview {
    NavigationView {
        WorkoutDetailView(workout: WorkoutData.shared.getWeeklyProgram()[0])
            .environmentObject(WorkoutManager())
    }
}

