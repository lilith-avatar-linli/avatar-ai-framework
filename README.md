#Avatar AI-Framework
### ����
Avatar AI-Framework���ṩ��Avatar�༭��ʹ�õ���ϷAI����Ϊ��������ܡ�
### ʲô����Ϊ��
��Ϊ����һ�������߼��ڵ����Ϊ�ڵ�����ṹ��ÿ����Ҫ�ҳ�һ����Ϊ��ʱ�򣬻�����ĸ��ڵ���������������ڵ㣬�ҳ���һ���͵�ǰ��������ϵ���Ϊ��ִ�С�
����
![QQ��ͼ20201201143727.png](https://ae03.alicdn.com/kf/H3f7e3cffb3104ae5b95d02e0220f39c86.png)
### ��Ϊ���Ĺ���
��Ϊ����Ҫ������״̬���ɹ���SUCCESS����ʧ�ܣ�FAILURE�����������У�RUN��������ERROR������Щ״̬���ڿ�����Ϊ����������
��Ϊ�����ܷ�Ϊ�������֣������ϣ�TREES�����ڵ㼯�ϣ�NODES��
- **������**�����ౣ��ÿһ����Ϊ��AI���ڵ�
- **�ڵ㼯��**����Ÿ���ͨ�á��Զ���ڵ�
�ڵ㼯���ַ�Ϊ�ĸ����֣�**��Ͻڵ㣨COMPOSITES����װ�νڵ㣨DECORATORS���������ڵ㣨ACTIONS���������ڵ㣨CONDITIONS��**
- **��Ͻڵ�**����Ͻڵ�ͨ������ӵ��һ���������ӽڵ㡣��Щ�ӽڵ�ᰴ��һ���Ĵ�����������ִ�У���������ӽڵ��ִ�н���򸸽ڵ㷵�ء��ɹ�������ʧ�ܡ���������δִ�����ʱ���ء������С������Ľ��ֵ��
```
Sequence��˳��ִ���ӽڵ㣬���ӽڵ㷵��SUCCESSֱ�ӷ�����һ���ӽڵ㣬ֱ�������ӽڵ㶼����SUCCESS,�Ŵӵ�ǰ�ڵ㷵��SUCCESS�����ӽڵ㷵��FAILURE����ֱ�Ӵӵ�ǰ�ڵ㷵��FAILURE������ڵ�Ͳ���ִ��,�൱���߼�AND
Priority�����ӽڵ㷵��FAILUREֱ�ӷ�����һ���ӽڵ㣬ֱ�������ӽڵ㶼����FAILURE,�Ŵӵ�ǰ�ڵ㷵��FAILURE�����ӽڵ㷵��SUCCESS����ֱ�Ӵӵ�ǰ�ڵ㷵��SUCCESS�����ӽڵ�ֻҪ��һ���ɹ����ͷ��أ�����ڵ㲻��ִ��,�൱���߼�OR
MemSequence: �߼���Sequenceһ�������������漰��һ��RUNNING�ķ���ֵ�������ӽڵ㲢��֪��ִ�н���ǳɹ�����ʧ�ܣ��ҵ���һ����ܸ����㣬����δ�����������֣�����Sequence�ڵ㣬�����ٴα����ӽڵ��ʱ�򣬻��Ǵӵ�һ���ӽڵ㿪ʼ����������MemSequenceȴ���ס֮ǰ��Running���ӽڵ�,Ȼ���´α�����ʱ��ֱ�Ӵ�Running���Ǹ��ӽڵ㿪ʼ������Ժܷ���ļ���֮ǰ�жϵ��߼����ߡ�
MemPriority �ڵ� �߼���Priorityһ����Ȼ��Running�ĸ����MemSequenceһ����
```
- **װ�νڵ�**��װ�νڵ�Ҳ����ӵ���ӽڵ㣬���ǲ�ͬ����Ͻڵ㣬��ֻ��ӵ��һ���ӽڵ㡣�������е�װ�νڵ�������Ҫ�Ĺ��ܶ��������޸��ӽڵ㷵�صĽ������ֹ�ӽڵ�ִ�У������ظ��������ӽڵ�ִ�д����ȡ�
```
Repeator���ظ�ִ���ӽڵ�maxLoop��
RepeatUntilFailure���ظ�ִ���ӽڵ�ֱ���ӽڵ㷵��Failure
RepeatUntilSuccess���ظ�ִ���ӽڵ�ֱ���ӽڵ㷵��Success
Limiter�����ƽ����ӽڵ�����޴���ΪmaxLoop
Inverter����ת����ֵ
MaxTime�������ӽڵ����ִ�е�ʱ��ΪmaxTime����
```
- **�����ڵ�**�������ڵ�λ��������Ϊ������ײ������ǲ���ӵ���ӽڵ㡣�����ڵ���ǿ��Ľڵ����ͣ������������������Ϊ��ִ�о��幦�ܻ��޸�ĳ�������Ļ���Ԫ�ء�
```
Successder������SUCCESS
Failer������FAILURE
Error������ERROR(������)
Runner������RUNNING
Wait���ȴ�milliseconds����
```
- **�����ڵ�**�������ڵ�λ��������Ϊ������ײ������ǲ���ӵ���ӽڵ㡣�����ڵ�������Ҫ�Ŀ��ƽڵ����ͣ����ǽ����߼��жϣ���ͨ�����ء��ɹ�������ʧ�ܡ����������С���״̬����������ڵ������Ϊ���ڵ�����
### ��Ϊ���༭����ʹ��
1. �򿪱��ر༭�����Ƽ�����[������վ](https://www.behaviortrees.com/#/dash/home "������վ")
2. ����һ����Ŀ
![������Ŀ](https://ae01.alicdn.com/kf/Hde3d140c501b443da6bc09512bd27180P.png)
3. ����һ����Ϊ��
![������Ϊ��](https://ae05.alicdn.com/kf/H515e405fe2ad46d4b7fcf48d694159ffk.png)
4. �༭�ڵ�
![�༭�ڵ�](https://ae04.alicdn.com/kf/H711f5872cd354d95a97d17b5bf48b861O.png)
5.����
![����.png](https://ae02.alicdn.com/kf/H0c4af77a143b43df8cf577ad44464727z.png)
### AI-Framework��ʹ��
�ο�SMAP�е�NPC��ʹ��
### ��չ�ڵ�
Ŀǰ�ٷ���չ�Ľڵ��У�
- ��ɫ����
![��ɫ����.png](https://ae03.alicdn.com/kf/H4f4964f8fcd347d3894d7f708b3b7df9N.png)
- ��ɫ״̬
![��ɫ״̬.png](https://ae05.alicdn.com/kf/H938ee0bab2c5414fb14901f5988da205d.png)
- ��ӡ
![��ӡ.png](https://ae05.alicdn.com/kf/H2eb0ac17be1247518dfa70b7a51f80b5B.png)

����ʹ����Щ��չ�ڵ㣬���ڱ༭���е��������json�ļ���
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
      "title": "��ɫ����",
      "description": "��ɫ�������ܣ�����Titleִ�в�ͬ����",
      "properties": {}
    },
    {
      "version": "0.3.0",
      "scope": "node",
      "name": "StatusCheck",
      "category": "condition",
      "title": "��ɫ״̬",
      "description": "��ɫ״̬��⣬���ݲ�ͬ��Titleִ�в�ͬ���",
      "properties": {},
      "parent": null
    },
    {
      "version": "0.3.0",
      "scope": "node",
      "name": "Print",
      "category": "action",
      "title": "��ӡ",
      "description": "��ӡһЩ��Ϣ",
      "properties": {},
      "parent": null
    }
  ],
  "custom_folders": []
}
```
��Щ��չ�ڵ���÷�����ο�ʾ����
�û���������չ�ڵ㣬��չ������ο�ʾ����

### �����ƻ�
��չ�������Ͻڵ��װ�νڵ�
Ŀǰ�ļƻ��У�
- Parallel
- Random

### ��Ϊ������
[AI ��Ϊ���Ĺ���ԭ��](https://indienova.com/indie-game-development/ai-behavior-trees-how-they-work/#iah-9)
https://www.cnblogs.com/KillerAery/category/1229106.html
http://www.aisharing.com/archives/90#comment-238610
https://note.youdao.com/ynoteshare1/index.html?id=4f46dc2144ea62b55f597630f5e666b4&type=note
https://www.behaviac.com/concepts/
### �����Ŀ
https://github.com/behavior3/behavior3editor
https://github.com/nottvlike/behavior3_lua
https://github.com/monitor1394/LuaBT
https://github.com/SilenceSu/behavior3java
###��������˽�Bhavior3
[��Ϊ��Ӧ��֮��Ϊ�����](https://note.youdao.com/ynoteshare1/index.html?id=dce05d33cd3d413b750f44cfeb27cba1&type=note)
[��Ϊ��Ӧ��֮��Ͻڵ�](https://note.youdao.com/ynoteshare1/index.html?id=f30ce2503a280e88bc7559710a48f580&type=note)
[��Ϊ��Ӧ��֮װ�νڵ�](https://note.youdao.com/ynoteshare1/index.html?id=b9993e6c6027759517d99d13307d5694&type=note)
[��Ϊ��Ӧ��֮�Զ���ڵ�](https://note.youdao.com/ynoteshare1/index.html?id=5f6bef7d092105c9d27b8f7696432980&type=note)
[��Ϊ��Ӧ��֮������Ϊ��](https://note.youdao.com/ynoteshare1/index.html?id=3015421942fafe2c09aacaef7990173c&type=note)
[��Ϊ��Ӧ��֮�ڵ�ִ��](https://note.youdao.com/ynoteshare1/index.html?id=ad915819d8f7cad146176ff8fad9adb8&type=note)
[��Ϊ��Ӧ��֮���Ѳ�߱�AI](https://note.youdao.com/ynoteshare1/index.html?id=2e8ab83e4c44737f0e90f4811caad77c&type=note)
[��Ϊ��Ӧ��֮���ɥʬAI](https://note.youdao.com/ynoteshare1/index.html?id=c0d89fd291827442ed6ab2ca938403c1&type=note)
