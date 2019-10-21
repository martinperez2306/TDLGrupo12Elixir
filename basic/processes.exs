pid = spawn fn -> 1 + 2 end
IO.puts(Process.alive?(pid))

self = self()
IO.puts(Process.alive?(self))

parent = self()
spawn fn -> send(parent, {:hello, self()}); IO.puts("Sending Hello to parent!") end
receive do
	{:hello, pid} -> IO.puts("Got hello from #{inspect pid}")
	end