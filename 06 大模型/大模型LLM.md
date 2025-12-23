# LLM

- [llm-twin-course](https://github.com/decodingml/llm-twin-course)

## prompt 提示词工程

## SFT 监督微调（Supervised Fine-Tuning）  

在人工智能，尤其是大语言模型（LLM）训练中，SFT 指“监督微调”。它是在预训练模型基础上，用带标签的数据进一步训练，使模型更贴合具体任务（如对话、摘要、翻译）。例如，用高质量指令数据集对 LLaMA-3-8B 进行一次 epoch、学习率 2×10⁻⁵ 的微调，就属于 SFT 。

## Agent
智能体**定义** 智能体是指**具有自主决策能力和自我学习能力的计算机程序或机器人**。智能体可以通过感知环境、分析信息、制定决策并执行行动来完成任务。
智能体通常包括感知模块、决策模块和执行模块，其中**感知模块**用于获取环境信息，**决策模块**用于分析信息并做出决策，**执行模块**用于执行决策并完成任务。

## LangChain

[深入浅出 LangChain 与智能 Agent：构建下一代 AI 助手](https://juejin.cn/post/7346009985791311922)

Composer

## MCP

- [一文看懂：MCP(大模型上下文协议)](https://zhuanlan.zhihu.com/p/27327515233)
- [# MCP 终极指南](https://guangzhengli.com/blog/zh/model-context-protocol)
- [cursor  model-context-protocol](https://docs.cursor.com/context/model-context-protocol)

https://modelcontextprotocol.io/introduction

[Spring AI之模型上下文协议（MCP）](https://blog.csdn.net/alyenc/article/details/146968671)

[GPT 应用开发和思考](https://guangzhengli.com/blog/zh/gpt-embeddings)

[深入探究 MCP Spring Boot Server：构建强大的天气信息服务系统](https://blog.csdn.net/I_Am_Zou/article/details/146687907)

## Function Calling

## milvus

- [云原生向量数据库Milvus知识大全，看完这篇就够了.基本概念、系统架构、主要组件、应用场景](https://cloud.tencent.com/developer/article/2338267)

Milvus 是一个开源的云原生向量数据库，专为处理海量向量数据而设计，广泛应用于 AI 和大数据领域。

### 特点

- **高性能**: 支持快速的向量相似性搜索和检索。
- **可扩展性**: 采用分布式架构，支持大规模数据存储和处理。
- **多种索引类型**: 提供多种索引算法（如 IVF、HNSW），适应不同的应用场景。
- **云原生**: 支持容器化部署，易于集成到云环境中。

### 应用场景

- **推荐系统**: 基于用户行为向量化，提供个性化推荐。
- **图像检索**: 存储和检索图像特征向量，实现相似图像搜索。
- **自然语言处理**: 存储文本嵌入向量，用于问答系统或语义搜索。
- **生物信息学**: 处理基因序列或蛋白质结构的向量化数据。

### 示例

以下是一个简单的 Milvus 使用流程：

1. **安装 Milvus**: 使用 Docker 或 Kubernetes 部署。
2. **创建集合**: 定义存储向量数据的集合。
3. **插入数据**: 将向量数据插入集合。
4. **搜索数据**: 根据查询向量进行相似性搜索。

更多信息请参考 [Milvus 官方文档](https://milvus.io/docs)。

## openai接口规范

[openai  openapi 规范](https://www.cnblogs.com/dongai/p/18474507)


## LoRA

**全称：** Low-Rank Adaptation of Large Language Models（大型语言模型的低秩自适应）。

**简单来说：** 它是一种**极其高效的 AI 模型微调（Fine-tuning）技术**。如果把大模型（如 GPT、Llama 或 Stable Diffusion）比作一本写满知识的**巨型百科全书**，传统的微调是把整本书重写一遍（极其昂贵、耗时）。而 LoRA 就像是在书的旁边贴了一张**便利贴**，只修改或补充特定的内容，而不动原来的书。

**核心特点与优势：**

- **极低的资源消耗：** 传统全量微调需要巨大的显存（VRAM），可能需要几十张 A100 显卡。而 LoRA 可以让普通消费级显卡（如 RTX 3060, 4090）也能训练大模型。
    
- **文件极小：** 训练出来的 LoRA 模型文件通常只有几 MB 到几百 MB，而原始大模型通常是几十 GB。这使得分享和切换风格非常容易。
    
- **不破坏原模型：** 原始模型的权重被冻结（Freeze），LoRA 只是作为一个“外挂”插件存在。你可以给同一个模型挂载不同的 LoRA（例如一个负责画动漫风，一个负责画写实风）。
    

**应用场景：**

- **AI 绘画 (Stable Diffusion)：** 让 AI 学会画特定的角色（如某个动漫人物）、特定的画风（如水墨画、赛博朋克）或特定的构图。
    
- **大语言模型 (LLMs)：** 让通用的 AI（如 Llama 3, Qwen）变成特定领域的专家（如医疗助手、法律顾问、代码生成器）。

# todo

- [camel-ai](https://docs.camel-ai.org/cookbooks/basic_concepts/create_your_first_agent.html)
- [人工智能 - 通用 AI Agent 之 LangManus、Manus、OpenManus 和 OWL 技术选型](https://blog.csdn.net/Fx_demon/article/details/146446836)
- [AI 代理框架深度对比分享：Agno、OpenManus 和 OWL](https://juejin.cn/post/7481238697553297442)
- [OpenManus](https://github.com/mannaandpoem/OpenManus/blob/main/README_zh.md)
-  [一文彻底搞懂大模型 - Dify（Agent + RAG）](https://blog.csdn.net/m0_59163425/article/details/142368632)
