local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")

local messages = {
    "Hello everyone!",
    "Team Source Developer",
    "Hello everyone, I'm Source Dev.",
    "GG."
}

local function sendChatMessage(message)
    local channel = TextChatService.TextChannels.RBXGeneral
    if channel then
        channel:SendAsync(message)
    end
end

local function startMessageLoop()
    local messageIndex = 1
    while true do
        local message = messages[messageIndex]
        sendChatMessage(message)
        
        messageIndex = messageIndex + 1
        if messageIndex > #messages then
            messageIndex = 1
        end
        
        task.wait(11)
    end
end

local player = Players.LocalPlayer
if player then
    player.OnTeleport:Connect(function()
        startMessageLoop()
    end)
end

startMessageLoop()
