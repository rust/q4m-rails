class MessageQueue < ActiveRecord::Base
  @@queued = false

  class << self
    def push(messages)
      case messages
      when String, Numeric
        MessageQueue.create(:message => messages)
      when Array
        messages.each do |message|
          MessageQueue.create(:message => message)
        end
      else
        raise "Argument type error."
      end
    end

    def pop
      raise "No block given." unless block_given?

      raise "Now in owner mode." if @@queued

      @@queued = true
      queue = MessageQueue.find(:first, :conditions => "queue_wait('#{table_name}')")

      yield queue.message

      MessageQueue.find_by_sql("SELECT queue_end()")
      @@queued = false
    end
  end
end
