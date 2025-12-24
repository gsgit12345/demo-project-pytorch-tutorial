import  torch

weight=torch.ones(3,requires_grad=True)


for i  in range(2):
      
       model_output=(weight*3).sum()
       print(model_output)

       model_output.backward()

       print(weight.grad)
       
      # weight.grad.zero_()  it will reset the weight