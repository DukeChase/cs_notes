# What is RL? A short recap

**The agent’s decision-making process is called the policy π:** given a state, a policy will output an action or a probability distribution over actions. That is, given an observation of the environment, a policy will provide an action (or multiple probabilities for each action) that the agent should take.

![](https://huggingface.co/datasets/huggingface-deep-rl-course/course-images/resolve/main/en/unit3/policy.jpg)

![](https://huggingface.co/datasets/huggingface-deep-rl-course/course-images/resolve/main/en/unit3/two-approaches.jpg)

# Two types of value-based methods

In value-based methods, **we learn a value function** that **maps a state to the expected value of being at that state.**

![](https://duke-1258882975.cos.ap-guangzhou.myqcloud.com/picture/20251224102240099.png)

The value of a state is the **expected discounted return** the agent can get if it **starts at that state and then acts according to our policy.**

> But what does it mean to act according to our policy? After all, we don't have a policy in value-based methods since we train a value function and not a policy.

To find the optimal policy, we learned about two different methods:

- _Policy-based methods:_ **Directly train the policy** to select what action to take given a state (or a probability distribution over actions at that state). In this case, we **don’t have a value function.**

![](https://duke-1258882975.cos.ap-guangzhou.myqcloud.com/picture/20251224101257183.png)


The policy takes a state as input and outputs what action to take at that state (deterministic policy: a policy that output one action given a state, contrary to stochastic policy that output a probability distribution over actions).

And consequently, **we don’t define by hand the behavior of our policy; it’s the training that will define it.**

- _Value-based methods:_ **Indirectly, by training a value function** that outputs the value of a state or a state-action pair. Given this value function, our policy **will take an action.**

Since the policy is not trained/learned, **we need to specify its behavior.** For instance, if we want a policy that, given the value function, will take actions that always lead to the biggest reward, **we’ll create a Greedy Policy.**

![](https://duke-1258882975.cos.ap-guangzhou.myqcloud.com/picture/20251224094752089.png)
*Given a state, our action-value function (that we train) outputs the value of each action at that state. Then, our pre-defined Greedy Policy selects the action that will yield the highest value given a state or a state action pair. *

>> 

Consequently, whatever method you use to solve your problem, **you will have a policy**. In the case of value-based methods, you don’t train the policy: your policy **is just a simple pre-specified function** (for instance, the Greedy Policy) that uses the values given by the value-function to select its actions.

So the difference is:
- In policy-based training, **the optimal policy (denoted π*) is found by training the policy directly.**
- In value-based training, **finding an optimal value function (denoted Q* or V*, we’ll study the difference below) leads to having an optimal policy.**

![the link between value and policy](https://duke-1258882975.cos.ap-guangzhou.myqcloud.com/picture/20251224094714321.png)

$arg \ max$      argument of the maximum
对于一个函数 f(x) ，**argmax** 返回的是使 f(x) 最大的那个输入 x ，而不是最大值本身。


# The Bellman Equation , simplify our value Difference Learning



# Monte Carlo vs Temporal Difference Learning

