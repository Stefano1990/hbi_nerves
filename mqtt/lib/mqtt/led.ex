defmodule Mqtt.Led do
  @on_duration 200
  @off_duration 200

  alias Nerves.Leds

  def blink_once() do
    blink()
  end

  def blink_twice() do
    blink()
    blink()
  end

  defp blink() do
    # rpi0 only has 1 led, :green
    Leds.set([{:green, true}])
    :timer.sleep(@on_duration)
    Leds.set([{:green, false}])
    :timer.sleep(@off_duration)
  end
end
