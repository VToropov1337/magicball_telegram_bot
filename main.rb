require 'telegram/bot'
require 'yaml'

TOKEN = '***'
#TOKEN = YAML::load(IO.read('config.yaml'))['telegram_bot_token']


ANSWERS = [
  #положительные
  "Бесспорно!",
  "Carpe diem мой друг, carpe diem",
  "Никаких сомнений",
  "Определённо",
  "Полюбому",
  "ДА, ДА, ДА!",
  "Еще бы! Конечно да!",
  #фифти-фифти
  "Мне кажется - да!",
  "Вероятнее всего",
  "Хорошие перспективы",
  "Знаки говорят - да",
  "Всегда говори - да!",
  "50/50",
  "Ну.....",
  #нейтральные
  "Пока не ясно",
  "ХЗ",
  "Лучше не надо",
  "Попробуй снова",
  "Обмозгуй еще",
  "А что тебе говорит разум?",
  "Ну а ты как думаешь?",
  #отрицательные
  "Даже не думай!",
  "Мой ответ - нет!",
  "Нет",
  "Точно нет",
  "Я бы не стал",
  "Ну его",
  "НИКОГДА!"
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
