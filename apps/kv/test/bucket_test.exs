defmodule KV.BucketTest do
  use ExUnit.Case, async: true
  alias KV.Bucket

  setup do
    {:ok, bucket} = Bucket.start_link()
    %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert Bucket.get(bucket, "milk") == nil

    Bucket.put(bucket, "milk", 3)
    assert Bucket.get(bucket, "milk") == 3
  end

  test "delete value by key", %{bucket: bucket} do
    assert Bucket.get(bucket, "milk") == nil
    assert Bucket.get(bucket, "eggs") == nil

    Bucket.put(bucket, "milk", 3)
    Bucket.put(bucket, "eggs", 23)

    assert Bucket.get(bucket, "milk") == 3
    assert Bucket.get(bucket, "eggs") == 23

    assert Bucket.delete(bucket, "milk")

    assert Bucket.get(bucket, "milk") == nil
    assert Bucket.get(bucket, "eggs") == 23
    
  end
end
  