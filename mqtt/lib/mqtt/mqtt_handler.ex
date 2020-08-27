defmodule Mqtt.MqttHandler do
  use Tortoise.Handler

  def handle_message(topic, payload, state) do
    IO.inspect("received a message!")
    IO.inspect("payload:")
    IO.inspect(payload)

    Mqtt.Led.blink_once()

    {:ok, state}
  end
end
