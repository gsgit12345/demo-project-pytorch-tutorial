import torch
from torchviz import make_dot

x=torch.tensor(3.0,requires_grad=True)  # gradient is not applicable on the integer

y=x*3    # forward propogation
print(x)

print
print(y.grad_fn)


z=y.backward()  #  gradient calculation 

print("grad ",x.grad)

# dot = make_dot(y, params={'x': x})
# dot.format = 'png'
# dot.render('graph_test')


p=torch.tensor(4.0,requires_grad=True)


print(p)


b=p.requires_grad_(False)   # in-place: disables gradient tracking for the existing tensor p.

print(b)

b=p.detach()

print(b)
