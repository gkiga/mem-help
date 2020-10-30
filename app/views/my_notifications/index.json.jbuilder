json.array! @my_notifications do |notification|
    json.id notification.id
    #json.recipient notification.recipient
    json.actor notification.actor
    json.action notification.action
    json.notifiable do #notification.notifiable
        json.type "#{notification.notifiable.class.to_s.underscore.humanize}"
    end
    json.url request_path(notification.notifiable, anchor: dom_id(notification.notifiable))
end