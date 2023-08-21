//
//  NotificationManager.swift
//  swiftUIVC
//
//  Created by Oleksandr Smakhtin on 21/08/2023.
//

import Foundation
import UserNotifications

class NotificationManager {
    
    static let shared = NotificationManager()
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    
    
    func didPressCell(with value: String) {
        // content
        let content = UNMutableNotificationContent()
        content.title = "Application name"
        content.body = "Cell with value \(value) was pressed"
        content.sound = .default
        
        // trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        
        // request notification
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        
        // sending
        notificationCenter.add(request) { error in
            guard let error = error else { return }
            print(error.localizedDescription)
        }
    }
    
    func didDeleteCell(with value: String) {
        
        // content
        let content = UNMutableNotificationContent()
        content.title = "Application name"
        content.body = "Cell with value \(value) was deleted"
        content.sound = .default
        
        // trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        
        
        // request notification
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        
        // sending
        notificationCenter.add(request) { error in
            guard let error = error else { return }
            print(error.localizedDescription)
        }
    }
    
}
