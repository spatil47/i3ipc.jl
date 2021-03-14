using JSON;

@enum MessageType begin
    RUN_COMMAND
    GET_WORKSPACES
    SUBSCRIBE
    GET_OUTPUTS
    GET_TREE
    GET_MARKS
    GET_BAR_CONFIG
    GET_VERSION
    GET_BINDING_MODES
    GET_CONFIG
    SEND_TICK
    SYNC
    GET_BINDING_STATE
end

struct Message
    type::MessageType
    payload::String
    function Message(type, payload)
        return vcat(b"i3-ipc",
                    reinterpret(UInt8, UInt32[length(payload)]),
                    reinterpret(UInt8, UInt32[UInt32(type)]),
                    Vector{UInt8}(payload))
    end
end

