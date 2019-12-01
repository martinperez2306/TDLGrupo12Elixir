pid = spawn fn -> 1 + 2 end
IO.puts(Process.alive?(pid))

self = self()
IO.puts(Process.alive?(self))

pid = spawn fn -> raise "oops" end
IO.inspect(pid)
