local b3 = require(BTreePlugin.B3)
print(b3.VERSION)

local behaviorJson =
    [[
{
  "version": "0.3.0",
  "scope": "tree",
  "id": "298c3e26-e389-4354-aee6-0bc6db6fa551",
  "title": "AISoldier",
  "description": "",
  "root": "e4ba5b3b-33bd-4355-8026-376a20ff121c",
  "properties": {},
  "nodes": {
    "e4ba5b3b-33bd-4355-8026-376a20ff121c": {
      "id": "e4ba5b3b-33bd-4355-8026-376a20ff121c",
      "name": "Sequence",
      "category": "composite",
      "title": "Sequence",
      "description": "",
      "properties": {},
      "display": {
        "x": 132,
        "y": 0
      },
      "children": [
        "3edb35b2-c66a-4da8-b72a-70c2ab8ade68",
        "22fbbc05-f5f9-4d06-848d-d77ff98d3bdc"
      ]
    },
    "22fbbc05-f5f9-4d06-848d-d77ff98d3bdc": {
      "id": "22fbbc05-f5f9-4d06-848d-d77ff98d3bdc",
      "name": "HeroAction",
      "category": "action",
      "title": "Shot",
      "description": "角色动作汇总，根据Title执行不同动作",
      "properties": {},
      "display": {
        "x": 336,
        "y": 48
      }
    },
    "3edb35b2-c66a-4da8-b72a-70c2ab8ade68": {
      "id": "3edb35b2-c66a-4da8-b72a-70c2ab8ade68",
      "name": "StatusCheck",
      "category": "condition",
      "title": "CanSeePlayer",
      "description": "角色状态检测，根据不同的Title执行不同检测",
      "properties": {},
      "display": {
        "x": 336,
        "y": -36
      }
    }
  },
  "display": {
    "camera_x": 492,
    "camera_y": 380.5,
    "camera_z": 1,
    "x": 0,
    "y": 0
  },
  "custom_nodes": [
    {
      "version": "0.3.0",
      "scope": "node",
      "name": "HeroAction",
      "category": "action",
      "title": "角色动作",
      "description": "角色动作汇总，根据Title执行不同动作",
      "properties": {}
    },
    {
      "version": "0.3.0",
      "scope": "node",
      "name": "StatusCheck",
      "category": "condition",
      "title": "角色状态",
      "description": "角色状态检测，根据不同的Title执行不同检测",
      "properties": {}
    }
  ]
}
]]
wait(1)
print('------------------------------------------------')
local behaviorTree = b3.BehaviorTree.new()
local blackBoard = b3.Blackboard.new()
behaviorTree:load(behaviorJson, {})
print('------------------------------------------------')

while (true) do
    wait(1)
    behaviorTree:tick(nil, blackBoard)
end

--local i = 1
local NPC = script.Parent
while true do
    wait(0.1)
    local v3 = localPlayer.Position - script.Parent.Position
    --NPC:FaceToDir(v3.Normalized,math.pi*10)
    --i = i+1
    print(Vector3.Angle(NPC.Forward, v3))
    --print(type(localPlayer.Right))
end
