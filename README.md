#Avatar AI-Framework
### 概述
Avatar AI-Framework是提供给Avatar编辑器使用的游戏AI的行为树开发框架。
### 什么是行为树
行为树是一个包含逻辑节点和行为节点的树结构，每次需要找出一个行为的时候，会从树的根节点出发，遍历各个节点，找出第一个和当前数据相符合的行为并执行。
例如
![QQ截图20201201143727.png](https://ae03.alicdn.com/kf/H3f7e3cffb3104ae5b95d02e0220f39c86.png)
### 行为树的构成
行为树主要有四种状态：成功（SUCCESS）、失败（FAILURE）、持续运行（RUN）、错误（ERROR），这些状态用于控制行为树具体走向。
行为树功能分为俩个部分：树集合（TREES）、节点集合（NODES）
- **树集合**：归类保存每一颗行为树AI根节点
- **节点集合**：存放各种通用、自定义节点
节点集合又分为四个部分：**组合节点（COMPOSITES）、装饰节点（DECORATORS）、动作节点（ACTIONS）、条件节点（CONDITIONS）**
- **组合节点**：组合节点通常可以拥有一个或更多的子节点。这些子节点会按照一定的次序或是随机地执行，并会根据子节点的执行结果向父节点返回‘成功’、‘失败’，或是在未执行完毕时返回‘运行中’这样的结果值。
```
Sequence：顺序执行子节点，当子节点返回SUCCESS直接访问下一个子节点，直到所有子节点都返回SUCCESS,才从当前节点返回SUCCESS，当子节点返回FAILURE，则直接从当前节点返回FAILURE，其余节点就不再执行,相当于逻辑AND
Priority：当子节点返回FAILURE直接访问下一个子节点，直到所有子节点都返回FAILURE,才从当前节点返回FAILURE，当子节点返回SUCCESS，则直接从当前节点返回SUCCESS，当子节点只要有一个成功，就返回，其余节点不再执行,相当于逻辑OR
MemSequence: 逻辑和Sequence一样，但是这里涉及到一个RUNNING的返回值，就是子节点并不知道执行结果是成功还是失败，我得晚一点才能告诉你，那如何处理这种情况咧？对于Sequence节点，当它再次遍历子节点的时候，还是从第一个子节点开始遍历，但是MemSequence却会记住之前在Running的子节点,然后下次遍历的时候，直接从Running的那个子节点开始，这可以很方便的继续之前中断的逻辑决策。
MemPriority 节点 逻辑和Priority一样，然后Running的概念和MemSequence一样。
```
- **装饰节点**：装饰节点也可以拥有子节点，但是不同于组合节点，它只能拥有一个子节点。几乎所有的装饰节点类型主要的功能都集中在修改子节点返回的结果、终止子节点执行，或是重复、限制子节点执行次数等。
```
Repeator：重复执行子节点maxLoop次
RepeatUntilFailure：重复执行子节点直到子节点返回Failure
RepeatUntilSuccess：重复执行子节点直到子节点返回Success
Limiter：限制进入子节点的上限次数为maxLoop
Inverter：反转返回值
MaxTime：限制子节点可以执行的时间为maxTime毫秒
```
- **动作节点**：动作节点位于整颗行为树的最底部，它们不会拥有子节点。动作节点是强大的节点类型，它们是真正让你的行为树执行具体功能或修改某个变量的基础元素。
```
Successder：返回SUCCESS
Failer：返回FAILURE
Error：返回ERROR(调试用)
Runner：返回RUNNING
Wait：等待milliseconds毫秒
```
- **条件节点**：条件节点位于整颗行为树的最底部，它们不会拥有子节点。条件节点是最重要的控制节点类型，它们进行逻辑判断，并通过返回‘成功’、‘失败’、或‘运行中’等状态，配合其他节点控制行为树节点走向。
### 行为树编辑器的使用
1. 打开本地编辑器（推荐）或[在线网站](https://www.behaviortrees.com/#/dash/home "在线网站")
2. 创建一个项目
![创建项目](https://ae01.alicdn.com/kf/Hde3d140c501b443da6bc09512bd27180P.png)
3. 创建一个行为树
![创建行为树](https://ae05.alicdn.com/kf/H515e405fe2ad46d4b7fcf48d694159ffk.png)
4. 编辑节点
![编辑节点](https://ae04.alicdn.com/kf/H711f5872cd354d95a97d17b5bf48b861O.png)
5.导出
![导出.png](https://ae02.alicdn.com/kf/H0c4af77a143b43df8cf577ad44464727z.png)
### AI-Framework的使用
参考SMAP中的NPC的使用
### 扩展节点
目前官方扩展的节点有：
- 角色动作
![角色动作.png](https://ae03.alicdn.com/kf/H4f4964f8fcd347d3894d7f708b3b7df9N.png)
- 角色状态
![角色状态.png](https://ae05.alicdn.com/kf/H938ee0bab2c5414fb14901f5988da205d.png)
- 打印
![打印.png](https://ae05.alicdn.com/kf/H2eb0ac17be1247518dfa70b7a51f80b5B.png)

如需使用这些扩展节点，请在编辑器中导入下面的json文件。
```json
{
  "version": "0.3.0",
  "scope": "tree",
  "id": "298c3e26-e389-4354-aee6-0bc6db6fa551",
  "title": "CustomNodeTree",
  "description": "",
  "root": null,
  "properties": {},
  "nodes": {},
  "display": {
    "camera_x": 668,
    "camera_y": 386.5,
    "camera_z": 1,
    "x": -48,
    "y": 96
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
      "properties": {},
      "parent": null
    },
    {
      "version": "0.3.0",
      "scope": "node",
      "name": "Print",
      "category": "action",
      "title": "打印",
      "description": "打印一些信息",
      "properties": {},
      "parent": null
    }
  ],
  "custom_folders": []
}
```
这些拓展节点的用法，请参考示例。
用户可自行拓展节点，拓展方法请参考示例。

### 后续计划
拓展更多的组合节点和装饰节点
目前的计划有：
- Parallel
- Random

### 行为树资料
[AI 行为树的工作原理](https://indienova.com/indie-game-development/ai-behavior-trees-how-they-work/#iah-9)
https://www.cnblogs.com/KillerAery/category/1229106.html
http://www.aisharing.com/archives/90#comment-238610
https://note.youdao.com/ynoteshare1/index.html?id=4f46dc2144ea62b55f597630f5e666b4&type=note
https://www.behaviac.com/concepts/
### 相关项目
https://github.com/behavior3/behavior3editor
https://github.com/nottvlike/behavior3_lua
https://github.com/monitor1394/LuaBT
https://github.com/SilenceSu/behavior3java
###更深入的了解Bhavior3
[行为树应用之行为树简介](https://note.youdao.com/ynoteshare1/index.html?id=dce05d33cd3d413b750f44cfeb27cba1&type=note)
[行为树应用之组合节点](https://note.youdao.com/ynoteshare1/index.html?id=f30ce2503a280e88bc7559710a48f580&type=note)
[行为树应用之装饰节点](https://note.youdao.com/ynoteshare1/index.html?id=b9993e6c6027759517d99d13307d5694&type=note)
[行为树应用之自定义节点](https://note.youdao.com/ynoteshare1/index.html?id=5f6bef7d092105c9d27b8f7696432980&type=note)
[行为树应用之加载行为树](https://note.youdao.com/ynoteshare1/index.html?id=3015421942fafe2c09aacaef7990173c&type=note)
[行为树应用之节点执行](https://note.youdao.com/ynoteshare1/index.html?id=ad915819d8f7cad146176ff8fad9adb8&type=note)
[行为树应用之设计巡逻兵AI](https://note.youdao.com/ynoteshare1/index.html?id=2e8ab83e4c44737f0e90f4811caad77c&type=note)
[行为树应用之设计丧尸AI](https://note.youdao.com/ynoteshare1/index.html?id=c0d89fd291827442ed6ab2ca938403c1&type=note)
