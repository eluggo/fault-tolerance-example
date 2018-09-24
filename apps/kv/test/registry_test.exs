defmodule KV.RegistryTest do
  use ExUnit.Case
  alias KV.Registry

  setup do
    registry = start_supervised(Registry)
    on_exit(fn -> Registry.stop(registry) end)
    %{registry: registry}
  end
  
  test "spawns buckets", %{registry: registry} do
    assert Registry.lookup(registry, "shopping") == :error
  
    Registry.create(registry, "shopping") 
  
    KV.Bucket.put(bucket, "milk", 1)
    assert KV.Bucket.get(bucket, "milk") == 1
  end

end