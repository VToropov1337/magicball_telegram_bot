require 'telegram/bot'

TOKEN = '383295403:AAFlDRJXpy7qHiMwfVQ-a8weazodIOhEHYc'

ANSWERS = [
  #положительные
  "Бесспорно!",
  "Carpe diem мой друг, carpe diem",
  "Никаких сомнений",
  "Определённо",
  "Можешь быть уверен в этом!",
  #фифти-фифти
  "Мне кажется - да!",
  "Вероятнее всего",
  "Хорошие перспективы",
  "Знаки говорят - да",
  "Всегда говори - да!",
  #нейтральные
  "Пока не ясно",
  "ХЗ",
  "Лучне не надо",
  "Попробуй снова",
  #отричательные
  "Даже не думай!",
  "Мой ответ - нет!",
  "Нет",
  "Точно нет"
]

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start', '/start start'
      bot.api.send_message(chat_id: message.chat.id,
      text: "Привет, #{message.from.first_name}")
    else
      bot.api.send_message(
        chat_id: message.chat.id,
        text: ANSWERS.sample)
    end
  end
end
