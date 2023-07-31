//
//  ReminderStore.swift
//  Today
//
//  Created by Kim Yewon on 2023/07/07.
//

import EventKit
import Foundation

// You can't override metohds in final classes.
// The compiler will display a warning if you rty to subclass ReminderStore.
final class ReminderStore {
    static let shared = ReminderStore()
    
    private let ekStore = EKEventStore()
    
    var isAvailable: Bool {
        EKEventStore.authorizationStatus(for: .reminder) == .authorized
    }
    
    func requestAccess() async throws {
        let status = EKEventStore.authorizationStatus(for: .reminder)
        
        // Your app would work without the @unknown attribute before the default keyword. However, adding the attribute instructs the compiler to warn you if future versions of the API add new cases to the enumeration.
        switch status {
        case .authorized: return
        case .restricted: throw TodayError.accessRestricted
        case .notDetermined:
            let accessGranted = try await ekStore.requestAccess(to: .reminder)
            guard accessGranted else { throw TodayError.accessDenied }
        case .denied: throw TodayError.accessDenied
        @unknown default: throw TodayError.unknown
        }
    }
    
    func readAll() async throws -> [Reminder] {
        guard isAvailable else {
            throw TodayError.accessDenied
        }
        
        let predicate = ekStore.predicateForReminders(in: nil)
        let ekReminders = try await ekStore.reminders(matching: predicate)
        let reminders: [Reminder] = try ekReminders.compactMap { ekReminder in
            do {
                return try Reminder(with: ekReminder)
            } catch TodayError.reminderHasNoDueDate {
                return nil
            }
        }
        return reminders
    }
    
    @discardableResult
    func save(_ reminder: Reminder) throws -> Reminder.ID {
        guard isAvailable else { throw TodayError.accessDenied }
        let ekReminder: EKReminder
        
        do {
            ekReminder = try read(with: reminder.id)
        } catch {
            // Failing to find a reminder with the corresponding identifier doesn’t indicate an error. Rather, it indicates that the user is saving a new reminder.
            ekReminder = EKReminder(eventStore: ekStore)
        }
        ekReminder.update(using: reminder, in: ekStore)
        try ekStore.save(ekReminder, commit: true)
        return ekReminder.calendarItemIdentifier
    }
    
    func remove(with id: Reminder.ID) throws {
        guard isAvailable else { throw TodayError.accessDenied }
        
        let ekReminder = try read(with: id)
        try ekStore.remove(ekReminder, commit: true)
    }
    
    private func read(with id: Reminder.ID) throws -> EKReminder {
        guard let ekReminder = ekStore.calendarItem(withIdentifier: id) as? EKReminder else {
            throw TodayError.failedReadingCalendarItem
        }
        return ekReminder
    }
}
