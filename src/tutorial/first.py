import torch

x=torch.rand(3)

print(x)
#x = x.to("cuda")


# From data
x = torch.tensor([1, 2, 3])
print(x)

# Empty tensor (uninitialized memory)
a = torch.empty(2, 3)
print(a)

# Zeros
b = torch.zeros(2, 2)
print(b)
# Random values
c = torch.rand(3, 3)

print(c)

