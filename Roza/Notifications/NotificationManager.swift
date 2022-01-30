//
//  NotificationManager.swift
//  Roza
//
//  Created by Luka Vujnovac on 30.01.2022..
//

import Foundation
import UserNotifications

class NotificationManager {
    
    static let instance = NotificationManager()
    
    func requestAuthoratization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("ode je error \(error)")
            }else {
                print("success")
            }
        }
    }
    
    func scheduleNotifications() {
        
        let content = UNMutableNotificationContent()
        content.title = "Roza"
        content.subtitle = "Record Your activities for today"
        content.sound = .default
        content.badge = 1
        
        //time
        //        let triggerTime = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        //calendar
        var dateComponents = DateComponents()
        dateComponents.hour = 00
        dateComponents.minute = 00
        //        dateComponents.day = 1 //starts on sunday -> 1 == sunday
        let triggerCalendar = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: triggerCalendar)
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        
    }
}
