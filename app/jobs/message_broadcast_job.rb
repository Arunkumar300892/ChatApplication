class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform
    ActionCable.server.broadcast(
      "messages",
      message: 'ok'
    )
  end
end
