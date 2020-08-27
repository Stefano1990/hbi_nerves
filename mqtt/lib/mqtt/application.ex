defmodule Mqtt.Application do
  use Application

  # def start(_type, _args) do
  #   IO.puts("application has started")

    # Tortoise.Supervisor.start_child(
    #   client_id: "my_client_id",
    #   handler: {Tortoise.Handler.Logger, []},
    #   server: {Tortoise.Transport.Tcp, host: 'test.mosquitto.org', port: 1883},
    #   subscriptions: [{"test/channel123", 0}]
    # )

  #   Tortoise.publish("my_client_id", "test/channel123", "Hello from the World of Tomorrow !", qos: 0)
  # end

  def start(_type, _args) do
    # DONT DO THIS HERE! ONLY FOR TESTING!!!!
    Tortoise.Supervisor.start_child(
      client_id: "my_client_id",
      # handler: {Tortoise.Handler.Logger, []},
      handler: {Mqtt.MqttHandler, []},
      server: {Tortoise.Transport.Tcp, host: "test.mosquitto.org", port: 1883},
      subscriptions: [{"test/channel123", 0}]
    )

    children = []
    opts = [strategy: :one_for_one, name: Mqtt.Supervisor]

    Supervisor.start_link(children, opts)
  end
end
