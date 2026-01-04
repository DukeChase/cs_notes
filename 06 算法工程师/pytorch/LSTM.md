


```python
import torch
import torch.nn as nn

# 定义一个 LSTM：输入维度 10，隐藏维度 20，2 层
lstm = nn.LSTM(input_size=10, hidden_size=20, num_layers=2)

# 模拟输入数据：序列长 5，Batch 大小 3，特征维度 10
input_data = torch.randn(5, 3, 10)

# 模拟初始状态：(h_0, c_0)
# 形状：(层数2 * 方向1, Batch 3, 隐藏维度 20)
h0 = torch.randn(2, 3, 20)
c0 = torch.randn(2, 3, 20)

# 运行 forward
output, (hn, cn) = lstm(input_data, (h0, c0))

# output: 所有时间步的最后层隐藏状态
# hn, cn: 最后一个时间步的所有层隐藏状态和细胞状态，可用于下一个序列的初始值
```