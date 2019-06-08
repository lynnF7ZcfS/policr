module Policr
  class TortureTimeCallback < Callback
    def initialize(bot)
      super(bot, "TortureTime")
    end

    def handle(query, msg, report)
      chat_id = msg.chat.id
      from_user_id = query.from.id
      sec = report[0]

      # 检测权限
      role = DB.trust_admin?(msg.chat.id) ? :admin : :creator
      unless (user = msg.from) && bot.has_permission?(msg.chat.id, from_user_id, role)
        bot.answer_callback_query(query.id, text: t("callback.no_permission"))
        return
      end

      case sec
      when "refresh"
        begin
          bot.edit_message_text chat_id: msg.chat.id, message_id: msg.message_id, text: text(msg.chat.id), disable_web_page_preview: true, parse_mode: "markdown", reply_markup: markup
          bot.answer_callback_query(query.id)
        rescue e : TelegramBot::APIException
          bot.answer_callback_query(query.id)
        end
      else
        # 储存设置
        DB.set_torture_sec(msg.chat.id, sec.to_i)
        # 更新设置时间消息文本
        bot.edit_message_text chat_id: msg.chat.id, message_id: msg.message_id, text: text(msg.chat.id), disable_web_page_preview: true, parse_mode: "markdown", reply_markup: markup
        # 响应成功
        bot.answer_callback_query(query.id, text: t("setting_complete"))
      end
    end

    def text(chat_id)
      if (commander = bot.commanders[:torture_time]?) && (commander.is_a?(TortureTimeCommander))
        commander.text(chat_id)
      else
        raise Exception.new "TortureTimeCommander instance not created"
      end
    end

    def markup
      if (commander = bot.commanders[:torture_time]?) && (commander.is_a?(TortureTimeCommander))
        commander.create_markup
      else
        Markup.new
      end
    end
  end
end