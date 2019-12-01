parent = self()

receive do
 	{:hello, msg}  -> msg
after 5_000 -> IO.puts("Nothing after 5s")
end

spawn fn -> send(parent, {:hello, self()}); IO.puts("Sending Hello to parent!") end

receive do
	{:hello, pid} -> IO.puts("Got hello from #{inspect pid}")
end

## Flush
##While in the shell, you may find the helper flush/0 quite useful.
##It flushes and prints all the messages in the mailbox.
##flush()
