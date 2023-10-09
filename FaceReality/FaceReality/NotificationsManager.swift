import SwiftUI
//Central location for Notification code including the delegate
// A call to the notificationManager just like the line of code below has to be included in
// application(_:willFinishLaunchingWithOptions:) or
// application(_:didFinishLaunchingWithOptions:)
//https://developer.apple.com/documentation/usernotifications/unusernotificationcenterdelegate
//https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-an-appdelegate-to-a-swiftui-app

//You need a central location for the notification code because
// it is needed in more than 1 spot. At launch in the AppDelegate
// and wherever you schedule your notifications

class NotificationManager: NSObject, UNUserNotificationCenterDelegate, ObservableObject{
    //Singleton is requierd because of delegate
    static let shared: NotificationManager = NotificationManager()
    let notificationCenter = UNUserNotificationCenter.current()
    
    private override init(){
        super.init()
        //This assigns the delegate
        notificationCenter.delegate = self
    }
    
    func requestAuthorization() {
        print("called")
        print(#function)
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Access Granted")
            } else {
                print("Access Not Granted")
            }
        }
    }
    
    func deleteNotifications(notificationIdentifier: String){
        print(#function)
        
        if notificationIdentifier == "Inactive" {
            notificationCenter.removePendingNotificationRequests(withIdentifiers: ["twoDaysInactivityNotification", "oneWeekInactivityNotification", "twoWeeksInactivityNotification"])
            print("Notifications cleared!")

        }
    }
    ///This is just a reusable form of all the copy and paste you did in your buttons. If you have to copy and paste make it reusable.
    func scheduleTriggerNotification(title: String, body: String, categoryIdentifier: String, dateComponents : DateComponents, repeats: Bool) {
        print(#function)
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.categoryIdentifier = categoryIdentifier
        content.sound = UNNotificationSound.default
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: repeats)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        notificationCenter.add(request)
        
    }
    
    func scheduleNotifications () {
        scheduleNotification(typeOfNotification: .twoDays)
        scheduleNotification(typeOfNotification: .oneWeek)
        scheduleNotification(typeOfNotification: .twoWeeks)
    }
    
    func scheduleNotification(typeOfNotification: NotificationType) {
        let content = UNMutableNotificationContent()
        content.title = typeOfNotification.title
        content.body = typeOfNotification.body
        content.sound = typeOfNotification.sound
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: typeOfNotification.timeInterval, repeats: typeOfNotification.repeats)
        
        let request = UNNotificationRequest(identifier: typeOfNotification.identifier, content: content, trigger: trigger)
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error scheduling notification: \(error)")
            } else {
                print("Notification scheduled successfully")

            }
        }
    }
    ///Prints to console schduled notifications
    func printNotifications(){
        print(#function)
        notificationCenter.getPendingNotificationRequests { request in
            for req in request{
                if req.trigger is UNCalendarNotificationTrigger{
                    print((req.trigger as! UNCalendarNotificationTrigger).nextTriggerDate()?.description ?? "invalid next trigger date")
                }
            }
        }
    }
    //MARK: UNUserNotificationCenterDelegate
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler(.banner)
    }
}

