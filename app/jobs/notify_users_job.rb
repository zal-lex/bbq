class NotifyUsersJob < ActiveJob::Base
  queue_as :default

  def perform(obj)
    event = obj.event
    # Собираем всех подписчиков и автора события в массив мэйлов, убираем
    # из массива инициатора события (комментарий или фото), о котором 
    # уведомляем и e-mail адреса пользователей из vk.com
    all_emails = event.subscribers.map(&:email) + [event.user.email] - [obj.user&.email] - event.subscribers.map(&:email).grep(/@vk.com/)

    # По адресам из этого массива делаем рассылку в зависимости от типа объекта
    case obj
    when Comment
      all_emails.each do |mail|
        EventMailer.comment(event, obj, mail).deliver_later
      end
    when Photo
      all_emails.each do |mail|
        EventMailer.photo(event, obj, mail).deliver_later
      end
    end
  end
end
