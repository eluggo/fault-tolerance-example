defmodule KV.Registry do
  use GenServer

  #client api
  def start_link(opts) do
    Process.sleep(5000)
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def lookup(server, name) do
    IO.inspect GenServer.call(server, {:lookup, name})
  end

  def create(server, name) do
    GenServer.cast(server, {:create, name})
  end

  def stop(server) do
    GenServer.stop(server)
  end

  #server callbacks
  def init(:ok) do
    Process.flag(:trap_exit, true)
    {:ok, %{}}
  end
  
  def handle_call({:lookup, name}, _from, names) do
    zero = 9/0
    {:reply, Map.fetch(names, name), names}
  end

  def handle_cast({:create, name}, names) do
    if Map.has_key?(names, name) do
      {:noreply, names}
    else
      {:ok, bucket} = KV.Bucket.start_link()
      {:noreply, Map.put(names, name, bucket)}
    end
  end

  def terminate(reason, state) do
    IO.puts "Motivo do crash"
    IO.inspect reason
    
    IO.puts "Estado válido anterior ao crash"
    IO.inspect state
  end

end