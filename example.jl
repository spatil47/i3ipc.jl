using Sockets

include("i3ipc.jl")

s = connect(read(`i3 --get-socketpath`, String) |> chomp)

write(s, Message(RUN_COMMAND, "exec notify-send Success"))
